package ee.bcs.backend.controller.membership.dto;

import lombok.Data;


import java.io.Serializable;
import java.math.BigDecimal;

/**
 * DTO for {@link ee.bcs.backend.persistence.usermembership.UserMembership}
 */
@Data
public class UserMembershipDto implements Serializable {
   private Integer userMembershipId;
   private String chainName;
   private BigDecimal membershipDiscount;
   private String membershipName;
}