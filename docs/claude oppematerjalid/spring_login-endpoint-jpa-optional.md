# 2026-04-28 video 2 - Login flow, repository ja Optional

## Video info

| Väli | Väärtus |
| --- | --- |
| Video link | https://us02web.zoom.us/rec/share/oS-xMGmM9WrdhBmy0jn8pATNwBHcBdCS7xa6f-MKRm42GpeRcuim-HeeL_69h-wQ.2Oeab6SImdodgZ1p?startTime=1777372852000 |
| Parool | `7R2*aU17` |
| Transkript | [GMT20260428-104052_v-2.vtt](../transcripts/GMT20260428-104052_v-2.vtt) |
| Teema | Andmebaasi ühendamine, login endpoint, Spring service/repository kiht, JPA päringud ja `Optional` |

## Sisukord

- [0:00:17 - Andmebaasi ühendus IntelliJ-s](#andmebaasi-ühendus-intellij-s)
- [0:01:54 - `pank` skeema ja reset database skriptid](#pank-skeema-ja-reset-database-skriptid)
- [0:09:38 - Entity klassid peegeldavad andmebaasi piiranguid](#entity-klassid-peegeldavad-andmebaasi-piiranguid)
- [0:12:41 - B-5: login võimekuse alustamine](#b-5-login-võimekuse-alustamine)
- [0:13:04 - `application.properties` ja backend flow](#applicationproperties-ja-backend-flow)
- [0:18:17 - `LoginController` ja endpointi kaardistus](#logincontroller-ja-endpointi-kaardistus)
- [0:25:59 - `@RequestMapping` ja ühine `/api` prefix](#requestmapping-ja-ühine-api-prefix)
- [0:27:11 - `@RequestParam` ja query parameetrid](#requestparam-ja-query-parameetrid)
- [0:37:18 - `LoginService` ja controller-service ühendus](#loginservice-ja-controller-service-ühendus)
- [0:51:25 - Mäluviited liiguvad meetodite vahel](#mäluviited-liiguvad-meetodite-vahel)
- [0:58:35 - Swaggeriga flow debugimine](#swaggeriga-flow-debugimine)
- [1:11:40 - `User` tabel, entity ja repository vajadus](#user-tabel-entity-ja-repository-vajadus)
- [1:19:36 - `UserRepository` ja `JpaRepository` pärand](#userrepository-ja-jparepository-pärand)
- [1:34:29 - SQL, driver ja custom päringud](#sql-driver-ja-custom-päringud)
- [1:36:16 - `@Query` ja `findUserBy`](#query-ja-finduserby)
- [2:08:25 - `Optional<User>` ja puuduvate andmete käsitlemine](#optionaluser-ja-puuduvate-andmete-käsitlemine)

## Andmebaasi ühendus IntelliJ-s

**Aeg:** 0:00:17

Video algab IntelliJ andmebaasiühenduse seadistamisega. Oluline mõte on, et backend ei tööta vaakumis: Spring Booti rakendus räägib PostgreSQL andmebaasiga ning arendaja peab suutma sama andmebaasi ka IDE-st vaadata.

Ühenduse andmetest oli videos juttu:

- kasutaja: `postgres`
- parool: `student123`
- andmebaas: `postgres`
- skeema, millega projekt töötab: `bank`

Algajale on siin kõige olulisem eristada kahte asja:

- **andmebaas** on PostgreSQL serveris olev konkreetne andmekogu, näiteks `postgres`;
- **skeema** on andmebaasi sees olev nimede ruum, näiteks `bank`, mille all paiknevad tabelid.

Kui IDE ühendus töötab, saab kontrollida, kas tabelid on olemas, kas testandmed on sees ja kas SQL päring annab sama tulemuse, mida backend hiljem JPA kaudu küsib.

## `pank` skeema ja reset database skriptid

**Aeg:** 0:01:54

Kui vajalikku skeemat või tabeleid ei ole, tuleb andmebaasi skriptid uuesti käivitada. Videos loodi või kasutati reset database run configuration'it, mis käivitab projektiga kaasas olevad andmebaasi loomise skriptid.

Mõte on lihtne:

1. esmalt luuakse vajalik skeema ja tabelid;
2. seejärel lisatakse algandmed;
3. vajadusel saab andmebaasi samasse algseisu tagasi panna.

Run configuration nimetati hiljem kujule `pank Back`, et oleks lihtne aru saada, millise projekti andmebaasi resetitakse.

Praktiline kontroll pärast skriptide jooksutamist:

- kas `bank` skeema on nähtav;
- kas tabel `user` on olemas;
- kas tabelites on testandmed;
- kas Spring Booti ühenduse parool ja andmebaas kattuvad IDE ühendusega.

## Entity klassid peegeldavad andmebaasi piiranguid

**Aeg:** 0:09:38

Entity klass ei ole lihtsalt suvaline Java klass. See peegeldab andmebaasitabelit. Kui tabelis on veerg `NOT NULL`, foreign key või muu piirang, siis kajastub see tavaliselt ka entity väljade ja annotatsioonide kaudu.

Näide olemasolevast `User` entity klassist:

```java
@Getter
@Setter
@Entity
@ToString
@Table(name = "\"user\"", schema = "bank")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "role_id", nullable = false)
    private Role role;

    @Size(max = 50)
    @NotNull
    @Column(name = "username", nullable = false, length = 50)
    private String username;

    @Size(max = 50)
    @NotNull
    @Column(name = "password", nullable = false, length = 50)
    private String password;

    @Size(max = 1)
    @NotNull
    @Column(name = "status", nullable = false, length = 1)
    private String status;
}
```

Siit on näha mitu olulist asja:

- `@Entity` ütleb JPA-le, et see klass vastab andmebaasitabelile;
- `@Table(name = "\"user\"", schema = "bank")` ütleb täpse tabeli ja skeema;
- `@Id` märgib primaarvõtme;
- `@ManyToOne` ja `@JoinColumn` seovad kasutaja rolliga;
- `@Column(nullable = false)` ja `@NotNull` näitavad, et väärtus ei tohi puududa.

Tabeli nimi `user` on PostgreSQL-is eriline sõna, mistõttu on siin kasutatud jutumärkidega kuju `"user"`.

## B-5: login võimekuse alustamine

**Aeg:** 0:12:41

Transkriptis kõlas ülesandena "B viis"; materjalis märgin selle kujul **B-5**. Ülesande sisuline eesmärk on lisada backendile login võimekus.

Login flow ei tähenda ainult üht meetodit. Tüüpiline liikumine on:

1. brauser või Swagger teeb HTTP päringu;
2. päring jõuab controllerisse;
3. controller annab töö service kihile;
4. service küsib andmeid repository kaudu;
5. repository pöördub andmebaasi poole;
6. tulemus liigub tagasi sama ahelat pidi.

Videos rõhutati, et enne koodi kirjutamist tasub flow vasakult paremale läbi mõelda. See vähendab juhuslikku koodi: iga klass tekib sellepärast, et tal on kindel roll.

## `application.properties` ja backend flow

**Aeg:** 0:13:04

Spring Booti andmebaasiühendus on seadistatud failis `src/main/resources/application.properties`.

Praeguse projekti näide:

```properties
spring.application.name=bank40back
spring.datasource.driverClassName=org.postgresql.Driver
spring.datasource.url=jdbc:postgresql://localhost/postgres
spring.datasource.username=postgres
spring.datasource.password=student123
spring.jpa.database-platform=org.hibernate.dialect.PostgreSQLDialect
spring.jpa.show-sql=true
spring.sql.init.mode=always
spring.jpa.hibernate.ddl-auto=none
```

Olulised read:

- `spring.datasource.url` ütleb, millise PostgreSQL andmebaasiga ühendutakse;
- `spring.datasource.username` ja `spring.datasource.password` on sisselogimise andmed;
- `spring.jpa.database-platform` ütleb Hibernate'ile, millise SQL dialektiga arvestada;
- `spring.jpa.show-sql=true` aitab arenduse ajal näha, milliseid SQL päringuid Hibernate teeb;
- `spring.jpa.hibernate.ddl-auto=none` tähendab, et Hibernate ei loo tabeleid ise automaatselt.

Kui rakendus ei saa andmebaasiga ühendust, on see fail üks esimesi kohti, mida kontrollida.

## `LoginController` ja endpointi kaardistus

**Aeg:** 0:18:17

Controller on koht, kuhu HTTP päring esimesena rakenduse koodis jõuab. Videos loodi `controller` package ja `LoginController`, sest login on eraldi funktsionaalsus, mida ei ole mõistlik panna juhuslikku üldklassi.

Praeguse projekti controller:

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

Siin on rollid selged:

- `@RestController` teeb klassist REST controlleri;
- `@GetMapping("/login")` seob meetodi GET päringuga;
- `login(...)` meetod on endpointi Java-poolne käsitleja;
- controller ei otsi kasutajat ise, vaid kutsub `loginService.login(...)`.

Controlleri eesmärk ei ole sisaldada äriloogikat. Tema töö on HTTP maailma ja Java teenusekihi vahel vahendada.

## `@RequestMapping` ja ühine `/api` prefix

**Aeg:** 0:25:59

`@RequestMapping("/api")` klassi peal lisab kõigile sama klassi endpointidele ühise prefiksi.

Kui klassil on:

```java
@RequestMapping("/api")
```

ja meetodil:

```java
@GetMapping("/login")
```

siis lõplik endpoint on:

```text
GET /api/login
```

See on kasulik, sest kogu REST API saab hoida ühe selge alguse all. Hiljem võib samas controlleris olla mitu loginiga seotud endpointi, aga nad saavad kõik sama `/api` prefiksi.

## `@RequestParam` ja query parameetrid

**Aeg:** 0:27:11

Videos võeti login endpointis kasutusele `@RequestParam`. See tähendab, et väärtus loetakse URL-i query parameetrist.

Näide päringust:

```text
GET /api/login?username=mari&password=parool
```

Vastav Java meetod:

```java
@GetMapping("/login")
public void login(@RequestParam String username, @RequestParam String password) {
    loginService.login(username, password);
}
```

Spring teeb siin automaatselt sidumise:

- query parameeter `username` läheb Java muutujasse `username`;
- query parameeter `password` läheb Java muutujasse `password`.

Kui parameetri nimi URL-is ja meetodi argumendi nimi kattuvad, on kood lühike ja loetav.

## `LoginService` ja controller-service ühendus

**Aeg:** 0:37:18

Kui controller saab päringu kätte, ei tohiks ta hakata otse andmebaasiga tegelema. Selleks luuakse service kiht. Videos loodi `LoginService` ja märgiti see `@Service` annotatsiooniga.

Praegune `LoginService`:

```java
@Service
@RequiredArgsConstructor
public class LoginService {

    private final UserRepository userRepository;

    public void login(String username, String password) {
        // todo: too ära sisselogitud kasutaja andmed, tabelist 'user'
        Optional<User> optionalUser = userRepository.findById(1);
    }
}
```

`@Service` ütleb Springile, et sellest klassist tuleb luua bean. `@RequiredArgsConstructor` loob Lomboki abil konstruktori kõigile `final` väljadele.

Controlleris olev väli:

```java
private final LoginService loginService;
```

tähendab, et controller vajab service objekti. Spring süstib selle konstruktori kaudu sisse. Sama muster kordub service ja repository vahel.

## Mäluviited liiguvad meetodite vahel

**Aeg:** 0:51:25

Videos selgitati, et kui objekt või väärtus antakse meetodisse kaasa, siis Java ei tee iga kord tervest objektist uut koopiat. Liigub viide ehk reference.

Login näites liiguvad kasutajanimi ja parool controllerist service'isse:

```java
loginService.login(username, password);
```

Service meetodis on samad väärtused uute parameetrinimedega kättesaadavad:

```java
public void login(String username, String password) {
    // siin saab kasutada samu väärtusi
}
```

Algaja jaoks on tähtis aru saada, et meetodikutse ei ole "hüpe teise maailma". See on sama programmi järgmine samm. Väärtused antakse kaasa ning kutsutud meetod saab nendega edasi töötada.

## Swaggeriga flow debugimine

**Aeg:** 0:58:35

Endpointi meetod ei käivitu rakenduse startimisel. See käivitub siis, kui tuleb vastav HTTP päring, näiteks Swaggerist.

Praktiline debugimise järjekord:

1. pane breakpoint `LoginController.login(...)` reale;
2. käivita backend debug režiimis;
3. ava Swagger;
4. tee `GET /api/login` päring;
5. vaata, kuidas väärtused controllerisse jõuavad;
6. astu debuggeriga edasi `LoginService.login(...)` meetodisse.

Selline sammhaaval vaatamine aitab näha tegelikku flow'd, mitte ainult teooriat.

## `User` tabel, entity ja repository vajadus

**Aeg:** 1:11:40

Kui login peab kontrollima kasutajanime ja parooli, siis on vaja minna `user` tabelisse. Java kood ei tööta otse tabeli ridadega; ta töötab entity objektidega.

Seetõttu on vaja kolme mõistet koos:

- `User` entity kirjeldab tabeli rea kuju Java maailmas;
- `UserRepository` oskab `User` objekte andmebaasist küsida;
- `LoginService` kasutab repositoryt, et login otsus teha.

Kui küsimus on "kas selline kasutaja on olemas?", siis service ei peaks ehitama SQL stringi käsitsi. Selle asemel annab service töö repositoryle.

## `UserRepository` ja `JpaRepository` pärand

**Aeg:** 1:19:36

Repository loodi interface'ina. See tundub alguses harjumatu, sest tavaliselt ootame klassi ja meetodite sisu. Spring Data JPA puhul annab `JpaRepository` juba palju valmis käitumist.

Praegune repository:

```java
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("select u from User u where u.username = ?1 and u.password = ?2 and u.status = ?3")
    Optional<User> findUserBy(String username, String password, String status);
}
```

`JpaRepository<User, Integer>` tähendab:

- repository töötab `User` entityga;
- `User` primaarvõtme tüüp on `Integer`.

Pärimise kaudu saab repository kaasa standardmeetodid, näiteks:

- `findById(...)`;
- `findAll()`;
- `save(...)`;
- `delete(...)`.

Kui otsid primaarvõtme järgi, on `findById` olemas. Kui otsid näiteks `username`, `password` ja `status` väljade järgi, tuleb lisada custom meetod.

## SQL, driver ja custom päringud

**Aeg:** 1:34:29

Videos seletati, kuidas Java koodist jõutakse SQL päringuni. Me ei kirjuta alati SQL-i otse controllerisse või service'isse, aga lõpuks peab andmebaas ikkagi saama SQL käsu.

Lihtsustatud ahel:

```text
Java service -> repository -> JPA/Hibernate -> PostgreSQL driver -> SQL -> andmebaas
```

Näiteks login kontroll võib andmebaasi mõttes olla umbes selline:

```sql
select *
from bank."user"
where username = 'mari'
  and password = 'parool'
  and status = 'A';
```

Java poolel ei pea seda päringut alati ise stringina kokku panema. Spring Data JPA võimaldab:

- tuletada päringu meetodi nimest;
- kirjutada päringu `@Query` annotatsiooniga.

## `@Query` ja `findUserBy`

**Aeg:** 1:36:16

Videos vaadati kahte viisi, kuidas repositoryle öelda, mida andmebaasist küsida. Kui meetodinimi muutub liiga ebamugavaks või päring vajab täpsust, on `@Query` loetavam.

Praeguses projektis on kasutusel:

```java
@Query("select u from User u where u.username = ?1 and u.password = ?2 and u.status = ?3")
Optional<User> findUserBy(String username, String password, String status);
```

See ei ole tavaline SQL, vaid JPQL:

- `User` on entity klassi nimi, mitte tabeli nimi;
- `u.username` viitab entity väljale;
- `?1`, `?2`, `?3` vastavad meetodi argumentidele järjekorras.

Kui kutsuda:

```java
userRepository.findUserBy(username, password, "A");
```

siis:

- `?1` saab väärtuseks `username`;
- `?2` saab väärtuseks `password`;
- `?3` saab väärtuseks `"A"`.

Staatus `"A"` tähendab siin aktiivset kasutajat. Login ei peaks lubama sisse kasutajat, kelle staatus ei ole aktiivne.

## `Optional<User>` ja puuduvate andmete käsitlemine

**Aeg:** 2:08:25

`findById` ja sarnased otsingud ei saa alati objekti tagasi anda. Andmebaasis ei pruugi vastavat rida olla. Selle jaoks kasutatakse `Optional<User>` tüüpi.

Lihtne mõttemudel:

- `User` tähendab: kasutaja objekt on olemas;
- `Optional<User>` tähendab: karbis võib olla kasutaja, aga karp võib olla ka tühi.

`Optional` annab meetodid, millega puuduvat väärtust kontrollida:

```java
optionalUser.isPresent();
optionalUser.isEmpty();
optionalUser.get();
optionalUser.orElseThrow();
```

Videos jõuti mõtteni, et login puhul on mõistlik kasutada `orElseThrow()`: kui kasutajat ei leitud, tuleb viga välja visata.

Näidisena võiks login service hiljem liikuda sellise kuju poole:

```java
public void login(String username, String password) {
    User user = userRepository.findUserBy(username, password, "A")
            .orElseThrow(() -> new RuntimeException("Invalid username or password"));
}
```

See teeb kaks asja korraga selgeks:

- kui aktiivne kasutaja leitakse, saadakse `User` objekt;
- kui ei leita, katkestatakse login veaga.

Päris rakenduses tasub `RuntimeException` asemel kasutada projekti enda veaklassi, näiteks mõnda `infrastructure.exception` paketi erindit, et REST vastus oleks ühtlane.

## Kokkuvõte

Selles videos ehitati login funktsionaalsuse selgroog:

- seadistati ja kontrolliti PostgreSQL ühendust;
- vaadati, kuidas entity klassid peegeldavad andmebaasi;
- loodi `LoginController` ja `LoginService` rollid;
- ühendati controller service kihiga constructor injectioni kaudu;
- jõuti `UserRepository` ja `JpaRepository` pärandini;
- koostati custom kasutajaotsing `@Query` abil;
- selgitati, miks repository tagastab `Optional<User>`.

Põhiline õppetund: backend request liigub kihiti. Controller ei peaks teadma andmebaasi detaile, service ei peaks käsitsi HTTP-ga tegelema ning repository on koht, kus kirjeldatakse, kuidas entity andmebaasist kätte saada.
