# StationController

## Endpoints

### GET /api/stations — list all stations
- [ ] Accept optional query param `userId`
- [ ] Return all active stations
- [ ] If `userId` provided: include `stationFavorite` flag per station
- [ ] Logged-out response (no stationId param): `stationId`, `stationName`, `stationFavorite`
- [ ] Map view response: also include `stationLong`, `stationLat`, `chainName`

```
GET /api/stations?userId=y
→ [{ "stationId": int, "stationName": String, "stationFavorite": Boolean,
     "stationLong": double, "stationLat": double, "chainName": String }]
```

### GET /api/stations — single station detail
- [ ] Accept query params `stationId` and `userId`
- [ ] Return station with full detail: chain info, membership discount, list of fuels with latest prices
- [ ] `discount` is the user's membership discount for that chain (0 if none)
- [ ] `fuels` lists only fuel types that have at least one price entry

```
GET /api/stations?stationId=x&userId=y
→ { "stationId": int, "stationName": String, "stationFavorite": Boolean,
    "chainName": String, "chainLogo": String, "discount": int,
    "fuels": [{ "fuelName": String, "fuelPrice": double }] }
```

### POST /api/stations/favorite — add favorite
- [ ] Accept query params `stationId` and `userId`
- [ ] Insert row into `favorite_stations`
- [ ] Return success message

```
POST /api/stations/favorite?stationId=x&userId=y
→ { "message": String }
```

### DELETE /api/stations/favorite — remove favorite
- [ ] Accept query params `stationId` and `userId`
- [ ] Delete matching row from `favorite_stations`
- [ ] Return success message

```
DELETE /api/stations/favorite?stationId=x&userId=y
→ { "message": String }
```
