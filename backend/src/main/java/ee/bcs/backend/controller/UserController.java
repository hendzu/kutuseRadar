package ee.bcs.backend.controller;

import ee.bcs.backend.controller.dto.LoginResponseDto;
import ee.bcs.backend.infrastructure.error.ApiError;
import ee.bcs.backend.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/login")
    @Operation(summary = "Sisse logimine. Tagastab userId ja roleName",
            description = """
                Süsteemist otsitakse username ja password abil kasutajat, kelle konto on ka aktiivne.
                Kui vastet ei leita vistakse viga errorCode'ga 100""")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "OK"),
            @ApiResponse(responseCode = "403",
                    description = "Vale kasutajanimi või parool",
                    content = @Content(schema = @Schema(implementation = ApiError.class)))})
    public LoginResponseDto login(@RequestParam String username, @RequestParam String password){
        return userService.login(username, password);
    }
    @PostMapping("/register")
    @Operation(summary="Kasutaja registeerimine, sisestab username ja password",
    description = """
             Sisestab uued username, password user tabelisse, role ja status määratakse automaatselt.
            Kui kasutajanimi on juba võetud viskab errorcode 102
            

            """)

        public void register(@RequestParam String username, @RequestParam String password) {
            userService.register(username, password);
        }

}
