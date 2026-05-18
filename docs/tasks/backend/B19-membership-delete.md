# DELETE /api/memberships/user — remove membership

- [ ] Requires [B09 — MessageResponseDto](done/B09-message-response-dto.md)
- [ ] Accept query param `userMembershipId`
- [ ] Delete matching row from `user_membership`
- [ ] Return `MessageResponseDto`

```
DELETE /api/memberships/user?userMembershipId=x
→ MessageResponseDto { "message": String }
```
