package ee.bcs.backend.controller.station.dto;

import ee.bcs.backend.persistence.station.Station;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * DTO for {@link Station}
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class NearbyStationDto implements Serializable {
    private Integer id;
    @NotNull
    @Size(max = 255)
    private String name;
    private Double distance;
    private List<StationFuelPriceDto> fuels;
}