package ee.bcs.backend.service;

import ee.bcs.backend.persistence.fuel.Fuel;
import ee.bcs.backend.persistence.usermembership.UserMembership;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StationService {
    private FuelService fuelService;
    private MembershipService membershipService;

    public List<BestPricesDto> getBestPrices(int userId) {
        List<UserMembership> userMemberships = membershipService.getUserMemberships(userId);
        for (Fuel fuelType : fuelService.getFuelTypes()) {

        }


        return null;
    }
}
