package ee.bcs.backend.persistence.stationfuel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface StationFuelRepository extends JpaRepository<StationFuel, Integer> {

    @Query("select s from StationFuel s where s.station.id = :stationId and s.fuel.id = :fuelId")
    Optional<StationFuel> findStationFuelExists(Integer stationId, Integer fuelId);
}