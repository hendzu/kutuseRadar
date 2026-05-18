package ee.bcs.backend.controller.fuel.dto;

import ee.bcs.backend.persistence.fuel.Fuel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * DTO for {@link Fuel}
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FuelOptionDto implements Serializable {
    private Integer fuelId;
    private String fuelName;
}