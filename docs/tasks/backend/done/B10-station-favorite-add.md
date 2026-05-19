# POST /api/stations/favorite — add favorite

- [x] Requires [B09 — MessageResponseDto](B09-message-response-dto.md)
- [x] Accept query params `stationId` and `userId`
- [x] Insert row into `favorite_stations`
- [x] Return `MessageResponseDto`

```
POST /api/stations/favorite?stationId=x&userId=y
→ MessageResponseDto { "message": String }
```
