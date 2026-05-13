# MembershipController

## Endpoints

### GET /api/memberships/user — user's memberships
- [ ] Accept query param `userId`
- [ ] Return all memberships linked to that user via `user_membership`

```
GET /api/memberships/user?userId=y
→ [{ "userMembershipId": int, "chainName": String,
     "membershipName": String, "membershipDiscount": double }]
```

### GET /api/chains — list all chains
- [ ] Return all active chains

```
GET /api/chains
→ [{ "chainId": int, "chainName": String }]
```

### GET /api/memberships — memberships by chain
- [ ] Accept query param `chainId`
- [ ] Return all membership tiers for that chain

```
GET /api/memberships?chainId=c
→ [{ "membershipId": int, "membershipName": String }]
```

### POST /api/memberships/user — add membership
- [ ] Accept query params `chainId`, `membershipId`, `userId`
- [ ] Insert new row into `user_membership`
- [ ] Return success message

```
POST /api/memberships/user?chainId=c&membershipId=m&userId=y
→ { "message": String }
```

### PUT /api/memberships/user — update membership
- [ ] Accept query params `chainId`, `membershipId`, `userId`
- [ ] Update existing `user_membership` row for that user + chain
- [ ] Return success message

```
PUT /api/memberships/user?chainId=c&membershipId=m&userId=y
→ { "message": String }
```

### DELETE /api/memberships/user — remove membership
- [ ] Accept query param `userMembershipId`
- [ ] Delete matching row from `user_membership`
- [ ] Return success message

```
DELETE /api/memberships/user?userMembershipId=x
→ { "message": String }
```
