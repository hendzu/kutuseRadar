# GET /api/station/lowest-prices — cheapest price per fuel type

- [x] Accept optional query param `userId`
- [ ] Return one entry per fuel type showing the station with the lowest current price
- [ ] "Current price" = latest `station_fuel_price` entry for that station+fuel combination

```
GET /api/station/lowest-prices?userId=y
→ BestPriceDtos [{ "stationId": int, "stationName": String,
                     "fuelType": String, "price": double }]
```