# POST /api/fuelPrice — add fuel price

- [x] Requires [B09 — MessageResponseDto](B09-message-response-dto.md)
- [x] Accept `@RequestBody FuelStationPriceDto` (`userId`, `stationId`, `fuelId`, `fuelPrice`)
- [x] Look up the `station_fuel` record for the given station + fuel combination
- [x] Insert a new row into `station_fuel_price` with current timestamp
- [x] Throw `DataNotFoundException` if no `station_fuel` record exists for that combination
- [x] Return `MessageResponseDto`

```
POST /api/fuel
  body: FuelStationPriceDto { "userId": int, "stationId": int, "fuelId": int, "fuelPrice": int }
→ MessageResponseDto { "message": String }
```
