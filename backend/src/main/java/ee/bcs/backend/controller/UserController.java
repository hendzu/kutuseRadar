package ee.bcs.backend.controller;

import ee.bcs.backend.controller.dto.UserDto;
import ee.bcs.backend.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/login")
    public UserDto login(@RequestParam String username, @RequestParam String password){
        UserDto loginDto = userService.login(username, password);
        return loginDto ;
    }
}
