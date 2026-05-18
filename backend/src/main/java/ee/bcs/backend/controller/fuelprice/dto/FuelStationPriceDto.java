package ee.bcs.backend.controller.fuelprice.dto;

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
public class FuelStationPriceDto implements Serializable {
    private Integer userId;
    private Integer stationId;
    private Integer fuelId;
    private BigDecimal price;
}