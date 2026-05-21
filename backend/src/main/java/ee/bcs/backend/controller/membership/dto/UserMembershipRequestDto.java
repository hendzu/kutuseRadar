package ee.bcs.backend.controller.membership.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class UserMembershipRequestDto implements Serializable {
    private Integer chainId;
    private Integer membershipId;
    private Integer userId;
}
