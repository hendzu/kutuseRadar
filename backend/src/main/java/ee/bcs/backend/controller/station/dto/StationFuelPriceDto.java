package ee.bcs.backend.controller.station.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * DTO for {@link ee.bcs.backend.persistence.stationfuelprice.StationFuelPrice}
 */
@Data
public class StationFuelPriceDto implements Serializable {
   private String fuelName;
    @NotNull
    private BigDecimal price;
}