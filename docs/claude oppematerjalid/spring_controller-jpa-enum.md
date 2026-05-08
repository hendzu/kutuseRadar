## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/BiRRH8cNRmRzkPv8eCCILW2wnqktc9wpey4XkHrV0YsRSR_rE-u3gzLULn1x-rRh.ABx69EkV3ourkjGa?startTime=1777442925000) |
| **Parool** | `0C*wHhP&` |
| **Transkript** | [GMT20260429-060845_v-1.vtt](../transcripts/GMT20260429-060845_v-1.vtt) |

## Sisukord

- [Controller ja endpoint - kust programm pihta hakkab?](#controller-ja-endpoint) - `0:01:00`
- [URL ja HTTP meetod töötavad koos](#url-ja-http-meetod) - `0:03:30`
- [Meetodi struktuur ja parameetrid](#meetodi-struktuur-ja-parameetrid) - `0:11:22`
- [Controller-Service-Repository kihid](#controller-service-repository-kihid) - `0:18:25`
- [Repository loomine ja JPA päringumeetod](#repository-loomine-ja-jpa-paringumeetod) - `0:31:12`
- [@Query, nimelised parameetrid ja loetavad nimed](#query-nimelised-parameetrid-ja-loetavad-nimed) - `0:37:42`
- [Konstandid, static ja enum](#konstandid-static-ja-enum) - `1:08:03`
- [Optional ja leitud kasutaja kasti seest võtmine](#optional-ja-leitud-kasutaja) - `2:10:14`
- [Entity, DTO ja mapper](#entity-dto-ja-mapper) - `2:22:36`
- [BEB-5 - login teenuse tagastuskuju](#beb-5) - `2:39:50`

## Controller ja endpoint - kust programm pihta hakkab? {#controller-ja-endpoint}

Kontroller on klass, kuhu Spring suunab väljast tulevad HTTP päringud. Seda meetodit ei kutsu tavaliselt sinu enda kood otse välja. Meetodi kutsub välja Spring, kui päringu URL ja HTTP meetod sobivad annotatsioonidega.

### Selgitus

Spring Boot rakendus käivitatakse `main` meetodist. Pärast seda jääb server tööle ja ootab päringuid. Kui brauser või frontend saadab näiteks `GET /api/login`, siis Spring otsib kontrollerist meetodi, mis sellele sobib.

Kontrolleri ülesanne on hoida uksekoht puhas: ta võtab päringu vastu, loeb vajalikud sisendid ja annab töö edasi service kihile.

### Skeem

```text
Frontend / brauser
       |
       | GET /api/login?username=rain&password=123
       v
LoginController
       |
       v
LoginService
```

### Koodinäide

```java
@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;

    @GetMapping("/login")
    public LoginResponseDto login(@RequestParam String username, @RequestParam String password) {
        LoginResponseDto loginResponseDto = loginService.login(username, password);
        return loginResponseDto;
    }
}
```

Siin tuleb kogu aadress kokku kahest osast: klassi peal olev `/api` ja meetodi peal olev `/login`.

### Päriselu analoogia

Kontroller on nagu vastuvõtulaud. Ta ei tee kogu tööd ise, vaid saab kliendi soovi kätte ja suunab selle õige töötaja juurde.

## URL ja HTTP meetod töötavad koos {#url-ja-http-meetod}

Endpoint ei ole ainult URL. Spring vaatab korraga vähemalt kahte asja: URL-i ja HTTP meetodit.

### Selgitus

URL ütleb, millest käib jutt. HTTP meetod ütleb, mida sellega teha tahetakse.

- `GET` küsib andmeid ja ei tohiks andmebaasi muuta.
- `POST` loob tavaliselt midagi uut.
- `PUT` uuendab olemasolevat tervikuna.
- `PATCH` muudab osa olemasolevast.
- `DELETE` kustutab või märgib kustutatuks.

Videos rõhutati, et URL-is ei peaks olema tegusõnu nagu `add`, `create` või `update`. Tegevuse mõte tuleb HTTP meetodist.

### Skeem

```text
GET    /api/cities      -> küsi linnade nimekiri
POST   /api/users       -> loo uus kasutaja
PUT    /api/users/5     -> uuenda kasutaja 5
DELETE /api/users/5     -> kustuta kasutaja 5
```

### Koodinäide

```java
@GetMapping("/cities")
public List<CityOptionDto> findCities() {
    List<CityOptionDto> cities = cityService.findCities();
    return cities;
}
```

`/cities` on ressurss ehk "mis asi". `@GetMapping` ütleb, et seda kasutatakse andmete küsimiseks.

### Päriselu analoogia

URL on nagu riiuli nimi poes. HTTP meetod on tegevus: kas sa vaatad riiulit, lisad sinna kauba, muudad silti või võtad midagi ära.

## Meetodi struktuur ja parameetrid {#meetodi-struktuur-ja-parameetrid}

Meetod on nimeline koodilõik. Parameetrid on sildid, mille kaudu meetod saab väljastpoolt andmeid.

### Selgitus

Java meetodil on tavaliselt sellised osad:

```text
nahtavus tagastatav_tuup meetodiNimi(parameetrid) {
    meetodi keha
}
```

Näiteks `public LoginResponseDto login(String username, String password)` tähendab:

- `public` - meetod on nähtav ka väljastpoolt klassi.
- `LoginResponseDto` - meetod tagastab sellist tüüpi objekti.
- `login` - meetodi nimi.
- `String username, String password` - meetod vajab kahte tekstilist sisendit.

Parameetri nimi ei pea eri meetodites tehniliselt sama olema, aga sama nimi teeb koodi loetavamaks. Kui controlleris on `username` ja service meetodis on ka `username`, on lihtsam jälgida, kuidas info liigub.

### Koodinäide

```java
public LoginResponseDto login(String username, String password) {
    User user = userRepository.findUserBy(username, password, ACTIVE.getCode()).get();
    LoginResponseDto loginResponseDto = userMapper.toLoginResponseDto(user);
    return loginResponseDto;
}
```

`username` ja `password` tulevad controllerist. Service kasutab neid andmebaasist kasutaja otsimiseks.

### Päriselu analoogia

Kui ütled kellelegi "kirjuta tahvlile", jääb puudu info, mida kirjutada. Parameeter ongi see lisainfo: "kirjuta tahvlile lause X".

## Controller-Service-Repository kihid {#controller-service-repository-kihid}

Springi backend jagatakse tavaliselt kihtideks. Igal kihil on oma vastutus.

### Selgitus

Controller võtab HTTP päringu vastu. Service teeb äriloogika. Repository suhtleb andmebaasiga. Entity kirjeldab andmebaasi tabeli rida. DTO kirjeldab andmeid, mida tahame API kaudu välja saata või sisse võtta.

Selline jaotus hoiab koodi arusaadavana. Kui kõik oleks ühes controlleri meetodis, läheks kood kiiresti segaseks.

### Skeem

```text
Controller
  võtab päringu vastu
       |
       v
Service
  otsustab, mida teha
       |
       v
Repository
  küsib andmebaasist
       |
       v
Database
```

### Koodinäide

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

Siin küsib service repository kaudu `City` entity objektid ja mapper teeb neist `CityOptionDto` objektid.

### Päriselu analoogia

Restoranis kelner ei lähe ise lattu ega hakka toitu valmistama. Ta võtab tellimuse vastu, köök teeb töö ja lõpuks tuuakse kliendile sobival kujul taldrik.

## Repository loomine ja JPA päringumeetod {#repository-loomine-ja-jpa-paringumeetod}

Repository on ligipääs kindla tabeli andmetele. Spring Data JPA teeb palju andmebaasitööd sinu eest ära.

### Selgitus

Repository on seotud entity klassiga. Näiteks `UserRepository extends JpaRepository<User, Integer>` tähendab, et see repository töötab `User` entityga ja `User` primaarvõtme tüüp on `Integer`.

Videos näidati, kuidas IntelliJ abil repositoryt kiiremini luua: kirjutad service klassis vajaliku muutuja nime, lased IDE-l repository genereerida ja paned selle õige entity kausta.

### Koodinäide

```java
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("select u from User u where u.username = :username and u.password = :password and u.status = :status")
    Optional<User> findUserBy(String username, String password, String status);
}
```

`JpaRepository` annab kaasa valmis meetodid nagu `findAll`, `findById`, `save` ja `delete`. Oma eraldi päringu jaoks lisatakse meetod `findUserBy`.

### Päriselu analoogia

Repository on nagu uks konkreetsesse lattu. Kui tahad kasutajate andmeid, lähed kasutajate uksest. Kui tahad linnade andmeid, lähed linnade uksest.

## @Query, nimelised parameetrid ja loetavad nimed {#query-nimelised-parameetrid-ja-loetavad-nimed}

`@Query` lubab kirjutada päringu ise ja hoida meetodi nime lühikese ning loetavana.

### Selgitus

Spring Data JPA oskab päringuid tuletada ka meetodi nimest. Näiteks väga pikk nimi võiks kirjeldada, et otsitakse kasutajat username, passwordi ja staatuse järgi. Kui tingimusi on mitu, muutub nimi kiiresti lohisevaks.

`@Query` puhul on päringu sisu annotatsioonis ja meetodi nimi võib jääda lihtsamaks. Nimelised parameetrid nagu `:username` on loetavamad kui positsioonilised parameetrid nagu `?1`, sest nimi ütleb, mis väärtus sinna läheb.

### Koodinäide

```java
@Query("""
    select u
    from User u
    where u.username = :username
      and u.password = :password
      and u.status = :status
""")
Optional<User> findUserBy(String username, String password, String status);
```

Kui meetodi parameetri nimi on `username`, siis `:username` viitab just sellele sisendile.

### Päriselu analoogia

Nimelised parameetrid on nagu ankeedi lahtrid "eesnimi" ja "parool". Positsioonilised parameetrid on nagu "lahter 1" ja "lahter 2" - need töötavad, aga pead rohkem meeles hoidma.

## Konstandid, static ja enum {#konstandid-static-ja-enum}

Otse koodi kirjutatud väärtust, näiteks `"A"`, nimetatakse literaaliks. Kui sellisel väärtusel on äriline tähendus, on parem anda talle nimi.

### Selgitus

Videos tehti läbi mõte, et `"A"` ei ütle lugejale palju. `ACTIVE.getCode()` ütleb kohe, et kasutatakse aktiivse staatuse koodi.

`static` tähendab, et väli kuulub klassile, mitte konkreetsele objektile. `enum` sobib hästi siis, kui väärtuste hulk on kindel: näiteks `ACTIVE` ja `SOFT_DELETED`.

### Koodinäide

```java
@Getter
public enum Status {
    ACTIVE("A"),
    SOFT_DELETED("D");

    private final String code;

    Status(String code) {
        this.code = code;
    }
}
```

Kasutus service klassis:

```java
import static ee.bcs.bank40back.Status.ACTIVE;

User user = userRepository.findUserBy(username, password, ACTIVE.getCode()).get();
```

`ACTIVE` on loetav nimi. `getCode()` annab andmebaasi jaoks vajaliku väärtuse `"A"`.

### Päriselu analoogia

Andmebaasis võib ruumi kokkuhoiu mõttes olla lühike kood, nagu lennujaama tähis. Koodis tahame aga näha tähendust, mitte ainult ühte tähte.

## Optional ja leitud kasutaja kasti seest võtmine {#optional-ja-leitud-kasutaja}

`Optional<User>` tähendab: "siin võib olla User, aga võib ka mitte olla".

### Selgitus

Kui login päring otsib kasutajat username, passwordi ja aktiivse staatuse järgi, võib juhtuda, et sellist kasutajat ei leita. Sellepärast tagastab repository `Optional<User>`, mitte lihtsalt `User`.

Videos programmeeriti alguses "happy path" ehk olukord, kus kasutaja leitakse. Sellisel juhul võetakse `Optional` seest päris `User` objekt välja `get()` meetodiga.

### Skeem

```text
Optional<User>
   |
   | .get()
   v
User
```

### Koodinäide

```java
User user = userRepository.findUserBy(username, password, ACTIVE.getCode()).get();
```

See töötab ainult siis, kui `Optional` sees on väärtus. Hiljem tuleks lisada ka veakäsitlus juhuks, kui kasutajat ei leita.

### Päriselu analoogia

`Optional` on nagu karp. Enne kasutamist peaksid teadma, kas karbis on asi sees. `get()` teeb karbi lahti ja võtab asja välja.

## Entity, DTO ja mapper {#entity-dto-ja-mapper}

Entity on andmebaasi tabeli rea objekt. DTO on API jaoks mõeldud andmeobjekt. Neid ei tasu segamini ajada.

### Selgitus

`User` entity sisaldab andmebaasi struktuuri järgi välju nagu `id`, `role`, `username`, `password` ja `status`. API vastuses ei taha me kõike välja anda. Eriti ei taha me välja anda parooli ega andmebaasi sisemist struktuuri.

Selleks kasutatakse DTO-d. Login vastus peab sisaldama ainult seda, mida frontend vajab: `userId` ja `roleName`.

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

Mapper teisendab entity DTO-ks:

```java
@Mapper
public interface UserMapper {

    @Mapping(source = "id", target = "userId")
    @Mapping(source = "role.name", target = "roleName")
    LoginResponseDto toLoginResponseDto(User user);
}
```

`role.name` tähendab, et `User` sees on `Role` objekt ja selle seest võetakse `name`.

### Skeem

```text
User entity
  id
  role.name
  username
  password
  status
       |
       | UserMapper
       v
LoginResponseDto
  userId
  roleName
```

### Päriselu analoogia

Entity on nagu köögi sisemine tööleht, kus on kogu info. DTO on kliendile toodud taldrik: seal on ainult see, mida klient vajab ja nägema peaks.

## BEB-5 - login teenuse tagastuskuju {#beb-5}

Videos viidati taskile BEB-5. Selle juures kontrolliti, millist objekti login teenus peab tagastama.

### Selgitus

Taski järgi ei peaks login tagastama tervet `User` entityt. Õige vastus on DTO kujul objekt, kus on `userId` ja `roleName`.

Kui tagastada entity otse, lekib välja liiga palju infot: näiteks `password`, `status` ja rolli sisemine objektistruktuur. DTO teeb vastuse lamedaks ja kontrollituks.

### Koodinäide

```java
public LoginResponseDto login(String username, String password) {
    User user = userRepository.findUserBy(username, password, ACTIVE.getCode()).get();
    LoginResponseDto loginResponseDto = userMapper.toLoginResponseDto(user);
    return loginResponseDto;
}
```

Selle meetodi lõpptulemus on API vastus, mis on umbes selline:

```json
{
  "userId": 2,
  "roleName": "customer"
}
```

### Päriselu analoogia

Kui keegi küsib sinu isikut tõendavat infot, ei anna sa talle kogu dokumendikausta. Annad ainult need väljad, mida tal päriselt vaja on.
