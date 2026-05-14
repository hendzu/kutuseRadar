# CLAUDE.md — kütuseRadar Backend

## Commands

```bash
./gradlew bootRun          # Start on :8080
./gradlew build            # Compile and package
./gradlew test             # Run all tests
```

Swagger UI: `http://localhost:8080/swagger-ui.html`

---

## Package Structure

All code lives under `ee.bcs.backend`:

```
controller/
  UserController.java            GET /api/login
  dto/LoginResponseDto.java

service/
  UserService.java

persistence/user/
  User.java                      @Entity → kutus."user"
  UserRepository.java            JPA + custom @Query
  UserMapper.java                MapStruct: User → LoginResponseDto

infrastructure/
  RestExceptionHandler.java      @ControllerAdvice
  error/ApiError.java            { message, errorCode } — returned to client
  error/ErrorResponse.java       Enum: all messages + numeric error codes (Estonian)
  exception/
    ForbiddenException.java      → HTTP 403
    DataNotFoundException.java   → HTTP 404
    PrimaryKeyNotFoundException.java → HTTP 404, errorCode 777
```

---

## Adding a New Domain

Follow this pattern for every new domain (e.g. `station`, `fuel`):

1. **Entity** in `persistence/<domain>/` — annotate with `@Entity`, `@Table(name="...", schema="kutus")`
2. **Repository** in same package — extend `JpaRepository<Entity, Integer>`, add `@Query` methods as needed
3. **Mapper** in same package — `@Mapper` interface, map fields explicitly only when names differ
4. **DTOs** in `controller/<domain>/` — request and response DTOs as needed
5. **Service** in `service/` — inject repository + mapper, throw typed exceptions with `ErrorResponse` constants
6. **Controller** in `controller/` — `@RestController`, `@RequestMapping("/api/...")`, add `@Operation` + `@ApiResponses` Swagger annotations

---

## Error Handling

Throw from a service:
```java
throw new ForbiddenException(INCORRECT_CREDENTIALS.getMessage(), INCORRECT_CREDENTIALS.getErrorCode());
```

`RestExceptionHandler` catches it and returns:
```json
{ "message": "Vale kasutajanimi või parool", "errorCode": 100 }
```

| Exception                    | HTTP status |
|------------------------------|-------------|
| `ForbiddenException`         | 403         |
| `DataNotFoundException`      | 404         |
| `PrimaryKeyNotFoundException`| 404         |
| `MethodArgumentNotValidException` | 400    |

All error messages and codes are defined in `ErrorResponse` enum — do **not** hardcode strings in services.

---

## MapStruct Rules

- Mappers are Spring beans (`componentModel = SPRING`) — inject with `@Autowired` / constructor injection.
- Unmapped target fields are silently ignored (`unmappedTargetPolicy = IGNORE`).
- Only add `@Mapping` when source and target field names differ.
- Generated sources go to `src/main/generated/` — never edit them manually.

---

## Database

Schema: `kutus` (all tables live here, not `public`).  
No Flyway — SQL scripts run via `spring.sql.init.mode=always`:

| File | Purpose |
|------|---------|
| `database/1_reset_database.sql` | Drops and recreates `kutus` schema |
| `database/2_KutuseRadar_create.sql` | DDL: all tables and FK constraints |
| `database/3_import.sql` | Seed/test data |

### Tables

```
chain              (id, name, logo bytea, status)
fuel               (id, name)
station            (id, chain_id, name, lon, lat, status)
station_fuel       (id, station_id, fuel_id, status)
station_fuel_price (id, price money, time timestamp, station_fuel_id, user_id)
station_picture    (id, picture bytea, station_id)
memberships        (id, chain_id, discount money, name)
user_membership    (id, user_id, memberships_id)
favorite_stations  (id, user_id, station_id)
"user"             (id, username, password, role, status)
```

Price history: `station → station_fuel → station_fuel_price` (one row per price change).

**Status column**: `"A"` = active, `"D"` = soft-deleted. Filter active records with `status = 'A'`.

---

## Current Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/api/login` | Login — params: `username`, `password`. Returns `{ userId, roleName }` or 403. |