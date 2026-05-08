## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/FjmSa0q6hPOoWr3aR9YBgw5Vc7pEVr-jfWBabWyfvma-H9ZXYAxVMOajmXe07iXG.lgTfThbYqVBsxtxr?startTime=1777356748000) |
| **Parool** | `7R2*aU17` |
| **Transkript** | [GMT20260428-061228_v-1.vtt](../transcripts/GMT20260428-061228_v-1.vtt) |

## Sisukord

- [Objektid, klassid ja `new`](#objektid-klassid-ja-new) — `0:00:16`
- [Primitiivid ja objektitüübid](#primitiivid-ja-objektituubid) — `0:02:26`
- [String on immutable](#string-on-immutable) — `0:09:50`
- [Muutuja on silt, mitte objekt ise](#muutuja-on-silt-mitte-objekt-ise) — `0:13:48`
- [Getterid, setterid ja private väljad](#getterid-setterid-ja-private-valjad) — `0:16:46`
- [Objekti meetodid ja instantsimeetodid](#objekti-meetodid-ja-instantsimeetodid) — `0:22:01`
- [Konstruktorid ja default constructor](#konstruktorid-ja-default-constructor) — `0:28:26`
- [`toString`, `equals` ja `hashCode`](#tostring-equals-ja-hashcode) — `0:31:43`
- [`final` väljad](#final-valjad) — `0:46:23`
- [Lombok ja boilerplate koodi vähendamine](#lombok-ja-boilerplate-koodi-vahendamine) — `0:51:02`
- [Record kui muutumatu andmeobjekt](#record-kui-muutumatu-andmeobjekt) — `1:06:05`
- [Controller ja Service paarina](#controller-ja-service-paarina) — `1:21:38`
- [Spring bean ja `@Service`](#spring-bean-ja-service) — `1:23:09`
- [NullPointerException ja puuduva objekti viga](#nullpointerexception-ja-puuduva-objekti-viga) — `1:36:48`
- [Dependency injection constructor'i kaudu](#dependency-injection-constructori-kaudu) — `1:46:19`
- [`@RequiredArgsConstructor` ja `final` sõltuvused](#requiredargsconstructor-ja-final-soltuvused) — `1:58:12`
- [Projekti setup, JPA Buddy ja entity genereerimine](#projekti-setup-jpa-buddy-ja-entity-genereerimine) — `2:11:06`
- [Persistence package ja entity failide struktuur](#persistence-package-ja-entity-failide-struktuur) — `2:25:12`

## Objektid, klassid ja `new` — `0:00:16` {#objektid-klassid-ja-new}

Klass on kirjeldus. Objekt on klassist tehtud konkreetne eksemplar ehk koopia mälus.

Kui kirjutame Java koodis `new Customer(...)`, siis luuakse uus `Customer` objekt. `new` on Java reserveeritud võtmesõna. Seda ei saa kasutada muutuja nimena, sest Java keel kasutab seda objekti loomiseks.

### Selgitus

Objekti loomisel käivitub konstruktor. Konstruktor saab anda objektile algväärtused.

```java
Customer customer = new Customer(1, "Rain", "Tüür");
```

Siin toimub kolm asja:

1. `new Customer(...)` loob uue objekti;
2. konstruktor paneb väljadele väärtused;
3. `customer` muutujast saab silt selle objekti juurde.

### Päriselu analoogia

Klass on nagu tühi ankeedivorm. Objekt on üks täidetud ankeet. `new` tähendab: võta uus ankeet ja täida see andmetega.

## Primitiivid ja objektitüübid — `0:02:26` {#primitiivid-ja-objektituubid}

Java tüüpe on kasulik jagada kaheks: primitiivid ja objektitüübid.

### Selgitus

Primitiivid on lihtsad otseväärtused:

```java
int number = 1;
char letter = 'A';
boolean active = true;
```

Objektitüübid algavad tavaliselt suure tähega:

```java
Integer number = 1;
String name = "Rain";
Boolean active = true;
Character letter = 'A';
```

`int` ei saa olla `null`, sest ta ei ole objekt. `Integer` saab olla `null`, sest ta on objektitüübi muutuja.

### Skeem

```text
int      -> otseväärtus
Integer  -> objekt, mille sees on väärtus

char     -> otseväärtus
Character -> objekt, mille sees on väärtus
```

### Päriselu analoogia

Primitiiv on nagu number kirjutatud otse paberile. Objektitüüp on nagu väike karp, mille sees on see number.

## String on immutable — `0:09:50` {#string-on-immutable}

`String` on objekt, aga eriline objekt: ta on immutable ehk muutumatu.

### Selgitus

Kui kutsuda `toUpperCase()`, ei muutu vana string. Tekib uus string.

```java
String name = "rain";
name.toUpperCase();

System.out.println(name); // prindib ikka "rain"
```

Kui tahame sildile uue väärtuse panna, tuleb tulemus muutujasse tagasi määrata:

```java
String name = "rain";
name = name.toUpperCase();

System.out.println(name); // "RAIN"
```

Vana objekt ei muutunud. `name` silt hakkas viitama uuele objektile.

### Skeem

```text
name -> "rain"

name.toUpperCase() loob uue objekti:

"rain"   "RAIN"

name = name.toUpperCase()

name -> "RAIN"
```

## Muutuja on silt, mitte objekt ise — `0:13:48` {#muutuja-on-silt-mitte-objekt-ise}

Muutuja ei ole objekt ise. Muutuja on silt, mille kaudu objektile ligi pääseb.

### Selgitus

Kui objektil ei ole enam ühtegi silti, ei saa programm seda objekti enam kasutada.

```java
String name = "rain";
name = "tüür";
```

Pärast teist rida viitab `name` uuele stringile. Vana `"rain"` objekt ei ole selle sildi kaudu enam kättesaadav.

Sama nimega kahte muutujat samas skoobis luua ei saa:

```java
String name = "rain";
String name = "tüür"; // ei kompileeru
```

Kui silt on juba olemas, antakse uus väärtus ilma tüüpi uuesti kirjutamata:

```java
String name = "rain";
name = "tüür";
```

### Päriselu analoogia

Silt on nagu nimesilt ukse peal. Kui silt tõstetakse teise ukse peale, siis sama sildi järgi jõuad nüüd teise ruumi.

## Getterid, setterid ja private väljad — `0:16:46` {#getterid-setterid-ja-private-valjad}

Java objektide väljad tehakse tavaliselt `private`. See tähendab, et teisest klassist ei saa neid otse lugeda ega muuta.

### Selgitus

Väljale ligipääs käib meetodite kaudu:

- getter loeb väärtuse;
- setter muudab väärtust.

Näide olemasolevast `User` entity klassist:

```java
@Getter
@Setter
@Entity
@Table(name = "\"user\"", schema = "bank")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "username", nullable = false)
    private String username;
}
```

Siin getterid ja setterid ei ole failis käsitsi välja kirjutatud. Need teeb Lombok annotatsioonide `@Getter` ja `@Setter` abil.

### Koodinäide

Kui getter oleks käsitsi kirjutatud, näeks see välja nii:

```java
public String getUsername() {
    return username;
}
```

Setter:

```java
public void setUsername(String username) {
    this.username = username;
}
```

## Objekti meetodid ja instantsimeetodid — `0:22:01` {#objekti-meetodid-ja-instantsimeetodid}

Instantsimeetod on meetod, mis kuulub konkreetsele objektile.

### Selgitus

Kui klassist on loodud kaks objekti, siis sama meetod töötab kummagi objekti enda andmetega.

```java
Customer customer1 = new Customer(1, "Rain", "Tüür");
Customer customer2 = new Customer(2, "Mati", "Nuude");

customer1.getFullName(); // Rain Tüür
customer2.getFullName(); // Mati Nuude
```

Meetod `getFullName()` on koodis üks kord, aga käivitub konkreetse objekti kontekstis.

### Skeem

```text
customer1
  firstName = Rain
  lastName = Tüür
  getFullName()

customer2
  firstName = Mati
  lastName = Nuude
  getFullName()
```

### Päriselu analoogia

Kõigil ankeetidel võib olla sama nupp "näita täisnime", aga iga ankeet näitab enda sees olevat nime.

## Konstruktorid ja default constructor — `0:28:26` {#konstruktorid-ja-default-constructor}

Konstruktor on eriline meetod, mis käivitub objekti loomisel.

### Selgitus

Kui klassis ei ole ühtegi konstruktorit, lisab Java vaikimisi tühja konstruktori. Seda nimetatakse default constructor'iks.

Kui kirjutad ise konstruktori, siis Java enam automaatselt tühja konstruktorit ei lisa.

```java
public class Customer {
    private Integer id;
    private String firstName;

    public Customer(Integer id, String firstName) {
        this.id = id;
        this.firstName = firstName;
    }
}
```

Nüüd selline loomine ei tööta:

```java
Customer customer = new Customer();
```

Sest tühja konstruktorit enam ei ole.

### Miks see tähtis on?

Mõned raamistikud loovad objekte taustal. Kui nad eeldavad tühja konstruktorit ja seda ei ole, võib viga tulla kohas, kus sinu enda kood otseselt `new Customer()` ei kirjuta.

## `toString`, `equals` ja `hashCode` — `0:31:43` {#tostring-equals-ja-hashcode}

Kõik Java klassid pärinevad lõpuks klassist `Object`. Sealt tulevad näiteks `toString()`, `equals()` ja `hashCode()`.

### Selgitus

Kui printida objekti ilma oma `toString()` meetodita, võib tulemus olla midagi sellist:

```text
ee.bcs.bank40back.Customer@4f3f5b24
```

See ei ole kasutajasõbralik. Sellepärast tehakse tihti oma `toString()`.

`equals()` vaikimisi kontrollib, kas tegemist on täpselt sama objektiga mälus. Kui tahame kontrollida, kas kahel objektil on samad andmed, tuleb `equals()` ümber defineerida.

### Koodinäide

Lombokiga saab `toString()` genereerida:

```java
@ToString
public class User {
    private Integer id;
    private String username;
}
```

Ole siiski ettevaatlik: entity klassidel võib `@ToString` mõnikord liiga palju seotud andmeid kaasa tõmmata, eriti kui objektidel on omavahel seosed.

## `final` väljad — `0:46:23` {#final-valjad}

`final` väli saab väärtuse ainult ühe korra.

### Selgitus

Kui väli on `final`, peab ta väärtuse saama objekti loomise ajal ehk konstruktoris.

```java
public class Customer {
    private final Integer id;

    public Customer(Integer id) {
        this.id = id;
    }
}
```

Sellele väljale ei saa teha tavalist setterit:

```java
customer.setId(2); // final välja puhul ei ole selline muutmine mõeldud
```

### Päriselu analoogia

`final` on nagu isikukood. Kui dokument luuakse, pannakse see kirja. Hiljem seda sama objekti sees lihtsalt ümber ei kirjutata.

## Lombok ja boilerplate koodi vähendamine — `0:51:02` {#lombok-ja-boilerplate-koodi-vahendamine}

Lombok on teek, mis genereerib korduvat Java koodi kompileerimise ajal.

### Selgitus

Ilma Lombokita tuleks tihti käsitsi kirjutada:

- getterid;
- setterid;
- konstruktorid;
- `toString()`;
- `equals()` ja `hashCode()`.

Lombokiga saab sama mõtte kirja panna annotatsioonidega.

### Koodinäide

Olemasolev `City` entity:

```java
@Getter
@Setter
@Entity
@Table(name = "city", schema = "bank")
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;
}
```

Failis ei ole `getId()`, `setId(...)`, `getName()` ega `setName(...)` meetodeid näha. Lombok teeb need taustal.

### Levinud Lomboki annotatsioonid

```java
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@ToString
```

`@Data` teeb mitu asja korraga, aga entity klassidel ei ole see alati hea valik, sest ta võib lisada liiga palju käitumist.

## Record kui muutumatu andmeobjekt — `1:06:05` {#record-kui-muutumatu-andmeobjekt}

`record` on Java tüüp muutumatute andmeobjektide loomiseks.

### Selgitus

Record sobib hästi siis, kui objekt sünnib kõigi vajalike andmetega ja hiljem neid andmeid ei muudeta.

```java
public record Student(Integer id, String firstName, String lastName) {
}
```

Record loob automaatselt:

- konstruktori;
- väärtuste lugemise meetodid;
- `toString()`;
- `equals()` ja `hashCode()`.

Getteri nimi ei ole `getFirstName()`, vaid lihtsalt:

```java
student.firstName();
```

### Millal record sobib DTO-ks?

Record sobib hästi DTO-ks, kui kõik andmed on korraga olemas.

Kui vastus pannakse kokku mitmes etapis ja osa välju täidetakse hiljem, on tavaline klass mugavam, sest record'it ei saa pärast loomist muuta.

## Controller ja Service paarina — `1:21:38` {#controller-ja-service-paarina}

Controller ja service töötavad paarina. Controller võtab sõnumi vastu. Service teeb päris töö.

### Selgitus

Controller meetod peaks olema õhuke. Ta ei peaks sisaldama kogu äriloogikat.

Olemasolev `LoginController`:

```java
@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;

    @GetMapping("/login")
    public void login(@RequestParam String username, @RequestParam String password) {
        loginService.login(username, password);
    }
}
```

Siin controller:

- ootab GET sõnumit `/api/login`;
- võtab URL-ist `username` ja `password`;
- annab need edasi `LoginService` klassile.

### Skeem

```text
GET /api/login?username=...&password=...
          |
          v
LoginController.login(...)
          |
          v
LoginService.login(...)
```

## Spring bean ja `@Service` — `1:23:09` {#spring-bean-ja-service}

Spring bean on objekt, mida Spring loob ja hoiab oma konteineris.

### Selgitus

Kui klassil on `@Service`, siis Spring teab, et sellest klassist tuleb teha taaskasutatav service objekt.

Olemasolev `LoginService`:

```java
@Service
@RequiredArgsConstructor
public class LoginService {

    private final UserRepository userRepository;

    public void login(String username, String password) {
        Optional<User> optionalUser = userRepository.findById(1);
    }
}
```

`@Service` on Springi annotatsioon. See erineb Lomboki annotatsioonidest. Lombok genereerib koodi. Springi annotatsioonid annavad Spring raamistikule juhiseid objektide loomiseks ja ühendamiseks.

### Päriselu analoogia

Spring konteiner on nagu tööruum, kus vajalikud töötajad on juba kohal. Kui controller vajab service'it, ei loo ta uut inimest, vaid saab viite juba olemasolevale töötajale.

## NullPointerException ja puuduva objekti viga — `1:36:48` {#nullpointerexception-ja-puuduva-objekti-viga}

`NullPointerException` tekib siis, kui proovid kutsuda meetodit muutujalt, mille väärtus on `null`.

### Selgitus

Selline olukord on vigane:

```java
LoginService loginService = null;
loginService.login("user", "pass");
```

`null` ei ole objekt. Sellel ei ole meetodeid.

Kui näed pikka error stack'i, otsi esimest linki, mis viitab sinu enda koodifailile. Sealt algab tavaliselt koht, kus probleem päriselt avaldus.

### Skeem

```text
loginService -> null

loginService.login(...)
       |
       v
NullPointerException
```

## Dependency injection constructor'i kaudu — `1:46:19` {#dependency-injection-constructori-kaudu}

Dependency injection tähendab, et klass sõltub teisest objektist ja Spring annab selle objekti konstruktorisse.

### Selgitus

Kui controller vajab service'it, siis parim muster on constructor injection:

```java
private final LoginService loginService;

public LoginController(LoginService loginService) {
    this.loginService = loginService;
}
```

Spring näeb konstruktorit ja otsib oma konteinerist `LoginService` tüüpi objekti. Kui see on olemas, annab Spring selle controller'i loomisel kaasa.

### Skeem

```text
Spring loob LoginService bean'i
          |
          v
Spring loob LoginController bean'i
ja annab LoginService objekti konstruktorisse
          |
          v
LoginController saab loginService välja täidetud
```

### Miks mitte igal pool `new LoginService()`?

Kui iga controller looks ise uue service objekti, tekiks palju tarbetuid objekte. Service klassid on tavaliselt tegevusklassid, mitte andmeobjektid. Neid saab taaskasutada.

## `@RequiredArgsConstructor` ja `final` sõltuvused — `1:58:12` {#requiredargsconstructor-ja-final-soltuvused}

`@RequiredArgsConstructor` on Lomboki annotatsioon, mis loob konstruktori kõigi `final` väljade jaoks.

### Selgitus

Olemasolev `LoginController` kasutab seda mustrit:

```java
@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;
}
```

Lombok genereerib taustal umbes sellise konstruktori:

```java
public LoginController(LoginService loginService) {
    this.loginService = loginService;
}
```

Spring kasutab seda konstruktorit dependency injection'i tegemiseks.

### Meelespea

Tüüpiline Springi muster:

```java
@Service
@RequiredArgsConstructor
public class SomeService {
    private final SomeRepository someRepository;
}
```

`final` ütleb, et sõltuvus peab olema objekti loomise hetkel olemas. `@RequiredArgsConstructor` teeb vajaliku konstruktori. Spring annab sobiva bean'i sisse.

## Projekti setup, JPA Buddy ja entity genereerimine — `2:11:06` {#projekti-setup-jpa-buddy-ja-entity-genereerimine}

Video lõpus liigutakse päris projekti setup'i juurde.

### Selgitus

Teemad:

- IntelliJ Ultimate ja JPA Buddy plugin;
- andmebaasi skripti lisamine projekti;
- `infrastructure` kausta lisamine;
- frontend'i config'i muutmine nii, et päringud lähevad local backend'i vastu;
- andmebaasi connection'i loomine IntelliJ-s;
- entity klasside genereerimine andmebaasitabelite põhjal.

JPA Buddy aitab andmebaasi tabelitest entity klasse genereerida. Seda nimetatakse reverse engineering'uks: olemasolevast andmebaasi struktuurist luuakse Java klassid.

### Päriselu analoogia

Kui andmebaas on juba valmis Exceli tabelite kujul, siis JPA Buddy teeb nende tabelite põhjal Java "ankeedivormid", et kood oskaks tabeliridu objektidena käsitleda.

## Persistence package ja entity failide struktuur — `2:25:12` {#persistence-package-ja-entity-failide-struktuur}

`persistence` kaustas hoitakse andmebaasiga seotud klasse.

### Selgitus

Projektis on entity klassid jagatud tabeli järgi alamkaustadesse:

```text
src/main/java/ee/bcs/bank40back/persistence/
  city/City.java
  location/Location.java
  user/User.java
  role/Role.java
  transactiontype/TransactionType.java
```

Package nimed on väikeste tähtedega ja ilma sidekriipsudeta. Näiteks `locationtransctiontype` on kõik väikeste tähtedega kokku kirjutatud.

### Koodinäide

`Location` entity:

```java
@Getter
@Setter
@Entity
@Table(name = "location", schema = "bank")
public class Location {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "city_id", nullable = false)
    private City city;

    @Column(name = "name", nullable = false)
    private String name;
}
```

See klass ütleb:

- tegemist on entity'ga;
- tabel on `bank.location`;
- `id` on primary key;
- `city_id` seob location'i city tabeliga.

### Repository näide

`UserRepository` näitab, kuidas persistence kihis saab andmeid küsida:

```java
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("select u from User u where u.username = ?1 and u.password = ?2 and u.status = ?3")
    Optional<User> findUserBy(String username, String password, String status);
}
```

`JpaRepository<User, Integer>` tähendab, et repository töötab `User` entity'ga ja selle ID tüüp on `Integer`.
