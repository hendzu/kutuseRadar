# UserController

## Endpoints

### GET /api/login — login
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

### POST /api/user — register
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