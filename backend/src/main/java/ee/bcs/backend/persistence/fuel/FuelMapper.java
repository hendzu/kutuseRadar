package ee.bcs.backend.persistence.fuel;

import ee.bcs.backend.controller.fuel.dto.FuelOptionDto;
import org.mapstruct.*;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface FuelMapper {


    @Mapping(source = "name", target = "fuelName")
    @Mapping(source = "id", target = "fuelId")
    FuelOptionDto tofuelOptionDto(Fuel fuel);

    List<FuelOptionDto> tofuelOptionDtos(List<Fuel> fuels);

}