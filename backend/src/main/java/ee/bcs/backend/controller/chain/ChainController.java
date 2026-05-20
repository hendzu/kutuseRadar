package ee.bcs.backend.controller.chain;

import ee.bcs.backend.controller.chain.dto.ChainOptionDto;
import ee.bcs.backend.service.ChainService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/chains")

public class ChainController {
    private final ChainService chainService;

    @GetMapping()
    @Operation(summary = "Leiab kõik tankla ketid .",
            description = """
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public List<ChainOptionDto> getChains() {
        return chainService.getActiveChains();
    }
}
