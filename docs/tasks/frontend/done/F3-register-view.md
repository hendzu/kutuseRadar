# RegisterView.vue

Route: `/register`

## UI
- [ ] Kasutajanimi text input
- [ ] Parool password input
- [ ] Korda Parooli password input
- [ ] "Registreeru" submit button

## Logic
- [ ] Validate that Parool and Korda Parooli match before submitting
- [ ] On submit call `POST /api/register?username=x&password=p`
- [ ] On success redirect to LoginView (`/login`)
- [ ] Show error message on failure (error code 102)

## Required Backend Tasks

- [x] [B02 — POST /api/user (register)](../backend/done/B02-register.md)

## API
```
POST /api/register?username=x&password=p
→ 200 OK

Error USER_EXISTS:
→ { "message": "See kasutajanimi on juba kasutusel!", "errorCode": 102 }
```
