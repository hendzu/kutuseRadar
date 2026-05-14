# GET /api/memberships — membership tiers by chain

Used by MembershipView to populate the membership tier dropdown after a chain is selected.

- [ ] Accept query param `chainId`
- [ ] Return all membership tiers for that chain

```
GET /api/memberships?chainId=c
→ MembershipOptionDtos [{ "membershipId": int, "membershipName": String }]
```
