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
- [ ] On mount call `GET /api/station/option?userId=y` to load all stations for search
  - Pass `userId` from localStorage (omit if not logged in)
- [ ] Filter search results client-side as user types

## Required Backend Tasks

- [ ] [B03 — GET /api/station/lowest-prices](../backend/B03-station-lowest-prices.md)
- [ ] [B04 — GET /api/station (station search)](../backend/B04-station-search.md)

## API
```
GET /api/station/lowest-prices?userId=y
→ BestPricesDtos [{ "stationId": int, "stationName": String,
                    "fuelType": String, "price": double }]

GET /api/station/option?userId=y
→ SearchResponseDtos [{ "stationId": int, "stationName": String,
                        "favorite": boolean }]
```