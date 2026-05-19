# GET /api/station — single station detail

Used by StationView and MapView popup.

- [x] Accept query params `stationId` and `userId`
- [x] Return full station detail: chain info, latest prices per fuel type (discount already applied)
- [x] `fuels` lists only fuel types that have at least one price entry
- [x] Membership discount rakendatakse otse kütuse hinnale — eraldi `discount` välja ei tagastata

```
GET /api/station?stationId=x&userId=y
→ StationDto { "stationId": int, "stationName": String,
               "stationFavorite": boolean, "chainName": String,
               "chainLogo": String,
               "fuels": [{ "fuelName": String, "fuelPrice": double }] }
```
