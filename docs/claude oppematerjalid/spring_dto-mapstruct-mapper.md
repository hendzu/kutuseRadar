## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/r6HYIVmcOiL-H7j02IhgkrcanPSy3CBttWbti6NV-HekIQnAgZw2imxnw7udyWnT.f_F9yAjKbdUaXUW0?startTime=1777456121000) |
| **Parool** | `0C*wHhP&` |
| **Transkript** | [GMT20260429-094841_v-2.vtt](../transcripts/GMT20260429-094841_v-2.vtt) |

## Sisukord

- [DTO klassi loomine ja nimetamine](#dto-klassi-loomine-ja-nimetamine) - `0:00:14`
- [Entity objektist DTO objekti käsitsi tegemine](#entity-objektist-dto-objekti-kasitsi-tegemine) - `0:10:34`
- [Return type ja controlleri vastus](#return-type-ja-controlleri-vastus) - `0:24:11`
- [Swaggeri ja debuggeriga flow kontrollimine](#swaggeri-ja-debuggeriga-flow-kontrollimine) - `0:31:19`
- [Miks käsitsi mappimine tüütuks läheb?](#miks-kasitsi-mappimine-tuutuks-laheb) - `0:49:19`
- [Interface kui mall](#interface-kui-mall) - `0:51:46`
- [MapStruct mapper ja mapperi asukoht](#mapstruct-mapper-ja-mapperi-asukoht) - `1:05:40`
- [@Mapping source ja target](#mapping-source-ja-target) - `1:32:17`
- [Mapperi kasutamine service klassis](#mapperi-kasutamine-service-klassis) - `1:46:01`
- [BEB-6 - linnade info teenus](#beb-6) - `2:16:58`
- [Listi mappimine DTO listiks](#listi-mappimine-dto-listiks) - `3:05:45`

## DTO klassi loomine ja nimetamine {#dto-klassi-loomine-ja-nimetamine}

DTO ehk Data Transfer Object on klass, mis kirjeldab API kaudu liikuvat andmestruktuuri. See ei ole andmebaasi entity, vaid eraldi "kandik", millega saadad välja ainult vajaliku info.

### Selgitus

Videos jätkati login teenusega. Andmebaasist leitakse `User` entity, aga frontendile on vaja tagastada ainult `userId` ja `roleName`.

DTO nimi peaks ütlema, mille jaoks see objekt on. Kui objekt on mõeldud login teenuse vastuseks, sobib nimi `LoginResponseDto`. Kui objekt on mõeldud linnade valikusse, sobib nimi `CityOptionDto`.

DTO failid pannakse controlleri teema alla `dto` kausta, sest need on tihedalt seotud API sõnumitega.

### Koodinäide

```java
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginResponseDto {
    private Integer userId;
    private String roleName;
}
```

Olulised Lomboki annotatsioonid:

- `@Data` lisab getterid, setterid ja muud abimeetodid.
- `@NoArgsConstructor` lubab teha tühja objekti.
- `@AllArgsConstructor` lubab teha objekti kõigi väljadega.

### Päriselu analoogia

Entity on köögi sisemine retsept koos kõige tehnilise infoga. DTO on kliendile serveeritud taldrik, kus on ainult see, mida klient nägema peab.

## Entity objektist DTO objekti käsitsi tegemine {#entity-objektist-dto-objekti-kasitsi-tegemine}

Enne mapperi kasutamist tehti sama töö käsitsi, et oleks selge, mis taustal tegelikult toimub.

### Selgitus

Kui meil on `User` objekt olemas, siis see on source ehk lähteobjekt. `LoginResponseDto` on target ehk sihtobjekt. Mappimine tähendab, et võtame source objektilt vajalikud väärtused ja paneme need target objekti väljadele.

### Skeem

```text
User entity (source)
  id
  role.name
  username
  password
       |
       | tõsta vajalikud väljad ümber
       v
LoginResponseDto (target)
  userId
  roleName
```

### Koodinäide

```java
LoginResponseDto loginResponseDto = new LoginResponseDto();
loginResponseDto.setUserId(user.getId());
loginResponseDto.setRoleName(user.getRole().getName());
return loginResponseDto;
```

`user.getId()` annab kasutaja id. `user.getRole().getName()` liigub ühe kihi sügavamale: kõigepealt võetakse `Role` objekt ja selle seest `name`.

### Päriselu analoogia

See on nagu ühest kastist vajalike asjade võtmine ja teisele kandikule tõstmine. Kõike kastis olevat ei anta edasi.

## Return type ja controlleri vastus {#return-type-ja-controlleri-vastus}

Kui meetod midagi tagastab, peab meetodi signatuuris olema õige tagastatav tüüp.

### Selgitus

Kui service meetod tagastab `LoginResponseDto`, ei saa meetodi tagastatav tüüp olla `void`. `void` tähendab, et meetod ei tagasta midagi.

Kui service hakkab midagi tagastama, peab ka controller selle tulemuse vastu võtma ja edasi tagastama.

### Koodinäide

```java
public LoginResponseDto login(String username, String password) {
    User user = userRepository.findUserBy(username, password, ACTIVE.getCode()).get();
    LoginResponseDto loginResponseDto = userMapper.toLoginResponseDto(user);
    return loginResponseDto;
}
```

Controlleris:

```java
@GetMapping("/login")
public LoginResponseDto login(@RequestParam String username, @RequestParam String password) {
    LoginResponseDto loginResponseDto = loginService.login(username, password);
    return loginResponseDto;
}
```

### Päriselu analoogia

Kui töötaja lubab kliendile anda paberi, peab ta päriselt paberi tagasi andma. Kui ametijuhendis on kirjas "ei anna midagi", aga käes on dokument, tekib vastuolu.

## Swaggeri ja debuggeriga flow kontrollimine {#swaggeri-ja-debuggeriga-flow-kontrollimine}

Swaggeri kaudu saab endpointi käsitsi käivitada ja debuggeriga saab vaadata, kuidas objektid liiguvad.

### Selgitus

Videos käivitati login endpoint Swaggerist. Debugger peatus controlleris, liikus edasi service klassi, sealt repository päringu juurde ja lõpuks tagasi controllerisse.

Oluline mõte: kontrolleri meetodit ei kutsuta käsitsi. Selle käivitab Springi dispatcher, kui HTTP sõnum sobib URL-i ja meetodiga.

### Skeem

```text
Swagger
  GET /api/login
       |
       v
LoginController
       |
       v
LoginService
       |
       v
UserRepository
       |
       v
Database
```

### Koodinäide

```java
User user = userRepository.findUserBy(username, password, ACTIVE.getCode()).get();
```

Debuggeris on näha, et enne seda rida on olemas `username` ja `password`. Pärast seda rida on olemas `User` objekt.

### Päriselu analoogia

Debugger on nagu jälgimiskaamera töökojas. Sa näed, millal tellimus kelle juurde jõuab ja millise kujuga see järgmisse kohta edasi liigub.

## Miks käsitsi mappimine tüütuks läheb? {#miks-kasitsi-mappimine-tuutuks-laheb}

Kahe väljaga DTO-d on lihtne käsitsi täita. Suuremate objektide puhul muutub sama töö korduvaks ja veaohtlikuks.

### Selgitus

Käsitsi mappimisel pead ise kirjutama:

```java
target.setSomething(source.getSomething());
```

Kui välju on kümme, on ridu palju. Kui mõni väli on teise objekti sees, pead lisama ka `null` kontrollid. Näiteks `user.getRole().getName()` võib katki minna, kui `role` on `null`.

MapStruct genereerib sellise korduva koodi ise ja lisab ka lihtsaid kaitseid, näiteks kontrolli, kas source objekt on `null`.

### Päriselu analoogia

Kui pead ühe korra aadressi ümber kirjutama, pole probleemi. Kui pead seda tegema iga päev sadade ridadega, tahad tööriista, mis teeb seda sinu eest.

## Interface kui mall {#interface-kui-mall}

Interface on mall ehk leping. See ütleb, millised meetodid peavad olemas olema, aga ei sisalda tavaliselt päris lahendust.

### Selgitus

Interface ei kirjelda, kuidas töö täpselt tehakse. Ta ütleb ainult, et selline tegevus peab olemas olema. Päris klass, mis interface'i implementeerib, peab meetodite keha ise kirjutama.

Videos kasutati näidet, kus `Animal` interface ütleb, et loom peab oskama häält teha ja ütlema, mida ta sööb. `Cat` ja `Dog` annavad oma lahenduse.

### Koodinäide

```java
public interface Animal {
    void makeNoise();
    String getWhatIEat();
}

public class Cat implements Animal {
    @Override
    public void makeNoise() {
        System.out.println("meow");
    }

    @Override
    public String getWhatIEat() {
        return "cat food";
    }
}
```

### Päriselu analoogia

Interface on nagu tööleping: seal on kirjas, mida töötaja peab suutma teha. Kuidas konkreetne töötaja seda teeb, sõltub töötajast.

## MapStruct mapper ja mapperi asukoht {#mapstruct-mapper-ja-mapperi-asukoht}

MapStruct mapper on interface, mille põhjal MapStruct genereerib päris implementatsiooni.

### Selgitus

Mapper pannakse tavaliselt entity juurde, sest mapper on seotud andmebaasi objektiga. Kui mappimine käib `User` entity pealt, on nimi `UserMapper`. Kui mappimine käib `City` entity pealt, on nimi `CityMapper`.

Mapperi meetod kirjeldab, mis objekt tuleb sisse ja mis objekt peab välja minema.

### Koodinäide

```java
@Mapper
public interface UserMapper {

    @Mapping(source = "id", target = "userId")
    @Mapping(source = "role.name", target = "roleName")
    LoginResponseDto toLoginResponseDto(User user);
}
```

See ütleb:

- sisend on `User user`;
- väljund on `LoginResponseDto`;
- `User.id` läheb `LoginResponseDto.userId` väljale;
- `User.role.name` läheb `LoginResponseDto.roleName` väljale.

### Päriselu analoogia

Mapper on kokk, kes võtab köögist tooraine ja paneb selle kliendile sobivale taldrikule.

## @Mapping source ja target {#mapping-source-ja-target}

`@Mapping` annotatsioonis tähendab `source` lähtevälja ja `target` sihtvälja.

### Selgitus

Source tuleb sisendobjektist. Target on väljundobjekti väli. MapStruct oskab lihtsaid samu nimesid ise kokku viia, aga kui nimed erinevad, tuleb talle öelda, kuidas väljad seostuvad.

`role.name` tähendab liikumist objekti sees sügavamale: `user.getRole().getName()`.

### Koodinäide

```java
@Mapping(source = "id", target = "userId")
@Mapping(source = "role.name", target = "roleName")
LoginResponseDto toLoginResponseDto(User user);
```

MapStructi genereeritud kood teeb sisuliselt midagi sellist:

```java
if (user == null) {
    return null;
}

LoginResponseDto dto = new LoginResponseDto();
dto.setUserId(user.getId());
dto.setRoleName(user.getRole().getName());
return dto;
```

Päris genereeritud kood võib teha lisaks abimeetodi ja `null` kontrolli, et sügavama välja lugemine oleks turvalisem.

### Päriselu analoogia

`source` ütleb, millisest riiulist asi võtta. `target` ütleb, millisele kandiku kohale see panna.

## Mapperi kasutamine service klassis {#mapperi-kasutamine-service-klassis}

Service klass ei peaks käsitsi kõiki DTO välju täitma, kui mapper saab selle töö ära teha.

### Selgitus

Et service saaks mapperit kasutada, peab mapper olema Spring bean. Selleks kasutatakse MapStructi `componentModel = SPRING` või lihtsamat `@Mapper` seadistust vastavalt projektile.

Service klassis lisatakse mapper dependency'na `private final` väljaks. Lomboki `@RequiredArgsConstructor` loob konstruktori ja Spring süstib sinna õige objekti.

### Koodinäide

```java
@Service
@RequiredArgsConstructor
public class LoginService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;

    public LoginResponseDto login(String username, String password) {
        User user = userRepository.findUserBy(username, password, ACTIVE.getCode()).get();
        LoginResponseDto loginResponseDto = userMapper.toLoginResponseDto(user);
        return loginResponseDto;
    }
}
```

`userMapper.toLoginResponseDto(user)` võtab `User` objekti ja tagastab `LoginResponseDto` objekti.

### Päriselu analoogia

Service on kelner, kes ütleb köögile, mida vaja on. Mapper on kokk, kes paneb andmed õigesse vormi.

## BEB-6 - linnade info teenus {#beb-6}

Videos alustati taskiga BEB-6: luua teenus, mis tagastab kõik linnad kujul `cityId` ja `cityName`.

### Selgitus

Endpoint on `GET /api/cities`. Päring ei vaja sisendparameetreid, sest eesmärk on tagastada kõik linnad. Controller suunab töö service klassile. Service küsib repository kaudu kõik `City` entityd ja mapper teeb neist DTO-d.

### Skeem

```text
GET /api/cities
       |
       v
CityController.findCities()
       |
       v
CityService.findCities()
       |
       v
CityRepository.findAll()
       |
       v
CityMapper.toCityOptionDtos(...)
```

### Koodinäide

```java
@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class CityController {

    private final CityService cityService;

    @GetMapping("/cities")
    public List<CityOptionDto> findCities() {
        List<CityOptionDto> cities = cityService.findCities();
        return cities;
    }
}
```

Service:

```java
@Service
@RequiredArgsConstructor
public class CityService {

    private final CityRepository cityRepository;
    private final CityMapper cityMapper;

    public List<CityOptionDto> findCities() {
        List<City> cities = cityRepository.findAll();
        List<CityOptionDto> cityOptionDtos = cityMapper.toCityOptionDtos(cities);
        return cityOptionDtos;
    }
}
```

### Päriselu analoogia

Kui klient küsib linnade nimekirja, ei taha ta näha andmebaasi tabeli sisemist vormi. Ta tahab valikusse sobivat nimekirja: id ja nimi.

## Listi mappimine DTO listiks {#listi-mappimine-dto-listiks}

Kui repository tagastab `List<City>`, peab API tagastama `List<CityOptionDto>`.

### Selgitus

MapStruct vajab tavaliselt üksikobjekti mappimise reeglit. Kui olemas on meetod `City -> CityOptionDto`, oskab MapStruct teha ka listi mappimise `List<City> -> List<CityOptionDto>`.

Üksikobjekti reegel:

```java
@Mapping(source = "id", target = "cityId")
@Mapping(source = "name", target = "cityName")
CityOptionDto toCityOptionDto(City city);
```

Listi reegel:

```java
List<CityOptionDto> toCityOptionDtos(List<City> cities);
```

### Koodinäide

```java
@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE,
        componentModel = MappingConstants.ComponentModel.SPRING)
public interface CityMapper {

    @Mapping(source = "id", target = "cityId")
    @Mapping(source = "name", target = "cityName")
    CityOptionDto toCityOptionDto(City city);

    List<CityOptionDto> toCityOptionDtos(List<City> cities);
}
```

MapStructi genereeritud mõtteline loogika:

```java
List<CityOptionDto> result = new ArrayList<>();

for (City city : cities) {
    CityOptionDto dto = toCityOptionDto(city);
    result.add(dto);
}

return result;
```

### Päriselu analoogia

Kui sul on kastitäis õunu ja iga õun tuleb pakkida eraldi kotti, siis listi mappimine tähendab: võta iga õun, paki ära, pane uude kasti.
