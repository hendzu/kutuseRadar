package ee.bcs.backend.persistence.favoritestation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface FavoriteStationRepository extends JpaRepository<FavoriteStation, Integer> {
    @Query("select f from FavoriteStation f where f.user.id = :userId")
    List<FavoriteStation> findFavoriteStationBy(Integer userId);
}