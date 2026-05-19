package ee.bcs.backend.controller.station;


import ee.bcs.backend.controller.dto.MessageResponseDto;
import ee.bcs.backend.controller.fuel.dto.BestPriceDto;
import ee.bcs.backend.controller.station.dto.StationOptionDto;
import ee.bcs.backend.service.StationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

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
    public List<BestPriceDto> getBestPrices(@RequestParam(required = false) Integer userId) {

        return stationService.getBestPrices(userId);
    }
    @GetMapping("/option")
    @Operation(summary = "Kuvab kõik jaamad",
            description = """
                    Tagastab kõik aktiivsed jaamad koos nime ja lemmiku lipuga.
                              Kui userId on antud, märgitakse kasutaja lemmikjaamad favorite=true.
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public List<StationOptionDto> getStations(@RequestParam(required = false) Integer userId){
        return stationService.getStations(userId);
    }

    @PostMapping("/favorite")
    @Operation(summary = "Lisab uus lemmikjaama",
            description = """
                    Määrab userId ja stationId järgi kasutaja valitud jaama lemmikjaamaks favorite_station tabelis
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public MessageResponseDto addFavorite(@RequestParam Integer stationId, @RequestParam Integer userId) {
        return stationService.addFavorite(stationId, userId);
    }
    @DeleteMapping("/favorite")
    @Operation(summary = "Kustutab lemmikjaama",
            description = """
                    Kustutab userId ja stationId järgi kasutaja valitud jaama lemmikjaamaks favorite_station tabelist
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public MessageResponseDto deleteFavorite(@RequestParam Integer stationId, @RequestParam Integer userId) {
        return stationService.deleteFavorite(stationId, userId);
    }
}
