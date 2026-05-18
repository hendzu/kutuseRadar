# POST /api/fuel — add fuel price

- [ ] Requires [B09 — MessageResponseDto](done/B09-message-response-dto.md)
- [ ] Accept `@RequestBody FuelStationPriceDto` (`userId`, `stationId`, `fuelId`, `fuelPrice`)
- [ ] Look up the `station_fuel` record for the given station + fuel combination
- [ ] Insert a new row into `station_fuel_price` with current timestamp
- [ ] Throw `DataNotFoundException` if no `station_fuel` record exists for that combination
- [ ] Return `MessageResponseDto`

```
POST /api/fuel
  body: FuelStationPriceDto { "userId": int, "stationId": int, "fuelId": int, "fuelPrice": int }
→ MessageResponseDto { "message": String }
```
