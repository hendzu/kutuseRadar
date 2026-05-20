package ee.bcs.backend.service;

import ee.bcs.backend.controller.fuel.dto.FuelOptionDto;
import ee.bcs.backend.persistence.fuel.Fuel;
import ee.bcs.backend.persistence.fuel.FuelMapper;
import ee.bcs.backend.persistence.fuel.FuelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FuelService {


    private final FuelRepository fuelRepository;
    private final FuelMapper fuelMapper;


    public List<Fuel> getFuelTypes() {
        return fuelRepository.findAll();
    }

    public List<FuelOptionDto> getFuelTypeDtos() {
        return fuelMapper.tofuelOptionDtos(getFuelTypes());

    }
}
