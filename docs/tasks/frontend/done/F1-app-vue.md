# App.vue

Global shell rendered on every page.

## Navbar — logged out
- [x] Kütusehinnad → `/`
- [x] Kaart → `/map`
- [x] Logi sisse → `/login`
- [x] Registreeru → `/register`

## Navbar — logged in (any role)
- [x] Kütusehinnad → `/`
- [x] Kaart → `/map`
- [x] Lisa hind → `/price`
- [x] Halda soodustusi → `/membership`
- [x] Logi välja → clears localStorage and redirects to `/`

## Logic
- [x] Read `userId` from localStorage to determine logged-in state
- [x] Reactively swap navbar links when auth state changes (login / logout)
