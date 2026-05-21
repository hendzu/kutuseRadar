package ee.bcs.backend.controller.fuelprice.dto;

import ee.bcs.backend.persistence.stationfuelprice.StationFuelPrice;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * DTO for {@link StationFuelPrice}
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PriceTimeDto implements Serializable {
    private BigDecimal price;
    private LocalDateTime time;
}