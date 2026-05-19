# AddPriceView.vue

Route: `/price` or `/price?stationId=n`  
Requires login (redirect to `/login` if not authenticated)

## UI
- [x] Alert banner at top of page (below navbar): hidden by default, shown after any API call
  - Success state (green): shows `message` from API response
  - Error state (pink/red with `!` icon): shows `message` from error response
- [x] "Tankla nimi" dropdown populated from API
- [x] "Kütuse liik" dropdown populated from API
- [x] "Hind tanklas" number text input
- [x] "Lisa hind" submit button

## Logic
- [x] On mount: `AuthService.isLoggedIn()` → if false, `NavigationService.navigateToNotAuthorizedView()`
- [x] On mount call `GET /api/station/option?userId=y` to populate station dropdown
- [x] On mount call `GET /api/fuel` to populate fuel type dropdown
- [x] If `stationId` is present in the URL query params, auto-select that station in the dropdown
- [x] On submit call `POST /api/fuel` with body `FuelStationPriceDto`
  - Success → show green banner with "Hind lisatud"
  - Error `INCORRECT_FUEL_TYPE` (code 103) → show red banner with "Valitud tanklas ei müüda seda küttust"
  - Unknown/unexpected error → `NavigationService.navigateToErrorView()`

## Required Backend Tasks

- [x] [B04 — GET /api/station (station list)](../backend/B04-station-search.md)
- [x] [B12 — GET /api/fuel (fuel list)](../../backend/done/B12-fuel-list.md)
- [x] [B13 — POST /api/fuel (add price)](../../backend/done/B13-fuel-add-price.md)

## API
```
GET /api/station/option?userId=y
→ StationOptionDtos [{ "stationId": int, "stationName": String,
                      "favorite": boolean }]

GET /api/fuel
→ FuelOptionDtos [{ "fuelId": int, "fuelName": String }]

POST /api/fuel
  body: FuelStationPriceDto { "userId": int, "stationId": int, "fuelId": int, "fuelPrice": int }
→ { "message": String }
```