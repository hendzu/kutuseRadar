package ee.bcs.backend.persistence.usermembership;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserMembershipRepository extends JpaRepository<UserMembership, Integer> {

    @Query("""
            select u from UserMembership u
            where u.user.id = :userId and u.membership.status = :status
            order by u.membership.chain.id, u.membership.discount""")
    List<UserMembership> findValidMembershipChainDiscountBy(Integer userId, String status);
}