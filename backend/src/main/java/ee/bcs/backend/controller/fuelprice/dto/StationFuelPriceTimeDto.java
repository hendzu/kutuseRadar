package ee.bcs.backend.controller.fuelprice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StationFuelPriceTimeDto implements Serializable {
    private String fuelName;
    private List<PriceTimeDto> fuelPrice;
}