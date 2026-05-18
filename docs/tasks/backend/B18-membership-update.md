# PUT /api/memberships/user — update membership

- [ ] Accept `@RequestBody UserMembershipDto` (`chainId`, `membershipId`, `userId`)
- [ ] Update existing `user_membership` row for that user + chain
- [ ] Return success message

```
PUT /api/memberships/user
  body: UserMembershipDto { "chainId": int, "membershipId": int, "userId": int }
→ { "message": String }
```
