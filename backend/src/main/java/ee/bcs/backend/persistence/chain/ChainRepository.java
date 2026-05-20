package ee.bcs.backend.persistence.chain;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ChainRepository extends JpaRepository<Chain, Integer> {
    List<Chain> findByStatus(String status);
}