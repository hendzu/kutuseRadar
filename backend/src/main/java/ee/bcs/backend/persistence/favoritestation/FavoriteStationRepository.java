package ee.bcs.backend.persistence.favoritestation;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface FavoriteStationRepository extends JpaRepository<FavoriteStation, Integer> {
    @Query("select f from FavoriteStation f where f.user.id = :userId")
    List<FavoriteStation> findFavoriteStationBy(Integer userId);
@Transactional
    void deleteByUser_IdAndStation_Id(Integer userId, Integer stationId);

    boolean existsByUser_IdAndStation_Id(Integer userId, Integer stationId);
}