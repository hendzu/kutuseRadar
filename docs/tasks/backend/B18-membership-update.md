# PUT /api/memberships/user — update membership

- [ ] Requires [B09 — MessageResponseDto](done/B09-message-response-dto.md)
- [ ] Accept `@RequestBody UserMembershipDto` (`chainId`, `membershipId`, `userId`)
- [ ] Update existing `user_membership` row for that user + chain
- [ ] Return `MessageResponseDto`

```
PUT /api/memberships/user
  body: UserMembershipDto { "chainId": int, "membershipId": int, "userId": int }
→ MessageResponseDto { "message": String }
```
