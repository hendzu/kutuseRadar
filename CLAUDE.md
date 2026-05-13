# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Backend

```bash
cd backend/
./gradlew bootRun          # Start server on :8080
./gradlew build            # Compile and package
./gradlew test             # Run all tests
./gradlew test --tests "ee.bcs.backend.SomeTest"  # Run a single test class
```

Swagger UI: `http://localhost:8080/swagger-ui.html`

### Frontend

```bash
cd frontend/
npm install        # Install dependencies
npm run dev        # Dev server at http://localhost:8081
npm run build      # Production build → dist/
npm run lint       # Run oxlint then eslint (both with --fix)
npm run format     # Prettier formatting on src/
```

## Database Setup

The schema DDL is in `backend/database/2_KutuseRadar_create.sql` — run it manually against PostgreSQL before first boot. The backend does not use Flyway; it relies on `spring.sql.init.mode=always`.

Default credentials in `application.properties`: `postgres` / `student123`, DB: `postgres` (localhost). Override by creating `backend/src/main/resources/application-local.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost/postgres
spring.datasource.username=postgres
spring.datasource.password=your_password
```

## Backend Architecture

The backend uses a layered package structure under `ee.bcs.backend`:

```
controller/<domain>/     REST controller + request/response DTOs
service/                 Business logic
persistence/<domain>/    Entity, JPA Repository, MapStruct Mapper
infrastructure/
  RestExceptionHandler   @ControllerAdvice — maps custom exceptions to HTTP responses
  error/ErrorResponse    Enum: all error messages + numeric codes (Estonian text)
  error/ApiError         Error body returned to clients
  exception/             DataNotFoundException, ForbiddenException, PrimaryKeyNotFoundException
```

**Error handling**: Throw a typed exception from a service; `RestExceptionHandler` catches it and returns the appropriate HTTP status. `ErrorResponse` enum is the single source of truth for error messages and codes.

**MapStruct**: Compiled with `-Amapstruct.unmappedTargetPolicy=IGNORE` and `-Amapstruct.defaultComponentModel=spring`. Generated sources go to `src/main/generated/`.

## Database Schema

```
chain              (id, name, logo)
fuel               (id, name)
station            (id, chain_id, name)
station_fuel       (id, station_id, fuel_id)
station_fuel_price (id, price, time, station_fuel_id)   -- price history
user               (id, username, password, role)
memberships        (id, chain_id, user_id, discount)
```

Price history is modelled through `station → station_fuel → station_fuel_price`, allowing price changes over time per fuel type per station.

## Frontend Architecture

Early-stage Vue 3 SPA. Vite proxies `/api` requests to `http://localhost:8080`. Axios is registered globally as `app.config.globalProperties.$axios`.

```
src/
  views/       HomeView.vue, TestView.vue
  router/      Route definitions (/ and /test)
  App.vue      Root component
  main.js      Entry point — sets up Pinia, Router, Bootstrap, global Axios
```

`@` is aliased to `src/`. Code style: no semicolons, single quotes, 100-char line width (Prettier). ESLint runs oxlint first, then eslint-plugin-vue.
