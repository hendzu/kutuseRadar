package ee.bcs.backend.controller.membership.dto;

import lombok.Data;

import java.io.Serializable;

@Data

public class MembershipOptionDto implements Serializable {
    private Integer membershipId;
    private String membershipName;
}
