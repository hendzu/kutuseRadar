# GET /api/station — single station detail

Used by StationView and MapView popup.

- [ ] Accept query params `stationId` and `userId`
- [ ] Return full station detail: chain info, membership discount, latest prices per fuel type
- [ ] `discount` = user's membership discount for that chain (0 if none)
- [ ] `fuels` lists only fuel types that have at least one price entry

```
GET /api/station?stationId=x&userId=y
→ StationDto { "stationId": int, "stationName": String,
               "stationFavorite": boolean, "chainName": String,
               "chainLogo": String, "discount": int,
               "fuels": [{ "fuelName": String, "fuelPrice": double }] }
```
