# DELETE /api/memberships/user — remove membership

- [ ] Accept query param `userMembershipId`
- [ ] Delete matching row from `user_membership`
- [ ] Return success message

```
DELETE /api/memberships/user?userMembershipId=x
→ { "message": String }
```
