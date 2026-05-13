# UserController

## Endpoints

### GET /api/user — login
- [ ] Accept query params `userUsername` and `userPassword`
- [ ] Look up user by username and password
- [ ] Return `userId` and `userRole`
- [ ] Throw `DataNotFoundException` if credentials don't match

```
GET /api/user?userUsername=y&userPassword=p
→ { "userId": int, "userRole": String }
```

### POST /api/user — register
- [ ] Accept query params `username` and `password`
- [ ] Check username is not already taken
- [ ] Save new user with role `USER` and status `A`
- [ ] Return success message

```
POST /api/user?username=u&password=p
→ { "message": String }
```
