package ee.bcs.backend.persistence.stationfuelprice;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface StationFuelPriceRepository extends JpaRepository<StationFuelPrice, Integer> {
    @Query("""
            SELECT s FROM StationFuelPrice s
            WHERE s.stationFuel.fuel.id = :fuelId
              AND s.stationFuel.status = :stationFuelStatus
              AND s.time = (
                  SELECT MAX(s2.time) FROM StationFuelPrice s2
                  WHERE s2.stationFuel = s.stationFuel
              )
            ORDER BY s.price ASC
            LIMIT 1""")
    Optional<StationFuelPrice> findLowestLatestPriceByFuelId(Integer fuelId, String stationFuelStatus);
}