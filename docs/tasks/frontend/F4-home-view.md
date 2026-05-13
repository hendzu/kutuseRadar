# HomeView.vue

Route: `/`

## UI — logged out
- [ ] "Vali tankla" dropdown listing all stations
- [ ] Fuel price panel: shows 95, 98, D, LPG, CNG prices for selected station

## UI — logged in
- [ ] "Vali tankla" dropdown (same as above)
- [ ] Fuel price panel with chain logo, chain name, membership discount
- [ ] Star icon (☆/★) next to station panel to toggle favorite

## Logic
- [ ] On mount call `GET /api/stations?userId=y` to populate dropdown
  - Pass `userId` from localStorage (or omit if not logged in)
- [ ] On station select call `GET /api/stations?stationId=x&userId=y` for full detail
- [ ] Star click → if not favorite: `POST /api/stations/favorite?stationId=x&userId=y`
- [ ] Star click → if already favorite: `DELETE /api/stations/favorite?stationId=x&userId=y`
- [ ] "Logi välja" clears localStorage and redirects to `/`

## API
```
GET /api/stations?userId=y
→ [{ "stationId": int, "stationName": String, "stationFavorite": Boolean }]

GET /api/stations?stationId=x&userId=y
→ { "stationId": int, "stationName": String, "stationFavorite": Boolean,
    "chainName": String, "chainLogo": String, "discount": int,
    "fuels": [{ "fuelName": String, "fuelPrice": double }] }

POST /api/stations/favorite?stationId=x&userId=y
→ { "message": String }

DELETE /api/stations/favorite?stationId=x&userId=y
→ { "message": String }
```
