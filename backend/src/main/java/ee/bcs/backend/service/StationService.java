package ee.bcs.backend.service;

import ee.bcs.backend.Status;
import ee.bcs.backend.controller.dto.MessageResponseDto;
import ee.bcs.backend.controller.fuel.dto.BestPriceDto;
import ee.bcs.backend.controller.station.dto.StationDto;
import ee.bcs.backend.controller.station.dto.StationFuelPriceDto;
import ee.bcs.backend.controller.station.dto.StationLocationDto;
import ee.bcs.backend.controller.station.dto.StationOptionDto;
import ee.bcs.backend.infrastructure.exception.DataNotFoundException;
import ee.bcs.backend.persistence.chainimage.ChainImage;
import ee.bcs.backend.persistence.chainimage.ChainImageRepository;
import ee.bcs.backend.persistence.favoritestation.FavoriteStation;
import ee.bcs.backend.persistence.favoritestation.FavoriteStationRepository;
import ee.bcs.backend.persistence.fuel.Fuel;
import ee.bcs.backend.persistence.station.Station;
import ee.bcs.backend.persistence.station.StationMapper;
import ee.bcs.backend.persistence.station.StationRepository;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPrice;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPriceMapper;
import ee.bcs.backend.persistence.stationfuelprice.StationFuelPriceRepository;
import ee.bcs.backend.persistence.user.UserRepository;
import ee.bcs.backend.persistence.usermembership.UserMembership;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Base64;
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
    private final UserRepository userRepository;
    private final ChainImageRepository chainImageRepository;


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

    public MessageResponseDto addFavorite(Integer stationId, Integer userId) {
        FavoriteStation favoriteStation = new FavoriteStation();
        favoriteStation.setStation(stationRepository.getReferenceById(stationId));
        favoriteStation.setUser(userRepository.getReferenceById(userId));
        favoriteStationRepository.save(favoriteStation);
                return new MessageResponseDto("Lemmikjaam lisatud!");
    }
    public MessageResponseDto deleteFavorite(Integer stationId, Integer userId) {
        favoriteStationRepository.deleteByUser_IdAndStation_Id(userId,stationId);
        return new MessageResponseDto("Lemmikjaam kustutatud!");

    }
    public StationDto getStationDetail(Integer stationId, Integer userId) {
        Station station = stationRepository.findById(stationId)
                .orElseThrow(() -> new DataNotFoundException("Jaama ei leitud", 404));

        boolean isFavorite = userId != null &&
                favoriteStationRepository.existsByUser_IdAndStation_Id(userId, stationId);



        String chainLogo = null;
        ChainImage chainImage = chainImageRepository.findByChain_Id(station.getChain().getId()).orElse(null);
        if (chainImage != null) {
            chainLogo = Base64.getEncoder().encodeToString(chainImage.getLogo());
        }

        List<StationFuelPrice> prices = stationFuelPriceRepository
                .findLatestPriceByStationId(stationId, Status.ACTIVE.getCode());
        List<UserMembership> userMemberships = findUserMemberships(userId);
        for (StationFuelPrice price : prices) {
            applyMembershipDiscount(price, userMemberships);
        }

        List<StationFuelPriceDto> fuels = new ArrayList<>();
        for (StationFuelPrice price : prices) {
            fuels.add(stationFuelPriceMapper.toStationFuelPriceDto(price));
        }

        StationDto dto = new StationDto();
        dto.setStationId(stationId);
        dto.setStationName(station.getName());
        dto.setStationFavorite(isFavorite);
        dto.setChainName(station.getChain().getName());
        dto.setChainLogo(chainLogo);
        dto.setFuels(fuels);
        return dto;
    }

    public List<StationLocationDto> getStationLocations(Integer userId) {
        List<Station> stations = stationRepository.findByStatus(Status.ACTIVE.getCode());
        List<FavoriteStation> favorites = new ArrayList<>();
        if (userId != null) {
            favorites = favoriteStationRepository.findFavoriteStationBy(userId);
        }
        List<StationLocationDto> result = new ArrayList<>();
        for (Station station : stations) {
            StationLocationDto dto = new StationLocationDto();
                    dto.setStationId(station.getId());
                    dto.setStationName(station.getName());
                    dto.setStationLat(station.getLat().doubleValue());
                    dto.setStationLong(station.getLng().doubleValue());
                    dto.setIsInFavorites(false);
            for (FavoriteStation favorite : favorites) {
                if (favorite.getStation().getId().equals(station.getId())) {
                    dto.setIsInFavorites(true);
                }
            }
        result.add(dto);

        }
        return result;

    }
}
