package ee.bcs.backend.infrastructure.error;

import lombok.Getter;

@Getter
public enum ErrorResponse {
    INCORRECT_CREDENTIALS("Vale kasutajanimi või parool",100),
    USER_EXISTS("See kasutajanimi on juba võetud", 102);



    private final String message;
    private final Integer errorCode;

    ErrorResponse(String message, Integer errorCode) {
        this.message = message;
        this.errorCode = errorCode;
    }
}
