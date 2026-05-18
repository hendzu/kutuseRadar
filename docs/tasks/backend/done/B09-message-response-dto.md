# MessageResponseDto — shared success response

Used by all endpoints that return only a confirmation message (no data payload).

- [x] Create `controller/dto/MessageResponseDto.java` as a Java record:
  ```java
  public record MessageResponseDto(String message) {}
  ```

All endpoints that previously returned `{ "message": String }` use this DTO:
B10, B11, B13, B17, B18, B19