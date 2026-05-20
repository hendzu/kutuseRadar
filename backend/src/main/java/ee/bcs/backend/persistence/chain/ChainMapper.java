package ee.bcs.backend.persistence.chain;

import ee.bcs.backend.controller.chain.dto.ChainOptionDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;
import org.mapstruct.ReportingPolicy;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)

public interface ChainMapper {
 @Mapping(source = "id", target="chainId")
 @Mapping(source = "name", target="chainName")
 ChainOptionDto toChainOptionDto(Chain chain);
 List<ChainOptionDto> toChainOptionDtos(List<Chain> chains);
}
