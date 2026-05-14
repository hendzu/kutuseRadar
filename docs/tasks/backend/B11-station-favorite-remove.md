# DELETE /api/stations/favorite — remove favorite

- [ ] Accept query params `stationId` and `userId`
- [ ] Delete matching row from `favorite_stations`
- [ ] Return success message

```
DELETE /api/stations/favorite?stationId=x&userId=y
→ { "message": String }
```
