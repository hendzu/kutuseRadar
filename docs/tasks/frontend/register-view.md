# RegisterView.vue

Route: `/register`

## UI
- [ ] Navbar: Kütusehinnad | Kaart | Logi sisse | Registreeru
- [ ] Kasutajanimi text input
- [ ] Parool password input
- [ ] Korda Parooli password input
- [ ] "Registreeru" submit button

## Logic
- [ ] Validate that Parool and Korda Parooli match before submitting
- [ ] On submit call `POST /api/user?username=u&password=p`
- [ ] On success redirect to LoginView (`/login`)
- [ ] Show error message on failure

## API
```
POST /api/user?username=u&password=p
→ { "message": String }
```
