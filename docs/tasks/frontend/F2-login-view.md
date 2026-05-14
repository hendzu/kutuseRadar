# LoginView.vue

Route: `/login`

## UI
- [ ] Kasutajanimi text input
- [ ] Parool password input
- [ ] "Logi sisse" submit button

## Logic
- [ ] On submit call `GET /api/login?username=y&password=p`
- [ ] Save `userId` and `userRole` to localStorage via AuthService
- [ ] On success redirect to HomeView (`/`)
- [ ] Show error message on failed login (error code 100)

## API
```
GET /api/login?username=y&password=p
→ LoginResponseDto { "userId": int, "userRole": String }

Error INCORRECT_CREDENTIALS:
→ { "message": "Vale kasutajanimi või parool", "errorCode": 100 }
```
