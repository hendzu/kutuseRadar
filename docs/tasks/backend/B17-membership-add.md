# POST /api/memberships/user — add membership

- [ ] Accept `@RequestBody UserMembershipDto` (`chainId`, `membershipId`, `userId`)
- [ ] Insert new row into `user_membership`
- [ ] Return success message

```
POST /api/memberships/user
  body: UserMembershipDto { "chainId": int, "membershipId": int, "userId": int }
→ { "message": String }
```
