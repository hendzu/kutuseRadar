package ee.bcs.backend.controller.station.dto;

import lombok.Data;


import java.io.Serializable;


/**
 * DTO for {@link ee.bcs.backend.persistence.station.Station}
 */
@Data
public class StationLocationDto implements Serializable {
    private Integer stationId;
    private String stationName;
    private Double stationLong;
    private Double stationLat;
    private Boolean isInFavorites;
}