# PUT /api/memberships/user — update membership

- [ ] Accept query params `chainId`, `membershipId`, `userId`
- [ ] Update existing `user_membership` row for that user + chain
- [ ] Return success message

```
PUT /api/memberships/user?chainId=c&membershipId=m&userId=y
→ { "message": String }
```
