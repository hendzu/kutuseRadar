## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/csy6DaW0hIzljw2TuRlRe5ujA0ek0Bxu2WF1SEVkFketvBRmnH3sS5WVr3NYmuMm.Z__MgcYeyMEHMLmM?startTime=1776666092000) |
| **Parool** | `h1=9AqTI` |
| **Transkript** | [GMT20260420-062132_v-1.vtt](../transcripts/GMT20260420-062132_v-1.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Näiteks esinevad kohati `Cloud`, `Life template`, `Jason`, `Stop Light`, `veb seitse` ja `voe`, kuigi kontekst ütleb üsna selgelt, et mõeldud on `Claude`, `Live template`, `JSON`, `Stoplight`, `FEB-7` ja `Vue`.

Selles videos on kõige selgemalt tuvastatav taskikood `FEB-7`. Fookus on `LoginView` edasiarendamisel, vormi valideerimisel, mock-backendi kasutamisel ja sellel, kuidas Vue reaktiivne andmevoog tegelikult töötab.

Selles õppematerjalis seon teemad päris näidetega failidest `src/views/LoginView.vue`, `src/components/AlertError.vue`, `vite.config.js`, `src/App.vue`, `src/router/index.js` ja `src/main.js`.

## Sisukord

- [`Claude Code` IDE integratsioon ja failiviited](#claude-code-ide-integratsioon-ja-failiviited) - `0:00:56`
- [Live template'id kiirendavad korduvat koodi](#live-templateid-kiirendavad-korduvat-koodi) - `0:04:58`
- [Reaktiivne frontend seob template'i, meetodid ja andmed](#reaktiivne-frontend-seob-templatei-meetodid-ja-andmed) - `0:07:38`
- [Ära näpi DOM-i otse, lase raamistikul renderdada](#ara-napi-domi-otse-lase-raamistikul-renderdada) - `0:11:43`
- [`FEB-7` jätkab `LoginView` arendust](#feb-7-jatkab-loginview-arendust) - `0:17:21`
- [`Shift+F6`, `label`, `for` ja `id` hoiavad vormi korras](#shiftf6-label-for-ja-id-hoiavad-vormi-korras) - `0:27:35`
- [Bootstrapi grid juhib vahede, joonduste ja laiuste loogikat](#bootstrapi-grid-juhib-vahede-joonduste-ja-laiuste-loogikat) - `0:36:23`
- [`data()` tagastab ühise andmemudeli](#data-tagastab-uhise-andmemudeli) - `0:40:34`
- [`v-model` seob sisestuskasti ja muutuja kahes suunas](#v-model-seob-sisestuskasti-ja-muutuja-kahes-suunas) - `0:48:58`
- [REST veebiteenused on frontendi ja backendi kokkulepe](#rest-veebiteenused-on-frontendi-ja-backendi-kokkulepe) - `1:00:04`
- [Stoplight mock server, query parameetrid ja Vite proxy hoiavad töö liikumas](#stoplight-mock-server-query-parameetrid-ja-vite-proxy-hoiavad-too-liikumas) - `1:05:07`
- [Enne päringut valideeri vorm ja hoia positiivne tee `if` blokis](#enne-paringut-valideeri-vorm-ja-hoia-positiivne-tee-if-blokis) - `1:22:06`
- [Scripti poolel viita andmetele läbi `this`](#scripti-poolel-viita-andmetele-labi-this) - `1:26:00`
- [Kasuta rangeid võrdlusi ja seo tingimused `&&` abil](#kasuta-rangeid-vordlusi-ja-seo-tingimused--abil) - `1:34:05`
- [Tõsta kontroll eraldi abimeetodisse ja anna sellele statement-nimi](#tosta-kontroll-eraldi-abimeetodisse-ja-anna-sellele-statement-nimi) - `1:38:52`
- [Loe koodi ülevalt alla nagu lugu, mitte üksikuteks juppideks](#loe-koodi-ulevalt-alla-nagu-lugu-mitte-uksikuteks-juppideks) - `1:54:14`
- [Kohvimasina näide seletab peameetodi ja abimeetodite vahet](#kohvimasina-naide-seletab-peameetodi-ja-abimeetodite-vahet) - `1:59:07`
- [`AlertError` kuvab vea andmete põhjal, mitte käsitsi DOM-i näppides](#alerterror-kuvab-vea-andmete-pohjal-mitte-kasitsi-domi-nappides) - `2:03:20`

<a id="claude-code-ide-integratsioon-ja-failiviited"></a>
## `Claude Code` IDE integratsioon ja failiviited - `0:00:56`

Video alguses näidatakse, kuidas IDE ja `Claude Code` omavahel paremini koostööd teevad.

### Selgitus

Põhiidee on see, et AI-l on palju lihtsam aidata, kui ta teab:

- millisest failist jutt käib
- milliseid ridu kasutaja parajasti vaatab
- milline koodiosa on aktiivselt valitud

Selleks kasutatakse IDE pluginat ja failiviidete mugavusi, et küsimus ei oleks lihtsalt "miks see ei tööta", vaid "vaata seda konkreetset kohta".

### Skeem

```text
valid koodirea
  -> IDE annab faili + read kaasa
      -> AI näeb konteksti
          -> vastus on täpsem
```

### Koodinäide

Näiteks selline blokk `LoginView` failist on täpne ja arusaadav asi, mille kohta AI-lt küsida:

```vue
<div class="form-floating mb-3">
  <input
    v-model="username"
    type="text"
    class="form-control"
    id="inputUsername"
    placeholder="Kasutajanimi"
  />
  <label for="inputUsername">Kasutajanimi</label>
</div>
```

### Päriselu analoogia

See on nagu arstile näitad täpselt haiget kohta, mitte ei ütle ainult "kuskilt valutab".

<a id="live-templateid-kiirendavad-korduvat-koodi"></a>
## Live template'id kiirendavad korduvat koodi - `0:04:58`

Seejärel räägitakse IntelliJ `Live template`-itest ja nende importimisest.

### Selgitus

`Live template` tähendab väikest lühikäsku, mis loob valmis koodipõhja. See on kasulik siis, kui kirjutad pidevalt samu mustreid:

- meetod
- tsükkel
- tingimus
- tüüpiline Vue või Java struktuur

Mõte ei ole olla "laisk", vaid vältida mõttetut käsitsi toksimist.

### Skeem

```text
kirjutad lühikese märksõna
  -> IDE pakub valmis struktuuri
      -> sina täidad sisu
```

### Koodinäide

Selline korduv struktuur on hea näide sellest, mida template'iga oleks mugav alustada:

```js
methods: {
  login() {},

  resetErrorMessage() {},

  allFormFieldsAreCorrect() {},
}
```

### Päriselu analoogia

See on nagu kasutad köögis mõõdutopsi, mitte ei vala iga kord silma järgi.

<a id="reaktiivne-frontend-seob-templatei-meetodid-ja-andmed"></a>
## Reaktiivne frontend seob template'i, meetodid ja andmed - `0:07:38`

See on video üks kõige olulisemaid osi: template ja tegevused ei suhtle otse, vaid läbi andmete.

### Selgitus

Vue maailmas on kolm eri rolli:

- `template` näitab kasutajale midagi
- `methods` teeb tegevusi
- `data` hoiab ühist sisu

Kui kasutaja kirjutab vormi, siis info liigub andmetesse. Kui kood muudab andmeid, siis template reageerib sellele.

### Skeem

```text
template
  <-> data
      <-> methods
```

### Koodinäide

Selles repos on see side kohe nähtav:

```vue
<AlertError :error-message="errorMessage" />
<input v-model="username" type="text" class="form-control" />
<button @click="login" type="submit" class="btn btn-outline-secondary">Login</button>
```

```js
data() {
  return {
    username: '',
    errorMessage: '',
  }
}
```

### Päriselu analoogia

See on nagu laoriiul, kust nii müüja kui kassapidaja võtavad sama kauba seisu.

<a id="ara-napi-domi-otse-lase-raamistikul-renderdada"></a>
## Ära näpi DOM-i otse, lase raamistikul renderdada - `0:11:43`

Õpetaja rõhutab, et otsene HTML-elementide näppimine on "asking for trouble".

### Selgitus

Kui proovid koodis käsitsi haarata DOM-i elementi, võib juhtuda, et:

- seda elementi pole veel renderdatud
- tingimus peidab selle ära
- viitad millelegi, mida hetkel ei eksisteeri

Reaktiivne raamistik teeb sama töö turvalisemalt: kui andmed ütlevad, et midagi peab olemas olema, siis Vue joonistab selle ise.

### Skeem

```text
halb tee:
  kood -> otsi DOM element -> äkki pole olemas

hea tee:
  muuda andmeid -> Vue otsustab mida kuvada
```

### Koodinäide

`AlertError` ei lähe käsitsi DOM-i peitma ega näitama. Ta teeb seda andmete järgi:

```vue
<div v-if="errorMessage" class="alert alert-danger" role="alert">
  {{ errorMessage }}
</div>
```

### Päriselu analoogia

See on nagu liiklusfoor töötab sensori järgi ise, mitte keegi ei jookse käsitsi tuld sisse-välja lülitama.

<a id="feb-7-jatkab-loginview-arendust"></a>
## `FEB-7` jätkab `LoginView` arendust - `0:17:21`

Selle video praktiline töö käib peamiselt taski `FEB-7` ümber.

### Selgitus

Fookus on `LoginView` edasiarendamisel:

- vormi väljad
- nupp
- valideerimine
- veateade
- hiljem päring mock-backendi vastu

See on hea näide sellest, kuidas üks task ei ole ainult üks fail, vaid terve väike töövoog.

### Skeem

```text
task FEB-7
  -> login view
      -> route
          -> nav link
              -> vorm + loogika
```

### Koodinäide

Repos on login-vaate struktuur juba olemas:

```js
{
  path: '/login',
  name: 'loginRoute',
  component: LoginView,
}
```

Ja menüüs:

```vue
<RouterLink class="nav-link" to="/login">Sisse logimine</RouterLink>
```

### Päriselu analoogia

See on nagu "ehita sissepääs" tähendab korraga nii ust, lukku kui ka silti ukse peal.

<a id="shiftf6-label-for-ja-id-hoiavad-vormi-korras"></a>
## `Shift+F6`, `label`, `for` ja `id` hoiavad vormi korras - `0:27:35`

Siin ühendatakse kaks praktilist mõtet: turvaline ümbernimetamine ja korrektne vormi sidumine.

### Selgitus

`Shift+F6` abil saad muuta nime korraga seotud kohtades. Samas hoiatatakse, et frontendis tasub jälgida:

- kui laias skoopis rename toimub
- kas IDE muudab ainult õiget faili
- kas `label for` ja `input id` jäävad omavahel kooskõlla

`id` ei ole siin mõeldud väärtuse lugemiseks, vaid eelkõige kasutajakogemuse ja ligipääsetavuse jaoks.

### Skeem

```text
muudad inputi nime
  -> uuenda seotud kohad
      -> label viitab õigele väljale
          -> klikitavus + accessibility säilib
```

### Koodinäide

Selle repo loginis on see seos olemas:

```vue
<input
  v-model="username"
  type="text"
  class="form-control"
  id="inputUsername"
  placeholder="Kasutajanimi"
/>
<label for="inputUsername">Kasutajanimi</label>
```

### Päriselu analoogia

See on nagu paned võtmele ja uksele sama numbri, et oleks selge, kumb millega käib.

<a id="bootstrapi-grid-juhib-vahede-joonduste-ja-laiuste-loogikat"></a>
## Bootstrapi grid juhib vahede, joonduste ja laiuste loogikat - `0:36:23`

Video järgmine praktiline osa puudutab paigutust: vahed, keskjoondus ja veergude laius.

### Selgitus

Õpetaja rõhutab, et layouti ei tasu ehitada suvaliste pikslitega. Bootstrap annab mõistlikud ehituskivid:

- `row`
- `col`
- `justify-content-center`
- `mb-3`

See aitab hoida vormi ühtlase ja paremini hallatavana.

### Skeem

```text
container
  -> row
      -> col
          -> inputid / pealkiri / nupp
```

### Koodinäide

Praegune `LoginView` kasutabki seda lähenemist:

```vue
<div class="row justify-content-center">
  <div class="col col-3">
    <h1 class="mb-3">Sisse logimine</h1>
    <div class="form-floating mb-3">...</div>
  </div>
</div>
```

### Päriselu analoogia

See on nagu lao riiulid on kindla mõõdusüsteemiga, mitte iga kast ei seisa juhuslikus kohas.

<a id="data-tagastab-uhise-andmemudeli"></a>
## `data()` tagastab ühise andmemudeli - `0:40:34`

Õpetaja seletab pikalt, et `data` ei ole lihtsalt suvaline koht muutujatele, vaid meetod, mis tagastab objekti.

### Selgitus

See tähendab, et:

- `data()` on ise funktsioon
- ta tagastab objekti
- selle objekti väljad on need reaktiivsed väärtused, mida template ja methods jagavad

Algväärtused annavad ühtlasi vihje, mis tüüpi sisu seal oodatakse.

### Skeem

```text
data()
  -> return {
       username: '',
       password: '',
       errorMessage: ''
     }
```

### Koodinäide

Sama muster on siin:

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

### Päriselu analoogia

See on nagu koostad enne töö algust vormi, kuhu kõik väljad on ette nimetatud.

<a id="v-model-seob-sisestuskasti-ja-muutuja-kahes-suunas"></a>
## `v-model` seob sisestuskasti ja muutuja kahes suunas - `0:48:58`

See on video üks keskseid tehnilisi samme: kasutaja sisestus ja data väli pannakse kahesuunaliselt kokku.

### Selgitus

`v-model` tähendab:

- kui muutuja muutub, muutub kast
- kui kasutaja kirjutab kasti, muutub muutuja

See eemaldab tohutu hulga käsitsi kirjutamist.

### Skeem

```text
input
  <-> v-model
      <-> data.username
```

### Koodinäide

Repos on see olemas mõlema välja jaoks:

```vue
<input
  v-model="username"
  type="text"
  class="form-control"
  id="inputUsername"
  placeholder="Kasutajanimi"
/>

<input
  v-model="password"
  type="password"
  class="form-control"
  id="inputPassword"
  placeholder="Parool"
/>
```

### Päriselu analoogia

See on nagu tahvlil ja andmebaasis olev number on ühe ja sama nupu küljes.

<a id="rest-veebiteenused-on-frontendi-ja-backendi-kokkulepe"></a>
## REST veebiteenused on frontendi ja backendi kokkulepe - `1:00:04`

Pärast vormi osa minnakse suure pildi juurde: mis üldse on veebiteenus ja miks frontend peab sellest aru saama.

### Selgitus

Põhimõte on lihtne:

- frontend saadab HTTP sõnumi
- backend töötleb selle
- backend tagastab vastuse

See ei ole ainult "andmete küsimine", vaid kokkulepe selle üle:

- mis rajal sõnum liigub
- mis andmed kaasa lähevad
- mis kujul vastus tagasi tuleb

### Skeem

```text
frontend
  -> request
      -> backend
          -> response
              -> frontend kuvab tulemuse
```

### Koodinäide

Selle repo loginiloogika näitab sama mõtet:

```js
axios
  .get('/api/login', {
    params: {
      username: 'AAA',
      password: 'BBB',
    },
  })
```

### Päriselu analoogia

See on nagu restoranis menüü järgi tellimine: sa ei ütle lihtsalt "midagi süüa", vaid kasutad kokkulepitud vormi.

<a id="stoplight-mock-server-query-parameetrid-ja-vite-proxy-hoiavad-too-liikumas"></a>
## Stoplight mock server, query parameetrid ja Vite proxy hoiavad töö liikumas - `1:05:07`

Siin selgitatakse väga praktilist töövõtet: frontend saab edasi areneda ka siis, kui päris backend veel puudub.

### Selgitus

`Stoplight` teeb siin võltserveri rolli:

- defineerid URL-i
- defineerid sisendid
- defineerid näidisvastused
- frontend saab juba oma tööd testida

Väga oluline osa on ka proxy: frontend saadab näiteks `/api/...`, aga Vite suunab selle taustal õige serveri või mocki vastu.

### Skeem

```text
frontend -> /api/login
  -> Vite proxy
      -> Stoplight mock
          -> näidis JSON vastus
```

### Koodinäide

Selles repos on mocki vastu suunamine olemas:

```js
server: {
  proxy: {
    '/api': 'https://stoplight.io/mocks/valiit/myproject/170385130'
    // '/api': 'http://localhost:8080'
  }
}
```

Ja päringus saadetakse query parameetrid:

```js
params: {
  username: 'AAA',
  password: 'BBB',
}
```

### Päriselu analoogia

See on nagu filmivõtetel kasutatakse ajutist rekvisiiti enne, kui päris ese valmis saab.

<a id="enne-paringut-valideeri-vorm-ja-hoia-positiivne-tee-if-blokis"></a>
## Enne päringut valideeri vorm ja hoia positiivne tee `if` blokis - `1:22:06`

Õpetaja rõhutab, et enne backendi poole pöördumist tuleb kontrollida, kas vormi üldse on mõtet saata.

### Selgitus

Loogika on:

- kui kõik vajalikud väljad on täidetud, mine edasi
- muul juhul kuva viga

Ta soovitab kirjutada `if` nii, et üleval oleks "hea tee" ja `else` blokis vigade osa. Nii on kood lihtsam lugeda.

### Skeem

```text
if vorm on korrektne
  -> saada request
else
  -> kuva veateade
```

### Koodinäide

Praegune `LoginView` teeb täpselt seda:

```js
login() {
  this.resetErrorMessage()
  if (this.allFormFieldsAreCorrect()) {
    axios.get('/api/login', {
      params: {
        username: 'AAA',
        password: 'BBB',
      },
    })
  } else {
    this.errorMessage = 'Täida kõik väljad'
  }
}
```

### Päriselu analoogia

See on nagu lennujaamas kontrollitakse enne väravat, kas pass ja pilet on olemas, mitte ei saadeta sind kõigepealt lennukisse.

<a id="scripti-poolel-viita-andmetele-labi-this"></a>
## Scripti poolel viita andmetele läbi `this` - `1:26:00`

See on koht, kus paljud algajad komistavad: template'is ja scriptis ei käituta andmetega täpselt samamoodi.

### Selgitus

Vue `template` osas saad kasutada nime otse:

- `username`
- `password`

Aga `script` poolel pead ütlema, et räägid selle komponendi andmetest:

- `this.username`
- `this.password`

Muidu võib JS arvata, et mõtled hoopis mingit lokaalset muutujat.

### Skeem

```text
template: username
script: this.username
```

### Koodinäide

See on praeguses failis hästi nähtav:

```js
this.resetErrorMessage()
this.errorMessage = 'Täida kõik väljad'
localStorage.setItem('userId', this.loginResponse.userId)
```

### Päriselu analoogia

See on nagu ütled "see minu märkmik", mitte lihtsalt "märkmik", kui toas on neid mitu.

<a id="kasuta-rangeid-vordlusi-ja-seo-tingimused--abil"></a>
## Kasuta rangeid võrdlusi ja seo tingimused `&&` abil - `1:34:05`

Video selles osas räägitakse JavaScripti võrdlustest ja sellest, miks tasub olla täpne.

### Selgitus

Peamised mõtted:

- `===` ja `!==` on täpsemad kui kahekordsed variandid
- `&&` tähendab, et mõlemad tingimused peavad korraga tõele vastama
- vormi puhul ei piisa ühest täidetud väljast, vaja on mõlemat

See teeb kontrolli loetavamaks ja vähendab ootamatuid tüübi-konversioone.

### Skeem

```text
username ei ole tühi
  AND
password ei ole tühi
    -> võib edasi minna
```

### Koodinäide

Selle repo lihtsustatud helper väljendab sama mõtet lühidalt:

```js
allFormFieldsAreCorrect() {
  return this.username && this.password
}
```

Transkriptis arutatakse sama loogika pikemat varianti ka `!== ''` kujul.

### Päriselu analoogia

See on nagu uks avaneb ainult siis, kui sul on korraga nii võti kui õige uksekood.

<a id="tosta-kontroll-eraldi-abimeetodisse-ja-anna-sellele-statement-nimi"></a>
## Tõsta kontroll eraldi abimeetodisse ja anna sellele statement-nimi - `1:38:52`

See on video üks paremaid puhta koodi mõtteid.

### Selgitus

Kui `if` tingimus muutub pikaks, on parem tõsta see eraldi meetodisse. Aga oluline on nime kuju:

- nimi peaks olema statement
- see peaks kõlama loetava väitena
- seda peab olema mugav lugeda koos sõnaga `if`

Näiteks: `allFormFieldsAreCorrect()`.

### Skeem

```text
keeruline tingimus
  -> tõsta helper meetodisse
      -> anna loetav nimi
          -> if muutub arusaadavaks
```

### Koodinäide

Selles repos on tulemus juba olemas:

```js
if (this.allFormFieldsAreCorrect()) {
  // jätka loginiga
}
```

```js
allFormFieldsAreCorrect() {
  return this.username && this.password
}
```

### Päriselu analoogia

See on nagu paned keerulisele kontrollnimekirjale nimeks "auto on sõidukorras", mitte ei loe iga kord kõiki kruvisid ükshaaval ette.

<a id="loe-koodi-ulevalt-alla-nagu-lugu-mitte-uksikuteks-juppideks"></a>
## Loe koodi ülevalt alla nagu lugu, mitte üksikuteks juppideks - `1:54:14`

Õpetaja rõhutab, et peameetod peaks rääkima sinuga nagu normaalne tekst.

### Selgitus

Hea lugemisjärjekord on:

- vaata peameetod läbi
- saa aru, mida ta üritab teha
- mine detailidesse alles siis, kui vajad

See aitab võõrast koodi lugeda ilma, et kohe detailidesse ära upuksid.

### Skeem

```text
loe peameetod
  -> saa üldpilt kätte
      -> ava helper ainult vajadusel
```

### Koodinäide

Praeguses `LoginView` failis on see loogika näha:

```js
methods: {
  login() {
    this.resetErrorMessage()
    if (this.allFormFieldsAreCorrect()) {
      // request
    } else {
      this.errorMessage = 'Täida kõik väljad'
    }
  },
}
```

Detailne kontroll on peidetud eraldi helperisse.

### Päriselu analoogia

See on nagu loed raamatus kõigepealt peatüki sisu, mitte ei hüppa esimesena joonealustesse märkustesse.

<a id="kohvimasina-naide-seletab-peameetodi-ja-abimeetodite-vahet"></a>
## Kohvimasina näide seletab peameetodi ja abimeetodite vahet - `1:59:07`

Video lõpus tuuakse väga hea analoogia: kohvimasina nupp on peameetod, taustal jooksvad väiksemad sammud on abimeetodid.

### Selgitus

Kui kasutaja vajutab "cappuccino":

- käivitub üks nähtav põhitegevus
- selle sees kutsutakse väiksemaid samme
- kasutaja ei pea teadma iga sisemise sammu detaile

Sama kehtib tarkvaras:

- peameetod räägib äriloogikast
- helperid teevad väiksemad töölõigud ära

### Skeem

```text
public/main action
  -> helper 1
  -> helper 2
  -> helper 3
      -> valmis tulemus
```

### Koodinäide

`login()` on siin peameetod ja kaks ülejäänut on helperid:

```js
methods: {
  login() {},
  resetErrorMessage() {},
  allFormFieldsAreCorrect() {},
}
```

### Päriselu analoogia

See on nagu kohvimasina nupp "tee cappuccino" ei palu sul ise mõõta vett, jahvatada ube ja vahustada piima.

<a id="alerterror-kuvab-vea-andmete-pohjal-mitte-kasitsi-domi-nappides"></a>
## `AlertError` kuvab vea andmete põhjal, mitte käsitsi DOM-i näppides - `2:03:20`

Viimases osas jõutakse eraldi veakomponendini ja näidatakse, kuidas tekst jõuab ekraanile läbi andmete.

### Selgitus

Loogika on:

- parent hoiab `errorMessage` väärtust
- parent annab selle childile `props` kaudu
- child kuvab alerti ainult siis, kui sõnum on olemas
- tekst pannakse vaatesse `{{ ... }}` interpolatsiooni kaudu

See on puhas reaktiivne lahendus.

### Skeem

```text
login() meetod
  -> this.errorMessage = 'Täida kõik väljad'
      -> parent annab propina edasi
          -> child kuvab alerti
```

### Koodinäide

Parent:

```vue
<AlertError :error-message="errorMessage" />
```

Child:

```vue
<div v-if="errorMessage" class="alert alert-danger" role="alert">
  {{ errorMessage }}
</div>
```

Ja scripti poolel:

```js
this.errorMessage = 'Täida kõik väljad'
```

### Päriselu analoogia

See on nagu juhtpaneelile ilmub hoiatus siis, kui süsteem kirjutab sinna uue teate, mitte keegi ei kleebi käsitsi punast silti ekraanile.

## Kokkuvõte

See video ühendab kolm suurt telge. Esimene on tööriistade kasutamine: `Claude Code` IDE integratsioon, failiviited ja live template'id. Teine on Vue enda loogika: `data()`, `v-model`, `this`, valideerimine, helper-meetodid ja andmepõhine renderdamine. Kolmas on arendusprotsess: `FEB-7`, mock-backend Stoplightis, query parameetrid, proxy ja eraldi veakomponent.

Kui sellest videost võtta kaasa kõige olulisem mõte, siis see on see: template ja script ei suhtle otse, vaid läbi andmete. Just selle tõttu saab vormi valideerida, veateadet kuvada ja hiljem backendi päringut teha nii, et kood on loetavam ja vähem habras.
