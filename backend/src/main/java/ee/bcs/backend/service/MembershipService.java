package ee.bcs.backend.service;

import ee.bcs.backend.Status;
import ee.bcs.backend.controller.membership.dto.UserMembershipDto;
import ee.bcs.backend.persistence.usermembership.UserMembership;
import ee.bcs.backend.persistence.usermembership.UserMembershipMapper;
import ee.bcs.backend.persistence.usermembership.UserMembershipRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MembershipService {

    private final UserMembershipRepository userMembershipRepository;
    private final UserMembershipMapper userMembershipMapper;


    public List<UserMembership> getUserMemberships(Integer userId) {
        return userMembershipRepository.findValidMembershipChainDiscountBy(userId, Status.ACTIVE.getCode());
    }
    public List<UserMembershipDto> getUserMembershipDtos(Integer userId) {
    List<UserMembership> userMemberships = getUserMemberships(userId);
    return userMembershipMapper.toUserMembershipDtos(userMemberships);
    }
}
