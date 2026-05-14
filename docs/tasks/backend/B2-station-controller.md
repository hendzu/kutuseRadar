# StationController

## Endpoints

### GET /api/station/lowest-prices — cheapest price per fuel type
- [ ] Return one entry per fuel type showing the station with the lowest current price
- [ ] "Current price" = latest `station_fuel_price` entry for that station+fuel combination

```
GET /api/station/lowest-prices
→ BestPricesDtos [{ "stationId": int, "stationName": String,
                     "fuelType": String, "price": double }]
```

### GET /api/station — search / list stations
- [ ] Accept optional query param `userId`
- [ ] Return all active stations with name and favorite flag
- [ ] If no `userId`: `favorite` is always false

```
GET /api/station?userId=y
→ SearchResponseDtos [{ "stationId": int, "stationName": String,
                         "favorite": boolean }]
```

### GET /api/station — single station detail
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

### GET /api/station/location — station coordinates for map
- [ ] Accept optional query param `userId`
- [ ] Return all active stations with coordinates and favorites flag

```
GET /api/station/location?userId=y
→ StationLocationDtos [{ "stationId": int, "stationName": String,
                          "stationLong": double, "stationLat": double,
                          "chainName": String, "isInFavorites": boolean }]
```

### GET /api/station/location — nearby stations
- [ ] Accept query params `stationId` and `kaugus` (max distance in km)
- [ ] Return all stations within `kaugus` km of the given station
- [ ] Include current fuel prices and membership discount per station

```
GET /api/station/location?stationId=x&kaugus=z
→ NearbyStationDtos [{ "stationId": int, "stationName": String,
                        "discount": double, "kaugus": double,
                        "fuels": [{ "fuelName": String, "fuelPrice": double }] }]
```

### GET /api/station/history — price history
- [ ] Accept query param `stationId`
- [ ] Return full price history per fuel type for that station

```
GET /api/station/history?stationId=x
→ StationPriceDtos { "fuels": [{ "fuelName": String,
                                  "fuelPrice": [{ "price": double,
                                                  "time": timestamp }] }] }
```

### GET /api/stations — station list for dropdowns
- [ ] Accept optional query param `userId`
- [ ] Used by AddPriceView to populate the station dropdown

```
GET /api/stations?userId=y
→ StationOptionDtos [{ "stationId": int, "stationName": String,
                        "stationFavorite": boolean }]
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