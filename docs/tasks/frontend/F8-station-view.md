# StationView.vue

Route: `/station?stationId=n`

## UI — left panel: station card
- [ ] Chain logo + station name + star (☆/★) for favorite
- [ ] Fuel type badges: 95 | 98 | D | LPG | CNG (circular)
- [ ] Price row: €/l for each fuel type
- [ ] "Lisa hetke hind" link → navigates to `/price?stationId=x`

## UI — right panel: nearby stations table
- [ ] Fuel type filter dropdown (kõik / 95 / 98 / ...)
- [ ] Sort dropdown: "Hinna järgi" / "Läheduse järg"
- [ ] Max kaugus km number input (default 4)
- [ ] Table columns: tankla | kütus | hind | delta | kaugus
  - delta = price difference compared to current station

## UI — bottom: price history chart
- [ ] Line chart showing price over time per fuel type

## Logic
- [ ] On mount fetch station detail via `GET /api/station?stationId=x&userId=y`
- [ ] On mount fetch nearby stations via `GET /api/station/nearby?stationId=x&kaugus=z`
- [ ] On mount fetch price history via `GET /api/station/history?stationId=x`
- [ ] On mount call `GET /api/fuel` for fuel filter dropdown options
- [ ] Star click → if not favorite: `POST /api/stations/favorite?stationId=x&userId=y`
- [ ] Star click → if already favorite: `DELETE /api/stations/favorite?stationId=x&userId=y`
- [ ] Re-fetch nearby stations when fuel filter, sort, or max distance changes

## Required Backend Tasks

- [ ] [B05 — GET /api/station (station detail)](../backend/B05-station-detail.md)
- [ ] [B07 — GET /api/station/location (nearby stations)](../backend/B07-station-location-nearby.md)
- [ ] [B08 — GET /api/station/history (price history)](../backend/B08-station-history.md)
- [ ] [B12 — GET /api/fuel (fuel list)](../backend/B12-fuel-list.md)
- [ ] [B10 — POST /api/stations/favorite (add favorite)](../backend/B10-station-favorite-add.md)
- [ ] [B11 — DELETE /api/stations/favorite (remove favorite)](../backend/B11-station-favorite-remove.md)

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