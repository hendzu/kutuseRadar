# GET /api/station/lowest-prices — cheapest price per fuel type

- [ ] Return one entry per fuel type showing the station with the lowest current price
- [ ] "Current price" = latest `station_fuel_price` entry for that station+fuel combination

```
GET /api/station/lowest-prices
→ BestPricesDtos [{ "stationId": int, "stationName": String,
                     "fuelType": String, "price": double }]
```