package ee.bcs.backend.controller.fuel.dto;

import ee.bcs.backend.persistence.stationfuelprice.StationFuelPrice;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface StationFuelBestPriceMapper {

    @Mapping(source="stationFuel.station.name",target="stationName")
    @Mapping(source="stationFuel.station.id",target="stationId")
    @Mapping(source="price",target="price")
    @Mapping(source = "stationFuel.fuel.name",target = "fuelName")
    BestPriceDto toDto(StationFuelPrice stationFuelPrice);}