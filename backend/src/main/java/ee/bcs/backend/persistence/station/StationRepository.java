package ee.bcs.backend.persistence.station;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StationRepository extends JpaRepository<Station, Integer> {
    @Query("select s from Station s where s.status = :status")
    List<Station> findByStatus(String status);
}