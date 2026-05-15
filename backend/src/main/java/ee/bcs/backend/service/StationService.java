package ee.bcs.backend.service;

import ee.bcs.backend.controller.fuel.dto.BestPriceDto;
import ee.bcs.backend.controller.fuel.dto.StationFuelBestPriceMapper;
import ee.bcs.backend.persistence.fuel.Fuel;
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
    private final StationFuelBestPriceMapper stationFuelBestPriceMapper;

    public List<BestPriceDto> getBestPrices(int userId) {
        List<UserMembership> userMemberships = membershipService.getUserMemberships(userId);
        List<BestPriceDto> bestPriceDtos = new java.util.ArrayList<>(List.of());
        for (Fuel fuelType : fuelService.getFuelTypes()) {
            StationFuelPrice stationFuelPrice = cheepestFuel(fuelType);
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
            bestPriceDtos.add(stationFuelBestPriceMapper.toDto(stationFuelPrice));
        }
        return bestPriceDtos;

    }

    private StationFuelPrice cheepestFuel(Fuel fuelType) {
        Optional<StationFuelPrice> optionalStationFuelPrice = stationFuelPriceRepository.findLowestLatestPriceByFuelId(fuelType.getId(), "A");
        return optionalStationFuelPrice.orElse(null);
    }
}
