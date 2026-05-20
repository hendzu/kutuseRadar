package ee.bcs.backend.persistence.usermembership;

import ee.bcs.backend.controller.membership.dto.UserMembershipDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;
import org.mapstruct.ReportingPolicy;

import java.util.List;


@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)

public interface UserMembershipMapper {
    @Mapping(source = "id", target = "userMembershipId")
    @Mapping(source = "membership.chain.name", target = "chainName")
    @Mapping(source = "membership.name", target = "membershipName")
    @Mapping(source = "membership.discount", target = "membershipDiscount")
    UserMembershipDto toUserMembershipDto(UserMembership userMembership);
    List<UserMembershipDto> toUserMembershipDtos(List<UserMembership> userMemberships);

}
