# AddPriceView.vue

Route: `/price`  
Requires login (redirect to `/login` if not authenticated)

## UI
- [ ] "Tankla nimi" dropdown populated from API
- [ ] "Kütuse liik" dropdown populated from API
- [ ] "Hind tanklas" number text input
- [ ] "Lisa hind" submit button

## Logic
- [ ] On mount call `GET /api/stations?userId=y` to populate station dropdown
- [ ] On mount call `GET /api/fuel` to populate fuel type dropdown
- [ ] On submit call `POST /api/fuel?userId=y&stationId=x&fuelId=z&fuelPrice=p`
- [ ] Show success/error message after submit

## API
```
GET /api/stations?userId=y
→ [{ "stationId": int, "stationName": String, "stationFavorite": Boolean }]

GET /api/fuel
→ [{ "fuelId": int, "fuelName": String }]

POST /api/fuel?userId=y&stationId=x&fuelId=z&fuelPrice=p
→ { "message": String }
```
