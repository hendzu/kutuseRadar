# MembershipView.vue

Route: `/memberships`  
Requires login (redirect to `/login` if not authenticated)

## UI
- [ ] Table of existing memberships: columns Kett | Tase | Soodus s/l | (edit ✏ | delete ✕)
- [ ] "Tankla kett" dropdown
- [ ] "Soodustus tase" dropdown (populated after chain is selected)
- [ ] "Lisa/Muuda soodustus" submit button

## Logic
- [ ] On mount call `GET /api/memberships/user?userId=y` to populate table
- [ ] On mount call `GET /api/chains` to populate chain dropdown
- [ ] On chain select call `GET /api/memberships?chainId=c` to populate membership dropdown
- [ ] "Lisa/Muuda soodustus":
  - If membership not yet in table: `POST /api/memberships/user?chainId=c&membershipId=m&userId=y`
  - If already exists: `PUT /api/memberships/user?chainId=c&membershipId=m&userId=y`
- [ ] Edit ✏ icon → pre-fill dropdowns with that row's values
- [ ] Delete ✕ icon → `DELETE /api/memberships/user?userMembershipId=x`, then refresh table

## API
```
GET /api/memberships/user?userId=y
→ [{ "userMembershipId": int, "chainName": String,
     "membershipName": String, "membershipDiscount": double }]

GET /api/chains
→ [{ "chainId": int, "chainName": String }]

GET /api/memberships?chainId=c
→ [{ "membershipId": int, "membershipName": String }]

POST /api/memberships/user?chainId=c&membershipId=m&userId=y
→ { "message": String }

PUT /api/memberships/user?chainId=c&membershipId=m&userId=y
→ { "message": String }

DELETE /api/memberships/user?userMembershipId=x
→ { "message": String }
```
