## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/T_2Tko0uxM-suJcQ8Pscnmg0QP4b7NBGRRizir9Sji__5At5WGHlcWD1N2GRdM6M.fhSk2wCv2Wqk07Jt?startTime=1776252691000) |
| **Parool** | `#^vAq1J9` |
| **Transkript** | [GMT20260415-113131_v-3.vtt](../transcripts/GMT20260415-113131_v-3.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu ja terminid on kohati loetud valesti. Näiteks on `integer`, `double`, `false`, `getter`, `setter` ja `encapsulation` mõnes kohas vigaselt tuvastatud.

Selles õppematerjalis kasutan tavapäraseid Java termineid ja vormistan näited selges kujus ümber.

Selles videos otseseid taskikoode stiilis `FE-124` või `BEB-7` ei tuvastanud.

Kuna selle repo koodibaas on Vue/JavaScript projekt, mitte Java projekt, kasutan siin kaht tüüpi koodinäiteid:

- päris näited repo `src/` kaustast, kui mõte on sama
- lihtsad Java näited nendes kohtades, kus projektis otsest vastet ei ole

## Sisukord

- [Muutuja on nimega kast mälus](#muutuja-on-nimega-kast-malus) - `0:00:31`
- [Andmetüüp ütleb, mis liiki väärtust hoitakse](#andmetuup-utleb-mis-liiki-vaartust-hoitakse) - `0:02:03`
- [Miks `int` ja `double` ei käitu jagamisel samamoodi](#miks-int-ja-double-ei-kaitu-jagamisel-samamoodi) - `0:03:28`
- [Muutuja väärtust saab hiljem muuta](#muutuja-vaartust-saab-hiljem-muuta) - `0:05:25`
- [`boolean` tähendab sisuliselt `true` või `false`](#boolean-tahendab-sisuliselt-true-voi-false) - `0:06:59`
- [Tingimuslaused `if`, `else` ja `else if`](#tingimuslaused-if-else-ja-else-if) - `0:08:31`
- [Loogilised operaatorid `and`, `or`, `not`](#loogilised-operaatorid-and-or-not) - `0:16:10`
- [Meetod on korduvkasutatav koodiplokk](#meetod-on-korduvkasutatav-koodiplokk) - `0:23:19`
- [Parameetrid ja tagastusväärtus](#parameetrid-ja-tagastusvaartus) - `0:25:50`
- [Klass on plaan, objekt on päris asi](#klass-on-plaan-objekt-on-paris-asi) - `0:28:09`
- [Konstruktor loob objekti algseisuga](#konstruktor-loob-objekti-algseisuga) - `0:30:44`
- [Getter ja setter juhivad andmete lugemist ja muutmist](#getter-ja-setter-juhivad-andmete-lugemist-ja-muutmist) - `0:31:39`
- [Kapseldamine hoiab tundlikud väljad kontrolli all](#kapseldamine-hoiab-tundlikud-valjad-kontrolli-all) - `0:34:04`
- [`public` ja `private` määravad, kes ligi pääseb](#public-ja-private-maaravad-kes-ligi-paaseb) - `0:40:01`

<a id="muutuja-on-nimega-kast-malus"></a>
## Muutuja on nimega kast mälus - `0:00:31`

Video alguses selgitatakse muutujat väga õige algaja-analooogiaga: muutuja on nagu nimega kast, kuhu saad mingi väärtuse panna.

### Selgitus

Muutuja aitab programmil midagi meeles hoida. Tavaliselt on muutujal vähemalt kolm mõttelist osa:

- nimi
- tüüp
- väärtus

See on kasulik, sest programm saab sama väärtust hiljem uuesti kasutada, mitte ei pea seda iga kord nullist välja mõtlema.

### Skeem

```text
muutuja
  |
  +-- nimi: aasta
  +-- tüüp: int
  +-- väärtus: 2026
```

### Koodinäide

Selles projektis on Vue komponendi `data()` plokis mitu "kastikest", kuhu väärtusi hoitakse:

```js
data() {
  return {
    username: '',
    password: '',
    errorMessage: '',
    loginResponse: {
      userId: 0,
      roleName: '',
    },
  }
}
```

Kuigi see ei ole Java, on mõte sama:

- `username` hoiab kasutajanime
- `password` hoiab parooli
- `errorMessage` hoiab veateadet

### Päriselu analoogia

Muutuja on nagu sildiga sahtel. Kui sildil on kirjas `parool`, siis tead, mida sealt otsida või kuhu uus väärtus panna.

<a id="andmetuup-utleb-mis-liiki-vaartust-hoitakse"></a>
## Andmetüüp ütleb, mis liiki väärtust hoitakse - `0:02:03`

Järgmine oluline mõte on see, et programm peab teadma, mis sorti asi muutujas sees on.

### Selgitus

Levinumad algtaseme tüübid, mis videos läbi käivad:

- `int` - täisarv
- `double` - komakohaga arv
- `String` - tekst
- `char` - üks märk
- `boolean` - tõene või väär

Samuti tuletatakse meelde, et Java rea lõpus käib tavaliselt semikoolon `;`. Kui see puudu jääb, tuleb tihti süntaksiviga.

### Skeem

```text
2026      -> int
2.5       -> double
"Tallinn" -> String
'A'       -> char
true      -> boolean
```

### Koodinäide

Lihtne Java näide:

```java
int year = 2026;
double price = 2.5;
String city = "Tallinn";
char grade = 'A';
boolean loggedIn = false;
```

### Päriselu analoogia

Andmetüüp on nagu hoiukasti kleebis:

- ühte kasti lähevad numbrid
- teise tekstid
- kolmandasse ainult jah/ei tüüpi väärtused

<a id="miks-int-ja-double-ei-kaitu-jagamisel-samamoodi"></a>
## Miks `int` ja `double` ei käitu jagamisel samamoodi - `0:03:28`

See on video üks praktilisemaid hetki, sest siin näidatakse kohe viga, mida algajad väga sageli teevad.

### Selgitus

Kui jagad kahte täisarvu ja tulemus peaks sisaldama komakohta, siis `int` ei sobi lõpptulemuse hoidmiseks.

Näide:

- `5 / 2` peaks inimese jaoks olema `2.5`
- kui tulemus läheb täisarvu tüüpi, võid saada lihtsalt `2`

Kui sul on vaja komakohta, kasuta `double`.

### Skeem

```text
5 / 2
 |
 +-- int    -> 2
 +-- double -> 2.5
```

### Koodinäide

```java
int wrongResult = 5 / 2;        // tulemus 2
double rightResult = 5.0 / 2;   // tulemus 2.5
```

### Päriselu analoogia

Kui lõikad pitsa pooleks, ei taha sa kuulda, et tulemus on "kaks". Sa tahad ka seda poolt näha. `double` lubab sul seda poolt näidata.

<a id="muutuja-vaartust-saab-hiljem-muuta"></a>
## Muutuja väärtust saab hiljem muuta - `0:05:25`

Videos rõhutatakse ka seda, et muutuja üks tugevusi on paindlikkus: väärtus ei pea jääma kogu programmi ajaks samaks.

### Selgitus

Kui olukord muutub, võib muutuda ka muutuja sisu. See ongi üks põhjus, miks muutujad kasulikud on.

Näiteks:

- aasta muutub
- kasutaja sisestus muutub
- veateade tekib või kaob

### Skeem

```text
alguses: year = 2026
hiljem:  year = 2027
```

### Koodinäide

Selles projektis muudetakse väärtusi pidevalt:

```js
resetErrorMessage() {
  this.errorMessage = ''
}

login() {
  // ...
  this.errorMessage = 'Täida kõik väljad'
}
```

Siin saab `errorMessage` olla kord tühi, kord sisuga. Sama muutujat kasutatakse eri hetkedel eri väärtusega.

### Päriselu analoogia

See on nagu tahvel klassiruumis. Sisu saab muuta, aga tahvel ise jääb samaks.

<a id="boolean-tahendab-sisuliselt-true-voi-false"></a>
## `boolean` tähendab sisuliselt `true` või `false` - `0:06:59`

Selles osas tuleb läbi küsimus, kas boolean võiks olla ka `1` ja `0`.

### Selgitus

Praktilisel programmeerimistasemel mõtle booleanist nii:

- `true` - jah, kehtib
- `false` - ei, ei kehti

Madalamal tasemel võib arvuti seda bittidena esitada, aga koodi kirjutades on sul mõistlik mõelda `true` ja `false` kaudu.

### Skeem

```text
boolean
  |
  +-- true
  +-- false
```

### Koodinäide

Selles projektis on üks väga lihtne boolean-loogika näide:

```js
allFormFieldsAreCorrect() {
  return this.username && this.password
}
```

Mõtte tasandil ütleb see:

- kui kasutajanimi on olemas
- ja parool on olemas
- siis tingimus on piisavalt "tõene", et edasi minna

### Päriselu analoogia

Boolean on nagu lüliti. Ta ei ole "natuke sees". Ta on kas sees või väljas.

<a id="tingimuslaused-if-else-ja-else-if"></a>
## Tingimuslaused `if`, `else` ja `else if` - `0:08:31`

Pärast muutujate teemat liigutakse otsustusloogika juurde.

### Selgitus

`if` tähendab: tee midagi ainult siis, kui tingimus peab paika.

`else` tähendab: kui eelmine tingimus ei pidanud paika, tee selle asemel midagi muud.

`else if` tähendab: enne lõplikku varuvarianti kontrolli veel mõnd lisatingimust.

Videos tuuakse näiteks:

- hinne
- valgusfoor
- kontroll liigub ülevalt alla

### Skeem

```text
if (tingimus 1) {
  tee A
} else if (tingimus 2) {
  tee B
} else {
  tee C
}
```

### Koodinäide

Selles projektis on `if` ja `else` päris olemas:

```js
login() {
  this.resetErrorMessage()
  if (this.allFormFieldsAreCorrect()) {
    axios.get('/api/login', { /* ... */ })
  } else {
    this.errorMessage = 'Täida kõik väljad'
  }
}
```

Kui väljad on korras, minnakse edasi. Kui ei ole, näidatakse veateadet.

### Päriselu analoogia

See on nagu uksekontroll:

- kui pilet on olemas, saad sisse
- kui ei ole, siis sisse ei saa

<a id="loogilised-operaatorid-and-or-not"></a>
## Loogilised operaatorid `and`, `or`, `not` - `0:16:10`

Tingimuslaused muutuvad kasulikumaks siis, kui oskad mitu tingimust kokku panna.

### Selgitus

Kolm põhiasja:

- `and` ehk `&&` - mõlemad tingimused peavad kehtima
- `or` ehk `||` - vähemalt üks tingimus peab kehtima
- `not` ehk `!` - pöörab tingimuse vastupidiseks

Videos kasutatakse lapsevanema näidet:

- tuba korras ja kodutöö tehtud
- tuba korras või kodutöö tehtud

### Skeem

```text
A && B  -> mõlemad peavad tõsi olema
A || B  -> vähemalt üks peab tõsi olema
!A      -> pöörab A vastupidiseks
```

### Koodinäide

Repo koodist:

```js
allFormFieldsAreCorrect() {
  return this.username && this.password
}
```

Java näitena võiks sama mõte olla:

```java
if (homeworkDone && roomClean) {
  System.out.println("Võid mängida");
}
```

### Päriselu analoogia

`&&` on nagu "saad jäätist siis, kui tuba on korras ja nõud on pestud". `||` on leebem: "piisab ühest". `!` on nagu "ei ole vihmane".

<a id="meetod-on-korduvkasutatav-koodiplokk"></a>
## Meetod on korduvkasutatav koodiplokk - `0:23:19`

Järgmine suur teema on meetod.

### Selgitus

Meetod on nimeline koodiplokk, mis teeb kindlat tööd ja mida saab hiljem uuesti välja kutsuda.

Miks see kasulik on:

- ei pea sama loogikat igal pool uuesti kirjutama
- kood muutub lühemaks
- parandused saab teha ühes kohas

Videos kasutatakse kohvimasina analoogiat: sina vajutad nuppu, aga ei pea teadma, kuidas masin seest töötab.

### Skeem

```text
meetod
  |
  +-- nimi
  +-- sisemine töö
  +-- tulemus
```

### Koodinäide

Selles projektis on mitu meetodit:

```js
methods: {
  login() {
    // teeb sisselogimise loogika
  },

  resetErrorMessage() {
    this.errorMessage = ''
  },

  allFormFieldsAreCorrect() {
    return this.username && this.password
  },
}
```

Iga meetod teeb ühte konkreetset asja.

### Päriselu analoogia

Meetod on nagu kohvimasina nupp "tee cappuccino". Sina kutsud tegevuse välja ühe nime kaudu, masin teeb ülejäänu ise.

<a id="parameetrid-ja-tagastusvaartus"></a>
## Parameetrid ja tagastusväärtus - `0:25:50`

Meetodi sees on kaks väga olulist mõistet: mida talle sisse antakse ja mida ta tagasi annab.

### Selgitus

- parameetrid on sisendid
- tagastusväärtus on väljund

Kõigil meetoditel ei pea mõlemat olema:

- mõnel on parameetrid, aga ta ei tagasta midagi
- mõni tagastab tulemuse
- mõni teeb lihtsalt tegevuse

### Skeem

```text
sisendid -> meetod -> väljund
```

### Koodinäide

Lihtne Java näide:

```java
int add(int a, int b) {
  return a + b;
}
```

Siin:

- `a` ja `b` on parameetrid
- `return a + b;` on tagastusväärtus

Vue/JavaScripti poolest on hea võrdlus `src/stores/counter.js`:

```js
function increment() {
  count.value++
}
```

See meetod ei tagasta eraldi vastust, vaid muudab olemasolevat väärtust.

### Päriselu analoogia

Parameetrid on nagu kohvimasina valikud: suur, väike, lahja, kange. Tagastusväärtus on valmis jook.

<a id="klass-on-plaan-objekt-on-paris-asi"></a>
## Klass on plaan, objekt on päris asi - `0:28:09`

Siin minnakse objektorienteeritud programmeerimise tuuma juurde.

### Selgitus

Klass on nagu plaan või retsept. Objekt on konkreetne asi, mis selle plaani järgi valmis tehakse.

Videos tuuakse näiteks:

- klass = retsept
- objekt = konkreetne küpsis

Klass kirjeldab tavaliselt:

- millised andmed objektil on
- milliseid tegevusi objekt oskab teha

### Skeem

```text
klass -> kirjeldus / plaan
objekt -> selle plaani järgi tehtud päris eksemplar
```

### Koodinäide

Lihtne Java näide:

```java
class Cookie {
  String flavor;
  int size;

  void bake() {
    System.out.println("Küpsetan küpsist");
  }
}
```

Kui lood sellest klassist objekti, saad juba konkreetse küpsise.

### Päriselu analoogia

Mööblipoe kataloogis olev joonis on klass. Sinu päris lauaeksemplar kodus on objekt.

<a id="konstruktor-loob-objekti-algseisuga"></a>
## Konstruktor loob objekti algseisuga - `0:30:44`

Pärast klassi ja objekti tuleb loogiliselt konstruktor.

### Selgitus

Konstruktor on eriline osa, mida kasutatakse objekti loomisel. Selle töö on anda objektile algne seis.

Videos öeldakse väga hästi, et konstruktor on justkui objekti "sünnihetk".

### Skeem

```text
uus objekt
   |
   v
konstruktor
   |
   v
algväärtused paika
```

### Koodinäide

```java
class Car {
  String color;
  int price;

  Car(String color, int price) {
    this.color = color;
    this.price = price;
  }
}
```

Kui lood `new Car("Kollane", 10000)`, siis konstruktor paneb need algväärtused objektile külge.

### Päriselu analoogia

See on nagu sünnitunnistuse täitmine: nimi, sünniaeg ja muud esimesed põhiandmed pannakse kohe alguses paika.

<a id="getter-ja-setter-juhivad-andmete-lugemist-ja-muutmist"></a>
## Getter ja setter juhivad andmete lugemist ja muutmist - `0:31:39`

See teema tekitas videos ka küsimusi, mis on normaalne, sest alguses aetakse getterid, setterid ja konstruktor sageli segi.

### Selgitus

Lihtne eristus:

- getter loeb väärtuse välja
- setter muudab väärtust

Need on kasulikud siis, kui sa ei taha lubada igal pool kõike otse muuta.

### Skeem

```text
objekt
  |
  +-- getter -> "näita mulle väärtust"
  +-- setter -> "muuda seda väärtust"
```

### Koodinäide

Lihtne Java näide:

```java
class BankAccount {
  private int balance;

  public int getBalance() {
    return balance;
  }

  public void setBalance(int balance) {
    this.balance = balance;
  }
}
```

Siin:

- `getBalance()` loeb väärtuse
- `setBalance(...)` muudab väärtuse

Selle repo lähim analoog on `src/stores/counter.js`, kus üks osa loeb ja teine muudab:

```js
const doubleCount = computed(() => count.value * 2)

function increment() {
  count.value++
}
```

### Päriselu analoogia

Getter on nagu küsimus kassapidajale: "palju mul kontol on?" Setter on nagu ametlik tegevus: "kanna sellele kontole uus summa".

<a id="kapseldamine-hoiab-tundlikud-valjad-kontrolli-all"></a>
## Kapseldamine hoiab tundlikud väljad kontrolli all - `0:34:04`

Getterid ja setterid viivad edasi laiema põhimõtteni: kapseldamine.

### Selgitus

Kapseldamine tähendab, et sa ei ava kõiki andmeid kõigile otse muutmiseks. Selle asemel peidad osa andmeid ära ja juhid ligipääsu kontrollitud kohtade kaudu.

See aitab:

- vältida juhuslikke valesid muudatusi
- kaitsta tundlikku infot
- hoida loogika ühes kohas

Videos tuuakse näiteid:

- mängu elude muutmine
- pangakonto summa

### Skeem

```text
tundlik väli
   |
   +-- otse ligi ei pääse
   |
   +-- kontrollitud meetodi kaudu pääseb
```

### Koodinäide

```java
class GamePlayer {
  private int lives;

  public int getLives() {
    return lives;
  }

  public void addLife() {
    lives++;
  }
}
```

Siin ei anta igale välisele koodijupile õigust suvaliselt `lives = 10000` panna.

### Päriselu analoogia

Kapseldamine on nagu seif. Sa ei jäta kogu sisu laua peale laiali. Ligipääs käib kindla mehhanismi kaudu.

<a id="public-ja-private-maaravad-kes-ligi-paaseb"></a>
## `public` ja `private` määravad, kes ligi pääseb - `0:40:01`

Video lõpus jõutakse juurdepääsu tasemete juurde.

### Selgitus

Kõige lihtsam algtaseme vahe:

- `public` - nähtav ja kasutatav väljastpoolt
- `private` - nähtav ainult klassi enda sees

See on väga tihedalt seotud eelmise teemaga. Kui midagi on `private`, siis ei saa teine klass seda lihtsalt otse muuta.

### Skeem

```text
public  -> väljaspoolt ligi pääseb
private -> ainult sama klassi sees
```

### Koodinäide

```java
class Person {
  public String firstName;
  private int age;

  public int getAge() {
    return age;
  }
}
```

Siin:

- `firstName` on avalik
- `age` on peidetud
- vanust saab lugeda läbi getteri

Videos seoti see ka pangaautomaadi ja andmekaitse mõttega: kõik ei pea kõike saama otse muuta.

### Päriselu analoogia

`public` on nagu poe saal, kuhu klient võib minna. `private` on nagu töötajate tagaruum, kuhu igaüks lihtsalt sisse ei astu.

## Kokkuvõte

Selle video kõige tähtsamad õppetunnid on:

- muutuja on nimega koht, kus programm hoiab väärtust
- andmetüüp määrab, mis kujul väärtust kasutatakse
- `if`, `else`, `else if` ja loogilised operaatorid aitavad programmil otsuseid teha
- meetod teeb korduvkasutatava töö ära ühe nime all
- klass on plaan ja objekt on selle plaani järgi loodud päris eksemplar
- konstruktor, getterid, setterid, kapseldamine ja `public`/`private` aitavad hoida andmeid korras ja kontrolli all

Kui tahad, saab sellest videost teha ka lühema ainult Java spikri või eraldi versiooni ainult objektorienteeritud programmeerimise teemadest.
