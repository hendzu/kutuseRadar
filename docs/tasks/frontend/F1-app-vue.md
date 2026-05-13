# App.vue

Global shell rendered on every page.

## Navbar — logged out
- [ ] Kütusehinnad → `/`
- [ ] Kaart → `/map`
- [ ] Logi sisse → `/login`
- [ ] Registreeru → `/register`

## Navbar — logged in (any role)
- [ ] Kütusehinnad → `/`
- [ ] Kaart → `/map`
- [ ] Lisa hind → `/price`
- [ ] Halda soodustusi → `/memberships`
- [ ] Logi välja → clears localStorage and redirects to `/`

## Logic
- [ ] Read `userId` from localStorage to determine logged-in state
- [ ] Reactively swap navbar links when auth state changes (login / logout)
