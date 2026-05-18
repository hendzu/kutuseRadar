# MembershipView.vue

Route: `/memberships`  
Requires login (redirect to `/login` if not authenticated)

## UI
- [ ] Alert banner at top of page (below navbar): hidden by default, shown after any mutating API call
  - Success state (green): shows `message` from API response
  - Error state (pink/red with `!` icon): shows `message` from error response
- [ ] Table of existing memberships: columns Kett | Tase | Soodus s/l | (edit ✏ | delete ✕)
- [ ] "Tankla kett" dropdown
- [ ] "Soodustus tase" dropdown (populated after chain is selected)
- [ ] "Lisa/Muuda soodustus" submit button

## Logic
- [ ] On mount: `AuthService.isLoggedIn()` → if false, `NavigationService.navigateToNotAuthorizedView()`
- [ ] On mount call `GET /api/memberships/user?userId=y` to populate table
- [ ] On mount call `GET /api/chains` to populate chain dropdown
- [ ] On chain select call `GET /api/memberships?chainId=c` to populate membership dropdown
- [ ] "Lisa/Muuda soodustus":
  - If membership not yet in table: `POST /api/memberships/user?chainId=c&membershipId=m&userId=y`
    - Success → show green banner with "Soodustus lisatud"
    - Error `MEMBERSHIP_EXISTS` (code 105) → show red banner with "Teil juba on selle ketti soodustus"
    - Unknown/unexpected error → `NavigationService.navigateToErrorView()`
  - If already exists: `PUT /api/memberships/user?chainId=c&membershipId=m&userId=y`
    - Success → show green banner with "Soodustus muudetud"
    - Unknown/unexpected error → `NavigationService.navigateToErrorView()`
- [ ] Edit ✏ icon → pre-fill dropdowns with that row's values
- [ ] Delete ✕ icon → `DELETE /api/memberships/user?userMembershipId=x`, then refresh table; show banner with API message
  - Unknown/unexpected error → `NavigationService.navigateToErrorView()`

## Required Backend Tasks

- [ ] [B14 — GET /api/memberships/user (user membership list)](../backend/B14-membership-user-list.md)
- [ ] [B15 — GET /api/chains (chain list for dropdown)](../backend/B15-chain-list.md)
- [ ] [B16 — GET /api/memberships (membership options by chain)](../backend/B16-membership-options.md)
- [ ] [B17 — POST /api/memberships/user (add membership)](../backend/B17-membership-add.md)
- [ ] [B18 — PUT /api/memberships/user (update membership)](../backend/B18-membership-update.md)
- [ ] [B19 — DELETE /api/memberships/user (delete membership)](../backend/B19-membership-delete.md)

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
