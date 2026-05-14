package ee.bcs.backend.persistence.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {


    @Query("""
            select u from User u
            where upper(u.username) = upper(:username) and u.password = :password and u.status = :status
            order by u.id, u.role.name""")
    Optional<User> findUserBy(String username, String password, String status);

    @Query("select u from User u where upper (u.username) = upper(:username)")
    Optional<User> findUserByUsername(@Param("username") String username);


}