## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/cefItO6Bx60uONN9VupAh4DmGj46GJsADMsbUu59ItbZQpWvhnO4mCGQ4uNey1Q0.iogCQ6FBSJ3L2jeR?startTime=1776335326000) |
| **Parool** | `D6dexQH@` |
| **Transkript** | [GMT20260416-102846-v-2.vtt](../transcripts/GMT20260416-102846-v-2.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu ja mitu tehnilist terminit on kohati loetud valesti. Näiteks esineb kohati `Cloud`, kuigi kontekst ütleb, et jutt käib tõenäoliselt `Claude`-ist. Samuti võivad `property`, `return`, `value`, `checked`, `props`, `render` ja muud JavaScripti või Vue terminid olla kohati moondunud.

Selles õppematerjalis kasutan tavapäraseid termineid ja sõnastan näited algajasõbralikult ümber.

Selles videos otseseid taskikoode stiilis `FE-124` või `BEB-7` ei tuvastanud.

Kuna videos vahelduvad tavaline HTML/JavaScript ja Vue raamistik, kasutan siin kahte tüüpi näiteid:

- lihtsad HTML/JavaScript näited seal, kus õpetaja teeb asju otse `script` tag'is
- päris näited selle repo Vue failidest, kui mõte on sama

## Sisukord

- [JavaScriptis on objektid olemas ka ilma klassikalise OOP-ita](#javascriptis-on-objektid-olemas-ka-ilma-klassikalise-oop-ita) - `0:00:14`
- [`new Object()` loob tühja objekti, aga see pole peamine töövõte](#new-object-loob-tuhja-objekti-aga-see-pole-peamine-toovoite) - `0:00:50`
- [Objektliteraal `{}` on tänapäevane ja mugav kirjaviis](#objektliteraal-on-tanapaevane-ja-mugav-kirjaviis) - `0:05:14`
- [`key: value` ja pesastatud objektid on JavaScripti baas](#key-value-ja-pesastatud-objektid-on-javascripti-baas) - `0:11:18`
- [Brauser loeb skripti ülevalt alla ning funktsioonidel on oma leping](#brauser-loeb-skripti-ulevalt-alla-ning-funktsioonidel-on-oma-leping) - `0:13:22`
- [Funktsioon peab olema defineeritud enne, kui selle saad nupu külge siduda](#funktsioon-peab-olema-defineeritud-enne-kui-selle-saad-nupu-kulge-siduda) - `0:22:36`
- [Arenda väikeste sammudega ja kasuta IDE otseteid enda kasuks](#arenda-vaikeste-sammudega-ja-kasuta-ide-otseteid-enda-kasuks) - `0:27:44`
- [`document.getElementById(...)` tagastab elemendi, mitte kohe selle sisu](#document-getelementbyid-tagastab-elemendi-mitte-kohe-selle-sisu) - `0:35:14`
- [`value` ja `checked` sõltuvad sellest, mis tüüpi element sul käes on](#value-ja-checked-soltuvad-sellest-mis-tuupi-element-sul-kaes-on) - `0:39:00`
- [Kui meetod tagastab midagi, pane see muutujasse](#kui-meetod-tagastab-midagi-pane-see-muutujasse) - `0:42:34`
- [Raamistik ja AI lihtsustavad kirjutamist, aga peidavad keerukust](#raamistik-ja-ai-lihtsustavad-kirjutamist-aga-peidavad-keerukust) - `1:01:51`
- [Vormiandmetest saab kokku panna ühe kliendiobjekti](#vormiandmetest-saab-kokku-panna-uhe-kliendiobjekti) - `1:10:03`
- [`label for` parandab nii klikitavust kui ligipääsetavust](#label-for-parandab-nii-klikitavust-kui-ligipaasetavust) - `1:16:02`
- [JSON on JavaScripti objektikirjelduse tekstiline sugulane](#json-on-javascripti-objektikirjelduse-tekstiline-sugulane) - `1:28:01`
- [Single Page Application kasutab üht `index.html` faili ja palju dünaamilist sisu](#single-page-application-kasutab-uht-indexhtml-faili-ja-palju-dunaamilist-sisu) - `2:22:17`
- [Küsimärk URL-is lõpetab raja ja alustab query parameetreid](#kusimark-url-is-lopetab-raja-ja-alustab-query-parameetreid) - `2:25:15`
- [Frontend toob ressursse asünkroonselt ja ehitab lehe andmete pealt kokku](#frontend-toob-ressursse-asunkroonselt-ja-ehitab-lehe-andmete-pealt-kokku) - `2:35:25`
- [`props`-id ja andmevoog liiguvad Vue's ülevalt alla](#props-id-ja-andmevoog-liiguvad-vues-ulevalt-alla) - `2:50:09`

<a id="javascriptis-on-objektid-olemas-ka-ilma-klassikalise-oop-ita"></a>
## JavaScriptis on objektid olemas ka ilma klassikalise OOP-ita - `0:00:14`

Video algus teeb kohe ühe tähtsa täpsustuse: JavaScript ei käitu täpselt nagu Java, aga see ei tähenda, et objekte ei oleks.

### Selgitus

Õpetaja põhisõnum on lihtne:

- andmed on tihti objektid
- objektil on väljad ehk omadused
- objekt võib kirjeldada päris maailma asja, näiteks klienti või õpilast

See on algajale oluline, sest hiljem JSON, DOM, Vue komponendi andmed ja API vastused kasutavad kõik sama põhimõtet: üks suurem asi sisaldab nimega andmevälju.

### Skeem

```text
customer
  |
  +-- firstName
  +-- lastName
  +-- age
```

### Koodinäide

```js
const customer = {
  firstName: 'Rain',
  lastName: 'Tuur',
  age: 20,
}
```

### Päriselu analoogia

Objekt on nagu kliendikaart. Kaart ise on üks asi, aga selle sees on mitu lahtrit: eesnimi, perekonnanimi, vanus ja nii edasi.

<a id="new-object-loob-tuhja-objekti-aga-see-pole-peamine-toovoite"></a>
## `new Object()` loob tühja objekti, aga see pole peamine töövõte - `0:00:50`

Alguses näidatakse ka vanemat või robustsemat viisi, kuidas JavaScriptis objekt luua.

### Selgitus

Sa võid teha nii:

- luua kõigepealt tühja objekti
- lisada sinna väljad hiljem ükshaaval

See töötab, aga on tavaliselt kohmakam kui objekt kohe ühe korraga kirja panna.

### Skeem

```text
1. loo tühi objekt
2. lisa omadus
3. lisa veel omadus
```

### Koodinäide

```js
const customer = new Object()
customer.firstName = 'Rain'
customer.lastName = 'Tuur'
```

### Päriselu analoogia

See on nagu võtad tühja ankeedi ja täidad lahtrid hiljem ükshaaval. Saab küll, aga vahel on mugavam kogu struktuur kohe korraga välja kirjutada.

<a id="objektliteraal-on-tanapaevane-ja-mugav-kirjaviis"></a>
## Objektliteraal `{}` on tänapäevane ja mugav kirjaviis - `0:05:14`

Siin jõuab video JavaScripti ühe põhilise töövahendi juurde: objektliteraal.

### Selgitus

Objektliteraal tähendab, et kirjutad objekti otse välja loogeliste sulgude sees. See on tavaliselt:

- lühem
- loetavam
- kiirem aru saada

Õpetaja rõhutab, et see on JavaScriptis eelistatud viis, kui tead objekti struktuuri kohe ette.

### Skeem

```text
const customer = {
  võti: väärtus,
  võti: väärtus
}
```

### Koodinäide

```js
const customer = {
  firstName: 'Rain',
  lastName: 'Tuur',
}
```

### Päriselu analoogia

See on nagu täidad kliendikaardi ühe istumisega, mitte ei lisa iga välja hiljem eraldi.

<a id="key-value-ja-pesastatud-objektid-on-javascripti-baas"></a>
## `key: value` ja pesastatud objektid on JavaScripti baas - `0:11:18`

Video üks tähtsamaid süntaksikohti on siin: kuidas objektis väljad kirjutatakse.

### Selgitus

JavaScripti objekti sees kehtib muster:

- vasakul on võti ehk välja nimi
- paremal on väärtus
- väljad eraldatakse komadega

Lisaks võib väärtus ise olla omakorda uus objekt. Seda nimetatakse pesastatud objektiks.

### Skeem

```text
customer
  +-- firstName: 'Rain'
  +-- drivingLicense
      +-- expires: '2027-10-01'
```

### Koodinäide

```js
const customer = {
  firstName: 'Rain',
  drivingLicense: {
    expires: '2027-10-01',
  },
}
```

### Päriselu analoogia

See on nagu kaust kausta sees. Põhikaust on klient, selle sees on alamkaust juhiloa andmetega.

<a id="brauser-loeb-skripti-ulevalt-alla-ning-funktsioonidel-on-oma-leping"></a>
## Brauser loeb skripti ülevalt alla ning funktsioonidel on oma leping - `0:13:22`

Selles osas seotakse kokku kaks suurt mõtet: JavaScripti kood jookseb brauseris ülevalt alla ning funktsioonid ei tohi "valetada".

### Selgitus

Põhipunktid on:

- brauser loeb `script` ploki ülevalt alla
- kui jõuab käsuni, võib see kohe käivituda
- funktsioon võib tagastada väärtuse või mitte
- kui funktsioon lubab midagi tagastada, siis see peabki seda tegema

Õpetaja seob selle Java näitega: kui meetod on defineeritud nii, et ta peab andma näiteks `String`-i, siis see on leping. Kood ei tohi öelda üht ja teha teist.

### Skeem

```text
script
  -> rida 1
  -> rida 2
  -> rida 3

funktsioon:
  nimi
  sisend
  tegevus
  return või mitte
```

### Koodinäide

Lihtne näide sisseehitatud brauserifunktsioonist:

```js
alert('Tere, maailm')
```

Ja näide tagastavast funktsioonist:

```js
function getGreeting() {
  return 'Tere'
}
```

### Päriselu analoogia

Kui keegi ütleb sulle "ma toon sulle tassi kohvi", siis see on lubadus. Kui ta tuleb tagasi tühjade kätega, siis jutt ja tegu ei lähe kokku.

<a id="funktsioon-peab-olema-defineeritud-enne-kui-selle-saad-nupu-kulge-siduda"></a>
## Funktsioon peab olema defineeritud enne, kui selle saad nupu külge siduda - `0:22:36`

Video liigub siit praktilise HTML/JavaScript näite juurde: kuidas panna nupp käivitama mingit tegevust.

### Selgitus

Oluline loogika on:

- nupu `onclick`-laadne sündmus tahab teada, mida käivitada
- käivitatav funktsioon peab enne olemas olema
- nupp ei "tee ise midagi", kui sa pole talle tegevust andnud

See õpetab head mõtlemist: UI element on trigger, aga päris töö on tavaliselt funktsioonis.

### Skeem

```text
nupp
  -> click
      -> funktsioon
          -> tegevus
```

### Koodinäide

Tänapäevases Vue kujus näeb sama mõte välja nii:

```vue
<button @click="login" type="submit">Login</button>
```

Ja selle taga peab päriselt eksisteerima meetod:

```js
methods: {
  login() {
    // tee midagi
  },
}
```

### Päriselu analoogia

Nupp on nagu uksekell. Kui juhtmed pole kuhugi ühendatud, siis vajutamine ei tee midagi.

<a id="arenda-vaikeste-sammudega-ja-kasuta-ide-otseteid-enda-kasuks"></a>
## Arenda väikeste sammudega ja kasuta IDE otseteid enda kasuks - `0:27:44`

See on videos väga praktiline tööhügieeni teema.

### Selgitus

Õpetaja rõhutab, et alguses ei tasu kirjutada "kogu lahendust korraga valmis". Mõistlikum on:

- teha väike jupp
- kontrollida, kas see töötab
- alles siis ehitada järgmine jupp peale

Lisaks näidatakse, et IDE otseteed aitavad:

- sulud kiiremini sulgeda
- read puhtamalt vormistada
- vigu vähem teha

### Skeem

```text
väike samm
  -> kontrolli
      -> järgmine samm
          -> kontrolli
```

### Koodinäide

Sama mõtet näeb ka repo `login()` meetodis:

```js
login() {
  this.resetErrorMessage()

  if (this.allFormFieldsAreCorrect()) {
    // alles siis teeb järgmise sammu
  } else {
    this.errorMessage = 'Täida kõik väljad'
  }
}
```

Kõigepealt puhastatakse vana viga, siis kontrollitakse vormi, siis alles minnakse edasi.

### Päriselu analoogia

See on nagu maja ehitamine korrus korruse haaval. Kui vundament lonkab, ei ole mõtet kohe katust peale panna.

<a id="document-getelementbyid-tagastab-elemendi-mitte-kohe-selle-sisu"></a>
## `document.getElementById(...)` tagastab elemendi, mitte kohe selle sisu - `0:35:14`

See on video üks kõige tähtsamaid DOM-i mõtteid.

### Selgitus

Kui kirjutad `document.getElementById('firstName')`, siis sa ei saa kohe kätte ainult nime teksti. Sa saad kätte terve HTML elemendi objekti.

See tähendab:

- saad viite konkreetsele elemendile
- alles siis pead valima, millist omadust sellest elemendist tahad
- näiteks `value`, `checked`, `id` või midagi muud

### Skeem

```text
document
  -> getElementById('firstName')
      -> HTML element
          -> selle omadused
```

### Koodinäide

Lihtne puhas JavaScripti näide:

```js
const firstNameInput = document.getElementById('firstName')
```

Sellest hetkest alates on sul käes element, mitte veel selle sees olev sisestatud tekst.

### Päriselu analoogia

See on nagu võtad riiulist terve karbi. Alles pärast karbi kättesaamist otsustad, kas tahad sealt seest ühte paberit, pliiatsit või midagi muud.

<a id="value-ja-checked-soltuvad-sellest-mis-tuupi-element-sul-kaes-on"></a>
## `value` ja `checked` sõltuvad sellest, mis tüüpi element sul käes on - `0:39:00`

Pärast elemendi kättesaamist tuleb järgmine samm: kuidas selle seest õige info välja võtta.

### Selgitus

Kõikidel HTML elementidel ei ole samad omadused:

- tekstiväljal on tihti `value`
- checkboxil on eriti oluline `checked`

Seega ei tohi eeldada, et `getElementById(...)` annab sulle alati kohe sama tüüpi sisu.

### Skeem

```text
input type="text"
  -> value

input type="checkbox"
  -> checked
```

### Koodinäide

```js
const firstName = document.getElementById('firstName').value
const acceptedTerms = document.getElementById('conditionsCheck').checked
```

### Päriselu analoogia

Kui sul on käes raamat ja lamp, siis mõlemalt ei küsi sama asja. Raamatu puhul huvitab sisu, lambi puhul kas see põleb või mitte.

<a id="kui-meetod-tagastab-midagi-pane-see-muutujasse"></a>
## Kui meetod tagastab midagi, pane see muutujasse - `0:42:34`

See on sama põhimõte, mida õpetaja rõhutas ka eelmises videos, ja siin tuuakse see DOM näitega uuesti välja.

### Selgitus

Kui meetod või funktsioon tagastab mingi objekti või väärtuse ja sa tahad sellega veel edasi töötada, siis:

- seo see nimega
- ära jäta tulemust "õhku rippuma"

Muidu saad küll midagi kätte, aga sul pole enam millegagi edasi suhelda.

### Skeem

```text
meetod kutsub
  -> tagastus tuleb tagasi
      -> pane muutujasse
          -> kasuta edasi
```

### Koodinäide

```js
const inputElement = document.getElementById('firstName')
const firstName = inputElement.value
```

Ja sama mõte repo koodis:

```js
this.loginResponse = response.data
```

Siin ei jäeta API vastust lihtsalt õhku. Vastus seotakse nimega, et seda saaks järgmistes ridades kasutada.

### Päriselu analoogia

Kui kuller toob paki ja sa tahad seda hiljem kasutada, siis võtad selle vastu ja paned kindlasse kohta. Sa ei lase tal lihtsalt käest läbi libiseda.

<a id="raamistik-ja-ai-lihtsustavad-kirjutamist-aga-peidavad-keerukust"></a>
## Raamistik ja AI lihtsustavad kirjutamist, aga peidavad keerukust - `1:01:51`

Siin tuleb hästi küps arendajamõte: abstraktsioon aitab, aga võib ka segada, kui alusloogika pole selge.

### Selgitus

Raamistikud ja AI tööriistad:

- lubavad vähem koodi kirjutada
- teevad asju mugavamaks
- peidavad tehnilist keerukust kuhugi taustale

See on kasulik, aga algaja jaoks ohtlik siis, kui ta enam ei saa aru, mida süsteem all tegelikult teeb.

### Skeem

```text
toores tehniline töö
  -> raamistik lihtsustab
  -> AI lihtsustab
      ->
kirjutad vähem
aga pead mõistma rohkem
```

### Koodinäide

Vue näide repo põhjal:

```js
const app = createApp(App)
app.use(router)
app.mount('#app')
```

See on lühike, aga taustal juhtub palju. Just seepärast on kasulik enne aru saada, mis on `index.html`, mis on `App.vue` ja kuhu rakendus üldse "sisse läheb".

### Päriselu analoogia

See on nagu automaatkäigukastiga auto. Sõita on mugavam, aga juhil tasub ikka aru saada, mis pidur, rool ja mootor teevad.

<a id="vormiandmetest-saab-kokku-panna-uhe-kliendiobjekti"></a>
## Vormiandmetest saab kokku panna ühe kliendiobjekti - `1:10:03`

See on video üks praktilisemaid osi: DOM-ist loetud väärtused pannakse kokku üheks objektiks.

### Selgitus

Loogika on:

- leia vajalikud inputid ID järgi üles
- võta neist õiged väärtused
- pane need ühe objekti väljadeks

Nii liigud üksikutest kastidest struktureeritud andmete poole.

### Skeem

```text
input 1 -> firstName
input 2 -> lastName
input 3 -> age
        ->
customer objekt
```

### Koodinäide

```js
const customer = {
  firstName: document.getElementById('firstName').value,
  lastName: document.getElementById('lastName').value,
  age: document.getElementById('age').value,
}
```

Vue versioonis teeb sama töö `v-model` sinu eest elegantsemalt:

```vue
<input v-model="username" type="text" id="inputUsername" />
```

### Päriselu analoogia

See on nagu võtad kolmest erinevast paberivormist andmed ja täidad nende põhjal ühe ametliku kliendikaardi.

<a id="label-for-parandab-nii-klikitavust-kui-ligipaasetavust"></a>
## `label for` parandab nii klikitavust kui ligipääsetavust - `1:16:02`

See on väike HTML detail, mille mõju on palju suurem, kui alguses paistab.

### Selgitus

Kui `label` ja `input` on omavahel seotud:

- saab kasutaja klõpsata ka tekstil, mitte ainult väikesel kastil
- fookus liigub õigesse sisendisse
- ekraanilugejad saavad seosest paremini aru

See teeb vormi mugavamaks ja korrektsemaks.

### Skeem

```text
label for="inputUsername"
          |
          +-- input id="inputUsername"
```

### Koodinäide

Repo `LoginView.vue` kasutab seda õigesti:

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

See on nagu lüliti ja silt seinal. Kui silt on õige lülitiga seotud, saab inimene kohe aru, mida ta parajasti vajutab.

<a id="json-on-javascripti-objektikirjelduse-tekstiline-sugulane"></a>
## JSON on JavaScripti objektikirjelduse tekstiline sugulane - `1:28:01`

Video toob hästi välja, miks JSON üldse nii loomulik välja näeb.

### Selgitus

JSON tähendab `JavaScript Object Notation`. Mõte on:

- võtta JavaScripti objektikirjelduse loogika
- kasutada seda andmete vahetamisel tekstivormis

See meenutab JavaScripti objekti, aga pole täpselt sama. Näiteks JSON-is on võtmed jutumärkides.

### Skeem

```text
JavaScript objekt:
{ firstName: 'Rain' }

JSON:
{ "firstName": "Rain" }
```

### Koodinäide

Lihtne JSON näide:

```json
{
  "firstName": "Rain",
  "lastName": "Tuur"
}
```

Ja JavaScriptis saab objekti JSON-iks muuta näiteks nii:

```js
JSON.stringify(customer)
```

### Päriselu analoogia

See on nagu täidad sama info ümber ametlikku vormingusse, mida eri süsteemid oskavad omavahel vahetada.

<a id="single-page-application-kasutab-uht-indexhtml-faili-ja-palju-dunaamilist-sisu"></a>
## Single Page Application kasutab üht `index.html` faili ja palju dünaamilist sisu - `2:22:17`

Siin jõuab video Vue ja tänapäevase frontend-arhitektuuri keskse ideeni.

### Selgitus

Single Page Application ehk SPA mõte on:

- rakendusel on üks põhiline HTML sisenemispunkt
- ülejäänud sisu pannakse kokku dünaamiliselt JavaScripti abil

See on erinev vanakooli lähenemisest, kus iga suurem leht oli omaette HTML fail.

### Skeem

```text
index.html
  -> src/main.js
      -> App.vue
          -> RouterView
              -> konkreetne vaade
```

### Koodinäide

Repo `index.html`:

```html
<div id="app"></div>
<script type="module" src="/src/main.js"></script>
```

Repo `main.js`:

```js
const app = createApp(App)
app.use(router)
app.mount('#app')
```

Repo `App.vue`:

```vue
<RouterView />
```

### Päriselu analoogia

See on nagu teatri lava, kus lava ise jääb samaks, aga dekoratsioonid ja stseenid vahetuvad vastavalt sellele, mida parasjagu näidata vaja on.

<a id="kusimark-url-is-lopetab-raja-ja-alustab-query-parameetreid"></a>
## Küsimärk URL-is lõpetab raja ja alustab query parameetreid - `2:25:15`

Video teeb siin väga hea URL-i lugemise harjutuse.

### Selgitus

URL-is on kaks eri osa:

- rada ehk path
- query parameetrid pärast küsimärki

Kui tuleb `?`, siis tähendab see, et:

- raja osa on läbi
- ülejäänu on lisainfo, näiteks kuupäevad, keel, linn või filtrid

### Skeem

```text
/searchresults.html?city=Parnu&lang=et
|--------------path-------------| |--query--|
```

### Koodinäide

Repo `router/index.js` näitab puhtaid radu:

```js
{
  path: '/login',
  name: 'loginRoute',
  component: LoginView,
}
```

Siin `path` on puhas marsruut. Kui kasutaja saadaks lisaks query parameetreid, need tuleksid sellest eraldi.

### Päriselu analoogia

See on nagu tänava aadress ja uksekellal olev lisainfo. Maja asukoht on üks asi, lisajuhised teine asi.

<a id="frontend-toob-ressursse-asunkroonselt-ja-ehitab-lehe-andmete-pealt-kokku"></a>
## Frontend toob ressursse asünkroonselt ja ehitab lehe andmete pealt kokku - `2:35:25`

See on video suur arhitektuuriosa: kuidas leht, vaade, andmed ja server omavahel koos töötavad.

### Selgitus

Põhiidee on:

- frontend küsib serverilt vaate või andmed
- eri ressursid võivad tulla eri sõnumitega
- neid ei pea tooma ühe suure plokina
- brauser võib saata mitu päringut paralleelselt

Nii sünnibki dünaamiline leht:

- struktuur tuleb ühest kohast
- andmed teisest kohast
- pildid kolmandast kohast

### Skeem

```text
brauser
  -> GET / mingi vaade
  -> GET / mingi andmestik
  -> GET / pilt
  -> GET / veel midagi

kõik vastused tulevad tagasi
  -> frontend renderdab tulemuse
```

### Koodinäide

Repo `LoginView.vue` teeb API-päringu nii:

```js
axios.get('/api/login', {
  params: {
    username: 'AAA',
    password: 'BBB',
  },
})
```

See näitab sama mõtet väiksemas mõõtkavas:

- frontend saadab päringu
- server vastab andmetega
- frontend kasutab saadud vastust edasi

### Päriselu analoogia

See on nagu restoran, kus üks inimene toob menüü, teine joogi ja kolmas pearoa. Kõik ei pea saabuma ühest ukseavast ühel hetkel, et õhtu toimiks.

<a id="props-id-ja-andmevoog-liiguvad-vues-ulevalt-alla"></a>
## `props`-id ja andmevoog liiguvad Vue's ülevalt alla - `2:50:09`

See on video lõpu kõige olulisem Vue mõtteviis.

### Selgitus

Õpetaja rõhutab, et komponentide hierarhias liigub andmevoog ülevalt alla:

- vanem komponent annab andmed lapsele
- laps ei lähe suvaliselt vanema andmeid otse muutma
- vajadusel saadab laps üles sõnumi, et vanem midagi muudaks

See hoiab süsteemi selgema ja vähem maagilisena.

### Skeem

```text
Parent
  -> props
      -> Child

Child
  -> sündmus / sõnum üles
      -> Parent muudab seisu
          -> uus info voolab jälle alla
```

### Koodinäide

Repo `LoginView.vue` annab lapsele prop'i:

```vue
<AlertError :error-message="errorMessage" />
```

Ja laps `AlertError.vue` võtab selle vastu:

```js
props: {
  errorMessage: String,
}
```

See on klassikaline ülalt-alla andmevoog: vanemal on seis, laps lihtsalt kuvab seda.

### Päriselu analoogia

See on nagu juht annab töötajale ülesande ja info. Töötaja saab tagasi raporteerida, aga organisatsiooni ametlik muudatus tehakse ikkagi kõrgemal tasemel.

## Kokkuvõte

See video viib õppija puhtast HTML-ist ja algelisest JavaScriptist edasi tänapäevase frontend-mõtlemiseni. Alguses õpid, kuidas objektid, funktsioonid, DOM ja vormiväljad päriselt töötavad. Lõpus seotakse see kokku Vue, SPA, serveripäringute, JSON-i ja `props`-ide andmevooga.

Kui sellest videost võtta kaasa neli kõige tähtsamat mõtet, siis need võiksid olla:

- JavaScripti andmed on tihti objektid ja objektliteraal on peamine tööriist
- `document.getElementById(...)` annab sulle elemendi, mitte automaatselt selle `value`
- kui funktsioon tagastab midagi ja sa tahad sellega edasi töötada, seo see nimega
- Vue ja SPA ei kaota baasloogikat ära, vaid ehitavad selle peale mugavama abstraktsioonikihi
