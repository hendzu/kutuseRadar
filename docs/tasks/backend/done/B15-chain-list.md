# GET /api/chains — list all chains

Used by MembershipView chain dropdown.

- [x] Return all active chains

```
GET /api/chains
→ ChainOptionDtos [{ "chainId": int, "chainName": String }]
```
