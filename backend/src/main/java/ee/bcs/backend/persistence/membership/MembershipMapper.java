package ee.bcs.backend.persistence.membership;

import ee.bcs.backend.controller.membership.dto.MembershipOptionDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;
import org.mapstruct.ReportingPolicy;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)

public interface MembershipMapper {
    @Mapping(source = "id", target = "membershipId")
    @Mapping(source = "name", target = "membershipName")
    MembershipOptionDto toMembershipOptionDto (Membership memberships);
    List<MembershipOptionDto> toMembershipOptionDtos(List<Membership> memberships);
}
