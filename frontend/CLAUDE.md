# CLAUDE.md — kütuseRadar Frontend

## Commands

```bash
npm install        # Install dependencies
npm run dev        # Dev server at http://localhost:8081
npm run build      # Production build → dist/
npm run lint       # oxlint then eslint --fix
npm run format     # Prettier formatting on src/
```

Vite proxies `/api` → `http://localhost:8080` (see `vite.config.js`).

---

## Source Layout

```
src/
  api-services/       One JS module per backend domain — wraps Axios calls
    LoginService.js
  auth/
    AuthService.js    isLoggedIn() — checks localStorage
  components/
    alerts/
      AlertError.vue    prop: errorMessage (String) — renders Bootstrap danger alert
      AlertSuccess.vue  prop: successMessage (String) — renders Bootstrap success alert
    MapComponent.vue
  views/              One component per route
    HomeView.vue
    LoginView.vue
    RegisterView.vue
    AddPriceView.vue
    MapView.vue
    MembershipView.vue
  router/index.js     Route table
  App.vue             Root layout
  main.js             Entry — registers Pinia, Router, Bootstrap, global Axios
```

---

## Routes

| Path | Name | View |
|------|------|------|
| `/` | `homeRoute` | `HomeView` |
| `/map` | `mapRoute` | `MapView` |
| `/addprice` | `addPriceRoute` | `AddPriceView` |
| `/login` | `login` | `LoginView` |
| `/register` | `loginRoute` | `RegisterView` |
| `/memberships` | `membershipRoute` | `MembershipView` |

---

## Auth

Session state is stored in `localStorage`:
- `userId` — integer as string
- `roleName` — role string (e.g. `"ADMIN"`, `"USER"`)

`AuthService.isLoggedIn()` returns `true` when `userId` is present.

Login writes both keys; logout must remove both. No JWT or cookie.

---

## Adding a New API Call

Create or extend a file in `api-services/`. Use the global Axios instance (`this.$axios`) inside components, or import `axios` directly in service modules:

```js
// api-services/StationService.js
import axios from 'axios'

export default {
  getStations() {
    return axios.get('/api/stations')
  },
  addPrice(stationFuelId, price) {
    return axios.post('/api/prices', { stationFuelId, price })
  },
}
```

---

## Error / Success Alerts Pattern

Components hold `errorMessage` and/or `successMessage` in `data()` and pass them as props to alert components:

```vue
<AlertError :error-message="errorMessage" />
<AlertSuccess :success-message="successMessage" />
```

Reset before each request; set on `.catch`. Both alert components render nothing when the prop is empty.

---

## Code Style

- No semicolons, single quotes, 100-char line width (Prettier).
- Options API (`export default { ... }`) is the current style — keep new components consistent.
- `@` is aliased to `src/`.
- Bootstrap 5 classes for all layout and UI — no custom CSS unless unavoidable.