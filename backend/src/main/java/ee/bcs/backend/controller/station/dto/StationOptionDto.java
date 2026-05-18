package ee.bcs.backend.controller.station.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * DTO for {@link ee.bcs.backend.persistence.station.Station}
 */
@Data
@NoArgsConstructor
@AllArgsConstructor

public class StationOptionDto implements Serializable {
    private Integer stationId;
    @NotNull
    @Size(max = 255)
    private String stationName;
    private Boolean favorite;
}