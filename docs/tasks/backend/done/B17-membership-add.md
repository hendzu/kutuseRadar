# POST /api/memberships/user — add membership

- [x] Requires [B09 — MessageResponseDto](B09-message-response-dto.md)
- [x] Accept `@RequestBody UserMembershipDto` (`chainId`, `membershipId`, `userId`)
- [x] Insert new row into `user_membership`
- [x] Return `MessageResponseDto`

```
POST /api/memberships/user
  body: UserMembershipDto { "chainId": int, "membershipId": int, "userId": int }
→ MessageResponseDto { "message": String }
```
