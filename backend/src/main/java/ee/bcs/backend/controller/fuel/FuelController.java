package ee.bcs.backend.controller.fuel;

import ee.bcs.backend.controller.fuel.dto.FuelOptionDto;
import ee.bcs.backend.service.FuelService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/fuel")
@RequiredArgsConstructor
public class FuelController {

    private final FuelService fuelService;


    @GetMapping("/")
    @Operation(summary = "Leiab küttuse liigid.",
            description = """
                    Leiab andmebaasist iga küttuse liigi id ja nime.
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public List<FuelOptionDto> getFuelType() {
        return fuelService.getFuelTypeDtos();
    }

}
