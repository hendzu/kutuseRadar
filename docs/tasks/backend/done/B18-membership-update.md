# PUT /api/memberships/user — update membership

- [x] Requires [B09 — MessageResponseDto](B09-message-response-dto.md)
- [x] Accept `@RequestBody UserMembershipDto` (`chainId`, `membershipId`, `userId`)
- [x] Update existing `user_membership` row for that user + chain
- [x] Return `MessageResponseDto`

```
PUT /api/memberships/user
  body: UserMembershipDto { "chainId": int, "membershipId": int, "userId": int }
→ MessageResponseDto { "message": String }
```
