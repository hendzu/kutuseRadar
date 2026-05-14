# POST /api/stations/favorite — add favorite

- [ ] Accept query params `stationId` and `userId`
- [ ] Insert row into `favorite_stations`
- [ ] Return success message

```
POST /api/stations/favorite?stationId=x&userId=y
→ { "message": String }
```
