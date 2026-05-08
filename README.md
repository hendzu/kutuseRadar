# kütuseRadar

Fuel price radar application (*kütus* = fuel in Estonian). Full-stack monorepo with a Spring Boot REST backend and a Vue 3 frontend.

---

## Project structure

```
kütuseRadar/
├── backend/    # Spring Boot 4 REST API
├── frontend/   # Vue 3 SPA
└── data/       # Raw data / scripts
```

---

## Backend

| Property | Value |
|----------|-------|
| Framework | Spring Boot 4.0.6 |
| Language | Java 21 |
| Database | PostgreSQL |
| ORM | Spring Data JPA / Hibernate |
| Mapping | MapStruct 1.6.3 |
| Docs | springdoc-openapi (Swagger UI) |
| Extras | Lombok, Spring Validation, Actuator |

### Prerequisites

- Java 21
- PostgreSQL running locally

### Configuration

Create `backend/src/main/resources/application-local.properties` and override credentials:

```properties
spring.datasource.url=jdbc:postgresql://localhost/postgres
spring.datasource.username=postgres
spring.datasource.password=your_password
```

### Run

```bash
cd backend/
./gradlew bootRun
```

Swagger UI: `http://localhost:8080/swagger-ui.html`

---

## Frontend

| Property | Value |
|----------|-------|
| Framework | Vue 3 |
| Build tool | Vite 8 |
| State | Pinia |
| Routing | Vue Router 5 |
| UI | Bootstrap 5, Phosphor Icons |
| HTTP | Axios |

### Prerequisites

- Node.js `^20.19.0` or `>=22.12.0`

### Run

```bash
cd frontend/
npm install
npm run dev     # http://localhost:8081
```

### Other commands

```bash
npm run build   # production build → dist/
npm run lint    # oxlint + eslint (auto-fix)
npm run format  # prettier
```
