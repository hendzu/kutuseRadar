# GET /api/station/location — station coordinates for map

Used by MapView to place markers.

- [x] Accept optional query param `userId`
- [x] Return all active stations with coordinates and favorites flag

```
GET /api/station/location?userId=y
→ StationLocationDtos [{ "stationId": int, "stationName": String,
                          "stationLong": double, "stationLat": double,
                          "chainName": String, "isInFavorites": boolean }]
```
