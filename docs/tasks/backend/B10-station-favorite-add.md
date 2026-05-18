# POST /api/stations/favorite — add favorite

- [ ] Requires [B09 — MessageResponseDto](done/B09-message-response-dto.md)
- [ ] Accept query params `stationId` and `userId`
- [ ] Insert row into `favorite_stations`
- [ ] Return `MessageResponseDto`

```
POST /api/stations/favorite?stationId=x&userId=y
→ MessageResponseDto { "message": String }
```
