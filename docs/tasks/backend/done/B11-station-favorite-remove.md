# DELETE /api/stations/favorite — remove favorite

- [x] Requires [B09 — MessageResponseDto](B09-message-response-dto.md)
- [x] Accept query params `stationId` and `userId`
- [x] Delete matching row from `favorite_stations`
- [x] Return `MessageResponseDto`

```
DELETE /api/stations/favorite?stationId=x&userId=y
→ MessageResponseDto { "message": String }
```
