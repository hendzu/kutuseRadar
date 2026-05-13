package ee.bcs.backend.persistence.user;

import ee.bcs.backend.controller.dto.UserDto;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserMapper {
    @Mapping(source = "roleName", target = "role")
    @Mapping(source = "userId", target = "id")
    User toEntity(UserDto userDto);

    @InheritInverseConfiguration(name = "toEntity")
    UserDto toDto(User user);

}