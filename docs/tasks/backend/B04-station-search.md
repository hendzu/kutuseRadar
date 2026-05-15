# GET /api/station — search / list stations

Used by HomeView search bar and AddPriceView station dropdown.

- [ ] Accept optional query param `userId`
- [ ] Return all active stations with name and favorite flag
- [ ] If no `userId`: `favorite` is always false

```
GET /api/stations?userId=y
→ StationOptionDtos [{ "stationId": int, "stationName": String,
                         "favorite": boolean }]
```