## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/wgAXbsSJUOkMd3Mu9B9FEg9YkVYKLQ2haNas7pHcFD3zv94Qwt_igT_2Gbs9jEuS.5ccE6uysoMhRsB1v?startTime=1776751626000) |
| **Parool** | `S19I!GgF` |
| **Transkript** | [GMT20260421-060706_v-1.vtt](../transcripts/GMT20260421-060706_v-1.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Näiteks esinevad kohati `Cliport`, `Cloud`, `Stop Light`, `aktsias`, `terrorespons`, `Jason`, `veb seitse` ja `loogi`, kuigi kontekst ütleb üsna selgelt, et mõeldud on `clipboard`, `Claude`, `Stoplight`, `axios`, `errorResponse`, `JSON`, `FEB-7` ja `login`.

Selles videos on selgelt tuvastatav taskikood `FEB-7`. Esimene osa räägib oskusfailidest ehk `skill`-idest ja õppematerjalide workflow’st, teine ja pikem osa liigub tagasi `LoginView` arenduse juurde: `LoginService`, error-handling, `localStorage`, meetodite struktuur ja spinner.

Kuna video algus keskendub repo enda skill-failidele, toon näiteid lisaks `src/` kaustale ka `.claude/skills` ja `docs/` alt. Põhiosa koodinäited seon failidega `src/views/LoginView.vue`, `src/services/LoginService.js`, `src/components/AlertError.vue` ja `docs/theory-materials/java-vs-javascript-meetodid.md`.

## Sisukord

- [`/export` ja `Save to File` hoiavad pika vestluse konteksti alles](#export-ja-save-to-file-hoiavad-pika-vestluse-konteksti-alles) - `0:01:05`
- [`skill-transkript-oppematerjal` muudab VTT failid õppematerjalideks](#skill-transkript-oppematerjal-muudab-vtt-failid-oppematerjalideks) - `0:03:09`
- [`FEB-7` catch-up skill otsib õpetaja haru ja teeb uue versiooniharuna](#feb-7-catch-up-skill-otsib-opetaja-haru-ja-teeb-uue-versiooniharuna) - `0:16:23`
- [`LoginView.login()` algab nupust ja kutsub meetodeid läbi `this`](#loginviewlogin-algab-nupust-ja-kutsub-meetodeid-labi-this) - `0:25:56`
- [Query parameetrid peavad sobima täpselt serveri ootusega](#query-parameetrid-peavad-sobima-tapselt-serveri-ootusega) - `0:28:45`
- [`response.data` ja `localStorage` seovad serveri vastuse brauseri olekuga](#responsedata-ja-localstorage-seovad-serveri-vastuse-brauseri-olekuga) - `0:31:37`
- [`error.response.data` on sügavam objekt ja vajab eraldi mudelit](#errorresponsedata-on-sugavam-objekt-ja-vajab-eraldi-mudelit) - `0:50:21`
- [`403` + `errorCode 111` tähendab: kuva backendist tulnud veateade](#403--errorcode-111-tahendab-kuva-backendist-tulnud-veateade) - `1:03:12`
- [`Prefer` header lubab Stoplightiga erinevaid vastuseid teeselda](#prefer-header-lubab-stoplightiga-erinevaid-vastuseid-teeselda) - `1:09:27`
- [Pikk meetod tuleb tükeldada nimelisteks tegevusteks](#pikk-meetod-tuleb-tukeldada-nimelisteks-tegevusteks) - `1:15:43`
- [`LoginService` eraldab sõnumi saatmise vaate loogikast](#loginservice-eraldab-sonumi-saatmise-vaate-loogikast) - `1:32:07`
- [Parameetrid on sildid, mille kaudu teenus saab väljast infot](#parameetrid-on-sildid-mille-kaudu-teenus-saab-valjast-infot) - `1:46:47`
- [Java ja JavaScripti meetodistruktuur selgitab nime, sisendi ja tagastuse rolli](#java-ja-javascripti-meetodistruktuur-selgitab-nime-sisendi-ja-tagastuse-rolli) - `1:49:02`
- [Spinner vajab head boolean-nime, `v-if` paari ja õiget lõpetamiskohta](#spinner-vajab-head-boolean-nime-v-if-paari-ja-oiget-lopetamiskohta) - `2:21:55`

<a id="export-ja-save-to-file-hoiavad-pika-vestluse-konteksti-alles"></a>
## `/export` ja `Save to File` hoiavad pika vestluse konteksti alles - `0:01:05`

Video alguses näitab õpetaja väga praktilist töövõtet: kui chat venib pikaks, saab selle sisu failina kõrvale salvestada.

### Selgitus

Mõte on lihtne:

- pikk vestlus ei pea jääma ainult jooksva terminalisessiooni sisse
- vestluse saab salvestada tekstifaili
- hiljem saab sellele failile uuesti viidata või sealt ainult vajaliku lõigu kopeerida

See on kasulik eriti siis, kui:

- tahad päeva jooksul kogunenud konteksti alles hoida
- arvuti tuleb kinni panna
- tahad AI-le anda ainult osa eelnevast jutust

### Skeem

```text
pikk chat
  -> /export
      -> Save to File
          -> tekstifail
              -> hiljem viitad või loed uuesti sisse
```

### Koodinäide

```text
/export
  -> Copy to Clipboard
  -> Save to File
```

See ei ole programmeerimiskeel, vaid töövoo nipp: vestlus ise muutub failiks, mida saab hiljem kasutada uue töö sisendina.

### Päriselu analoogia

See on nagu koosoleku märkmik. Kui jutt läheb pikaks, ei hoia kõike peas, vaid paned kirja ja avad hiljem uuesti.

<a id="skill-transkript-oppematerjal-muudab-vtt-failid-oppematerjalideks"></a>
## `skill-transkript-oppematerjal` muudab VTT failid õppematerjalideks - `0:03:09`

Õpetaja näitab selles videos just sedasama protsessi, mida sa praegu minult palud: VTT transkriptist tehakse struktureeritud õppematerjal.

### Selgitus

Oluline idee on, et toortranskript ei ole veel hea õppematerjal. Zoomi VTT:

- on OCR-vigadega
- on pikk
- ei ole teemaplokkideks lahti võetud

Skill teeb sellest hoopis parema tööriista:

- lisab sisukorra
- märgib ajatemplid
- koondab teemad
- seob need koodibaasi näidetega

### Skeem

```text
VTT transkript
  -> skill loeb faili
      -> tuvastab teemad
          -> lisab ajad ja lingid
              -> salvestab docs/transcript-materials
```

### Koodinäide

Repo enda skill ütleb selle väga otse:

```md
name: skill-transkript-oppematerjal
description: Loo algajasõbralik õppematerjal eesti keeles video transkriptist ja salvesta docs/transcript-materials kausta.
```

Ja tulemuse kuju on näha olemasolevates materjalides:

```md
## Sisukord

- [Teema nimi](#teema-nimi) - `0:05:30`
```

### Päriselu analoogia

See on nagu toorest loengusalvestusest tehakse korralik konspekt koos peatükkide ja järjehoidjatega.

<a id="feb-7-catch-up-skill-otsib-opetaja-haru-ja-teeb-uue-versiooniharuna"></a>
## `FEB-7` catch-up skill otsib õpetaja haru ja teeb uue versiooniharuna - `0:16:23`

Selles kohas tutvustab õpetaja veel üht skill’i, mis aitab õpilase feature branch’i õpetaja koodiga samale tasemele viia.

### Selgitus

Siin on oluline aru saada, et skill ei ole lihtsalt "kirjeldusega fail". Hea skill kirjeldab täpset tööjärjekorda:

- tuvasta praegune branch
- leia õpetaja vastav branch sama taski numbriga
- loo uus versiooniga branch
- tee checkout õigesse kohta

Video näites kasutatakse OCR-i tõttu kuju `rainu veeb seitse`, aga mõte on `FEB-7`.

### Skeem

```text
õpilase branch
  -> leia sama taski õpetaja branch
      -> loo uus versiooniharu
          -> jätka puhta põhjaga
```

### Koodinäide

`.claude/skills/skill-git-catch-up-feature-branch/SKILL.md` kirjeldab selle nii:

```md
### 4. Otsi õpetaja remote arenduse haru
- Käivita `git branch -r`
- Otsi harud, mis algavad `origin/OPETAJA`
- Leia see, mille Jira number klapib õpilase haruga

### 5. Loo uus haru õpetaja harult
- Kui vanal harunimel pole versiooni numbrit -> lisa `-v2`
- Kui on juba `-v2` -> suurenda numbrit
```

### Päriselu analoogia

See on nagu võtad vana vihiku, aga enne uue peatüki alustamist kopeerid õpetaja värske mustri ja paned enda töö sellest puhtast variandist edasi.

<a id="loginviewlogin-algab-nupust-ja-kutsub-meetodeid-labi-this"></a>
## `LoginView.login()` algab nupust ja kutsub meetodeid läbi `this` - `0:25:56`

Siit läheb video tagasi rakenduse põhifookusesse: `LoginView` login-loogika.

### Selgitus

Õpetaja tuletab meelde kaks olulist asja:

- tegevus algab nupu klikist
- meetodibloki sees olevatele abimeetoditele viidatakse `this` kaudu

Miks `this` on vajalik? Sest see ütleb Vue komponendile: "otsi see meetod või muutuja sellest samast komponendist".

### Skeem

```text
button @click="login"
  -> login()
      -> this.resetErrorMessage()
      -> kontrollid
      -> päring või veateade
```

### Koodinäide

```js
login() {
  this.startSpinner()
  this.resetErrorMessage()
  if (this.allFormFieldsAreCorrect()) {
    LoginService.sendGetLoginRequest(this.username, this.password)
      .then((response) => this.handleLoginResponse(response))
      .catch((error) => this.handleLoginError(error))
      .finally(() => this.stopSpinner())
  } else {
    this.errorMessage = 'Täida kõik väljad'
    this.stopSpinner()
  }
}
```

See on hea näide sellest, et meetod ei ela üksinda. Ta orkestreerib teisi nimetatud samme.

### Päriselu analoogia

See on nagu köögis pealik ütleb: "alusta taimer, võta vana silt ära, kontrolli koostisosad, siis kas küpseta või näita viga".

<a id="query-parameetrid-peavad-sobima-tapselt-serveri-ootusega"></a>
## Query parameetrid peavad sobima täpselt serveri ootusega - `0:28:45`

Õpetaja joonistab välja, et päring peab sobituma backendi ootusega nagu pusletükk.

### Selgitus

Kui backend ootab võtmeid `username` ja `password`, siis frontend ei saa suvaliselt panna:

- `user`
- `name`
- `pwd`

Kokkulepe peab klappima täpselt. Muidu server ei tea, mida sa talle andsid.

### Skeem

```text
frontend saadab:
  username=...
  password=...

backend ootab:
  username
  password

ainult täpne kattuvus töötab
```

### Koodinäide

`src/services/LoginService.js` hoiab selle kokkuleppe selgelt välja kirjutatuna:

```js
params: {
  username: username,
  password: password,
}
```

See ongi API leping väiksel kujul.

### Päriselu analoogia

See on nagu vormil on väljad "eesnimi" ja "perekonnanimi". Kui kirjutad mõlemad lihtsalt lahtrisse "midagi", ei saa registratuur aru.

<a id="responsedata-ja-localstorage-seovad-serveri-vastuse-brauseri-olekuga"></a>
## `response.data` ja `localStorage` seovad serveri vastuse brauseri olekuga - `0:31:37`

Kui login õnnestub, ei piisa ainult sellest, et "saime vastuse". Vastuse sisu tuleb kuhugi tallele panna.

### Selgitus

Siin juhtub kaks erinevat asja:

- vastuse kasulik osa võetakse `response.data` seest
- vajalikud väljad salvestatakse brauseri `localStorage`-isse

Video rõhutab ka seda, et `localStorage` hoiab väärtusi tekstina. Kui vajad hiljem numbrit, tuleb see ümber teisendada.

### Skeem

```text
response
  -> data
      -> userId
      -> roleName

need salvestatakse
  -> localStorage
```

### Koodinäide

```js
async handleLoginResponse(response) {
  this.loginResponse = response.data
  localStorage.setItem('userId', this.loginResponse.userId)
  localStorage.setItem('roleName', this.loginResponse.roleName)
  this.$emit('event-user-logged-in')
  NavigationService.navigateToAtmsView()
}
```

See meetod mitte ainult ei loe vastust, vaid valmistab rakenduse järgmisteks sammudeks ette.

### Päriselu analoogia

See on nagu saad vastuskirja kätte, võtad sealt olulise numbri välja ja kirjutad selle märkmikku, et hiljem uuesti otsima ei peaks.

<a id="errorresponsedata-on-sugavam-objekt-ja-vajab-eraldi-mudelit"></a>
## `error.response.data` on sügavam objekt ja vajab eraldi mudelit - `0:50:21`

Video üks hea koht on see, kus õnnestunud vastust võrreldakse error-vastusega.

### Selgitus

Õnnestunud vastus on lihtsam:

- `response.data`

Error on sügavam:

- `error.response.data`

Seepärast tehakse `data()` sisse eraldi `errorResponse` mudel. See annab kaks kasu:

- koodist on kohe näha, milliseid välju me ootame
- hiljem on mugavam kasutada `message` ja `errorCode` välju

### Skeem

```text
hea vastus:
response
  -> data

vea vastus:
error
  -> response
      -> data
```

### Koodinäide

```js
data() {
  return {
    errorResponse: {
      message: '',
      errorCode: 0,
    },
  }
}
```

```js
handleLoginError(error) {
  const statusNumber = error.response.status
  this.errorResponse = error.response.data
}
```

See on väikese mudeli väärtus: sa ei toimetada "anonüümse mudruga", vaid tead, mis kujuga objekti kasutad.

### Päriselu analoogia

See on nagu ümbrikust ei võta lihtsalt "mingit paberit", vaid tead, et sees on kaks kindlat asja: sõnum ja veakood.

<a id="403--errorcode-111-tahendab-kuva-backendist-tulnud-veateade"></a>
## `403` + `errorCode 111` tähendab: kuva backendist tulnud veateade - `1:03:12`

Õpetaja näitab, et kõik vead ei ole võrdsed.

### Selgitus

Kui backend ütleb:

- HTTP staatus on `403`
- ja `errorCode` on `111`

siis on see meie jaoks tuntud äriloogiline olukord: vale kasutajanimi või parool. Seda ei pea peitma üldise vealehe taha. Seda võib näidata otse vormi juures.

Kõik muud vead on tundmatumad ja need suunatakse eraldi error-vaatesse.

### Skeem

```text
if status === 403 and errorCode === 111
  -> näita alerti sees message
else
  -> navigeeri error-vaatesse
```

### Koodinäide

```js
handleLoginError(error) {
  const statusNumber = error.response.status
  this.errorResponse = error.response.data

  if (statusNumber === 403 && this.errorResponse.errorCode === 111) {
    this.errorMessage = this.errorResponse.message
  } else {
    NavigationService.navigateToErrorView()
  }
}
```

### Päriselu analoogia

See on nagu uksehoidja teeb vahet, kas sul on lihtsalt vale pilet või terve süsteem on maas. Need ei ole sama tüüpi probleemid.

<a id="prefer-header-lubab-stoplightiga-erinevaid-vastuseid-teeselda"></a>
## `Prefer` header lubab Stoplightiga erinevaid vastuseid teeselda - `1:09:27`

Siin tuleb mängu väga kasulik arendusnipp: päris backend ei pea veel valmis olema, et frontend saaks eri olukordi läbi mängida.

### Selgitus

Stoplighti mock server oskab vastata erinevalt, kui sõnumiga pannakse kaasa spetsiaalne `header`. Video mõte ei ole see, et see jääks päris süsteemi lõplikuks lahenduseks, vaid see:

- frontend saab error-handlingu valmis teha juba varem
- sama endpoint saab anda mitut tüüpi näidisvastuseid
- arendaja saab teadlikult testida nii edu kui vea haru

### Skeem

```text
frontend request
  + Prefer header
      -> Stoplight loeb soovi
          -> tagastab soovitud näitevastuse
```

### Koodinäide

```js
sendGetLoginRequest(username, password) {
  return axios.get('/api/login', {
    headers: { Prefer: this.getPreferValue(username) },
    params: {
      username: username,
      password: password,
    },
  })
}
```

Ja näidiskontroll:

```js
getPreferValue(username) {
  switch (username) {
    case 'admin':
      return 'code=200, example=admin'
    case 'error':
      return 'code=403, example=error'
    default:
      return 'code=200, example=rain'
  }
}
```

### Päriselu analoogia

See on nagu ütled teenindajale ette, millist teststsenaariumi sa praegu harjutada tahad: tavalist teenindust või veasituatsiooni.

<a id="pikk-meetod-tuleb-tukeldada-nimelisteks-tegevusteks"></a>
## Pikk meetod tuleb tükeldada nimelisteks tegevusteks - `1:15:43`

Õpetaja üks tugevamaid sõnumeid on siin, et meetod peab olema loetav nagu lugu.

### Selgitus

Kui üks meetod sisaldab liiga palju samme, siis lugeja näeb ainult müra:

- kontrollid
- võrreldavad väärtused
- navigeerimine
- storage
- error-handling

Lahendus ei ole rohkem kommentaare, vaid paremad meetodipiirid. Kui tahad kommenteerida "siin saadame sõnumi" või "siin töötleme vastust", siis see on signaal, et sellest võiks saada eraldi meetod.

### Skeem

```text
halb:
  üks pikk meetod
    -> kõik detailid segamini

hea:
  login()
    -> resetErrorMessage()
    -> allFormFieldsAreCorrect()
    -> handleLoginResponse()
    -> handleLoginError()
```

### Koodinäide

Praegune `LoginView.vue` on juba selle mõtte tulemus:

```js
login() {
  this.startSpinner()
  this.resetErrorMessage()
  if (this.allFormFieldsAreCorrect()) {
    LoginService.sendGetLoginRequest(this.username, this.password)
      .then((response) => this.handleLoginResponse(response))
      .catch((error) => this.handleLoginError(error))
      .finally(() => this.stopSpinner())
  } else {
    this.errorMessage = 'Täida kõik väljad'
    this.stopSpinner()
  }
}
```

See meetod ei seleta kõiki detaile ise lahti. Ta juhib töövoogu.

### Päriselu analoogia

See on nagu peatükkidega raamat. Kui kõik lõigud on ühes plokis, on jutt loetav ainult autorile endale.

<a id="loginservice-eraldab-sonumi-saatmise-vaate-loogikast"></a>
## `LoginService` eraldab sõnumi saatmise vaate loogikast - `1:32:07`

Video selles osas viiakse päringu saatmine `LoginView` seest eraldi teenusefaili.

### Selgitus

Miks see on hea?

- vaatefailis on vähem tehnilist müra
- päringu detailid elavad ühes kohas
- sama teenust saab hiljem kasutada ka mujalt

View peaks peamiselt teadma:

- millal päring käivitada
- mida teha õnnestumisel
- mida teha vea korral

Teenusefail peaks teadma:

- milline URL
- millised parameetrid
- millised headerid

### Skeem

```text
LoginView
  -> kutsub teenust

LoginService
  -> ehitab axios requesti
      -> tagastab promise'i
```

### Koodinäide

```js
import LoginService from '@/services/LoginService.js'

LoginService.sendGetLoginRequest(this.username, this.password)
```

Teenuse enda sisu:

```js
import axios from 'axios'

export default {
  sendGetLoginRequest(username, password) {
    return axios.get('/api/login', {
      headers: { Prefer: this.getPreferValue(username) },
      params: {
        username: username,
        password: password,
      },
    })
  },
}
```

### Päriselu analoogia

See on nagu müüja ei jookse ise lattu riiuleid ehitama. Tema esitab tellimuse, lao süsteem teab tehnilisi detaile.

<a id="parameetrid-on-sildid-mille-kaudu-teenus-saab-valjast-infot"></a>
## Parameetrid on sildid, mille kaudu teenus saab väljast infot - `1:46:47`

Õpetaja peatub siin pikemalt ühel algajatele väga tähtsal hetkel: teenusemeetod ei näe automaatselt `LoginView` andmeid.

### Selgitus

`LoginService.sendGetLoginRequest()` ei tea midagi sellest, et kuskil teises failis on:

- `this.username`
- `this.password`

Kui tahad, et teenus saaks neid kasutada, pead need käivitamisel kaasa andma. Selleks on parameetrid.

Parameeter on siin justkui nimeline silt:

- vasakul meetodi definitsioonis `username`
- paremal väljakutsumisel konkreetne väärtus

### Skeem

```text
LoginView teab väärtusi
  -> annab need kaasa
      -> LoginService võtab vastu parameetritena
          -> kasutab requestis
```

### Koodinäide

```js
sendGetLoginRequest(username, password) {
  return axios.get('/api/login', {
    params: {
      username: username,
      password: password,
    },
  })
}
```

Ja väljakutse:

```js
LoginService.sendGetLoginRequest(this.username, this.password)
```

### Päriselu analoogia

See on nagu kuller ei tea ise, kuhu pakk viia. Aadress tuleb talle kaasa anda.

<a id="java-ja-javascripti-meetodistruktuur-selgitab-nime-sisendi-ja-tagastuse-rolli"></a>
## Java ja JavaScripti meetodistruktuur selgitab nime, sisendi ja tagastuse rolli - `1:49:02`

Video teeb siin väikese, aga kasuliku kõrvalepõike meetodite üldisesse ehitusse.

### Selgitus

Mõte on see, et kui saad aru meetodi põhiosadest, siis on lihtsam mõista nii teenusefaile kui Vue komponente:

- nimi ütleb, mida tegevus teeb
- parameetrid toovad sisse välise info
- `return` annab tulemuse tagasi

See aitab aru saada, miks `LoginService` ei saa `LoginView` sisust "niisama teada".

### Skeem

```text
meetod
  -> nimi
  -> parameetrid
  -> sisu
  -> tagastus
```

### Koodinäide

Repo olemasolev teooriafail sõnastab selle lühidalt:

```js
const liidaArvud = (a, b) => {
  return a + b
}
```

Ja sama Vue kontekstis:

```js
allFormFieldsAreCorrect() {
  return this.username && this.password
}
```

Esimene näitab üldist meetodi kuju. Teine näitab sama mõtet päris projektis.

### Päriselu analoogia

See on nagu retsept: nimi on "küpseta kook", sisendid on jahu ja munad, väljund on valmis kook.

<a id="spinner-vajab-head-boolean-nime-v-if-paari-ja-oiget-lopetamiskohta"></a>
## Spinner vajab head boolean-nime, `v-if` paari ja õiget lõpetamiskohta - `2:21:55`

Video lõpuosa keskendub visuaalsele tagasisidele.

### Selgitus

Siin on mitu väikest, aga tähtsat mõtet:

- boolean-muutuja nimi võiks olla väitena loetav
- spinneri nupp ja tavaline nupp peaksid moodustama `v-if` / `v-else` paari
- spinner tuleb ka vea korral kinni panna

Transkriptis mõeldakse nimede üle palju. Praeguses koodis on valitud `showSpinner`, mis loeb hästi:

- kui `true`, siis näita spinnerit
- kui `false`, siis näita tavalist login-nuppu

### Skeem

```text
klikid login
  -> startSpinner()
      -> showSpinner = true
          -> kuvatakse spinneri nupp

request lõpeb
  -> stopSpinner()
      -> showSpinner = false
          -> kuvatakse tavaline nupp
```

### Koodinäide

Template:

```vue
<button v-if="showSpinner" class="btn btn-primary" type="button" disabled>
  <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
  <span role="status">Login sisse...</span>
</button>
<button v-else @click="login" type="submit" class="btn btn-outline-secondary">
  Login
</button>
```

Meetodid:

```js
startSpinner() {
  this.showSpinner = true
},

stopSpinner() {
  this.showSpinner = false
},
```

Ja kasutus:

```js
.finally(() => this.stopSpinner())
```

### Päriselu analoogia

See on nagu teenindusleti kohal süttib "Töötlen..." silt ainult siis, kui töö päriselt käib, ja kustub siis, kui klient saab uuesti midagi teha.
