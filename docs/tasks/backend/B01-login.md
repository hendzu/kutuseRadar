# GET /api/login — login

- [ ] Accept query params `username` and `password`
- [ ] Look up user by username and password
- [ ] Return `LoginResponseDto` with `userId` and `userRole`
- [ ] Throw `ForbiddenException` (error code 100) if credentials don't match

```
GET /api/login?username=y&password=p
→ LoginResponseDto { "userId": int, "userRole": String }

Error INCORRECT_CREDENTIALS (100):
→ { "message": "Vale kasutajanimi või parool", "errorCode": 100 }
```