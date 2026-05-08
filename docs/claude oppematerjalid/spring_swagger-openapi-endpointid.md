## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/q8EFC7yJM3SuepkHD56_fTmCnPnW71wMdpgfw-LdYRol_Jkli_TwrzSq1Fq7IR55.d_z6r2KMEo8jyi4B?startTime=1777529279000) |
| **Parool** | `vZ09*4x6` |
| **Transkript** | [GMT20260430-060759_v-1.vtt](../transcripts/GMT20260430-060759_v-1.vtt) |

## Sisukord

- [Õppematerjali skill ja transkriptide kasutamine](#oppematerjali-skill-ja-transkriptide-kasutamine) — `0:00:07`
- [AI agentide kasutamine samm-sammulises arenduses](#ai-agentide-kasutamine-samm-sammulises-arenduses) — `0:08:06`
- [City endpointi debugimine Swaggeri kaudu](#city-endpointi-debugimine-swaggeri-kaudu) — `0:11:13`
- [Mapper ja DTO: miks entityt otse ei tagastata](#mapper-ja-dto-miks-entityt-otse-ei-tagastata) — `0:14:16`
- [Listi, objektide ja mäluviidete mõistmine](#listi-objektide-ja-maluviidete-moistmine) — `0:21:38`
- [OpenAPI ja Swagger dokumentatsiooni eesmärk](#openapi-ja-swagger-dokumentatsiooni-eesmark) — `0:45:11`
- [BEB-6 - City endpointi dokumenteerimine](#beb-6-city-endpointi-dokumenteerimine) — `0:48:29`
- [BEB-5 - Login endpointi vastuste dokumenteerimine](#beb-5-login-endpointi-vastuste-dokumenteerimine) — `0:58:05`
- [BEB-7 - Pangaautomaatide asukohainfo teenus](#beb-7-pangaautomaatide-asukohainfo-teenus) — `1:33:32`
- [Controlleri loomine ja request parameter](#controlleri-loomine-ja-request-parameter) — `1:35:09`
- [Service ja repository rollid](#service-ja-repository-rollid) — `1:47:00`
- [LocationDto ja LocationMapper](#locationdto-ja-locationmapper) — `2:37:28`
- [Listist listi mappimine](#listist-listi-mappimine) — `2:49:19`

## Õppematerjali skill ja transkriptide kasutamine — `0:00:07` {#oppematerjali-skill-ja-transkriptide-kasutamine}

Video alguses näidatakse, kuidas Zoomi salvestusest alla laadida vajalikud failid ja kuidas VTT transkriptist õppematerjal luua. Mõte on lihtne: kui video tekst on failina olemas, saab AI sellest teha kordamiseks sobiva materjali.

### Selgitus

VTT fail on tekstifail, kus iga lõigu juures on ajatempel. Ajatempel ütleb, millal videos vastav lause algab ja lõpeb.

Näide:

```text
00:11:13.615 --> 00:11:17.199
Õpetaja: viimane asi, mis me tegime, oli City Controller
```

Sellest saab õppematerjali jaoks võtta kaks asja:

- aeg `0:11:13`
- teema: City controlleriga jätkamine

### Skeem

```text
Zoom video
   |
   v
VTT transkript
   |
   v
AI loeb teemad ja ajad
   |
   v
docs/transcript-materials/*.md
```

### Päriselu analoogia

See on nagu loengu konspekti tegemine helisalvestuse järgi. Vahe on selles, et VTT fail annab juba kaasa täpsed kohad, kust videos uuesti vaadata.

## AI agentide kasutamine samm-sammulises arenduses — `0:08:06` {#ai-agentide-kasutamine-samm-sammulises-arenduses}

Videos räägitakse, et AI agentidega saab tööd paralleelseks teha, aga arendust ei tasu anda ühte suurde "tee kõik valmis" käsuna. Paremini töötab väike ja selge samm korraga.

### Selgitus

Agent on eraldi AI töötegija, kellele saab anda konkreetse ülesande. Näiteks üks agent võib koostada õppematerjali ühe video kohta ja teine agent teise video kohta. Need ülesanded ei sega üksteist.

Arenduses on oht suurem. Kui üks agent teeb backendit ja teine frontendit, võivad nad teha eeldusi, mis hiljem kokku ei sobi. Seetõttu rõhutatakse videos head struktuuri ja samm-sammulist arendust.

### Skeem

```text
Hea paralleelne töö:
Video 1 materjal  ---> agent A
Video 2 materjal  ---> agent B

Riskantsem töö:
Backend muudatus   ---> agent A
Frontend muudatus  ---> agent B
Kokkumäng vajab kontrolli
```

### Päriselu analoogia

Kui kaks inimest kirjutavad eri peatükke samasse raamatusse, on kõik korras, kui peatükid on sõltumatud. Kui üks kirjutab tegelaste nimed ja teine nende elulood, peavad nad pidevalt kokku leppima.

## City endpointi debugimine Swaggeri kaudu — `0:11:13` {#city-endpointi-debugimine-swaggeri-kaudu}

Õpetaja käivitab backend serveri debug režiimis, paneb breakpointid ja kutsub Swaggerist välja `GET /api/cities` teenuse.

### Selgitus

Breakpoint on koht koodis, kus programm jääb seisma. See lubab vaadata, mis väärtused muutujatel päriselt on.

Olulised debug tegevused:

- `Step Over` käivitab järgmise rea ja ei lähe meetodi sisse.
- `Step Into` läheb meetodi sisse.
- `Resume` laseb programmil edasi joosta järgmise breakpointini või lõpuni.

### Koodinäide

Failis `src/main/java/ee/bcs/bank40back/controller/city/CityController.java` on endpoint:

```java
@GetMapping("/cities")
@Operation(summary = "Leiab süsteemist kõik linnad",
        description = "Tagastab massiivi koos 'cityId' ja 'cityName' infoga")
public List<CityOptionDto> findCities() {
    List<CityOptionDto> cities = cityService.findCities();
    return cities;
}
```

Kui Swaggeris vajutada `Execute`, liigub päring sellesse meetodisse. Sealt edasi kutsutakse `cityService.findCities()`.

### Skeem

```text
Swagger Execute
   |
   v
CityController.findCities()
   |
   v
CityService.findCities()
   |
   v
CityRepository.findAll()
```

### Päriselu analoogia

Debugimine on nagu paki teekonna jälgimine. Igas punktis vaatad, kas pakk on õiges kohas ja kas selle sees on õige sisu.

## Mapper ja DTO: miks entityt otse ei tagastata — `0:14:16` {#mapper-ja-dto-miks-entityt-otse-ei-tagastata}

Videos rõhutatakse, et andmebaasi entity objekte ei tohiks otse serverist välja tagastada. Selle asemel tehakse neist DTO objektid.

### Selgitus

Entity on objekt, mis kirjeldab andmebaasi tabeli rida. DTO ehk Data Transfer Object on objekt, mis on mõeldud andmete saatmiseks kliendile.

Põhjused, miks DTO on vajalik:

- klient ei pea nägema kogu andmebaasi struktuuri;
- saab välja saata ainult vajalikud väljad;
- API vastuse kuju on selgem ja stabiilsem;
- sisemised andmed jäävad serveri sisse.

### Koodinäide

Failis `src/main/java/ee/bcs/bank40back/persistence/city/CityMapper.java` teisendab MapStruct `City` entity `CityOptionDto` objektiks:

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

`source` tähendab välja entity poolel. `target` tähendab välja DTO poolel.

### Skeem

```text
City entity
  id   = 1
  name = "Tartu"
      |
      v
CityOptionDto
  cityId   = 1
  cityName = "Tartu"
```

### Päriselu analoogia

Entity on nagu kogu töötaja personalikaart. DTO on nagu visiitkaart: seal on ainult see info, mida teisele inimesele päriselt vaja anda.

## Listi, objektide ja mäluviidete mõistmine — `0:21:38` {#listi-objektide-ja-maluviidete-moistmine}

Suur osa videost selgitab, kuidas listid ja objektid mälus käituvad. See on tähtis, sest mapper teisendab sageli listi entity objekte listiks DTO objekte.

### Selgitus

Muutuja on silt. Objekt on tegelik asi mälus. Silt võib viidata objektile, aga silt ise ei ole objekt.

Kui meetodis luuakse uus objekt ja seda ei tagastata ega kuhugi ei salvestata, kaob viide ära. Siis saab Java mäluhaldus selle objekti hiljem ära koristada.

### Skeem

```text
Muutuja "cities"
   |
   v
List objekt
   |------> City(id=1, name="Tartu")
   |------> City(id=2, name="Tallinn")
   |------> City(id=3, name="Pärnu")
```

Mapper teeb uue listi:

```text
List<City>                  List<CityOptionDto>
[City, City, City]  --->    [Dto, Dto, Dto]
```

### Koodinäide

Projektis on sama mõte teenuses:

```java
public List<CityOptionDto> findCities() {
    List<City> cities = cityRepository.findAll();
    List<CityOptionDto> cityOptionDtos = cityMapper.toCityOptionDtos(cities);
    return cityOptionDtos;
}
```

`cities` on list entity objektidega. `cityOptionDtos` on list DTO objektidega.

### Päriselu analoogia

Muutuja on nagu aadress märkmikus. Maja on objekt. Kui aadress ära kaob ja keegi teine seda maja ei tea, ei oska keegi sinna enam minna.

## OpenAPI ja Swagger dokumentatsiooni eesmärk — `0:45:11` {#openapi-ja-swagger-dokumentatsiooni-eesmark}

Video järgmine suur teema on API dokumentatsioon. Swagger UI näitab teenuseid, aga vaikimisi võib info olla liiga napp.

### Selgitus

OpenAPI on standard, mis kirjeldab veebiteenuseid masinloetaval kujul. Swagger UI oskab selle kirjelduse põhjal teha inimesele loetava veebilehe.

Spring oskab osa infot ise leida:

- `@RestController` näitab, et klassis on API endpointid;
- `@GetMapping`, `@PostMapping` jne näitavad URL-id ja HTTP meetodid;
- tagastustüüp näitab, milline vastuse objekt välja läheb.

Puudu jääb sageli inimesele mõeldud selgitus: mida teenus teeb, millal kasutada, mis vead võivad tulla.

### Skeem

```text
Java controller + annotatsioonid
   |
   v
OpenAPI JSON
   |
   v
Swagger UI dokumentatsioon
```

### Päriselu analoogia

Swagger on nagu teenuse kasutusjuhend. Kui juhend on tühi, peab teine arendaja koodi lugema. Kui juhend on hea, saab ta API-t kasutada ilma serveri sisemust tundmata.

## BEB-6 - City endpointi dokumenteerimine — `0:48:29` {#beb-6-city-endpointi-dokumenteerimine}

City endpointile lisatakse `@Operation`, et Swaggeris oleks näha lühike kokkuvõte ja pikem kirjeldus.

### Selgitus

`@Operation` on Swagger/OpenAPI annotatsioon. See ei muuda äriloogikat. See muudab dokumentatsiooni.

`summary` on lühike tekst, mida Swagger näitab endpointi real. `description` on pikem selgitus endpointi sees.

### Koodinäide

```java
@GetMapping("/cities")
@Operation(summary = "Leiab süsteemist kõik linnad",
        description = "Tagastab massiivi koos 'cityId' ja 'cityName' infoga")
public List<CityOptionDto> findCities() {
    List<CityOptionDto> cities = cityService.findCities();
    return cities;
}
```

### Skeem

```text
@Operation(summary = "...", description = "...")
   |
   v
Swaggeris tekib endpointile selgitav tekst
```

### Päriselu analoogia

See on nagu panna uksele silt. Uks oli enne ka olemas, aga nüüd saab inimene aru, kuhu see uks viib.

## BEB-5 - Login endpointi vastuste dokumenteerimine — `0:58:05` {#beb-5-login-endpointi-vastuste-dokumenteerimine}

Login endpointi juures näidatakse, kuidas dokumenteerida mitu võimalikku vastust. Edu korral tuleb `200 OK`, vale kasutajanime või parooli korral võib tulla `403`.

### Selgitus

Kui endpointil on ainult edukas vastus, oskab Swagger selle sageli ise tuletada. Kui tahame näidata ka veaolukordi, tuleb need ise kirjeldada.

Selleks kasutatakse näiteks:

- `@ApiResponse` ühe vastuse kirjeldamiseks;
- `@ApiResponses` mitme vastuse koondamiseks;
- `@Content` ja `@Schema`, kui on vaja öelda, millise kujuga keha vea korral tuleb.

### Koodinäide

Projektis on vea keha kirjeldav klass `src/main/java/ee/bcs/bank40back/infrastructure/error/ApiError.java`. Seda saab Swaggeris näidata vea vastuse skeemina.

```java
@ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Sisselogimine õnnestus"),
        @ApiResponse(responseCode = "403", description = "Vale kasutajanimi või parool")
})
```

See näide näitab ideed. Täpne annotatsioonide sisu sõltub sellest, kui detailselt projekt soovib vigu dokumenteerida.

### Päriselu analoogia

See on nagu vormi juhend: lisaks "kui kõik on korras" olukorrale kirjutatakse lahti ka "kui midagi on valesti" olukorrad.

## BEB-7 - Pangaautomaatide asukohainfo teenus — `1:33:32` {#beb-7-pangaautomaatide-asukohainfo-teenus}

Uus ülesanne on luua teenus, mis tagastab pangaautomaatide asukohainfo. Sisendiks tuleb `cityId` request parameter.

### Selgitus

Teenuse nõue:

- HTTP meetod on `GET`;
- URL on `/api/atm/locations`;
- sisend tuleb query/request parameterina `cityId`;
- kui `cityId` on `null`, tagastatakse kõik asukohad;
- kui `cityId` on väärtusega, tagastatakse selle linna asukohad;
- vastuses on `locationId`, `cityName` ja `locationName`.

Näidis URL:

```text
/api/atm/locations?cityId=1
```

### Skeem

```text
GET /api/atm/locations?cityId=1
   |
   v
LocationController
   |
   v
LocationService
   |
   v
LocationRepository
   |
   v
LocationMapper
   |
   v
List<LocationDto>
```

### Päriselu analoogia

See on nagu küsida infolauast: "Näita mulle kõiki automaate Tartus." `cityId` on vihje, millise linna kohta infot soovid.

## Controlleri loomine ja request parameter — `1:35:09` {#controlleri-loomine-ja-request-parameter}

Controller võtab HTTP sõnumi vastu. Selle ülesanne ei ole teha kogu äriloogikat, vaid anda töö edasi service kihile.

### Selgitus

`@RequestMapping("/api")` paneb klassi kõigile endpointidele ühise alguse. `@GetMapping("/atm/locations")` lisab konkreetse teenuse raja.

`@RequestParam Integer cityId` ütleb Springile: võta URL-i query parameter nimega `cityId` ja pane see meetodi parameetri sisse.

### Koodinäide

Fail `src/main/java/ee/bcs/bank40back/controller/location/LocationController.java`:

```java
@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class LocationController {

    private final LocationService locationService;

    @GetMapping("/atm/locations")
    public void findLocations(@RequestParam Integer cityId) {
        locationService.findLocations(cityId);
    }
}
```

Video hetkel on tagastustüüp veel `void`, sest ehitus käib sammhaaval. Lõplikult peaks controller tagastama DTO listi.

### Skeem

```text
URL: /api/atm/locations?cityId=1
                         |
                         v
                  Integer cityId = 1
```

### Päriselu analoogia

Controller on nagu vastuvõtulaud. Ta võtab kliendi küsimuse vastu ja suunab selle õigesse osakonda.

## Service ja repository rollid — `1:47:00` {#service-ja-repository-rollid}

Service on koht, kus tegevus päriselt kokku pannakse. Repository on koht, mille kaudu küsitakse andmeid andmebaasist.

### Selgitus

Service ei peaks teadma SQL-i detaile rohkem kui vaja. Ta ütleb repositoryle: "anna mulle need locationid". Repository teab, kuidas andmebaasist küsida.

Praeguses failis `src/main/java/ee/bcs/bank40back/service/LocationService.java` on esimene samm:

```java
@Service
@RequiredArgsConstructor
public class LocationService {

    private final LocationRepository locationRepository;

    public void findLocations(Integer cityId) {
        List<Location> locations = locationRepository.findLocationsBy(cityId);
    }
}
```

Repository failis `src/main/java/ee/bcs/bank40back/persistence/location/LocationRepository.java` on päring:

```java
@Query("select l from Location l where l.city.id = :cityId order by l.city.name, l.name")
List<Location> findLocationsBy(Integer cityId);
```

See päring leiab `Location` entityd, mille linna id vastab sisendile.

### Skeem

```text
Service
  küsib: findLocationsBy(cityId)
      |
      v
Repository
  teeb andmebaasi päringu
      |
      v
List<Location>
```

### Tähelepanek

Ülesande nõudes oli ka olukord, kus `cityId` on `null` ja tuleb tagastada kõik asukohad. Praegune query `where l.city.id = :cityId` seda veel ei kata. Selle jaoks tuleb hiljem queryt või service loogikat täiendada.

### Päriselu analoogia

Service on nagu projektijuht, repository on nagu arhiivitöötaja. Projektijuht küsib infot, arhiivitöötaja otsib selle õigetest kaustadest välja.

## LocationDto ja LocationMapper — `2:37:28` {#locationdto-ja-locationmapper}

Kui andmebaasist on saadud `Location` entityd, tuleb need muuta kliendile sobivaks `LocationDto` kujuks.

### Selgitus

`Location` entity sees on `City` eraldi objektina. Vastuses ei taheta aga tervet `City` objekti. Tahetakse ainult linna nime.

Seetõttu on DTO lame ehk flat:

```java
public class LocationDto implements Serializable {
    private Integer locationId;
    private String cityName;
    private String locationName;
}
```

`cityName` saadakse sügavamalt: `location.city.name`.

### Koodinäide

Fail `src/main/java/ee/bcs/bank40back/persistence/location/LocationMapper.java`:

```java
@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE,
        componentModel = MappingConstants.ComponentModel.SPRING)
public interface LocationMapper {

    @Mapping(source = "id", target = "locationId")
    @Mapping(source = "city.name", target = "cityName")
    @Mapping(source = "name", target = "locationName")
    LocationDto toLocationDto(Location location);

    List<LocationDto> toLocationDtos(List<Location> locations);
}
```

### Skeem

```text
Location entity
  id = 10
  name = "Lounakeskus"
  city -> City(name = "Tartu")
      |
      v
LocationDto
  locationId = 10
  cityName = "Tartu"
  locationName = "Lounakeskus"
```

### Päriselu analoogia

See on nagu võtta pikast ankeedist ainult kolm vajalikku välja ja panna need lühikesele kaardile.

## Listist listi mappimine — `2:49:19` {#listist-listi-mappimine}

Video lõpus selgitatakse, et üksiku objekti mappimisest ei piisa, sest andmebaasist tuleb tagasi list.

### Selgitus

Kui repository tagastab `List<Location>`, peab API lõpuks tagastama `List<LocationDto>`. MapStruct oskab listi mappida siis, kui ta teab, kuidas ühte elementi mappida.

Seetõttu on mapperis kaks meetodit:

- `toLocationDto(Location location)` teisendab ühe objekti;
- `toLocationDtos(List<Location> locations)` teisendab listi.

### Koodinäide

Kui service lõpuni viia, oleks loogika selline:

```java
public List<LocationDto> findLocations(Integer cityId) {
    List<Location> locations = locationRepository.findLocationsBy(cityId);
    List<LocationDto> locationDtos = locationMapper.toLocationDtos(locations);
    return locationDtos;
}
```

Selle jaoks peab `LocationService` sisse süstima ka `LocationMapper`:

```java
private final LocationRepository locationRepository;
private final LocationMapper locationMapper;
```

### Skeem

```text
List<Location>
   |
   |  iga element käib läbi toLocationDto(...)
   v
List<LocationDto>
```

### Päriselu analoogia

Kui sul on kastitäis dokumente ja pead igast dokumendist tegema lühikokkuvõtte, siis teed sama väikese teisenduse iga dokumendi kohta eraldi. Lõpuks on sul kastitäis kokkuvõtteid.
