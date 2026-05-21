# DELETE /api/memberships/user — remove membership

- [x] Requires [B09 — MessageResponseDto](B09-message-response-dto.md)
- [x] Accept query param `userMembershipId`
- [x] Delete matching row from `user_membership`
- [x] Return `MessageResponseDto`

```
DELETE /api/memberships/user?userMembershipId=x
→ MessageResponseDto { "message": String }
```
