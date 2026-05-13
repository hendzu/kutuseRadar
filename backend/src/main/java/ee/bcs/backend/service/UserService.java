package ee.bcs.backend.service;

import ee.bcs.backend.controller.dto.UserDto;
import ee.bcs.backend.infrastructure.exception.ForbiddenException;
import ee.bcs.backend.persistence.user.User;
import ee.bcs.backend.persistence.user.UserMapper;
import ee.bcs.backend.persistence.user.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;


import static ee.bcs.backend.infrastructure.error.ErrorResponse.INCORRECT_CREDENTIALS;

@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;

    public UserDto login(String username, String password) {
        User user = userRepository.findUserBy(username, password,"A").orElseThrow(()-> new ForbiddenException(INCORRECT_CREDENTIALS.getMessage(),INCORRECT_CREDENTIALS.getErrorCode()));
        return userMapper.toDto(user);
    }
}
