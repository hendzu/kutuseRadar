# AddPriceView.vue

Route: `/price` or `/price?stationId=n`  
Requires login (redirect to `/login` if not authenticated)

## UI
- [ ] "Tankla nimi" dropdown populated from API
- [ ] "Kütuse liik" dropdown populated from API
- [ ] "Hind tanklas" number text input
- [ ] "Lisa hind" submit button

## Logic
- [ ] On mount call `GET /api/station/option?userId=y` to populate station dropdown
- [ ] On mount call `GET /api/fuel` to populate fuel type dropdown
- [ ] If `stationId` is present in the URL query params, auto-select that station in the dropdown
- [ ] On submit call `POST /api/fuel?userId=y&stationId=x&fuelId=z&fuelPrice=p`
- [ ] Show success/error message after submit

## Required Backend Tasks

- [ ] [B04 — GET /api/station (station list)](../backend/B04-station-search.md)
- [ ] [B12 — GET /api/fuel (fuel list)](../backend/B12-fuel-list.md)
- [ ] [B13 — POST /api/fuel (add price)](../backend/B13-fuel-add-price.md)

## API
```
GET /api/station/option?userId=y
→ StationOptionDtos [{ "stationId": int, "stationName": String,
                      "favorite": boolean }]

GET /api/fuel
→ FuelOptionDtos [{ "fuelId": int, "fuelName": String }]

POST /api/fuel?userId=y&stationId=x&fuelId=z&fuelPrice=p
→ { "message": String }
```