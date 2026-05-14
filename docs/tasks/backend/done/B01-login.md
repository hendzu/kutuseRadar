# GET /api/login — login

- [x] Accept query params `username` and `password`
- [x] Look up user by username and password
- [x] Return `LoginResponseDto` with `userId` and `userRole`
- [x] Throw `ForbiddenException` (error code 100) if credentials don't match

```
GET /api/login?username=y&password=p
→ LoginResponseDto { "userId": int, "userRole": String }

Error INCORRECT_CREDENTIALS (100):
→ { "message": "Vale kasutajanimi või parool", "errorCode": 100 }
```