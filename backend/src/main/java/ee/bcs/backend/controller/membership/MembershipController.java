package ee.bcs.backend.controller.membership;

import ee.bcs.backend.controller.membership.dto.UserMembershipDto;
import ee.bcs.backend.service.MembershipService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/memberships")
public class MembershipController {
    private final MembershipService membershipService;
    @GetMapping("/user")
    @Operation(summary = "Leiab kasutaja liikmesuse info",
            description = """
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public List<UserMembershipDto> getUserMemberships(@RequestParam Integer userId) {
        return membershipService.getUserMembershipDtos(userId);
    }

}
