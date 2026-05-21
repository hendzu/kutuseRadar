package ee.bcs.backend.persistence.membership;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MembershipRepository extends JpaRepository<Membership, Integer> {
    List<Membership> findByChainIdAndStatus (Integer chainId, String status);
}