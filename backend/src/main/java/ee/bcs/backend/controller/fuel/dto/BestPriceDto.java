package ee.bcs.backend.controller.fuel.dto;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * DTO for {@link ee.bcs.backend.persistence.stationfuelprice.StationFuelPrice}
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BestPriceDto implements Serializable {
    private Integer stationId;
    private String stationName;
    private String fuelName;
    private BigDecimal price;
}