# GET /api/station/location — nearby stations

Used by StationView nearby stations table.

- [ ] Accept query params `stationId` and `kaugus` (max distance in km)
- [ ] Return all stations within `kaugus` km of the given station
- [ ] Include latest fuel prices and membership discount per station

```
GET /api/station/nearby?stationId=x&kaugus=z
→ NearbyStationDtos [{ "stationId": int, "stationName": String,
                        "discount": double, "kaugus": double,
                        "fuels": [{ "fuelName": String, "fuelPrice": double }] }]
```
