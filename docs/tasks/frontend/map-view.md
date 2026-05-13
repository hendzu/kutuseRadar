# MapView.vue

Route: `/map`

## UI — logged out
- [ ] Text: "Kaardilt leiad mugavalt lähima tankla"
- [ ] Map component with station markers

## UI — logged in
- [ ] Same map with station markers, favorites visually distinguished

## Logic
- [ ] On mount call `GET /api/stations?userId=y` to get station coordinates
- [ ] Render a map (e.g. Leaflet) with a marker per station using `stationLong` / `stationLat`
- [ ] Clicking a station marker navigates to HomeView (`/`) with that station pre-selected

## API
```
GET /api/stations?userId=y
→ [{ "stationId": int, "stationName": String, "stationLong": double,
     "stationLat": double, "chainName": String, "stationFavorite": Boolean }]
```
