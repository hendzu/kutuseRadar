package ee.bcs.backend.persistence.station;

import ee.bcs.backend.controller.station.dto.StationOptionDto;
import org.mapstruct.*;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface StationMapper {
    @Mapping(source = "id", target="stationId")
    @Mapping(source = "name", target="stationName")
    @Mapping(target="favorite", constant = "false")
    StationOptionDto toStationOptionDto(Station station);

    List<StationOptionDto> toStationOptionDtos(List<Station> stations);

}