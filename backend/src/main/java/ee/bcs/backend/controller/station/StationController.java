package ee.bcs.backend.controller.station;


import ee.bcs.backend.controller.fuel.dto.BestPriceDto;
import ee.bcs.backend.infrastructure.error.ApiError;
import ee.bcs.backend.service.StationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/station")
public class StationController {
    private final StationService stationService;

    @GetMapping("/lowest-prices")
    @Operation(summary = "Leiab parimad hetke hinnad",
            description = """
                Leiab andmebaasist iga küttuse liigi kohta parim hetke hind ning jaama id ja nimi.
                """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public List<BestPriceDto> getBestPrices(@RequestParam(required = false) int userId){

        return stationService.getBestPrices(userId);
    }

}
