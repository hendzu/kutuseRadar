package ee.bcs.backend.controller.station.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link ee.bcs.backend.persistence.station.Station}
 */
@Value
public class SearchResponseDto implements Serializable {
    Integer id;
    @NotNull
    @Size(max = 255)
    String name;
    @NotNull
    @Size(max = 1)
    String status;
}