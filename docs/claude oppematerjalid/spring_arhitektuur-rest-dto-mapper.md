## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/HqIIq_pzKRqM9Z_qV7dBU1gc3x64EjZUoUMBUg6j_2sfqdkL-EMYcig1FmUOUNO5.QbXWQc-eou7OhFn_?startTime=1777282733000) |
| **Parool** | `t74@K+$9` |
| **Transkript** | [GMT20260427-093853_v-2.vtt](../transcripts/GMT20260427-093853_v-2.vtt) |

## Sisukord

- [Backend arhitektuur ja andmete liikumine](#backend-arhitektuur-ja-andmete-liikumine) — `0:00:19`
- [REST sõnumid ja controller'i vastutus](#rest-sonumid-ja-controlleri-vastutus) — `0:02:02`
- [Service, repository, entity, DTO ja mapper](#service-repository-entity-dto-ja-mapper) — `0:02:22`
- [Restorani analoogia backend'i kihtidele](#restorani-analoogia-backendi-kihtidele) — `0:06:29`
- [GET, POST, PUT, PATCH ja DELETE](#get-post-put-patch-ja-delete) — `0:18:38`
- [Controller'i mapping ja `@RestController`](#controlleri-mapping-ja-restcontroller) — `0:21:56`
- [Dependency injection ja objektide sildid](#dependency-injection-ja-objektide-sildid) — `0:48:16`
- [Entity ja tabeli rea kujutamine Java objektina](#entity-ja-tabeli-rea-kujutamine-java-objektina) — `0:57:07`
- [Repository kui uks konkreetse tabeli juurde](#repository-kui-uks-konkreetse-tabeli-juurde) — `1:04:49`
- [DTO ja mapper: entity'st väljastatavaks objektiks](#dto-ja-mapper-entityst-valjastatavaks-objektiks) — `1:14:53`
- [Projekt, Maven ja sõltuvused](#projekt-maven-ja-soltuvused) — `1:17:44`
- [Swagger ja serveri käivitamine](#swagger-ja-serveri-kaivitamine) — `2:01:15`
- [HelloWorldController ja esimene endpoint](#helloworldcontroller-ja-esimene-endpoint) — `2:02:47`
- [Path variable ja request parameter](#path-variable-ja-request-parameter) — `2:29:36`
- [Controller'ist service klassi liikumine](#controllerist-service-klassi-liikumine) — `2:40:47`
- [Java objektid, private väljad ja getter'id](#java-objektid-private-valjad-ja-getterid) — `2:46:30`
- [Konstruktor, `this` ja objektide elu mälus](#konstruktor-this-ja-objektide-elu-malus) — `3:01:53`

## Backend arhitektuur ja andmete liikumine — `0:00:19` {#backend-arhitektuur-ja-andmete-liikumine}

Backend on rakenduse osa, mis võtab sõnumeid vastu, töötleb andmeid ja suhtleb andmebaasiga. Frontend saadab näiteks vormi andmed backend'ile. Backend otsustab, mida nende andmetega teha.

Selles videos vaadatakse backend'i kui mitmekihilist süsteemi. Üks klass ei tee kõike. Igal kihil on oma ülesanne.

### Selgitus

Tüüpiline liikumine on selline:

```text
Klient / frontend
      |
      v
Controller
      |
      v
Service
      |
      v
Repository
      |
      v
Andmebaas
```

`Controller` võtab sõnumi vastu. `Service` sisaldab päris tegevuse loogikat. `Repository` suhtleb andmebaasi tabeliga. Andmete kuju muutmiseks kasutatakse `DTO`, `entity` ja `mapper` klasse.

### Koodinäide

Praeguses projektis on lihtne controller juba olemas failis `src/main/java/ee/bcs/bank40back/HelloWorldController.java`:

```java
@RestController
public class HelloWorldController {

    @GetMapping("/api/say-hello")
    public String getGreeting(@RequestParam Integer customerId) {
        return null;
    }

}
```

See on veel pooleli, aga struktuur näitab backend'i alguspunkti: väljast tuleb sõnum aadressile `/api/say-hello`.

### Päriselu analoogia

Backend on nagu restorani tagaruum. Klient ei lähe ise külmkappi ega kööki. Ta annab tellimuse, süsteem suunab selle õigesse kohta ja lõpuks saab klient vastuse.

## REST sõnumid ja controller'i vastutus — `0:02:02` {#rest-sonumid-ja-controlleri-vastutus}

REST on kokkulepe, kuidas veebirakendused sõnumeid saadavad. Sõnumil on tavaliselt HTTP meetod, URL ja vajadusel kaasa pandud andmed.

### Selgitus

Controller'i põhimõte on lihtne:

1. kui tuleb kindel sõnum;
2. siis käivita kindel Java meetod;
3. anna tulemus tagasi.

Controller ei peaks ise andmebaasis otsima, objekte teisendama ega keerulist äriloogikat tegema. Ta on alguspunkt, mitte kogu lahendus.

### Skeem

```text
GET /api/say-hello?customerId=1
        |
        v
HelloWorldController.getGreeting(1)
        |
        v
tagastab vastuse
```

### Koodinäide

```java
@GetMapping("/api/say-hello")
public String getGreeting(@RequestParam Integer customerId) {
    return null;
}
```

`@GetMapping` ütleb Springile, millise URL-i ja GET sõnumi peale meetod käivitub. `@RequestParam` ütleb, et `customerId` tuleb URL-i küsimärgi järel olevast parameetrist.

## Service, repository, entity, DTO ja mapper — `0:02:22` {#service-repository-entity-dto-ja-mapper}

Backend jagatakse mitmeks väikeseks rolliks. See teeb koodi loetavamaks ja hoiab vastutused lahus.

### Selgitus

Peamised rollid:

- `Controller` käivitab tegevuse välise sõnumi peale.
- `Service` sisaldab äriloogikat ehk otsustab, mida tuleb teha.
- `Repository` suhtleb konkreetse andmebaasitabeliga.
- `Entity` kirjeldab ühe tabelirea kuju Java objektina.
- `DTO` on andmete kandja, mida on sobiv frontend'ile saata või frontend'ilt vastu võtta.
- `Mapper` teisendab ühe objekti kuju teiseks.

### Skeem

```text
JSON / DTO  ->  Controller  ->  Service  ->  Repository  ->  Entity
     ^                                               |
     |                                               v
     +---------------- Mapper teisendab -------------+
```

### Päriselu analoogia

DTO on nagu kandik. Sa ei anna kliendile köögis olevat potti ega külmiku riiulit. Sa paned ainult vajaliku info kandikule ja annad selle välja.

## Restorani analoogia backend'i kihtidele — `0:06:29` {#restorani-analoogia-backendi-kihtidele}

Videos kasutatakse restorani näidet, et backend'i rollid oleksid lihtsamad.

### Selgitus

Restorani võrdlus:

- klient on frontend või brauser;
- vastuvõtu serveerija on controller;
- tellimuse teenindaja on service;
- lao uks või hoidla uks on repository;
- tooraine on entity;
- kandikul valmis toit on DTO;
- kokkupanija on mapper.

Oluline mõte on see, et klient ei pea teadma, kust kõik andmed tulevad. Ta küsib ühte asja. Backend võib selle vastuse kokku panna mitmest tabelist ja mitme sammuga.

### Skeem

```text
Klient küsib valikut
      |
      v
Serveerija võtab tellimuse
      |
      v
Teenindaja korraldab töö
      |
      v
Hoidlatest võetakse vajalik info
      |
      v
Kandikule pannakse valmis vastus
```

### Päriselu analoogia

Kui klient tellib päevaprae, ei ütle ta eraldi: too kartul ühest laost, kaste teisest ja salat kolmandast. Restoran paneb selle tema eest kokku.

## GET, POST, PUT, PATCH ja DELETE — `0:18:38` {#get-post-put-patch-ja-delete}

HTTP meetod annab märku, mis tüüpi tegevust sõnumiga soovitakse teha.

### Selgitus

Tavalised meetodid:

- `GET` küsib andmeid.
- `POST` lisab uusi andmeid.
- `PUT` asendab olemasoleva kirje tervikuna.
- `PATCH` muudab olemasolevat kirjet osaliselt.
- `DELETE` kustutab andmeid.

Need meetodid ei tee ise automaatselt tegevust õigeks. Arendaja kirjutab koodi. Aga meetod peab kirjeldama kavatsust õigesti, sest teised arendajad ja tööriistad loevad seda kokkuleppena.

### Koodinäide

```java
@GetMapping("/api/say-hello")
public String getGreeting(@RequestParam Integer customerId) {
    return null;
}
```

Siin on `GET`, sest endpoint küsib tervituse jaoks andmeid. Kui endpoint lisaks uue kliendi, oleks sobivam `POST`.

### Päriselu analoogia

`GET` on nagu küsimine: "Mis on menüüs?" `POST` on nagu uue tellimuse esitamine. `PATCH` on nagu tellimuse ühe osa parandamine.

## Controller'i mapping ja `@RestController` — `0:21:56` {#controlleri-mapping-ja-restcontroller}

Mapping tähendab seost: milline URL käivitab millise meetodi.

### Selgitus

Spring Boot otsib käivitumisel klasse, millel on kindlad annotatsioonid. `@RestController` ütleb Springile, et sellest klassist tuleb teha controller objekt ja selle sees võivad olla endpoint'id.

Endpoint on teenus, mida saab väljastpoolt käivitada URL-i kaudu.

### Koodinäide

```java
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

    @GetMapping("/api/say-hello")
    public String getGreeting(@RequestParam Integer customerId) {
        return null;
    }

}
```

Kolm tähtsat osa:

- `@RestController` märgib klassi controller'iks.
- `@GetMapping("/api/say-hello")` seob URL-i meetodiga.
- `getGreeting(...)` on meetod, mis käivitatakse.

## Dependency injection ja objektide sildid — `0:48:16` {#dependency-injection-ja-objektide-sildid}

Dependency injection tähendab, et klass vajab teist objekti ja Spring annab selle objekti talle ise kätte.

### Selgitus

Kui controller tahab kasutada service klassi, siis controller ei peaks iga kord ise `new` abil service objekti looma. Spring hoiab teatud objekte oma konteineris ja seob need õigesse kohta.

Videos nimetatakse muutujat sildiks. Silt on nimi, mille kaudu kood saab objektile viidata.

### Skeem

```text
Spring konteiner
  HelloWorldService objekt
          |
          | süstitakse controllerisse
          v
HelloWorldController
  helloWorldService.getGreeting(...)
```

### Koodinäide

Praeguses failis service veel controllerisse süstitud ei ole. Tüüpiline suund oleks selline:

```java
@RestController
public class HelloWorldController {

    private final HelloWorldService helloWorldService;

    public HelloWorldController(HelloWorldService helloWorldService) {
        this.helloWorldService = helloWorldService;
    }

    @GetMapping("/api/say-hello")
    public String getGreeting(@RequestParam Integer customerId) {
        return helloWorldService.getGreeting(customerId);
    }
}
```

Siin on `helloWorldService` silt, mille kaudu controller saab service objekti kasutada.

## Entity ja tabeli rea kujutamine Java objektina — `0:57:07` {#entity-ja-tabeli-rea-kujutamine-java-objektina}

Entity on Java klass, mis peegeldab andmebaasitabeli ühte rida.

### Selgitus

Kui tabelis `customer` on veerud `id`, `first_name` ja `last_name`, siis Java objektis võivad olla väljad `id`, `firstName` ja `lastName`.

Üks tabelirida muutub üheks objektiks. Kui andmebaasist tuleb kolm rida, tekib tavaliselt kolm entity objekti.

### Koodinäide

Praeguses projektis on lihtne `Customer` klass:

```java
public class Customer {
    private Integer id;
    private String firstName;
    private String lastName;

    public Customer(Integer id, String firstName, String lastName) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getFullName() {
        return firstName + " " + lastName;
    }
}
```

See ei ole veel päris JPA entity, sest puuduvad näiteks `@Entity` ja `@Table`. Õppimise mõttes näitab ta siiski sama ideed: objekt hoiab ühe kliendi andmeid.

### Päriselu analoogia

Tabel on nagu Exceli leht. Üks rida Excelis on üks objekt Java koodis.

## Repository kui uks konkreetse tabeli juurde — `1:04:49` {#repository-kui-uks-konkreetse-tabeli-juurde}

Repository on ligipääs konkreetsele tabelile. Videos nimetatakse seda ukseks.

### Selgitus

Kui meil on `LocationRepository`, siis see on seotud `Location` entity'ga ja selle kaudu küsitakse `location` tabeli andmeid. Repository ei ole lihtsalt üldine andmebaasiuks. Ta on tavaliselt seotud ühe entity ja selle tabeliga.

Spring Data JPA annab palju tüüptegevusi valmis kujul:

- leia kõik read;
- leia rida ID järgi;
- salvesta uus rida;
- kustuta rida ID järgi.

### Koodinäide

Tüüpiline repository näeks välja nii:

```java
public interface LocationRepository extends JpaRepository<Location, Integer> {
}
```

`Location` ütleb, millise entity'ga repository töötab. `Integer` ütleb, mis tüüpi on selle entity ID.

### Päriselu analoogia

Kui repository on uks, siis `LocationRepository` on uks ainult `location` ruumi. Selle ukse kaudu ei minda suvalisse teise ruumi.

## DTO ja mapper: entity'st väljastatavaks objektiks — `1:14:53` {#dto-ja-mapper-entityst-valjastatavaks-objektiks}

Entity objekte ei ole hea otse frontend'ile tagastada. Selle asemel tehakse neist DTO-d.

### Selgitus

Põhjused:

- entity paljastab andmebaasi sisemist struktuuri;
- frontend vajab sageli teistsugust andmekuju;
- vastusesse peaks minema ainult vajalik info;
- mõnikord pannakse vastus kokku mitmest tabelist.

Mapper on klass või interface, mille ülesanne on teisendada üks objekt teiseks.

### Skeem

```text
Location entity
  id
  city objekt
  locationName
      |
      | mapper
      v
LocationInfo DTO
  locationId
  cityName
  locationName
  transactionTypes
```

### Koodinäide

MapStructi stiilis mapper võiks välja näha nii:

```java
@Mapper(componentModel = "spring")
public interface LocationMapper {

    @Mapping(source = "id", target = "locationId")
    @Mapping(source = "city.name", target = "cityName")
    LocationInfo toLocationInfo(Location location);

    List<LocationInfo> toLocationInfos(List<Location> locations);
}
```

See näitab mõtet: sisse tuleb `Location`, välja läheb `LocationInfo`. Mapper tõstab väärtused õigetele väljadele.

## Projekt, Maven ja sõltuvused — `1:17:44` {#projekt-maven-ja-soltuvused}

Video praktilises osas kloonitakse backend'i projekt ja vaadatakse, kuidas Java projekti sõltuvused tööle tulevad.

### Selgitus

Maven on tööriist, mis aitab Java projektis sõltuvusi alla laadida ja projekti ehitada. Frontend'is oli sarnane roll `package.json` failil. Java Spring Boot projektis on samalaadne keskne koht `pom.xml`.

Näited sõltuvustest, mida videos mainitakse:

- Spring Boot Web;
- Swagger / OpenAPI;
- Lombok;
- andmebaasiga seotud teegid;
- MapStruct.

### Päriselu analoogia

Maven on nagu ostunimekiri ja varustaja korraga. Projekt ütleb, mida vaja on, Maven toob vajalikud osad kohale.

## Swagger ja serveri käivitamine — `2:01:15` {#swagger-ja-serveri-kaivitamine}

Swagger on veebileht, mis näitab backend'i endpoint'e ja lubab neid proovida.

### Selgitus

Kui server käib ja Swagger avaneb, tähendab see, et rakendus vähemalt käivitub ning dokumentatsiooni tööriist töötab. Kui endpoint'e veel pole, võib Swagger öelda, et operatsioone ei ole. See ei tähenda tingimata viga.

Java backend'i puhul tuleb pärast koodimuudatusi server tihti uuesti käivitada. Frontend'i hot reload töötab tavaliselt mugavamalt, aga backend'is ei saa sellele alati loota.

### Skeem

```text
Java kood muutub
      |
      v
server restart
      |
      v
Spring kaardistab endpoint'id uuesti
      |
      v
Swagger näitab uut seisu
```

## HelloWorldController ja esimene endpoint — `2:02:47` {#helloworldcontroller-ja-esimene-endpoint}

Praktilises osas tehakse esimene lihtne controller ja endpoint.

### Selgitus

Meetodi definitsioonis on mitu osa:

- nähtavus, näiteks `public`;
- tagastustüüp, näiteks `String`;
- meetodi nimi, näiteks `getGreeting`;
- parameetrid sulgudes;
- meetodi keha loogelistes sulgudes.

Kui tagastustüüp on `String`, peab meetod lõpuks tagastama stringi.

### Koodinäide

```java
@GetMapping("/api/say-hello")
public String getGreeting(@RequestParam Integer customerId) {
    return null;
}
```

Õppimise varases faasis pannakse vahel `return null`, et kood ajutiselt kompileeruks. Lõplikus lahenduses peaks sealt tulema päris vastus.

## Path variable ja request parameter — `2:29:36` {#path-variable-ja-request-parameter}

URL-i kaudu saab backend'ile väärtusi kaasa anda mitmel viisil.

### Selgitus

`Path variable` on osa rajast:

```text
/api/hello/Rain
```

`Request parameter` ehk query parameter tuleb küsimärgi järel:

```text
/api/say-hello?customerId=1
```

Mõlemal juhul peab controller meetod Springile ütlema, kust väärtus tuleb.

### Koodinäide

Request parameter:

```java
@GetMapping("/api/say-hello")
public String getGreeting(@RequestParam Integer customerId) {
    return null;
}
```

Path variable näide:

```java
@GetMapping("/api/hello/{firstName}")
public String sayHello(@PathVariable String firstName) {
    return "Hello " + firstName;
}
```

### Päriselu analoogia

Path variable on nagu aadressi osa. Request parameter on nagu aadressile lisatud täpsustus.

## Controller'ist service klassi liikumine — `2:40:47` {#controllerist-service-klassi-liikumine}

Controller ei peaks ise tervitust kokku panema, kui see on juba äriloogika. Selle jaoks tehakse service klass.

### Selgitus

Videos jõutakse mõtteni, et controller'i meetod peaks kutsuma service meetodit. Service otsustab, kuidas `customerId` põhjal õige klient leida ja milline tekst tagastada.

Praeguses projektis on `HelloWorldService`:

```java
public class HelloWorldService {

    public String getGreeting(Integer customerId) {
        Customer customer1 = new Customer(1, "Rain", "Tüür");
        Customer customer2 = new Customer(2, "Mati", "Nuude");

        return null;
    }

}
```

See on veel pooleli. Õppimise mõte on näha, et `customerId` liigub controller'ist service'isse.

### Skeem

```text
GET /api/say-hello?customerId=1
        |
        v
Controller võtab customerId vastu
        |
        v
Service otsib kliendi ja koostab vastuse
        |
        v
Controller tagastab vastuse
```

## Java objektid, private väljad ja getter'id — `2:46:30` {#java-objektid-private-valjad-ja-getterid}

Java klassist saab teha objekte. Objekti sees on väljad ja meetodid.

### Selgitus

`private` väli tähendab, et seda ei saa teisest klassist otse muuta ega lugeda. Selleks tehakse `public` getter meetodid.

Näide:

```java
private String firstName;

public String getFirstName() {
    return firstName;
}
```

Teine klass ei kirjuta `customer.firstName`, vaid kasutab:

```java
customer.getFirstName();
```

### Koodinäide

`Customer` klassis on getter'id:

```java
public Integer getId() {
    return id;
}

public String getFirstName() {
    return firstName;
}

public String getFullName() {
    return firstName + " " + lastName;
}
```

`getFullName()` ei tagasta ainult ühte välja. Ta paneb eesnime ja perekonnanime kokku.

### Päriselu analoogia

`private` väli on nagu lukustatud sahtel. Getter on teenindusluuk, mille kaudu lubatud infot küsida.

## Konstruktor, `this` ja objektide elu mälus — `3:01:53` {#konstruktor-this-ja-objektide-elu-malus}

Konstruktor käivitub siis, kui luuakse uus objekt.

### Selgitus

Kui kirjutame `new Customer(1, "Rain", "Tüür")`, siis Java loob uue `Customer` objekti ja käivitab sobiva konstruktori.

`this` tähendab "see konkreetne objekt". Seda kasutatakse siis, kui konstruktori parameetril ja objekti väljal on sama nimi.

### Koodinäide

```java
public Customer(Integer id, String firstName, String lastName) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
}
```

Siin:

- parempoolne `id` on parameeter;
- `this.id` on objekti enda väli;
- võrdusmärk seob parameetri väärtuse objekti väljaga.

### Skeem

```text
new Customer(1, "Rain", "Tüür")
        |
        v
Customer objekt mälus
  id = 1
  firstName = "Rain"
  lastName = "Tüür"
```

Kui luua teine objekt `new Customer(2, "Mati", "Nuude")`, siis see on eraldi objekt eraldi väärtustega.

### Päriselu analoogia

Klass on nagu ankeedi vorm. Objekt on üks täidetud ankeet. Konstruktor on hetk, kus uus ankeet täidetakse algandmetega.
