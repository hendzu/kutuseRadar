# GET /api/station — search / list stations

Used by HomeView search bar.

- [ ] Accept optional query param `userId`
- [ ] Return all active stations with name and favorite flag
- [ ] If no `userId`: `favorite` is always false

```
GET /api/station?userId=y
→ SearchResponseDtos [{ "stationId": int, "stationName": String,
                         "favorite": boolean }]
```