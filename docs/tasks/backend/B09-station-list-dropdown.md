# GET /api/stations — station list for dropdowns

Used by AddPriceView station dropdown.

- [ ] Accept optional query param `userId`
- [ ] Return all active stations with name and favorite flag

```
GET /api/stations?userId=y
→ StationOptionDtos [{ "stationId": int, "stationName": String,
                        "stationFavorite": boolean }]
```
