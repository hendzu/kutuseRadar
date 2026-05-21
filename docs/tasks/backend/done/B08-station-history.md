# GET /api/station/history — price history

Used by StationView price history chart.

- [x] Accept query param `stationId`
- [x] Return all price history entries per fuel type for that station

```
GET /api/station/history?stationId=x
→ StationPriceDtos { "fuels": [{ "fuelName": String,
                                  "fuelPrice": [{ "price": double,
                                                  "time": timestamp }] }] }
```
