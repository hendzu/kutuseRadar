package ee.bcs.backend.controller.station.dto;


import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * DTO for {@link ee.bcs.backend.persistence.station.Station}
 */
@Data
public class StationDto implements Serializable {
    private Integer stationId;
    private String stationName;
    private Boolean stationFavorite;
    private String chainName;
    private String chainLogo;
    private List<StationFuelPriceDto> fuels;

}