# POST /api/memberships/user — add membership

- [ ] Requires [B09 — MessageResponseDto](done/B09-message-response-dto.md)
- [ ] Accept `@RequestBody UserMembershipDto` (`chainId`, `membershipId`, `userId`)
- [ ] Insert new row into `user_membership`
- [ ] Return `MessageResponseDto`

```
POST /api/memberships/user
  body: UserMembershipDto { "chainId": int, "membershipId": int, "userId": int }
→ MessageResponseDto { "message": String }
```
