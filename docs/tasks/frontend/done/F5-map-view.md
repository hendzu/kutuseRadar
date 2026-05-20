# MapView.vue

Route: `/map`

## UI
- [x] Text: "Kaardilt leiad mugavalt lähima tankla"
- [x] Map with a marker per station (station name shown as label)
- [x] Clicking a marker opens a popup card:
  - Station name and chain logo image
  - Star (☆/★) to toggle favorite
  - "Lisa hetke hind" link → navigates to `/price?stationId=x`
  - "Vaata tanklat" link → navigates to `/station?stationId=x`

## Logic
- [x] On mount call `GET /api/station/location?userId=y` to get all station coordinates
  - Pass `userId` from localStorage (omit if not logged in)
- [x] Render a map (e.g. Leaflet) with one marker per station
- [x] On marker click: fetch station detail via `GET /api/station?stationId=x&userId=y` and show popup
- [x] Unknown/unexpected API errors → `NavigationService.navigateToErrorView()`

## Required Backend Tasks

- [x] [B06 — GET /api/station/location (map markers)](../../backend/done/B06-station-location-map.md)
- [x] [B05 — GET /api/station (station detail)](../backend/B05-station-detail.md)

## API
```
GET /api/station/location?userId=y
→ StationLocationDtos [{ "stationId": int, "stationName": String,
                          "stationLong": double, "stationLat": double,
                          "isInFavorites": boolean }]

GET /api/station?stationId=x&userId=y
→ StationDto { "stationId": int, "stationName": String,
               "stationFavorite": boolean, "chainName": String,
               "chainLogo": String,
               "fuels": [{ "fuelName": String, "fuelPrice": double }] }
```