# StationView.vue

Route: `/station?stationId=n`

## UI — left panel: station card
- [x] Chain logo + station name + star (☆/★) for favorite
- [x] Fuel type badges: 95 | 98 | D | LPG | CNG (circular)
- [x] Price row: €/l for each fuel type
- [x] "Lisa hetke hind" link → navigates to `/price?stationId=x`

## UI — right panel: nearby stations table
- [x] Fuel type filter dropdown (kõik / 95 / 98 / ...)
- [ ] Sort dropdown: "Hinna järgi" / "Läheduse järg"
- [x] Max kaugus km number input
- [x] Table columns: tankla | kütus | hind | delta | kaugus
  - delta = price difference compared to current station

## UI — bottom: price history chart
- [ ] Line chart showing price over time per fuel type

## Logic
- [x] On mount fetch station detail via `GET /api/station?stationId=x&userId=y`
- [x] On mount fetch nearby stations via `GET /api/station/nearby?stationId=x&kaugus=z`
- [ ] On mount fetch price history via `GET /api/station/history?stationId=x`
- [x] On mount call `GET /api/fuel` for fuel filter dropdown options
- [x] Star click → if not favorite: `POST /api/stations/favorite?stationId=x&userId=y`
- [x] Star click → if already favorite: `DELETE /api/stations/favorite?stationId=x&userId=y`
- [x] Re-fetch nearby stations when max distance changes
- [x] Unknown/unexpected API errors → `NavigationService.navigateToErrorView()`

## Required Backend Tasks

- [x] [B05 — GET /api/station (station detail)](../backend/B05-station-detail.md)
- [x] [B07 — GET /api/station/location (nearby stations)](../backend/done/B07-station-location-nearby.md)
- [x] [B08 — GET /api/station/history (price history)](../backend/done/B08-station-history.md)
- [x] [B12 — GET /api/fuel (fuel list)](../backend/B12-fuel-list.md)
- [x] [B10 — POST /api/stations/favorite (add favorite)](../backend/done/B10-station-favorite-add.md)
- [x] [B11 — DELETE /api/stations/favorite (remove favorite)](../backend/done/B11-station-favorite-remove.md)

## API
```
GET /api/station?stationId=x&userId=y
→ StationDto { "stationId": int, "stationName": String,
               "stationFavorite": boolean, "chainName": String,
               "chainLogo": String, "discount": int,
               "fuels": [{ "fuelName": String, "fuelPrice": double }] }

GET /api/station/nearby?stationId=x&kaugus=z
→ NearbyStationDtos [{ "stationId": int, "stationName": String,
                        "discount": double, "kaugus": double,
                        "fuels": [{ "fuelName": String, "fuelPrice": double }] }]

GET /api/station/history?stationId=x
→ StationPriceDtos { "fuels": [{ "fuelName": String,
                                  "fuelPrice": [{ "price": double,
                                                  "time": timestamp }] }] }

GET /api/fuel
→ FuelOptionDtos [{ "fuelId": int, "fuelName": String }]

POST /api/stations/favorite?stationId=x&userId=y
→ { "message": String }

DELETE /api/stations/favorite?stationId=x&userId=y
→ { "message": String }
```