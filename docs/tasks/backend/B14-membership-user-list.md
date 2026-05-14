# GET /api/memberships/user — user's memberships

Used by MembershipView to populate the table.

- [ ] Accept query param `userId`
- [ ] Return all memberships linked to that user

```
GET /api/memberships/user?userId=y
→ UserMembershipDtos [{ "userMembershipId": int, "chainName": String,
                         "membershipName": String, "membershipDiscount": double }]
```
