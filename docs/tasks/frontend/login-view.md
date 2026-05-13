# LoginView.vue

Route: `/login`

## UI
- [ ] Navbar: Kütusehinnad | Kaart | Logi sisse | Registreeru
- [ ] Kasutajanimi text input
- [ ] Parool password input
- [ ] "Logi sisse" submit button

## Logic
- [ ] On submit call `GET /api/user?userUsername=y&userPassword=p`
- [ ] Save `userId` and `userRole` to localStorage via AuthService
- [ ] On success redirect to HomeView (`/`)
- [ ] Show error message on failed login

## API
```
GET /api/user?userUsername=y&userPassword=p
→ { "userId": int, "userRole": String }
```
