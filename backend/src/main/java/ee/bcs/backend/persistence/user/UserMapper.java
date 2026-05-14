package ee.bcs.backend.persistence.user;

import ee.bcs.backend.controller.dto.LoginResponseDto;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserMapper {


    @Mapping(source = "id", target = "userId")
    LoginResponseDto toDto(User user);

}