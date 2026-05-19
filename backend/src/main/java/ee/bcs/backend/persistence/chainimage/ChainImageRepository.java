package ee.bcs.backend.persistence.chainimage;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ChainImageRepository extends JpaRepository<ChainImage, Integer> {
    Optional<ChainImage> findByChain_Id(Integer chainId);
}