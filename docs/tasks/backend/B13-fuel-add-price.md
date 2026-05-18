# POST /api/fuel — add fuel price

- [ ] Accept `@RequestBody FuelStationPriceDto` (`userId`, `stationId`, `fuelId`, `fuelPrice`)
- [ ] Look up the `station_fuel` record for the given station + fuel combination
- [ ] Insert a new row into `station_fuel_price` with current timestamp
- [ ] Throw `DataNotFoundException` if no `station_fuel` record exists for that combination
- [ ] Return success message

```
POST /api/fuel
  body: FuelStationPriceDto { "userId": int, "stationId": int, "fuelId": int, "fuelPrice": int }
→ { "message": String }
```
