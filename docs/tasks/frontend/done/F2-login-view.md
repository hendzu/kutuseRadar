# LoginView.vue

Route: `/login`

## UI
- [x] Kasutajanimi text input
- [x] Parool password input
- [x] "Logi sisse" submit button

## Logic
- [x] On submit call `GET /api/login?username=y&password=p`
- [x] Save `userId` and `userRole` to localStorage via AuthService
- [x] On success redirect to HomeView (`/`)
- [x] Show error message on failed login (error code 100)

## API
```
GET /api/login?username=y&password=p
→ LoginResponseDto { "userId": int, "userRole": String }

Error INCORRECT_CREDENTIALS:
→ { "message": "Vale kasutajanimi või parool", "errorCode": 100 }
```
