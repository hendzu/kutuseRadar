package ee.bcs.backend.controller.station;


import ee.bcs.backend.controller.dto.MessageResponseDto;
import ee.bcs.backend.controller.fuel.dto.BestPriceDto;
import ee.bcs.backend.controller.fuelprice.dto.StationFuelPriceTimeDto;
import ee.bcs.backend.controller.station.dto.NearbyStationDto;
import ee.bcs.backend.controller.station.dto.StationDto;
import ee.bcs.backend.controller.station.dto.StationLocationDto;
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
    @Operation(summary = "Kuvab kõik jaamad otsinguks",
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
    @GetMapping
    @Operation(summary = "Kuvab valitud jaama",
            description = """
                    
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public StationDto getStationDetail(@RequestParam Integer stationId, @RequestParam(required = false) Integer userId) {
        return stationService.getStationDetail(stationId, userId);
    }

    @GetMapping("/location")
    @Operation(summary = "Kuvab kõik jaama andmed kaardi jaoks",
            description = """
                    
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public List<StationLocationDto> getStationLocations(@RequestParam(required = false) Integer userId) {
        return stationService.getStationLocations(userId);

    }
    @GetMapping("/location/nearby")
    @Operation(summary = "Tagastab kõik lähedased tanklad.",
            description = """
                    Leiab tanklast antud raadiuse(km) sees olevad teised tanklad hinna võrdluseks.
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public List<NearbyStationDto> getNearbyStations(@RequestParam Integer stationId,@RequestParam Integer searchRadius, @RequestParam(required = false) Integer userId){

        return stationService.getNearbyStations(stationId,searchRadius,userId);
    }@GetMapping("/history")
    @Operation(summary = "Tagastab tankla hinna ajaloo.",
            description = """
                    
                    """)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),})
    public List<StationFuelPriceTimeDto> getPriceHistory(Integer stationId){

        return stationService.getPriceHistory(stationId);
    }
}
