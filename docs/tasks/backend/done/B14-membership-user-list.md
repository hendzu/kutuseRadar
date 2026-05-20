# GET /api/memberships/user — user's memberships

Used by MembershipView to populate the table.

- [x] Accept query param `userId`
- [x] Return all memberships linked to that user

```
GET /api/memberships/user?userId=y
→ UserMembershipDtos [{ "userMembershipId": int, "chainName": String,
                         "membershipName": String, "membershipDiscount": double }]
```
