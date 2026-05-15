package ee.bcs.backend.service;

import ee.bcs.backend.Status;
import ee.bcs.backend.persistence.usermembership.UserMembership;
import ee.bcs.backend.persistence.usermembership.UserMembershipRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MembershipService {

    private final UserMembershipRepository userMembershipRepository;


    public List<UserMembership> getUserMemberships(int userId) {
        return userMembershipRepository.findValidMembershipChainDiscountBy(userId, Status.ACTIVE.getCode());
    }
}
