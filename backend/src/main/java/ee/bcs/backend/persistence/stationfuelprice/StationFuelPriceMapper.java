package ee.bcs.backend.persistence.stationfuelprice;

import ee.bcs.backend.controller.fuel.dto.BestPriceDto;
import ee.bcs.backend.controller.fuelprice.dto.FuelStationPriceDto;
import ee.bcs.backend.controller.station.dto.StationFuelPriceDto;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface StationFuelPriceMapper {

    @Mapping(source = "stationFuel.station.name", target = "stationName")
    @Mapping(source = "stationFuel.station.id", target = "stationId")
    @Mapping(source = "price", target = "price")
    @Mapping(source = "stationFuel.fuel.name", target = "fuelName")
    BestPriceDto toBestPriceDto(StationFuelPrice stationFuelPrice);


    @Mapping(source = "userId", target = "user.id")
    @Mapping(source = "price", target = "price")
    StationFuelPrice toStationFuelPrice(FuelStationPriceDto fuelStationPriceDto);


    @Mapping(source = "stationFuel.fuel.name", target = "fuelName")
    StationFuelPriceDto toStationFuelPriceDto(StationFuelPrice stationFuelPrice);


}