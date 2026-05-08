## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/ZCDrTfNAKA8_IXB6sP6aguihExz5HYoBjMRXbn5vakfC9hUn5z01D1LqvuJqi7DW.RfEhkql1n6CFeB-x?startTime=1776424584000) |
| **Parool** | `ke9n+N3w` |
| **Transkript** | [GMT20260417-111624_v-2.vtt](../transcripts/GMT20260417-111624_v-2.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Näiteks esinevad kohati `Jason`, `voe`, `Glass` ja `Respons`, kuigi kontekst ütleb üsna selgelt, et mõeldud on `JSON`, `Vue`, `class` ja `response`.

Selles videos tähendab `Cloud` alguses tõenäoliselt `Balsamiq Cloud`, mitte `Claude`. Samuti on taskikoodid siin hästi selgelt eristatavad: kõige tugevamalt tulevad välja `FEB-6` ja `FEB-7`.

Selles õppematerjalis kasutan tavapäraseid termineid ja seon teemad päris näidetega failidest `src/App.vue`, `src/router/index.js`, `src/views/HomeView.vue`, `src/views/AtmsView.vue`, `src/views/LoginView.vue`, `src/components/AlertError.vue`, `src/views/ErrorView.vue`, `src/main.js` ja `index.html`.

## Sisukord

- [Ajutine email ja Balsamiq aitavad kiiresti ideid katsetada](#ajutine-email-ja-balsamiq-aitavad-kiiresti-ideid-katsetada) - `0:03:02`
- [Pangaautomaadi projekti plaan ühendab frontendi, backendi ja CRUD-i](#pangaautomaadi-projekti-plaan-uhendab-frontendi-backendi-ja-crud-i) - `0:07:22`
- [Dropdown ei tööta teksti, vaid peidetud `cityId` väärtuste peal](#dropdown-ei-toota-teksti-vaid-peidetud-cityid-vaartuste-peal) - `0:10:22`
- [`LocationView` ja alamkomponendid näitavad taaskasutuse mõtet](#locationview-ja-alamkomponendid-naitavad-taaskasutuse-motet) - `0:12:07`
- [Modal ja query parameetrid aitavad sama vaadet eri rollides kasutada](#modal-ja-query-parameetrid-aitavad-sama-vaadet-eri-rollides-kasutada) - `0:14:12`
- [Sisselogimine on kokkulepe päringu, vastuse ja veahandlingu vahel](#sisselogimine-on-kokkulepe-paringu-vastuse-ja-veahandlingu-vahel) - `0:17:31`
- [POST päring kogub vormist kokku struktureeritud JSON-i](#post-paring-kogub-vormist-kokku-struktureeritud-json-i) - `0:20:33`
- [Puhas töö algab branch hygiene'ist ja vanade harude koristamisest](#puhas-too-algab-branch-hygieneist-ja-vanade-harude-koristamisest) - `0:24:01`
- [`FEB-6` viib mängu uue vaate, route'i ja menüülingi](#feb-6-viib-mangu-uue-vaate-routei-ja-menuulingi) - `0:27:51`
- [Bootstrapi grid ja loetav HTML aitavad kiiremini edasi liikuda](#bootstrapi-grid-ja-loetav-html-aitavad-kiiremini-edasi-liikuda) - `0:29:50`
- [Ühine spacing tasub lahendada layout tasemel, mitte igas vaates eraldi](#uhine-spacing-tasub-lahendada-layout-tasemel-mitte-igas-vaates-eraldi) - `0:35:38`
- [Nimed võiksid olla lihtsad: klass ainsuses, list ilma liigse jututa](#nimed-voiksid-olla-lihtsad-klass-ainsuses-list-ilma-liigse-jututa) - `0:44:18`
- [Options API on siin teadlik õppevalik, mitte juhuslik vanavara](#options-api-on-siin-teadlik-oppevalik-mitte-juhuslik-vanavara) - `0:51:24`
- [IDE otseteed säästavad projektis päriselt aega](#ide-otseteed-saastavad-projektis-pariselt-aega) - `0:58:59`
- [Commit ja merge nõuavad suuna mõistmist, mitte pimesi nuppude vajutamist](#commit-ja-merge-nouavad-suuna-moistmist-mitte-pimesi-nuppude-vajutamist) - `1:03:57`
- [Andmebaasi tabelid, `PK`, `FK` ja sequence counter annavad andmetele struktuuri](#andmebaasi-tabelid-pk-fk-ja-sequence-counter-annavad-andmetele-struktuuri) - `1:11:26`
- [`FEB-7` kirjeldab login-vaate nõuded väga detailselt](#feb-7-kirjeldab-login-vaate-nouded-vaga-detailselt) - `1:17:12`
- [Nupp käivitab Vue meetodi: `@click` seob template'i ja loogika](#nupp-kaivitab-vue-meetodi-click-seob-templatei-ja-loogika) - `1:31:05`
- [Template ja script suhtlevad andmete kaudu ning reaktiivsus joonistab UI ümber](#template-ja-script-suhtlevad-andmete-kaudu-ning-reaktiivsus-joonistab-ui-umber) - `1:38:18`
- [`Props` liiguvad alla ja `emit` liigub üles](#props-liiguvad-alla-ja-emit-liigub-ules) - `1:46:02`

<a id="ajutine-email-ja-balsamiq-aitavad-kiiresti-ideid-katsetada"></a>
## Ajutine email ja Balsamiq aitavad kiiresti ideid katsetada - `0:03:02`

Video alguses räägitakse tööriistadest, mis aitavad kiiresti prototüüpida ja katsetada ilma liigse püsivuseta.

### Selgitus

Kui tahad kiiresti midagi proovida, ei pea kohe ehitama päris süsteemi. Vahel piisab:

- ajutisest emailist
- wireframe-tööriistast
- lihtsast visuaalsest maketist

See annab kiirema tagasiside: kas idee üldse töötab, enne kui arendus muutub kalliks.

### Skeem

```text
idee
  -> kiire makett
      -> vaata läbi flow
          -> alles siis päris arendus
```

### Koodinäide

Selle repo päris rakendus algab alles siit:

```html
<div id="app"></div>
<script type="module" src="/src/main.js"></script>
```

See tähendab, et enne päris Vue rakendust võib täiesti vabalt eksisteerida ka madalama detailsusega kavand.

### Päriselu analoogia

See on nagu joonistad enne maja ehitamist paberile plaani, mitte ei hakka kohe seina laduma.

<a id="pangaautomaadi-projekti-plaan-uhendab-frontendi-backendi-ja-crud-i"></a>
## Pangaautomaadi projekti plaan ühendab frontendi, backendi ja CRUD-i - `0:07:22`

Õpetaja käib läbi kogu kursuse näidisprojekti loogika: koduvaade, login, pangaautomaadid, filtrid ja andmete muutmine.

### Selgitus

See on oluline, sest arendust ei tehta ainult ühe ekraani kaupa. Tuleb näha tervikut:

- mida kasutaja näeb
- kust andmed tulevad
- mida saab lisada, muuta ja kustutada

See on klassikaline CRUD-mõte:

- `Create`
- `Read`
- `Update`
- `Delete`

### Skeem

```text
Home
  -> Login
      -> Atms view
          -> read / create / update / delete
```

### Koodinäide

Praeguses repos peegelduvad põhivaated ruuteris nii:

```js
routes: [
  { path: '/', component: HomeView },
  { path: '/error', component: ErrorView },
  { path: '/atms', component: AtmsView },
  { path: '/login', component: LoginView },
]
```

### Päriselu analoogia

See on nagu kaardistad enne reisi kogu marsruudi, mitte ainult esimese bussipeatuse.

<a id="dropdown-ei-toota-teksti-vaid-peidetud-cityid-vaartuste-peal"></a>
## Dropdown ei tööta teksti, vaid peidetud `cityId` väärtuste peal - `0:10:22`

Video üks tähtis mõte on see, et kasutaja näeb küll linnanime, aga süsteem töötab tegelikult ID-dega.

### Selgitus

Inimene näeb:

- Tallinn
- Tartu
- Pärnu

Aga backendi ja andmebaasi jaoks on tähtis:

- `cityId = 1`
- `cityId = 2`
- `cityId = 3`

See on hea praktika, sest ID on:

- üheselt mõistetav
- kiirem võrrelda
- stabiilsem kui vabatekst

### Skeem

```text
dropdown label = "Tallinn"
dropdown value = 2
  -> request cityId=2
      -> backend tagastab Tallinna read
```

### Koodinäide

Video loogikat saab seostada `LoginView` sisenditega, kus visuaalne väli ja päris andmed on samuti eri asjad:

```vue
<input v-model="username" type="text" class="form-control" />
<input v-model="password" type="password" class="form-control" />
```

Kasutaja näeb kasti, aga programm töötab muutujatega `username` ja `password`.

### Päriselu analoogia

See on nagu inimese rinnasildil on nimi, aga registris on tema isikukood.

<a id="locationview-ja-alamkomponendid-naitavad-taaskasutuse-motet"></a>
## `LocationView` ja alamkomponendid näitavad taaskasutuse mõtet - `0:12:07`

Õpetaja selgitab, et pärisrakendustes tekib parent-child-grandchild struktuur ja andmevoogu peab oskama hallata.

### Selgitus

Kõike ei pea ehitama ühe suure komponendina. Sageli on mõistlik jagada UI väiksemateks osadeks:

- parent haldab üldloogikat
- child teeb ühe konkreetse tüki
- grandchild võib olla veel kitsam korduv osa

See teeb taaskasutuse lihtsamaks.

### Skeem

```text
LocationView
  -> LocationDetailsInput
      -> väike korduv inputi osa
```

### Koodinäide

Selles repos on sama idee näha loginis:

```js
components: { AlertError }
```

`LoginView` ei kuva veateadet käsitsi igal pool, vaid kasutab eraldi `AlertError` komponenti.

### Päriselu analoogia

See on nagu ehitad auto ust, istet ja rooli eraldi detailidena, mitte ei valmista kogu autot ühest plekist.

<a id="modal-ja-query-parameetrid-aitavad-sama-vaadet-eri-rollides-kasutada"></a>
## Modal ja query parameetrid aitavad sama vaadet eri rollides kasutada - `0:14:12`

Siin tuleb kaks praktilist ideed: modal kui detailivaade ja query parameetrid kui lisainfo olemasolevale vaatele.

### Selgitus

Modal tähendab väikest pealepandud akent, kus taust jääb alles. Query parameeter tähendab, et URL-i lõppu pannakse lisainfo.

Näiteks:

- vaade on sama
- aga URL annab kaasa konteksti
- selle põhjal otsustad, kas oled lisamise või muutmise režiimis

### Skeem

```text
/location
  -> lisa uus

/location?id=14
  -> muuda olemasolevat
```

### Koodinäide

Praeguses repos on route'id juba olemas, kuigi query-parameetrite näidet veel pole:

```js
{
  path: '/login',
  name: 'loginRoute',
  component: LoginView,
}
```

Sama route'i saab päriselus täiendada query parameetritega.

### Päriselu analoogia

See on nagu sama vormi kasutatakse nii uue kliendi lisamiseks kui vana kliendi muutmiseks, ainult number nurgas ütleb, kellest jutt käib.

<a id="sisselogimine-on-kokkulepe-paringu-vastuse-ja-veahandlingu-vahel"></a>
## Sisselogimine on kokkulepe päringu, vastuse ja veahandlingu vahel - `0:17:31`

Video keskel muutub jutt väga praktiliseks: login ei ole lihtsalt üks nupp, vaid frontendi ja backendi vaheline leping.

### Selgitus

Frontend peab teadma:

- mis URL-ile päring läheb
- millised väljad saadetakse
- milline edukas vastus välja näeb
- milline veavastus välja näeb

Oluline mõte on see, et programm ei tee otsuseid lihtsalt suvalise veateksti järgi, vaid pigem:

- HTTP staatuse järgi
- error code järgi

### Skeem

```text
user vajutab login
  -> frontend saadab requesti
      -> backend vastab
          -> 200 = edu
          -> 403 + errorCode 11 = vale kasutajanimi või parool
          -> muu viga = /error
```

### Koodinäide

Repos on see mõte näha siin:

```js
axios.get('/api/login', {
  params: {
    username: 'AAA',
    password: 'BBB',
  },
})
```

Video räägib `sessionStorage` kasutamisest, aga selle repo näites talletatakse sama idee hetkel `localStorage` abil:

```js
localStorage.setItem('userId', this.loginResponse.userId)
localStorage.setItem('roleName', this.loginResponse.roleName)
```

### Päriselu analoogia

See on nagu uksehoidjale ei piisa, et sa lihtsalt ütled "lase sisse", vaid sul peab olema õige formaat ja õige tõend.

<a id="post-paring-kogub-vormist-kokku-struktureeritud-json-i"></a>
## POST päring kogub vormist kokku struktureeritud JSON-i - `0:20:33`

Asukoha lisamise näites seletatakse lahti, et vorm ei lähe backendi "lihtsalt tekstina", vaid struktureeritud sõnumina.

### Selgitus

Vormist võib kokku saada näiteks:

- `cityId`
- `locationName`
- `atmCount`
- `imageBase64`
- `transactionTypeIds`

See on tähtis, sest backend ootab kindla kujuga andmeid.

### Skeem

```text
vormi väljad
  -> korja andmed kokku
      -> tee JSON objekt
          -> saada POST request
```

### Koodinäide

Repos endas on hetkel logini näide, kus andmed pakitakse päringu sisse:

```js
params: {
  username: 'AAA',
  password: 'BBB',
}
```

Location lisamise loogika oleks sama põhimõtte edasiarendus, ainult välju on rohkem.

### Päriselu analoogia

See on nagu täidad paki saatelehe eri lahtrid, mitte ei kirjuta karbi peale lihtsalt "palun vii kuhugi".

<a id="puhas-too-algab-branch-hygieneist-ja-vanade-harude-koristamisest"></a>
## Puhas töö algab branch hygiene'ist ja vanade harude koristamisest - `0:24:01`

Enne uut taski tehakse repo puhtaks: vanad harud kinni, noolekesed tähele ja liigsed asjad eest ära.

### Selgitus

See on oluline, sest arendusharu peaks tähendama ühte konkreetset töölõiku. Kui vanad branchid jäävad alles, läheb pilt segaseks.

Õpetaja rõhutab eriti:

- kustuta vanad branchid
- loe hoolikalt, kuhu merge läheb
- kui näed nooli, saa aru, kas on vaja pushida või pullida

### Skeem

```text
vana töö tehtud
  -> branch kustuta
      -> võta puhas baas
          -> alusta uut taski
```

### Koodinäide

See teema ei kajastu ühes kindlas Vue failis, vaid kogu projekti töövoos. Aga sisuline seos on selles, et järgmised muudatused lähevad näiteks `AtmsView` ja `App.vue` faili alles pärast seda, kui branch on puhas.

### Päriselu analoogia

See on nagu paned tööriistad pärast ühte remonti tagasi kappi, enne kui hakkad järgmist tuba lammutama.

<a id="feb-6-viib-mangu-uue-vaate-routei-ja-menuulingi"></a>
## `FEB-6` viib mängu uue vaate, route'i ja menüülingi - `0:27:51`

Selle taski sisu on väga tüüpiline frontend-töö: uus vaade, uus route ja uus navigeerimislink.

### Selgitus

Kui teed uue ekraani, ei piisa ainult `.vue` faili loomisest. Tavaliselt pead muutma vähemalt kolme kohta:

- looma view faili
- lisama route'i
- lisama navigeerimislingi

### Skeem

```text
uus vaade
  -> route
      -> link menüüsse
          -> kasutaja saab sinna päriselt liikuda
```

### Koodinäide

Repos on see täna juba valmis:

```js
{
  path: '/atms',
  name: 'atmsRoute',
  component: AtmsView,
}
```

Ja menüüs:

```vue
<RouterLink class="nav-link" to="/atms">Pangaautomaadid</RouterLink>
```

### Päriselu analoogia

See on nagu ehitad uue toa, aga lisaks pead panema ka ukse ja sildi, muidu keegi ei jõua sinna.

<a id="bootstrapi-grid-ja-loetav-html-aitavad-kiiremini-edasi-liikuda"></a>
## Bootstrapi grid ja loetav HTML aitavad kiiremini edasi liikuda - `0:29:50`

Koduvaate näites tehakse selgeks, et grid, semantilised elemendid ja loetav kood on praktiline, mitte kosmeetiline teema.

### Selgitus

Õpetaja rõhutab kolme mõtet:

- kasuta kiireks layout'iks Bootstrapi
- ära topi olulist teksti suvaliselt paljalt DOM-i
- hoia HTML loetav

Kui kood on ühes pikas reas, on seda raske lugeda, isegi kui browser selle lõpuks ära "sööb".

### Skeem

```text
container
  -> row
      -> col
          -> h1 / img / muu sisu
```

### Koodinäide

Repos on see muster olemas nii `HomeView` kui `AtmsView` failides:

```vue
<div class="container text-center">
  <div class="row">
    <div class="col">
      <h1>Pangaautomaadid</h1>
    </div>
  </div>
</div>
```

Ja Bootstrap tuuakse projekti sisse siin:

```js
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.js'
```

### Päriselu analoogia

See on nagu riiulid, kastid ja sildid laos. Kui kõik on hunnikus, leiab küll, aga aeglaselt.

<a id="uhine-spacing-tasub-lahendada-layout-tasemel-mitte-igas-vaates-eraldi"></a>
## Ühine spacing tasub lahendada layout tasemel, mitte igas vaates eraldi - `0:35:38`

Siin jõutakse tähtsa arhitektuurilise mõtteni: kui igal vaatel on sama probleem, siis lahenda see ühises kohas.

### Selgitus

Kui igal lehel peab sisu navbari alt natuke allapoole liikuma, siis pole mõistlik igas vaates eraldi `margin-top` toppida.

Parem on lahendada see kohas, mis mõjutab kõiki:

- layout
- nav
- ülemine wrapper

### Skeem

```text
ühine probleem kõigil vaadetel
  -> ära paranda igas vaates
      -> paranda ühises layout kohas
```

### Koodinäide

Repos on see põhimõte näha navbari juures:

```vue
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-3 mb-4">
```

`mb-4` teebki selle, et navbari alla tekib ühtlane vahe kõigi vaadete jaoks.

### Päriselu analoogia

See on nagu reguleerid maja peaukse kõrgust, mitte ei saagi iga toa ees eraldi küürutama.

<a id="nimed-voiksid-olla-lihtsad-klass-ainsuses-list-ilma-liigse-jututa"></a>
## Nimed võiksid olla lihtsad: klass ainsuses, list ilma liigse jututa - `0:44:18`

Video läheb siin korraks Java ja üldiste nimetamisreeglite peale, aga mõte kehtib ka frontendis.

### Selgitus

Peamine mõte:

- klassi nimi ainsuses
- muutuja nimi võimalikult lihtne
- ära lisa sõna `List`, kui tüüp niikuinii ütleb selle ära

Halb nimetus tekitab tarbetut müra.

### Skeem

```text
Student
  -> üks objekt: student
  -> mitu objekti: students
```

### Koodinäide

Sama lihtsuse põhimõte on siin:

```js
name: 'LoginView'
name: 'AtmsView'
name: 'ErrorView'
```

Nimed ütlevad lühidalt, millega tegu on, ilma liigse jututa.

### Päriselu analoogia

See on nagu tööriistakapis silt "haamer", mitte "ühe löögifunktsiooniga metalliline käsitööobjekt".

<a id="options-api-on-siin-teadlik-oppevalik-mitte-juhuslik-vanavara"></a>
## Options API on siin teadlik õppevalik, mitte juhuslik vanavara - `0:51:24`

Õpetaja põhjendab üsna otse, miks kursusel kasutatakse Options API-d.

### Selgitus

Põhiargument ei ole see, et Composition API oleks halb, vaid see, et alguses on vaja näha:

- kus on andmed
- kus on meetodid
- kus on template

Kui abstraktsiooni on liiga palju liiga vara, kaob arusaam süsteemi flow'st ära.

### Skeem

```text
vähem abstraktsiooni
  -> lihtsam näha flow'd
      -> parem õppida põhimõtet
```

### Koodinäide

Selle repo `LoginView` kasutabki Options API mustrit:

```js
export default {
  data() {
    return {
      username: '',
      password: '',
    }
  },
  methods: {
    login() {},
  },
}
```

### Päriselu analoogia

See on nagu õpid enne manuaalkäigukastiga sõitma, et aru saada, mis mootoris toimub.

<a id="ide-otseteed-saastavad-projektis-pariselt-aega"></a>
## IDE otseteed säästavad projektis päriselt aega - `0:58:59`

Video üks väga praktiline osa on failide leidmine ja liikumine klaviatuuriga.

### Selgitus

Õpetaja toob välja otseteed:

- `Ctrl+F` faili sees otsimiseks
- `Ctrl+Shift+F` kogu projekti seest otsimiseks
- `Ctrl+Shift+N` failinimede leidmiseks

See on tähtis, sest päris projektis ei saa hiirega igat faili metsast taga ajada.

### Skeem

```text
tead faili või märksõna
  -> kasuta otseteed
      -> avad õige koha kiiremini
```

### Koodinäide

See repo on piisavalt väike, et käsitsi ringi klõpsida, aga juba praegu on kasulik teada, et näiteks `App.vue`, `LoginView.vue` ja `router/index.js` leiab hetkega, kui failinimed on peas olemas.

### Päriselu analoogia

See on nagu tead lao riiulinumbrit, mitte ei jaluta iga kord kogu hoonet läbi.

<a id="commit-ja-merge-nouavad-suuna-moistmist-mitte-pimesi-nuppude-vajutamist"></a>
## Commit ja merge nõuavad suuna mõistmist, mitte pimesi nuppude vajutamist - `1:03:57`

Siin on video üks kõige kasulikumaid töövoo osi: merge'i suund peab olema loogiliselt selge.

### Selgitus

Peamine mõte:

- töö commititakse oma harul
- merge tehakse sihtharul
- enne oma töö masterisse merge'imist on mõistlik tõmmata master enda harusse

Miks? Sest kui konflikt tekib sinu harus, on katkine ainult sinu haru. Kui konflikt lahendatakse valesti masteris, võib kogu ühine baas katki minna.

### Skeem

```text
oma branch
  -> commit
      -> tõmba master enda branchi
          -> lahenda konfliktid siin
              -> alles siis merge masterisse
```

### Koodinäide

See ei ela ühes Vue failis, vaid arenduse tööprotsessis. Aga videos rõhutatakse sama põhimõtet, mida kasutad alati enne, kui näiteks `App.vue` ja `router/index.js` muudatused ühisesse harusse viid.

### Päriselu analoogia

See on nagu parandad auto oma garaažis ära ja alles siis viid selle ühisesse kolonni, mitte ei hakka paraadi keskel mootorit lahti võtma.

<a id="andmebaasi-tabelid-pk-fk-ja-sequence-counter-annavad-andmetele-struktuuri"></a>
## Andmebaasi tabelid, `PK`, `FK` ja sequence counter annavad andmetele struktuuri - `1:11:26`

Video liigub siin frontendi piiridest kaugemale ja seletab, kuidas rollid ja kasutajad andmebaasis omavahel seotud on.

### Selgitus

Olulised mõisted:

- `PK` ehk primary key: rea unikaalne ID
- `FK` ehk foreign key: viide teise tabeli reale
- sequence counter: automaatne number, mis läheb aina edasi

Väga oluline mõte: kui üks rida kustutatakse, ei tähenda see, et sama ID hiljem uuesti kasutataks.

### Skeem

```text
Role(id, name)
  <- User(roleId, username, password, status)

user.roleId viitab role.id väljale
```

### Koodinäide

Frontendis näed selle mõju näiteks logini vastuses:

```js
loginResponse: {
  userId: 0,
  roleName: '',
}
```

Backendist tuleb küll rolli nimi, aga selle taga on enamasti relatsioonid ja ID-d.

### Päriselu analoogia

See on nagu töötaja kaardil on osakonna nimi, aga süsteemis seob teda osakonnaga tegelikult osakonna number.

<a id="feb-7-kirjeldab-login-vaate-nouded-vaga-detailselt"></a>
## `FEB-7` kirjeldab login-vaate nõuded väga detailselt - `1:17:12`

See task on juba palju konkreetsem kui eelmine: route, vorm, vead, backendi päring, salvestus ja navigeerimine.

### Selgitus

Hea taskikirjeldus ütleb:

- mida kasutaja peab nägema
- mis peab juhtuma nupu vajutusel
- millal kuvatakse viga
- kuhu tuleb suunata eduka tegevuse järel

Õpetaja rõhutab ka, et taski tuleb mitu korda rahulikult läbi lugeda.

### Skeem

```text
loe task läbi
  -> jaga see alamtegevusteks
      -> view
      -> route
      -> vorm
      -> päring
      -> error handling
```

### Koodinäide

Selles repos on login-vaate alustalad olemas:

```vue
<AlertError :error-message="errorMessage" />
<button @click="login" type="submit" class="btn btn-outline-secondary">Login</button>
```

Ja komponent ise:

```js
props: {
  errorMessage: String,
}
```

### Päriselu analoogia

See on nagu kokkupaneku juhend, kus on kirjas mitte ainult "ehita kapp", vaid ka milline uks kuhu käib.

<a id="nupp-kaivitab-vue-meetodi-click-seob-templatei-ja-loogika"></a>
## Nupp käivitab Vue meetodi: `@click` seob template'i ja loogika - `1:31:05`

Siin tehakse väga oluline sild HTML-i ja JavaScripti vahele.

### Selgitus

Nupp ise on visuaalne element, aga käitumine tuleb meetodist. Vue teeb selle sidumise lühikeseks:

- template'is paned `@click`
- scriptis defineerid meetodi
- klikiga käivitatakse loogika

### Skeem

```text
button click
  -> @click="login"
      -> methods.login()
          -> kontroll / request / veateade
```

### Koodinäide

See ongi repo `LoginView` keskne sidumine:

```vue
<button @click="login" type="submit" class="btn btn-outline-secondary">Login</button>
```

```js
methods: {
  login() {
    this.resetErrorMessage()
    if (this.allFormFieldsAreCorrect()) {
      // tee päring
    }
  },
}
```

### Päriselu analoogia

See on nagu uksekell on seinal nupp, aga heli tuleb alles siis, kui juhtmed on päriselt kella külge ühendatud.

<a id="template-ja-script-suhtlevad-andmete-kaudu-ning-reaktiivsus-joonistab-ui-umber"></a>
## Template ja script suhtlevad andmete kaudu ning reaktiivsus joonistab UI ümber - `1:38:18`

Video lõpu üks tähtsamaid mõtteid on see, et template ja script ei suhtle maagia kaudu, vaid andmete kaudu.

### Selgitus

Vue põhiidee on:

- kasutaja muudab andmeid
- Vue märkab muutust
- UI renderdatakse vajalikus osas uuesti

See tähendab, et arendaja ei kirjuta tavaliselt käsitsi "ehita see tabel nullist uuesti", vaid kirjeldab seose andmete ja vaate vahel.

### Skeem

```text
andmed muutuvad
  -> Vue märkab muudatust
      -> vajalik HTML renderdatakse uuesti
```

### Koodinäide

Repos näed selle algelist kuju siin:

```vue
<div v-if="errorMessage" class="alert alert-danger" role="alert">
  {{ errorMessage }}
</div>
```

Kui `errorMessage` muutub tühjast väärtusest tekstiks, ilmub komponent ekraanile ilma käsitsi DOM-i näppimata.

### Päriselu analoogia

See on nagu tablool muutub number ja ekraan joonistab uue seisu ise, ilma et keegi markeriga peale kirjutaks.

<a id="props-liiguvad-alla-ja-emit-liigub-ules"></a>
## `Props` liiguvad alla ja `emit` liigub üles - `1:46:02`

Viimases osas kasutatakse väga head metafoori: andmed voolavad alla nagu kosk ja sõnumid lähevad tagasi üles nagu tuvi.

### Selgitus

See on komponentide suhtluse põhimuster:

- parent annab childile andmed `props` kaudu
- child annab parentile märku sündmuse ehk `emit` kaudu

See aitab hoida andmevoo arusaadava ja ühe suunaga.

### Skeem

```text
parent
  -> props alla
      -> child
          -> emit üles
              -> parent reageerib
```

### Koodinäide

Selles repos on `props` näide olemas `AlertError` komponendis:

```js
props: {
  errorMessage: String,
}
```

Ja parent kasutab seda nii:

```vue
<AlertError :error-message="errorMessage" />
```

`emit` osa selles repos siin failis veel ei näe, aga video valmistab just selleks järgmist sammu ette.

### Päriselu analoogia

See on nagu vanem annab lapsele kaasa juhise ja laps saadab pärast sõnumiga tagasi, mis juhtus.

## Kokkuvõte

See video liigub maketist pärisrakenduseni. Alguses räägitakse prototüüpimisest, süsteemi üldplaanist ja ATM CRUD flow'st, siis minnakse praktilise Vue tööni: route'id, navigeerimine, Bootstrap layout, login-vaate ehitus, meetodid, JSON päringud ja üldine veahandling.

Sama tähtis telg on töövoog: `FEB-6`, `FEB-7`, branch hygiene, commit, merge'i suund ja taski rahulik läbilugemine. Video lõpus jõuab jutt Vue kõige olulisema põhimõtteni: template ja script on seotud andmete kaudu ning komponentide vahel liiguvad andmed alla `props`-iga ja sõnumid üles `emit`-iga.
