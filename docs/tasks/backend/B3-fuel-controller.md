# FuelController

## Endpoints

### GET /api/fuel — list fuel types
- [ ] Return all fuel types from the `fuel` table

```
GET /api/fuel
→ [{ "fuelId": int, "fuelName": String }]
```

### POST /api/fuel — add fuel price
- [ ] Accept query params `userId`, `stationId`, `fuelId`, `fuelPrice`
- [ ] Look up the `station_fuel` record for the given station + fuel combination
- [ ] Insert a new row into `station_fuel_price` with current timestamp
- [ ] Throw `DataNotFoundException` if no `station_fuel` record exists for that combination
- [ ] Return success message

```
POST /api/fuel?userId=y&stationId=x&fuelId=z&fuelPrice=p
→ { "message": String }
```
