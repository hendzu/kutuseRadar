# RegisterView.vue

Route: `/register`

## UI
- [ ] Kasutajanimi text input
- [ ] Parool password input
- [ ] Korda Parooli password input
- [ ] "Registreeru" submit button

## Logic
- [ ] Validate that Parool and Korda Parooli match before submitting
- [ ] On submit call `POST /api/user?username=x&password=p`
- [ ] On success redirect to LoginView (`/login`)
- [ ] Show error message on failure (error code 102)

## API
```
POST /api/user?username=x&password=p
→ { "message": String }

Error USER_EXISTS:
→ { "message": "See kasutajanimi on juba kasutusel!", "errorCode": 102 }
```
