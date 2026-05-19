package ee.bcs.backend.controller.fuelprice;


import ee.bcs.backend.controller.dto.MessageResponseDto;
import ee.bcs.backend.controller.fuelprice.dto.FuelStationPriceDto;
import ee.bcs.backend.infrastructure.error.ApiError;
import ee.bcs.backend.service.FuelPriceService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/fuelPrice")
@RequiredArgsConstructor
public class FuelPriceController {

    private final FuelPriceService fuelPriceService;

    @PostMapping("")
    @Operation(summary = "Lisab kütuse hinna asukohas andmebaasi.",
            description = """
                    Võtab kasutaja id, tankla id, küttuse id ja sisestatud hinna. Loob sissekande praeguse kella ajaga.
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),
            @ApiResponse(responseCode = "404",
            description = "See tankla ei paku seda küttust",
            content = @Content(schema = @Schema(implementation = ApiError.class)))})
    public MessageResponseDto addFuelPrices(@RequestBody FuelStationPriceDto fuelStationPriceDto){
        return fuelPriceService.addFuelPrices(fuelStationPriceDto);
    }
}
