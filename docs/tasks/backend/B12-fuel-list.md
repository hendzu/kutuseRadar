# GET /api/fuel — list fuel types

Used by AddPriceView and StationView fuel filter dropdown.

- [ ] Return all fuel types from the `fuel` table

```
GET /api/fuel
→ FuelOptionDtos [{ "fuelId": int, "fuelName": String }]
```
