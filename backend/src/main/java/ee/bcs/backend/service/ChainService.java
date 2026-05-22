package ee.bcs.backend.service;

import ee.bcs.backend.Status;
import ee.bcs.backend.controller.chain.dto.ChainOptionDto;
import ee.bcs.backend.persistence.chain.Chain;
import ee.bcs.backend.persistence.chain.ChainMapper;
import ee.bcs.backend.persistence.chain.ChainRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


import java.util.List;

@RequiredArgsConstructor
@Service
public class ChainService {
    private final ChainRepository chainRepository;
    private final ChainMapper chainMapper;

    public List<ChainOptionDto> getActiveChains() {
        List<Chain> chains = chainRepository.findByStatus(Status.ACTIVE.getCode());
        return chainMapper.toChainOptionDtos(chains);
    }

}
