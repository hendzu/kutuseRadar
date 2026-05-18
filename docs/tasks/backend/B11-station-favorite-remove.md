# DELETE /api/stations/favorite — remove favorite

- [ ] Requires [B09 — MessageResponseDto](done/B09-message-response-dto.md)
- [ ] Accept query params `stationId` and `userId`
- [ ] Delete matching row from `favorite_stations`
- [ ] Return `MessageResponseDto`

```
DELETE /api/stations/favorite?stationId=x&userId=y
→ MessageResponseDto { "message": String }
```
