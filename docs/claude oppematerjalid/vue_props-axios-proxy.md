## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/csy6DaW0hIzljw2TuRlRe5ujA0ek0Bxu2WF1SEVkFketvBRmnH3sS5WVr3NYmuMm.Z__MgcYeyMEHMLmM?startTime=1776678460000) |
| **Parool** | `h1=9AqTI` |
| **Transkript** | [GMT20260420-094740_v-2.vtt](../transcripts/GMT20260420-094740_v-2.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Näiteks esinevad kohati `Cloud`, `Jason`, `voe`, `aktsias`, `Alert Tanger` ja `appi`, kuigi kontekst ütleb üsna selgelt, et mõeldud on `Claude`, `JSON`, `Vue`, `Axios`, `Alert Danger` või `AlertError` ning `/api`.

Selles videos on kõige selgemalt tuvastatav taskikood `FEB-7`. Fookus on `LoginView` edasiarendamisel: veateate komponendiks tõstmisel, `props` loogikal, login-päringu saatmisel, proxy kasutamisel ja vastuse salvestamisel brauseri storage'isse.

Selles õppematerjalis seon teemad päris näidetega failidest `src/views/LoginView.vue`, `src/components/AlertError.vue`, `src/router/index.js`, `src/App.vue` ja `vite.config.js`.

## Sisukord

- [`FEB-7` tõstab veateate eraldi taaskasutatavaks komponendiks](#feb-7-tostab-veateate-eraldi-taaskasutatavaks-komponendiks) - `0:01:02`
- [`components/` kaust ja esimene `AlertError.vue`](#components-kaust-ja-esimene-alerterrorvue) - `0:02:26`
- [Komponendi väljakutsumine, import ja registreerimine seovad childi parentiga](#komponendi-valjakutsumine-import-ja-registreerimine-seovad-childi-parentiga) - `0:05:06`
- [`props` kirjeldab child-komponendi sisendit](#props-kirjeldab-child-komponendi-sisendit) - `0:17:20`
- [Parent annab proppi template'is edasi kebab-case'iga](#parent-annab-proppi-templateis-edasi-kebab-caseiga) - `0:21:17`
- [Koolon `:` tähendab: võta muutuja väärtus, mitte tekst](#koolon--tahendab-vota-muutuja-vaartus-mitte-tekst) - `0:23:50`
- [`props` ei tohi `v-model`-iga childis muteeruda](#props-ei-tohi-v-model-iga-childis-muteeruda) - `0:43:23`
- [Andmed voolavad parentist childi ülevalt alla](#andmed-voolavad-parentist-childi-ulevalt-alla) - `0:50:35`
- [`v-if` peab elama taaskasutatava alerti sees](#v-if-peab-elama-taaskasutatava-alerti-sees) - `0:59:25`
- [Iga login-klõps peab alustama `resetErrorMessage()`-ga](#iga-login-klops-peab-alustama-reseterrormessage-ga) - `1:06:02`
- [Login-päringu sisendid tulevad query parameetritest](#login-paringu-sisendid-tulevad-query-parameetritest) - `1:16:36`
- [Õppimiseks valitakse siin `Axios`, mitte brauseri `fetch`](#oppimiseks-valitakse-siin-axios-mitte-brauseri-fetch) - `1:17:41`
- [HTTP staatusekoodid annavad `then` vs `catch` loogika](#http-staatusekoodid-annavad-then-vs-catch-loogika) - `1:22:20`
- [HTTP meetodid märgivad CRUD tegevuse tüübi](#http-meetodid-margivad-crud-tegevuse-tuubi) - `1:27:30`
- [`axios.get('/login')` on esimene töötav päringu karkass](#axiosgetlogin-on-esimene-tootav-paringu-karkass) - `1:40:33`
- [`/api/login` eristab backend-päringut frontend route'ist `/login`](#apilogin-eristab-backend-paringut-frontend-routeist-login) - `2:36:01`
- [`loginResponse` mudel peegeldab backendi vastuse kuju](#loginresponse-mudel-peegeldab-backendi-vastuse-kuju) - `3:01:24`
- [`localStorage` ja `sessionStorage` hoiavad brauseris võtme-väärtuse paare](#localstorage-ja-sessionstorage-hoiavad-brauseris-votme-vaartuse-paare) - `3:10:34`
- [`userId` ja `roleName` tuleb vastusest õigete võtmetega salvestada](#userid-ja-rolename-tuleb-vastusest-oigete-votmetega-salvestada) - `3:22:04`
- [`login()` peab jääma lühikeseks orkestreerijaks](#login-peab-jaama-luhikeseks-orkestreerijaks) - `3:28:23`

<a id="feb-7-tostab-veateate-eraldi-taaskasutatavaks-komponendiks"></a>
## `FEB-7` tõstab veateate eraldi taaskasutatavaks komponendiks - `0:01:02`

Video alustab väga praktilise mõttega: `Täida kõik väljad` tüüpi veateade ei peaks elama ühes vaates käsitsi kirjutatud HTML-klotsina.

### Selgitus

Kui jätad veateate otse `LoginView` sisse, tekib kiiresti kaks probleemi:

- sama loogikat tuleb hiljem kopeerida ka teistesse vaadetesse
- nähtavuse tingimus tuleb iga kord uuesti kaasa vedada

Õpetaja mõte on lihtne: teeme ühe väikese komponendi, mis ise teab, millal alerti näidata ja millal mitte.

### Skeem

```text
enne:
LoginView
  -> alerti HTML
  -> alerti CSS klassid
  -> alerti näitamise tingimus

pärast:
LoginView
  -> "anna ainult errorMessage"

AlertError
  -> otsustab ise, kas kuvada
  -> hoiab alerti visuaali koos
```

### Koodinäide

```vue
<AlertError :error-message="errorMessage" />
```

Siin ongi parent-vaate töö sisuliselt ainult see, et ta annab errori sisu alla.

### Päriselu analoogia

See on nagu kasutad poes valmis tulekustutit, mitte ei ehita iga ruumi jaoks eraldi voolikute süsteemi.

<a id="components-kaust-ja-esimene-alerterrorvue"></a>
## `components/` kaust ja esimene `AlertError.vue` - `0:02:26`

Järgmine samm on tehniline: kus see uus klots koodibaasis elama hakkab.

### Selgitus

Vue projektides on täiesti tavaline, et:

- suuremad lehed elavad `views/` all
- väiksemad korduvkasutatavad tükid elavad `components/` all

Selles repos on see sama loogika juba näha. `src/components/AlertError.vue` on väike korduvkasutatav klots, samal ajal kui `src/views/LoginView.vue` on terve leht.

### Skeem

```text
src/
  views/
    LoginView.vue
  components/
    AlertError.vue
```

### Koodinäide

```vue
<script>
export default {
  name: 'AlertError',
}
</script>
```

Komponendil on nimi, et Vue ja IDE saaksid teda korrektselt viidata ning kasutada.

### Päriselu analoogia

See on nagu majas on üks ruumide kaart ja eraldi kapp tööriistade jaoks. Mõlemad on vajalikud, aga neid ei hoita samas hunnikus.

<a id="komponendi-valjakutsumine-import-ja-registreerimine-seovad-childi-parentiga"></a>
## Komponendi väljakutsumine, import ja registreerimine seovad childi parentiga - `0:05:06`

Õpetaja näitab, et komponent ei ilmu ekraanile niisama. Parent peab ta teadlikult sisse tõmbama ja template'is välja kutsuma.

### Selgitus

Vue komponentide kasutamisel juhtub kolm asja:

1. fail imporditakse
2. komponent registreeritakse
3. template'is kirjutatakse selle tag

Praeguses `LoginView.vue` failis on see muster ilusti olemas.

### Skeem

```text
import AlertError
  -> components: { AlertError }
      -> <AlertError ... />
          -> child-template renderdatakse parenti sisse
```

### Koodinäide

```vue
<script>
import AlertError from '@/components/AlertError.vue'

export default {
  components: { AlertError },
}
</script>
```

```vue
<AlertError :error-message="errorMessage" />
```

### Päriselu analoogia

See on nagu tellid kohvimasina kööki: kõigepealt tood ta majja, siis paned õigesse kohta ja alles siis saad nuppu vajutada.

<a id="props-kirjeldab-child-komponendi-sisendit"></a>
## `props` kirjeldab child-komponendi sisendit - `0:17:20`

Siin tuleb mängu video üks põhikontseptsioon: `props`.

### Selgitus

`props` tähendab, et child-komponent ütleb ette, millist sisendit ta parentilt ootab.

Oluline vahe:

- `data()` hoiab komponendi enda andmeid
- `props` kirjeldab andmeid, mis tulevad väljast sisse

`AlertError` ei oma ise error-sõnumit. Ta lihtsalt ütleb: "Kui sa tahad mind kasutada, anna mulle üks `String` nimega `errorMessage`."

### Skeem

```text
parent teab väärtust
  -> annab selle childile
      -> child kasutab seda renderdamiseks
```

### Koodinäide

```vue
<script>
export default {
  props: {
    errorMessage: String,
  },
}
</script>
```

### Päriselu analoogia

See on nagu pistikupesa ütleb, mis tüüpi pistikut ta ootab. Pesa ise ei tooda elektriseadet, vaid võtab õige asja vastu.

<a id="parent-annab-proppi-templateis-edasi-kebab-caseiga"></a>
## Parent annab proppi template'is edasi kebab-case'iga - `0:21:17`

Videos rõhutatakse ka kirjaviisi reeglit: childis kirjutad proppi JavaScripti kombel, template'is annad selle edasi HTML-i kombel.

### Selgitus

Vue's on levinud kokkulepe:

- scripti poolel: `errorMessage`
- template'i atribuudi poolel: `error-message`

See aitab visuaalselt eristada:

- JavaScripti muutujanimed
- HTML-is kirjutatud atribuudi nimed

### Skeem

```text
child script:
errorMessage

parent template:
error-message
```

### Koodinäide

```vue
<AlertError :error-message="errorMessage" />
```

### Päriselu analoogia

See on nagu inimese nimi passis ja sama nimi lennupiletil võivad olla eri formaadis, aga viitavad samale isikule.

<a id="koolon--tahendab-vota-muutuja-vaartus-mitte-tekst"></a>
## Koolon `:` tähendab: võta muutuja väärtus, mitte tekst - `0:23:50`

See on Vue template'i süntaksi väga tähtis koht.

### Selgitus

Kui kirjutad nii:

```vue
<AlertError error-message="errorMessage" />
```

siis Vue loeb seda sõna-sõnalt tekstina `"errorMessage"`.

Kui kirjutad nii:

```vue
<AlertError :error-message="errorMessage" />
```

siis Vue saab aru, et paremal pool on muutuja, mille väärtus tuleb võtta `data()` blokist.

### Skeem

```text
ilma koolonita:
"errorMessage" -> literal string

kooloniga:
errorMessage -> JS muutuja väärtus
```

### Koodinäide

```vue
<AlertError :error-message="errorMessage" />
```

See tähendab: võta `LoginView` muutujast `errorMessage` päris sisu ja anna see childile.

### Päriselu analoogia

See on nagu vahe sellel, kas ütled "anna mulle sildi tekst" või "anna mulle karbis päriselt olev ese".

<a id="props-ei-tohi-v-model-iga-childis-muteeruda"></a>
## `props` ei tohi `v-model`-iga childis muteeruda - `0:43:23`

Siin tehakse üks väga oluline Vue reegel hästi selgeks.

### Selgitus

Child-komponent ei tohi proppi väärtust ise ümber kirjutada. Põhjus on lihtne:

- propp ei kuulu childile
- propp tuleb parentist
- seega parent on selle info omanik

Sama tõttu ei tohi child siduda proppi `v-model`-iga, sest `v-model` tahab väärtust muuta.

### Skeem

```text
vale:
parent -> child prop
child -> muudab sama prop'i tagasi

õige:
parent -> child prop
child -> ainult kuvab või kasutab
```

### Koodinäide

```vue
<!-- halb mõte -->
<input v-model="errorMessage" type="text" />
```

Kui `errorMessage` on `prop`, siis see üritaks childis parenti andmeid üle kirjutada.

### Päriselu analoogia

See on nagu laenad sõbralt raamatut. Sa võid seda lugeda, aga sa ei tohi tema nime sealt kustutada ja enda nime asemele kirjutada.

<a id="andmed-voolavad-parentist-childi-ulevalt-alla"></a>
## Andmed voolavad parentist childi ülevalt alla - `0:50:35`

Pärast `props` reegleid võtab õpetaja kokku suurema pildi: andmevoog on ühe suunaga.

### Selgitus

Selle video kontekstis tähendab see:

- `LoginView` hoiab `errorMessage`
- `LoginView` annab selle `AlertError` komponendile
- `AlertError` ainult joonistab selle välja

See teeb süsteemi loetavamaks, sest kohe on näha, kust mingi info päriselt tuleb.

### Skeem

```text
LoginView.data.errorMessage
  -> <AlertError :error-message="errorMessage" />
      -> AlertError template
```

### Koodinäide

```vue
data() {
  return {
    errorMessage: '',
  }
}
```

```vue
<AlertError :error-message="errorMessage" />
```

### Päriselu analoogia

See on nagu ülemus annab tööülesande tiimile. Ülesanne liigub alla, mitte praktikant ei kirjuta ülemuse päevaplaani ümber.

<a id="v-if-peab-elama-taaskasutatava-alerti-sees"></a>
## `v-if` peab elama taaskasutatava alerti sees - `0:59:25`

See on selle video üks paremaid taaskasutuse näiteid.

### Selgitus

Kui jätad `v-if` parenti, pead igas kasutuskohas uuesti meeles pidama:

- millal alerti näidata
- millal alert peita

Kui tõstad `v-if` otse `AlertError` sisse, siis on see loogika ühe korra lahendatud ja kõik kasutuskohad saavad selle tasuta kaasa.

### Skeem

```text
parem:
AlertError
  -> v-if="errorMessage"

halvem:
iga parent vaatab ise
  -> kas näidata?
  -> kas peita?
```

### Koodinäide

```vue
<template>
  <div v-if="errorMessage" class="alert alert-danger" role="alert">
    {{ errorMessage }}
  </div>
</template>
```

### Päriselu analoogia

See on nagu suitsuanduril on andur juba sees. Sa ei taha iga toa ukse kõrval eraldi inimest, kes otsustab, kas alarm peaks tööle minema.

<a id="iga-login-klops-peab-alustama-reseterrormessage-ga"></a>
## Iga login-klõps peab alustama `resetErrorMessage()`-ga - `1:06:02`

Järgmine oluline mõte puudutab reaktiivset UI käitumist.

### Selgitus

Kui kasutaja vajutab korra `Login` nuppu ja saab vea, siis see veateade jääb nähtavale seni, kuni kood selle ära muudab.

Seetõttu on hea tava:

- iga nupuvajutus alustab vana vea tühjendamisega
- alles siis kontrollitakse vormi
- alles siis saadetakse võimalik päring

Praegune `LoginView.vue` teeb seda juba õigesti.

### Skeem

```text
click login
  -> resetErrorMessage()
  -> valideeri väljad
  -> saada päring või kuva uus viga
```

### Koodinäide

```js
login() {
  this.resetErrorMessage()
  if (this.allFormFieldsAreCorrect()) {
    // järgmised sammud
  } else {
    this.errorMessage = 'Täida kõik väljad'
  }
}
```

### Päriselu analoogia

See on nagu enne uue eksami alustamist kustutatakse tahvel puhtaks, mitte ei jäeta eelmise tunni vastuseid ette.

<a id="login-paringu-sisendid-tulevad-query-parameetritest"></a>
## Login-päringu sisendid tulevad query parameetritest - `1:16:36`

Siin liigub jutt API lepingu juurde.

### Selgitus

Õpetaja selgitab, et login-teenus ootab kasutajanime ja parooli query parameetritena. See tähendab URL-i lõpuossa lisatud võtme-väärtuse paare.

Näiteks:

- `username=...`
- `password=...`

See ei tähenda veel, et kasutaja näeb neid tingimata brauseri aadressiribal käsitsi. See tähendab lihtsalt, et päringu tehniline kuju sisaldab neid parameetreid.

### Skeem

```text
/login?username=admin&password=secret
```

### Koodinäide

```js
axios.get('/api/login', {
  params: {
    username: this.username,
    password: this.password,
  },
})
```

### Päriselu analoogia

See on nagu täidad saadetise vormi: ümbrikule läheb aadress ja saaja nimi eraldi väljadena, mitte ühe segase lausena.

<a id="oppimiseks-valitakse-siin-axios-mitte-brauseri-fetch"></a>
## Õppimiseks valitakse siin `Axios`, mitte brauseri `fetch` - `1:17:41`

Videos tehakse teadlik tehnoloogiavalik.

### Selgitus

Brauseris on olemas sisseehitatud `fetch`, aga õpetaja kasutab selles kursuses `Axios`-t, sest selle ülesehitus on algajale loetavam:

- saada päring
- `then` puhul tuli edukas vastus
- `catch` puhul tuli viga

See sarnaneb mõtteviisilt `if / else` loogikale, mida õppijad juba tunnevad.

### Skeem

```text
axios request
  -> then = õnnestus
  -> catch = ebaõnnestus
```

### Koodinäide

```js
axios
  .get('/api/login', { params: { username: this.username, password: this.password } })
  .then((response) => {
    this.loginResponse = response.data
  })
  .catch(() => {
    this.errorMessage = 'Sisselogimine ebaõnnestus'
  })
```

### Päriselu analoogia

See on nagu kassas on roheline tuli "makse õnnestus" ja punane tuli "midagi läks valesti". Põhistruktuur on kohe visuaalselt loetav.

<a id="http-staatusekoodid-annavad-then-vs-catch-loogika"></a>
## HTTP staatusekoodid annavad `then` vs `catch` loogika - `1:22:20`

`Axios` valik viib loomulikult järgmise teemani: mis üldse tähendab "hea" või "halb" vastus.

### Selgitus

Õpetaja võtab staatusekoodid kokku väga praktiliselt:

- `2xx` = õnnestus
- `4xx` = kliendi poole viga
- `5xx` = serveri poole viga

Frontendi mõttes on oluline arusaam, et edukas login ei tähenda lihtsalt "vastus tuli", vaid "vastus tuli õige staatusekoodiga".

### Skeem

```text
2xx -> success
4xx -> client error
5xx -> server error
```

### Koodinäide

```js
.then((response) => {
  this.loginResponse = response.data
})
.catch(() => {
  this.errorMessage = 'Midagi läks valesti'
})
```

Siin otsustab raamistik suure osa tööst sinu eest: edukad vastused jõuavad `then` blokki, vead `catch` blokki.

### Päriselu analoogia

See on nagu eksamitulemus: "sooritatud", "esitatud valesti" ja "süsteem kukkus kokku" ei ole sama olukord.

<a id="http-meetodid-margivad-crud-tegevuse-tuubi"></a>
## HTTP meetodid märgivad CRUD tegevuse tüübi - `1:27:30`

Seejärel tehakse kõrvale suurem veebiteenuste põhimõte.

### Selgitus

HTTP meetod ei ole lihtsalt tehniline detail. See ütleb, mida sa teenuselt tahad.

Kõige tavalisem seos on:

- `GET` = loe andmeid
- `POST` = lisa uus kirje
- `PUT` = uuenda olemasolev kirje
- `DELETE` = kustuta kirje

Logini näites kasutatakse hetkel `GET` päringut, sest nii on mock-teenus selles harjutuses kirjeldatud.

### Skeem

```text
CRUD
  Create -> POST
  Read   -> GET
  Update -> PUT
  Delete -> DELETE
```

### Koodinäide

```text
GET    /api/login
POST   /api/users
PUT    /api/users/15
DELETE /api/users/15
```

### Päriselu analoogia

See on nagu pangaautomaadi menüü: saldo vaatamine, uue konto loomine, andmete muutmine ja konto sulgemine ei ole sama käsk.

<a id="axiosgetlogin-on-esimene-tootav-paringu-karkass"></a>
## `axios.get('/login')` on esimene töötav päringu karkass - `1:40:33`

Pärast taustamudelit minnakse tagasi väga praktilise koodi juurde.

### Selgitus

Siin ehitatakse esimene päringu karkass:

- URL antakse ette stringina
- meetodiks on `GET`
- query parameetrid lisatakse konfiguratsiooni kaudu

Videos alustatakse kõige lihtsamast versioonist. Hiljem täpsustatakse seda `/api` prefiksiga.

### Skeem

```text
axios.get(url, config)
  -> url
  -> params
  -> then / catch
```

### Koodinäide

```js
axios.get('/login', {
  params: {
    username: this.username,
    password: this.password,
  },
})
```

Praeguses repos on selle skeleti edasiarendatud variant juba olemas `LoginView.vue` sees.

### Päriselu analoogia

See on nagu esimest korda vormi blanketile õiged väljad ette joonistada. Hiljem saad sinna päris väärtused sisse panna.

<a id="apilogin-eristab-backend-paringut-frontend-routeist-login"></a>
## `/api/login` eristab backend-päringut frontend route'ist `/login` - `2:36:01`

See on video kõige olulisem arhitektuurne koht.

### Selgitus

Projektis on olemas frontend route:

```js
{ path: '/login', name: 'loginRoute', component: LoginView }
```

Kui frontend saadab päringu lihtsalt aadressile `/login`, võib arendusserver arvata, et kasutaja tahab saada login-lehe HTML-i, mitte backendi andmeid. Tulemuseks ongi klassikaline viga: oodati `JSON`-i, aga tagasi tuli `HTML`.

Selle vältimiseks kasutatakse prefiksit `/api`. Siis on kohe selge:

- `/login` = frontend route
- `/api/login` = backend päring

### Skeem

```text
brauser -> /login
  = kuva Vue vaade

brauser -> /api/login
  = suuna proxy kaudu backendi
```

### Koodinäide

```js
// src/router/index.js
{
  path: '/login',
  name: 'loginRoute',
  component: LoginView,
}
```

```js
// vite.config.js
server: {
  proxy: {
    '/api': 'https://stoplight.io/mocks/valiit/myproject/170385130'
  }
}
```

### Päriselu analoogia

See on nagu samas majas on üks uks klienditeenindusse ja teine uks serveriruumi. Kui sildid puuduvad, lähevad inimesed valesse kohta.

<a id="loginresponse-mudel-peegeldab-backendi-vastuse-kuju"></a>
## `loginResponse` mudel peegeldab backendi vastuse kuju - `3:01:24`

Video lõpuosas liigub fookus vastuse töötlemisele.

### Selgitus

Õpetaja rõhutab, et `data()` blokis tasub hoida ette mudelit, mis meenutab backendi vastuse kuju. See annab mitu kasu:

- kohe on näha, milliseid välju oodatakse
- IDE oskab pakkuda õigeid välju
- vigaseid väljanimesid on raskem kirjutada

Praeguses `LoginView.vue` failis on see mõte juba ellu viidud.

### Skeem

```text
backend response
  -> response.data
      -> this.loginResponse
          -> userId
          -> roleName
```

### Koodinäide

```js
data() {
  return {
    loginResponse: {
      userId: 0,
      roleName: '',
    },
  }
}
```

### Päriselu analoogia

See on nagu paned sahtlitesse sildid ette enne, kui päris dokumendid saabuvad. Siis tead kohe, kuhu miski käib.

<a id="localstorage-ja-sessionstorage-hoiavad-brauseris-votme-vaartuse-paare"></a>
## `localStorage` ja `sessionStorage` hoiavad brauseris võtme-väärtuse paare - `3:10:34`

Järgmine teema on brauseri enda salvestusruum.

### Selgitus

Õpetaja seletab storage'i kui lihtsat võtme-väärtuse hoidlat:

- vasakul on võti
- paremal on väärtus
- brauser hoiab seda infot meeles

Oluline vahe:

- `localStorage` jääb alles ka hiljem
- `sessionStorage` on seotud aktiivse sessiooni või tabi elueaga

Video jutt läheb küll taski sõnastusest `sessionStorage`, aga õpetaja selgitab, et selles harjutuses on `localStorage` samuti täiesti kasutatav.

### Skeem

```text
storage
  key   -> value
  lang  -> est
  userId -> 10
```

### Koodinäide

```js
localStorage.setItem('lang', 'est')
sessionStorage.setItem('lang', 'est')
```

### Päriselu analoogia

`localStorage` on nagu kapp kontoris, mis jääb alles ka homme. `sessionStorage` on nagu päevaks antud külastajakaart, mis läheb õhtul tagasi.

<a id="userid-ja-rolename-tuleb-vastusest-oigete-votmetega-salvestada"></a>
## `userId` ja `roleName` tuleb vastusest õigete võtmetega salvestada - `3:22:04`

Siin jõutakse lõpuks päris kasutuseni: mida login-vastusest kohe pärast edu vaja on.

### Selgitus

Kui vastus on käes, peab frontend tavaliselt teadma vähemalt kahte asja:

- kes see kasutaja on
- mis rolliga ta sisse logis

Selles videos salvestatakse seetõttu vähemalt `userId` ja `roleName`. See võimaldab hiljem:

- näidata õigeid vaateid
- teha kasutajaspetsiifilisi päringuid
- otsustada õiguste üle

### Skeem

```text
response.data
  -> userId
  -> roleName
      -> storage
```

### Koodinäide

```js
.then((response) => {
  this.loginResponse = response.data
  localStorage.setItem('userId', this.loginResponse.userId)
  localStorage.setItem('roleName', this.loginResponse.roleName)
})
```

### Päriselu analoogia

See on nagu pärast festivali väravast sisse saamist saad käepaela, millelt on kohe näha nii sinu identiteet kui ka ligipääsutase.

<a id="login-peab-jaama-luhikeseks-orkestreerijaks"></a>
## `login()` peab jääma lühikeseks orkestreerijaks - `3:28:23`

Video lõpus võetakse kogu töö kokku koodi loetavuse vaatest.

### Selgitus

Õpetaja ei taha, et `login()` muutuks hiigelpikaks meetodiks, kuhu on kokku surutud:

- errori reset
- vormi kontroll
- päringu saatmine
- vea käsitlemine
- storage'i salvestamine
- ümbersuunamine

Parem lahendus on hoida `login()` kõrgel tasemel ja lükata detailid abimeetoditesse.

### Skeem

```text
login()
  -> resetErrorMessage()
  -> allFormFieldsAreCorrect()
  -> sendLoginRequest()
  -> handleLoginErrorResponse()
```

### Koodinäide

```js
login() {
  this.resetErrorMessage()

  if (!this.allFormFieldsAreCorrect()) {
    this.errorMessage = 'Täida kõik väljad'
    return
  }

  this.sendLoginRequest()
}
```

See on sama mõte, mida õpetaja nimetab "nice overview'ks": avad faili ja saad kohe aru, kuidas login üldjoontes töötab.

### Päriselu analoogia

See on nagu lennuki kapten ei käi ise kõiki juhtmeid ühendamas. Tema roll on juhtida protsessi, samal ajal kui alamtegevused on eraldi süsteemide käes.
