package ee.bcs.backend.controller.membership;

import ee.bcs.backend.controller.dto.MessageResponseDto;
import ee.bcs.backend.controller.membership.dto.MembershipOptionDto;
import ee.bcs.backend.controller.membership.dto.UserMembershipDto;
import ee.bcs.backend.controller.membership.dto.UserMembershipRequestDto;
import ee.bcs.backend.service.MembershipService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/memberships")
public class MembershipController {
    private final MembershipService membershipService;
    @GetMapping("/user")
    @Operation(summary = "Leiab kasutaja liikmesuse info"
            )
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public List<UserMembershipDto> getUserMemberships(@RequestParam Integer userId) {
        return membershipService.getUserMembershipDtos(userId);
    }

    @GetMapping
    @Operation(summary = "Leiab keti liikmesuse valikud")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public List<MembershipOptionDto> getMembershipOptions(@RequestParam Integer chainId) {
        return membershipService.getMembershipOptions(chainId);
    }
    @PostMapping("/user")
    @Operation(summary = "Märgib liikmesuse kasutajal ")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public MessageResponseDto postUserMembership(@RequestBody UserMembershipRequestDto userMembershipRequestDto) {
        return membershipService.addUserMembership(userMembershipRequestDto);
    }

    @PutMapping("/user")
    @Operation(summary = "Uuendab kasutaja liikmesust")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public MessageResponseDto updateUserMembership(@RequestBody UserMembershipRequestDto userMembershipRequestDto) {
        return membershipService.updateUserMembership(userMembershipRequestDto);

    }
    @DeleteMapping("/user")
    @Operation(summary = "Kustutab kasutaja liikmesuse")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public MessageResponseDto deleteUserMembership(@RequestParam Integer userMembershipId) {
        return membershipService.deleteUserMembership(userMembershipId);
    }
}
