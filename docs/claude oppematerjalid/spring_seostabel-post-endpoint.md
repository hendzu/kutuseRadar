## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/q8EFC7yJM3SuepkHD56_fTmCnPnW71wMdpgfw-LdYRol_Jkli_TwrzSq1Fq7IR55.d_z6r2KMEo8jyi4B?startTime=1777542898000) |
| **Parool** | `vZ09*4x6` |
| **Transkript** | [GMT20260430-095458_v-2.vtt](../transcripts/GMT20260430-095458_v-2.vtt) |

## Sisukord

- [BEB-7 - Location teenuse lõpuni ühendamine](#beb-7-location-teenuse-lopuni-uhendamine) — `0:00:09`
- [Return ja meetodi tagastustüüp](#return-ja-meetodi-tagastustuup) — `0:04:14`
- [BEB-8 - Pangaautomaatide asukohad koos teenustega](#beb-8-pangaautomaatide-asukohad-koos-teenustega) — `0:15:06`
- [Seostabel ja mitu-mitmele suhe](#seostabel-ja-mitu-mitmele-suhe) — `0:15:26`
- [DTO listi täiendamine for-tsüklis](#dto-listi-taiendamine-for-tsuklis) — `0:23:04`
- [LocationTransactionTypeRepository ja custom query](#locationtransactiontyperepository-ja-custom-query) — `0:29:26`
- [TransactionTypeDto ja mapper](#transactiontypedto-ja-mapper) — `0:46:49`
- [Nested listi külge panemine setteriga](#nested-listi-kulge-panemine-setteriga) — `1:02:05`
- [cityId null või 0: kõikide asukohtade pärimine](#cityid-null-voi-0-koikide-asukohtade-parimine) — `1:14:35`
- [BEB-13 - Transaction type valikute endpoint](#beb-13-transaction-type-valikute-endpoint) — `1:54:07`
- [TransactionTypeOptionDto ja constant mapping](#transactiontypeoptiondto-ja-constant-mapping) — `2:08:09`
- [500 errori lugemine backend konsoolist](#500-errori-lugemine-backend-konsoolist) — `2:24:10`
- [Asukoha lisamine POST endpointiga](#asukoha-lisamine-post-endpointiga) — `2:27:00`
- [RequestBody, validatsioonid ja DTO suund](#requestbody-validatsioonid-ja-dto-suund) — `2:58:00`
- [City otsimine enne Location salvestamist](#city-otsimine-enne-location-salvestamist) — `3:10:04`
- [DTO-st entityks mappimine ja save](#dto-st-entityks-mappimine-ja-save) — `3:14:43`

## BEB-7 - Location teenuse lõpuni ühendamine — `0:00:09` {#beb-7-location-teenuse-lopuni-uhendamine}

Video algab eelmisest tunnist pooleli jäänud `BEB-7` lõpetamisega. Eelmises osas oli olemas `LocationDto` ja `LocationMapper`; nüüd ühendatakse mapper service kihis ning tagastatakse vastus controllerini välja.

### Selgitus

Kui repository toob andmebaasist `Location` entity objektid, ei saadeta neid otse kliendile. Need tuleb mapperiga muuta DTO objektideks.

Oluline järjekord:

1. Repository küsib `List<Location>`.
2. Mapper teeb sellest `List<LocationResponseDto>`.
3. Service tagastab DTO listi.
4. Controller tagastab selle HTTP vastusena.

### Koodinäide

Failis `src/main/java/ee/bcs/bank40back/service/LocationService.java`:

```java
public List<LocationResponseDto> findLocations(Integer cityId) {
    List<Location> locations = locationRepository.findLocationsBy(cityId);
    List<LocationResponseDto> locationResponseDtos = locationMapper.toLocationResponseDtos(locations);

    return locationResponseDtos;
}
```

Videos ehitatakse see alguses sammhaaval, enne kui lisatakse transaction type'id.

### Skeem

```text
LocationRepository
   |
   v
List<Location>
   |
   v
LocationMapper
   |
   v
List<LocationResponseDto>
```

### Päriselu analoogia

Repository toob laost tooraine. Mapper paneb selle serveerimisalusele. Service annab valmis aluse edasi.

## Return ja meetodi tagastustüüp — `0:04:14` {#return-ja-meetodi-tagastustuup}

Õpetaja rõhutab, et kui meetod kutsub välja teise meetodi, mis midagi tagastab, tuleb tagastatud väärtusega midagi teha. Muidu "elab ja sureb" väärtus samas kohas ära.

### Selgitus

`void` tähendab, et meetod ei tagasta midagi. Kui meetodi sees kirjutada `return locationDtos;`, siis tagastustüüp ei saa enam olla `void`.

Näide:

```java
public List<LocationResponseDto> findLocations(Integer cityId) {
    return locationService.findLocations(cityId);
}
```

Siin peab meetodi tagastustüüp olema `List<LocationResponseDto>`, sest controller tagastab listi brauserile või frontendile.

### Skeem

```text
Controller method
   calls service
      |
      v
Service returns List<Dto>
      |
      v
Controller returns same List<Dto> to client
```

### Päriselu analoogia

Kui palud kelneril tuua kandiku ja ta toob selle tagasi, ei tohi kandikut kööki jätta. See tuleb anda kliendile edasi.

## BEB-8 - Pangaautomaatide asukohad koos teenustega — `0:15:06` {#beb-8-pangaautomaatide-asukohad-koos-teenustega}

Järgmine ülesanne muudab olemasolevat `GET /api/atm/locations` teenust. Nüüd peab iga asukoha juures olema ka info, milliseid teenuseid automaat pakub.

### Selgitus

Varem oli vastuses näiteks:

```json
{
  "locationId": 1,
  "cityName": "Tallinn",
  "locationName": "Sikupilli Prisma"
}
```

Nüüd peab lisanduma `transactionTypes` list:

```json
{
  "locationId": 1,
  "cityName": "Tallinn",
  "locationName": "Sikupilli Prisma",
  "transactionTypes": [
    { "transactionTypeName": "Maksed" },
    { "transactionTypeName": "Raha sisse" },
    { "transactionTypeName": "Raha välja" }
  ]
}
```

### Koodinäide

Fail `src/main/java/ee/bcs/bank40back/controller/location/dto/LocationResponseDto.java`:

```java
public class LocationResponseDto implements Serializable {
    private Integer locationId;
    private String cityName;
    private String locationName;
    private List<TransactionTypeDto> transactionTypes;
}
```

### Päriselu analoogia

Varem näitasime ainult automaadi aadressi. Nüüd lisame juurde sildi, kas seal saab raha välja võtta, sisse panna või makseid teha.

## Seostabel ja mitu-mitmele suhe — `0:15:26` {#seostabel-ja-mitu-mitmele-suhe}

Videos selgitatakse, et `Location` ja `TransactionType` vahel on seostabel. Ühel automaadil võib olla mitu teenust ja üks teenus võib kuuluda mitmele automaadile.

### Selgitus

See on mitu-mitmele seos. Selle jaoks kasutatakse vahetabelit `LocationTransactionType`.

Näiteks:

```text
Location
  1 = Sikupilli Prisma

TransactionType
  1 = Maksed
  2 = Raha sisse
  3 = Raha välja

LocationTransactionType
  location_id = 1, transaction_type_id = 1
  location_id = 1, transaction_type_id = 2
  location_id = 1, transaction_type_id = 3
```

### Skeem

```text
Location            LocationTransactionType          TransactionType
id=1  --------->    location_id=1                    id=1 Maksed
                    transaction_type_id=1  ------->  id=2 Raha sisse
                    transaction_type_id=2  ------->  id=3 Raha välja
```

### Päriselu analoogia

See on nagu õpilased ja kursused. Üks õpilane saab olla mitmel kursusel ning ühel kursusel saab olla mitu õpilast. Seostabel ütleb, kes kuhu kuulub.

## DTO listi täiendamine for-tsüklis — `0:23:04` {#dto-listi-taiendamine-for-tsuklis}

Õpetaja arutleb, kas tsüklit peaks tegema entity listi või DTO listi peal. Valik langeb DTO listile, sest just sinna tuleb puuduolev teenuste list külge panna.

### Selgitus

`LocationResponseDto` on alguses "ebatäiuslik": mapper täidab `locationId`, `cityName` ja `locationName`, aga `transactionTypes` on veel `null`.

Tsüklis tehakse iga DTO kohta:

1. võetakse `locationId`;
2. küsitakse andmebaasist selle asukoha teenused;
3. mapitakse teenused DTO-deks;
4. pannakse teenuste list sama `LocationResponseDto` külge.

### Koodinäide

Fail `src/main/java/ee/bcs/bank40back/service/LocationService.java`:

```java
for (LocationResponseDto locationResponseDto : locationResponseDtos) {
    Integer locationId = locationResponseDto.getLocationId();
    List<TransactionType> transactionTypes = locationTransactionTypeRepository.findTransactionTypesBy(locationId);
    List<TransactionTypeDto> transactionTypeDtos = transactionTypeMapper.toTransactionTypeDtos(transactionTypes);
    locationResponseDto.setTransactionTypes(transactionTypeDtos);
}
```

### Skeem

```text
LocationResponseDto(locationId=1, transactionTypes=null)
   |
   v
otsi teenused locationId järgi
   |
   v
setTransactionTypes([...])
```

### Päriselu analoogia

Sul on nimekiri automaatidest, aga teenuste veerg on tühi. Käid iga rea läbi ja täidad selle veeru õigete teenustega.

## LocationTransactionTypeRepository ja custom query — `0:29:26` {#locationtransactiontyperepository-ja-custom-query}

Teenuste leidmiseks luuakse repository, mis küsib seostabeli kaudu konkreetse asukoha transaction type'id.

### Selgitus

Tavaline `findAll()` ei sobi, sest vaja on leida ainult ühe `locationId` teenused. Selleks kasutatakse `@Query`.

Fail `src/main/java/ee/bcs/bank40back/persistence/locationtransctiontype/LocationTransactionTypeRepository.java`:

```java
@Query("select l.transactionType from LocationTransactionType l " +
        "where l.location.id = :locationId order by l.transactionType.name")
List<TransactionType> findTransactionTypesBy(Integer locationId);
```

Oluline detail: query ei tagasta `LocationTransactionType` objekte, vaid otse `TransactionType` objektid. Seda tehakse `select l.transactionType` abil.

### Skeem

```text
locationId = 1
   |
   v
LocationTransactionType rows
   |
   v
select l.transactionType
   |
   v
List<TransactionType>
```

### Päriselu analoogia

Kui tahad teada, millised raamatud on ühel inimesel laenutatud, ei huvita sind laenutuse kaart ise. Sind huvitavad lõpuks raamatud.

## TransactionTypeDto ja mapper — `0:46:49` {#transactiontypedto-ja-mapper}

Andmebaasist tulevad `TransactionType` entityd, aga vastusesse peab minema lihtne DTO, kus on ainult `transactionTypeName`.

### Selgitus

Fail `src/main/java/ee/bcs/bank40back/controller/location/dto/TransactionTypeDto.java`:

```java
public class TransactionTypeDto implements Serializable {
    private String transactionTypeName;
}
```

Fail `src/main/java/ee/bcs/bank40back/persistence/transactiontype/TransactionTypeMapper.java`:

```java
@Mapping(source = "name", target = "transactionTypeName")
TransactionTypeDto toTransactionTypeDto(TransactionType transactionType);

List<TransactionTypeDto> toTransactionTypeDtos(List<TransactionType> transactionTypes);
```

### Skeem

```text
TransactionType entity
  id = 2
  name = "Raha välja"
      |
      v
TransactionTypeDto
  transactionTypeName = "Raha välja"
```

### Päriselu analoogia

Andmebaasis on teenuse sisemine number ja nimi. Kliendile piisab ainult nimest.

## Nested listi külge panemine setteriga — `1:02:05` {#nested-listi-kulge-panemine-setteriga}

Kui `TransactionTypeDto` list on valmis, tuleb see panna õige `LocationResponseDto` objekti külge.

### Selgitus

See on koht, kus kogu tsükli mõte lõpuks täitub:

```java
locationResponseDto.setTransactionTypes(transactionTypeDtos);
```

Ilma selle reata oleks `transactionTypeDtos` muutujas küll olemas, aga ei jõuaks HTTP vastusesse.

### Skeem

```text
transactionTypeDtos
   |
   v
locationResponseDto.setTransactionTypes(...)
   |
   v
JSON vastuses transactionTypes: [...]
```

### Päriselu analoogia

Kui oled lisalehe valmis kirjutanud, pead selle õige dokumendi külge panema. Muidu jääb lisaleht lauale vedelema.

## cityId null või 0: kõikide asukohtade pärimine — `1:14:35` {#cityid-null-voi-0-koikide-asukohtade-parimine}

Ülesandes on nõue, et kui linna piirangut ei anta, peab teenus tagastama kõik asukohad. Videos näidatakse SQL mõtteharjutust `true`, `false`, `0 = 0` ja tingimuslausete kohta.

### Selgitus

Praeguses koodis kasutatakse `0` väärtust tähendusega "kõik linnad":

```java
@Query("select l from Location l where (0 = :cityId) OR  (l.city.id = :cityId) order by l.city.name, l.name")
List<Location> findLocationsBy(Integer cityId);
```

Kui `cityId` on `0`, siis `(0 = :cityId)` on tõene ja kõik read sobivad. Kui `cityId` on näiteks `2`, siis esimene pool on väär ja tööle jääb `l.city.id = :cityId`.

### Skeem

```text
cityId = 0:
(0 = 0) OR (l.city.id = 0)  -> true -> kõik read

cityId = 2:
(0 = 2) OR (l.city.id = 2)  -> ainult linna 2 read
```

### Päriselu analoogia

See on nagu otsingufilter "Kõik linnad". Kui valid "Kõik", siis filtrit sisuliselt ei rakendata.

## BEB-13 - Transaction type valikute endpoint — `1:54:07` {#beb-13-transaction-type-valikute-endpoint}

Järgmisena tehakse endpoint, mis tagastab kõik võimalikud pangaautomaadi teenused. Seda on frontendil vaja checkboxide jaoks.

### Selgitus

Endpoint:

```text
GET /api/atm/transaction-types
```

Sellel ei ole request parameterit, sest vaja on kõik teenusetüübid.

Fail `src/main/java/ee/bcs/bank40back/controller/transactiontype/TransactionTypeController.java`:

```java
@GetMapping("/atm/transaction-types")
@Operation(summary = "Tagastab kõik võimalikud pangaautomaadi teenused")
public List<TransactionTypeOptionDto> findTransactionTypes() {
    List<TransactionTypeOptionDto> transactionTypes = transactionTypeService.findTransactionTypes();
    return transactionTypes;
}
```

### Skeem

```text
GET /api/atm/transaction-types
   |
   v
TransactionTypeController
   |
   v
TransactionTypeService
   |
   v
TransactionTypeRepository.findAll()
```

### Päriselu analoogia

See on nagu küsida süsteemilt: "Milliseid valikuid üldse saab kasutajale näidata?"

## TransactionTypeOptionDto ja constant mapping — `2:08:09` {#transactiontypeoptiondto-ja-constant-mapping}

Checkboxide jaoks luuakse DTO, kus on teenuse id, nimi ja `isAvailable` väärtus. Vaikimisi pannakse `isAvailable` väärtuseks `false`.

### Selgitus

Fail `src/main/java/ee/bcs/bank40back/controller/common/TransactionTypeOptionDto.java`:

```java
public class TransactionTypeOptionDto implements Serializable {
    private Integer transactionTypeId;
    private String transactionTypeName;
    private Boolean isAvailable;
}
```

Mapperis kasutatakse `constant`, sest `isAvailable` ei tule andmebaasi `TransactionType` entityst:

```java
@Mapping(source = "id", target = "transactionTypeId")
@Mapping(source = "name", target = "transactionTypeName")
@Mapping(constant = "false", target = "isAvailable")
TransactionTypeOptionDto toTransactionTypeOptionDto(TransactionType transactionType);
```

### Skeem

```text
TransactionType(id=1, name="Maksed")
   |
   v
TransactionTypeOptionDto(
  transactionTypeId=1,
  transactionTypeName="Maksed",
  isAvailable=false
)
```

### Päriselu analoogia

See on nagu teha vormi valikute nimekiri. Kõik valikud on olemas, aga alguses pole ükski linnukesega märgitud.

## 500 errori lugemine backend konsoolist — `2:24:10` {#500-errori-lugemine-backend-konsoolist}

Kui Swaggeris tuleb `500 Internal Server Error`, ei ole probleem tavaliselt Swaggeris. Viga on backendis ja täpsem info on backend konsoolis.

### Selgitus

Õpetaja näitab, et tuleb otsida stack trace'ist esimene sinine link või rida, mis viitab enda kirjutatud klassile. Seal on sageli tegelik vea algus.

Tüüpiline põhjus selles videos: mapperis või DTO-s on väli puudu või vale nimi, näiteks `isAvailable` puudub DTO klassist.

### Skeem

```text
Swagger: 500 Internal Server Error
   |
   v
Backend console
   |
   v
otsi esimene oma klassi rida
   |
   v
paranda kood
```

### Päriselu analoogia

Swagger näitab, et auto ei käivitu. Backend konsool ütleb, kas bensiin on otsas, aku tühi või juhe lahti.

## Asukoha lisamine POST endpointiga — `2:27:00` {#asukoha-lisamine-post-endpointiga}

Video viimases suuremas osas alustatakse pangaautomaadi asukoha lisamist. See on esimene `POST` teenus selles plokis.

### Selgitus

`GET` loeb andmeid. `POST` saadab uue objekti serverisse ja tavaliselt loob uue rea andmebaasi.

Endpoint:

```text
POST /api/atm/location
```

Fail `src/main/java/ee/bcs/bank40back/controller/location/LocationController.java`:

```java
@PostMapping("/atm/location")
public void addLocation(@RequestBody LocationDto locationDto) {
    locationService.addLocation(locationDto);
}
```

### Skeem

```text
JSON body
   |
   v
@RequestBody LocationDto
   |
   v
LocationService.addLocation(...)
   |
   v
locationRepository.save(...)
```

### Päriselu analoogia

`GET` on nagu kataloogist vaatamine. `POST` on nagu uue kirje lisamine kataloogi.

## RequestBody, validatsioonid ja DTO suund — `2:58:00` {#requestbody-validatsioonid-ja-dto-suund}

Kui andmed tulevad internetist JSONina sisse, on DTO-l teine roll kui vastuse DTO-l. Nüüd peab kontrollima, et sisend sobib andmebaasi nõuetega.

### Selgitus

Fail `src/main/java/ee/bcs/bank40back/controller/location/dto/LocationDto.java`:

```java
public class LocationDto implements Serializable {

    private Integer cityId;

    @NotNull
    @Size(max = 255)
    private String locationName;

    @NotNull
    @Min(1)
    private Integer numberOfAtms;

    @NotNull
    private String imageData;

    private List<TransactionTypeOptionDto> transactionTypes;
}
```

Sisendile pannakse validatsioonid, sest kasutaja võib saata puuduvaid või liiga pikki väärtusi.

### Päriselu analoogia

Kui klient täidab vormi, peab süsteem kontrollima, et kohustuslikud väljad on täidetud ja tekst mahub andmebaasi lahtrisse.

## City otsimine enne Location salvestamist — `3:10:04` {#city-otsimine-enne-location-salvestamist}

`Location` entity sees ei ole lihtsalt `cityId`, vaid `City` objekt. Seetõttu ei piisa sellest, et JSONis tuleb `cityId`.

### Selgitus

Enne `Location` salvestamist tuleb andmebaasist otsida päris `City` entity:

```java
City city = cityRepository.findById(locationDto.getCityId()).get();
```

Praeguses videos veahaldust veel ei tehta. Kui `cityId` ei eksisteeri, siis `.get()` võib vea visata. Õpetaja ütleb, et vigade käsitlemine tuleb hiljem.

### Skeem

```text
JSON: cityId = 2
   |
   v
CityRepository.findById(2)
   |
   v
City entity
   |
   v
location.setCity(city)
```

### Päriselu analoogia

Kui vormis on kirjas linna number, peab süsteem leidma päris linna kaardi, mitte lihtsalt numbri paberile kirjutama.

## DTO-st entityks mappimine ja save — `3:14:43` {#dto-st-entityks-mappimine-ja-save}

Viimane arendusosa teeb `LocationDto` objektist `Location` entity ja salvestab selle andmebaasi.

### Selgitus

Kui andmed liiguvad andmebaasist välja, on suund `entity -> DTO`. Kui andmed tulevad sisse ja neid salvestatakse, on suund `DTO -> entity`.

Fail `src/main/java/ee/bcs/bank40back/persistence/location/LocationMapper.java`:

```java
@Mapping(ignore = true, target = "id")
@Mapping(ignore = true, target = "city")
@Mapping(source = "locationName", target = "name")
@Mapping(source = "numberOfAtms", target = "numberOfAtms")
@Mapping(constant = "A", target = "status")
Location toLocation(LocationDto locationDto);
```

`id` ignoreeritakse, sest andmebaas annab uuele reale id ise. `city` ignoreeritakse mapperis, sest see otsitakse enne andmebaasist ja pannakse käsitsi külge.

Service:

```java
public void addLocation(LocationDto locationDto) {
    City city = cityRepository.findById(locationDto.getCityId()).get();
    Location location = locationMapper.toLocation(locationDto);
    location.setCity(city);
    locationRepository.save(location);
}
```

### Skeem

```text
LocationDto
  cityId=2
  locationName="Torupilli Selver"
  numberOfAtms=1
      |
      v
mapper.toLocation(...)
      |
      v
Location entity, city veel puudu
      |
      v
location.setCity(city)
      |
      v
locationRepository.save(location)
```

### Päriselu analoogia

See on nagu uue kliendikaardi loomine. Vormist saad osa andmeid, aga mõne seotud objekti, näiteks linna, pead süsteemist üles otsima ja siis kaardile külge panema.
