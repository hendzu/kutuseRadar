package ee.bcs.backend.infrastructure.error;

import lombok.Getter;

@Getter
public enum ErrorResponse {
    INCORRECT_CREDENTIALS("Vale kasutajanimi või parool",111),
    ;

    private final String message;
    private final Integer errorCode;

    ErrorResponse(String message, Integer errorCode) {
        this.message = message;
        this.errorCode = errorCode;
    }
}
