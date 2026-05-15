# HomeView.vue

Route: `/`

## UI — section 1: lowest prices
- [ ] Heading: "Praegused odavamad kütuse hinnad"
- [ ] One card per fuel type: 95 | 98 | D | CNG | LPG
- [ ] Each card shows: price (€/l) and station name below

## UI — section 2: station search
- [ ] Heading: "Otsi tanklat"
- [ ] Search input with search icon
- [ ] Clicking a result navigates to StationView (`/station?stationId=x`)

## Logic
- [ ] On mount call `GET /api/station/lowest-prices?userId=y` to populate the fuel price cards
  - Pass `userId` from localStorage (omit if not logged in)
- [ ] On mount call `GET /api/station?userId=y` to load all stations for search
  - Pass `userId` from localStorage (omit if not logged in)
- [ ] Filter search results client-side as user types

## API
```
GET /api/station/lowest-prices?userId=y
→ BestPricesDtos [{ "stationId": int, "stationName": String,
                    "fuelType": String, "price": double }]

GET /api/station?userId=y
→ SearchResponseDtos [{ "stationId": int, "stationName": String,
                        "favorite": boolean }]
```