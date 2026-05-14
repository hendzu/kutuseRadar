# POST /api/user — register

- [ ] Accept query params `username` and `password`
- [ ] Check username is not already taken; throw error (code 102) if taken
- [ ] Save new user with role `USER` and status `A`
- [ ] Return success message

```
POST /api/user?username=x&password=p
→ { "message": String }

Error USER_EXISTS (102):
→ { "message": "See kasutajanimi on juba kasutusel!", "errorCode": 102 }
```