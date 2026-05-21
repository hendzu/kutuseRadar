package ee.bcs.backend.service;

import ee.bcs.backend.Status;
import ee.bcs.backend.controller.dto.MessageResponseDto;
import ee.bcs.backend.controller.membership.dto.MembershipOptionDto;
import ee.bcs.backend.controller.membership.dto.UserMembershipDto;
import ee.bcs.backend.controller.membership.dto.UserMembershipRequestDto;
import ee.bcs.backend.infrastructure.exception.DataNotFoundException;
import ee.bcs.backend.persistence.membership.Membership;
import ee.bcs.backend.persistence.membership.MembershipMapper;
import ee.bcs.backend.persistence.membership.MembershipRepository;
import ee.bcs.backend.persistence.user.UserRepository;
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
    private final MembershipRepository membershipRepository;
    private final MembershipMapper membershipMapper;
    private final UserRepository userRepository;


    public List<UserMembership> getUserMemberships(Integer userId) {
        return userMembershipRepository.findValidMembershipChainDiscountBy(userId, Status.ACTIVE.getCode());
    }
    public List<UserMembershipDto> getUserMembershipDtos(Integer userId) {
    List<UserMembership> userMemberships = getUserMemberships(userId);
    return userMembershipMapper.toUserMembershipDtos(userMemberships);
    }

    public List<MembershipOptionDto> getMembershipOptions(Integer chainId) {
        List<Membership> memberships = membershipRepository.findByChainIdAndStatus(chainId, Status.ACTIVE.getCode());
        return membershipMapper.toMembershipOptionDtos(memberships);
    }

    public MessageResponseDto addUserMembership(UserMembershipRequestDto userMembershipRequestDto) {
    UserMembership usermembership = new UserMembership();
    usermembership.setUser(userRepository.getReferenceById(userMembershipRequestDto.getUserId()));
    usermembership.setMembership(membershipRepository.getReferenceById(userMembershipRequestDto.getMembershipId()));
    userMembershipRepository.save(usermembership);
    return new MessageResponseDto("Liikmesus lisatud!");
    }

    public MessageResponseDto updateUserMembership(UserMembershipRequestDto userMembershipRequestDto) {
        UserMembership userMembership = userMembershipRepository
                .findUserMembershipByChain(userMembershipRequestDto.getUserId(), userMembershipRequestDto.getChainId())
                .orElseThrow(() -> new DataNotFoundException("Liikmesust ei leitud", 404));
        userMembership.setMembership(membershipRepository.getReferenceById(userMembershipRequestDto.getMembershipId()));
        userMembershipRepository.save(userMembership);
        return new MessageResponseDto("Liikmesus uuendatud!");
    }

    public MessageResponseDto deleteUserMembership(Integer userMembershipId) {
        userMembershipRepository.deleteById(userMembershipId);
        return new MessageResponseDto("Liikmesus kustutatud!");

    }

}
