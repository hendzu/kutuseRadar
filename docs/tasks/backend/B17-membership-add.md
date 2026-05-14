# POST /api/memberships/user — add membership

- [ ] Accept query params `chainId`, `membershipId`, `userId`
- [ ] Insert new row into `user_membership`
- [ ] Return success message

```
POST /api/memberships/user?chainId=c&membershipId=m&userId=y
→ { "message": String }
```
