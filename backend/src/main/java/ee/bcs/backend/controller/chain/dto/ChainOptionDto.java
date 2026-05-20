package ee.bcs.backend.controller.chain.dto;


import lombok.Data;

import java.io.Serializable;

/**
 * DTO for {@link ee.bcs.backend.persistence.chain.Chain}
 */
@Data
public class ChainOptionDto implements Serializable {
    private Integer chainId;
    private String chainName;
}