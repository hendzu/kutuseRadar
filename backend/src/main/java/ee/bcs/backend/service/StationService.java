package ee.bcs.backend.service;

import ee.bcs.backend.Status;
import ee.bcs.backend.controller.fuel.dto.BestPriceDto;
import ee.bcs.backend.controller.station.dto.StationOptionDto;
import ee.bcs.backend.persistence.favoritestation.FavoriteStation;
import ee.bcs.backend.persistence.favoritestation.FavoriteStationRepository;
import ee.bcs.backend.persistence.fuel.Fuel;
import ee.bcs.backend.persistence.station.Station;
import ee.bcs.backend.persistence.station.StationMapper;
import ee.bcs.backend.persistence.station.StationRepository;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPrice;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPriceMapper;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPriceRepository;
import ee.bcs.backend.persistence.usermembership.UserMembership;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    public List<BestPriceDto> getBestPrices(Integer userId) {
        List<UserMembership> userMemberships = findUserMemberships(userId);
        List<BestPriceDto> bestPriceDtos = new ArrayList<>();
        for (Fuel fuelType : fuelService.getFuelTypes()) {
            List<StationFuelPrice> stationFuelPrices = cheapestFuel(fuelType);
            if (stationFuelPrices.isEmpty()) {
                continue;
            }
            addBestPriceToList(stationFuelPrices, userMemberships, bestPriceDtos);
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

    private void addBestPriceToList(List<StationFuelPrice> stationFuelPrices, List<UserMembership> userMemberships, List<BestPriceDto> bestPriceDtos) {
        StationFuelPrice bestStationFuelPrice = stationFuelPrices.getFirst();
        for (StationFuelPrice stationFuelPrice : stationFuelPrices) {
            applyMembershipDiscount(stationFuelPrice, userMemberships);
            if (bestStationFuelPrice.getPrice().compareTo(stationFuelPrice.getPrice()) > 0) {
                bestStationFuelPrice = stationFuelPrice;
            }

        }
        bestPriceDtos.add(stationFuelPriceMapper.toBestPriceDto(bestStationFuelPrice));
    }

    private static void applyMembershipDiscount(StationFuelPrice stationFuelPrice, List<UserMembership> userMemberships) {
        Integer fuelPriceChainId = stationFuelPrice.getStationFuel().getStation().getChain().getId();
        for (UserMembership userMembership : userMemberships) {
            Integer membershipChainId = userMembership.getMembership().getChain().getId();
            if (membershipChainId.equals(fuelPriceChainId)) {
                stationFuelPrice.setPrice(stationFuelPrice.getPrice().subtract(userMembership.getMembership().getDiscount()));
            }
        }
    }

    private List<UserMembership> findUserMemberships(Integer userId) {
        List<UserMembership> userMemberships = new ArrayList<>();
        if (userId != null) {
            userMemberships = membershipService.getUserMemberships(userId);
        }
        return userMemberships;
    }


    private List<StationFuelPrice> cheapestFuel(Fuel fuelType) {
        return stationFuelPriceRepository.findLowestLatestPriceByFuelId(fuelType.getId(), Status.ACTIVE.getCode());
    }
}
