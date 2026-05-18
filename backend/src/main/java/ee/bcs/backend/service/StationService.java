package ee.bcs.backend.service;

import ee.bcs.backend.Status;
import ee.bcs.backend.controller.fuel.dto.BestPriceDto;
import ee.bcs.backend.controller.fuel.dto.StationFuelBestPriceMapper;
import ee.bcs.backend.controller.station.dto.StationOptionDto;
import ee.bcs.backend.persistence.favoritestation.FavoriteStation;
import ee.bcs.backend.persistence.favoritestation.FavoriteStationRepository;
import ee.bcs.backend.persistence.fuel.Fuel;
import ee.bcs.backend.persistence.station.Station;
import ee.bcs.backend.persistence.station.StationMapper;
import ee.bcs.backend.persistence.station.StationRepository;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPrice;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPriceRepository;
import ee.bcs.backend.persistence.usermembership.UserMembership;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class StationService {
    private final StationFuelPriceRepository stationFuelPriceRepository;
    private final FuelService fuelService;
    private final MembershipService membershipService;
    private final StationFuelPriceMapper stationFuelPriceMapper;
    private final StationRepository stationRepository;
    private final FavoriteStationRepository favoriteStationRepository;
    private final StationMapper stationMapper;

    public List<BestPriceDto> getBestPrices(int userId) {
        List<UserMembership> userMemberships = membershipService.getUserMemberships(userId);
        List<BestPriceDto> bestPriceDtos = new java.util.ArrayList<>(List.of());
        for (Fuel fuelType : fuelService.getFuelTypes()) {
            StationFuelPrice stationFuelPrice = cheapestFuel(fuelType);
            if (stationFuelPrice==null){
                continue;
            }
            Integer fuelPriceChainId = stationFuelPrice.getStationFuel().getStation().getChain().getId();
            for (UserMembership userMembership:userMemberships){
                Integer membershipChainId = userMembership.getMembership().getChain().getId();
                if (membershipChainId.equals(fuelPriceChainId)){
                    stationFuelPrice.setPrice(stationFuelPrice.getPrice().subtract(userMembership.getMembership().getDiscount()));
                }
            }
            bestPriceDtos.add(stationFuelPriceMapper.toDto(stationFuelPrice));
        }
        return bestPriceDtos;

    }
    public List<StationOptionDto> getStations(Integer userId) {
        List<Station> stations = stationRepository.findByStatus(Status.ACTIVE.getCode());
        List<StationOptionDto> result = stationMapper.toStationOptionDtos(stations);
        if (userId != null) {
            List<FavoriteStation> favorites = favoriteStationRepository.findFavoriteStationBy(userId);
            for (StationOptionDto dto : result) {
                for (FavoriteStation favorite : favorites) {
                    if (favorite.getStation().getId().equals(dto.getStationId())) {
                        dto.setFavorite(true);
                    }


                }
            }
        }
        return result;
    }

    private StationFuelPrice cheapestFuel(Fuel fuelType) {
        Optional<StationFuelPrice> optionalStationFuelPrice = stationFuelPriceRepository.findLowestLatestPriceByFuelId(fuelType.getId(), Status.ACTIVE.getCode());
        return optionalStationFuelPrice.orElse(null);
    }
}
