package ee.bcs.backend.service;

import ee.bcs.backend.controller.dto.MessageResponseDto;
import ee.bcs.backend.controller.fuelprice.dto.FuelStationPriceDto;
import ee.bcs.backend.infrastructure.exception.DataNotFoundException;
import ee.bcs.backend.persistence.stationfuel.StationFuel;
import ee.bcs.backend.persistence.stationfuel.StationFuelRepository;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPrice;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPriceMapper;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPriceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

import static ee.bcs.backend.infrastructure.error.ErrorResponse.INCORRECT_FUEL_TYPE;

@Service
@RequiredArgsConstructor
public class FuelPriceService {
    private final StationFuelRepository stationFuelRepository;
    private final StationFuelPriceMapper stationFuelPriceMapper;
    private final StationFuelPriceRepository stationFuelPriceRepository;


    public MessageResponseDto addFuelPrices(FuelStationPriceDto fuelStationPriceDto) {
        StationFuel stationFuel = validateStationSellsFuel(fuelStationPriceDto);
        createAndSaveStationFuelPrice(fuelStationPriceDto, stationFuel);
        return new MessageResponseDto("Hind lisatud");
    }

    private void createAndSaveStationFuelPrice(FuelStationPriceDto fuelStationPriceDto, StationFuel stationFuel) {
        StationFuelPrice stationFuelPrice = stationFuelPriceMapper.toStationFuelPrice(fuelStationPriceDto);
        stationFuelPrice.setTime(LocalDateTime.now());
        stationFuelPrice.setStationFuel(stationFuel);
        stationFuelPriceRepository.save(stationFuelPrice);
    }

    private StationFuel validateStationSellsFuel(FuelStationPriceDto fuelStationPriceDto) {
        Optional<StationFuel> optionalStationFuel = stationFuelRepository.findStationFuelExists(fuelStationPriceDto.getStationId(), fuelStationPriceDto.getFuelId());
        if (optionalStationFuel.isEmpty()) {
            throw new DataNotFoundException(INCORRECT_FUEL_TYPE.getMessage(), INCORRECT_FUEL_TYPE.getErrorCode());
        }
        return optionalStationFuel.get();

    }
}
