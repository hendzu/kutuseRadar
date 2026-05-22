package ee.bcs.backend.infrastructure.error;

import lombok.Getter;

@Getter
public enum ErrorResponse {
    INCORRECT_CREDENTIALS("Vale kasutajanimi või parool",100),
    USER_EXISTS("See kasutajanimi on juba võetud", 102),
    INCORRECT_FUEL_TYPE("Valitud tanklas ei müüda seda kütust",103),
    MEMBERSHIP_EXISTS("Teil juba on selle keti soodustus", 105);



    private final String message;
    private final Integer errorCode;

    ErrorResponse(String message, Integer errorCode) {
        this.message = message;
        this.errorCode = errorCode;
    }
}
