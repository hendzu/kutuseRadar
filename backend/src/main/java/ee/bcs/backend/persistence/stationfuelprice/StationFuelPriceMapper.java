package ee.bcs.backend.persistence.stationfuelprice;

import ee.bcs.backend.controller.fuel.dto.BestPriceDto;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface StationFuelPriceMapper {

    @Mapping(source="stationFuel.station.name",target="stationName")
    @Mapping(source="stationFuel.station.id",target="stationId")
    @Mapping(source="price",target="price")
    @Mapping(source = "stationFuel.fuel.name",target = "fuelName")
    BestPriceDto toDto(StationFuelPrice stationFuelPrice);}