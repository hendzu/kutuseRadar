package ee.bcs.backend.service;

import ee.bcs.backend.Status;
import ee.bcs.backend.controller.user.dto.LoginResponseDto;
import ee.bcs.backend.infrastructure.exception.DataNotFoundException;
import ee.bcs.backend.infrastructure.exception.ForbiddenException;
import ee.bcs.backend.persistence.role.Role;
import ee.bcs.backend.persistence.role.RoleRepository;
import ee.bcs.backend.persistence.user.User;
import ee.bcs.backend.persistence.user.UserMapper;
import ee.bcs.backend.persistence.user.UserRepository;
import lombok.AllArgsConstructor;
import org.jspecify.annotations.NonNull;
import org.springframework.stereotype.Service;


import static ee.bcs.backend.infrastructure.error.ErrorResponse.INCORRECT_CREDENTIALS;
import static ee.bcs.backend.infrastructure.error.ErrorResponse.USER_EXISTS;

@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final RoleRepository roleRepository;

    public LoginResponseDto login(String username, String password) {
        User user = userRepository.findUserBy(username, password,"A").orElseThrow(()-> new ForbiddenException(INCORRECT_CREDENTIALS.getMessage(),INCORRECT_CREDENTIALS.getErrorCode()));
        LoginResponseDto loginResponseDto = userMapper.toDto(user);
        loginResponseDto.setRoleName(user.getRole().getName());
        return loginResponseDto;
    }
    public void register(String username, String password) {
        userRepository.findUserByUsername(username).ifPresent(u -> {
            throw new DataNotFoundException(USER_EXISTS.getMessage(), USER_EXISTS.getErrorCode());
        });
        Role role   = roleRepository.findByName("USER").orElseThrow();
        User user = createAndMapUser(username, password, role);
        userRepository.save(user);
    }

    private static @NonNull User createAndMapUser(String username, String password, Role role) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);
        user.setStatus(Status.ACTIVE.getCode());
        return user;
    }
}
