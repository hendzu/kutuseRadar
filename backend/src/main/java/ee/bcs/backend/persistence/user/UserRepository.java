package ee.bcs.backend.persistence.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {


    @Query("""
            select u from User u
            where upper(u.username) = upper(:username) and u.status = :status and u.password = :password
            order by u.id, u.role""")
    Optional<User> findUserBy(String username, String password, String status);
}