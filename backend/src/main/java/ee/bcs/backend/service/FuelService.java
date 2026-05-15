package ee.bcs.backend.service;

import ee.bcs.backend.persistence.fuel.Fuel;
import ee.bcs.backend.persistence.fuel.FuelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FuelService {


    private final FuelRepository fuelRepository;

    public List<Fuel> getFuelTypes() {
        return fuelRepository.findAll();
    }
}
