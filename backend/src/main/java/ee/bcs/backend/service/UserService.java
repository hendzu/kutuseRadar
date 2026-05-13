package ee.bcs.backend.service;

import ee.bcs.backend.controller.dto.UserDto;
import ee.bcs.backend.persistence.user.User;
import ee.bcs.backend.persistence.user.UserMapper;
import ee.bcs.backend.persistence.user.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;

    public UserDto login(String username, String password) {
        Optional<User> optionalUser = userRepository.findUserBy(username, password,"A");
        return userMapper.toDto(optionalUser.get());
    }
}
