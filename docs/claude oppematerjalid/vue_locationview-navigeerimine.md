## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/NXlV3L3iaa00-xkOVAhO5FRnyxZjqkBvMKjnQYB3CGpci1s4N8EIo0NliM88zxgx.SkluJr26uO_ikv70?startTime=1776938508000) |
| **Parool** | `4uX#*q2m` |
| **Transkript** | [GMT20260423-100148_v-2.vtt](../transcripts/GMT20260423-100148_v-2.vtt) |

## Märkus transkripti ja repo seisu kohta

Selles transkriptis on OCR-vigu. Näiteks esinevad kujul `City Stop Town`, `Ghee`, `voe`, `Respons`, `Get Citys`, `Base kuuskümmend neli` ja `Navigator View`, kuigi kontekstist on selge, et mõeldud on `CitiesDropdown`, `key`, `Vue`, `response`, `getCities()`, `base64` ja `navigateToErrorView()`.

Selles videos on selgelt kuulda `FEB-10` lõpetamine. Pärast seda alustatakse uut haru numbriga `11`, millest saab aru, et edasi minnakse `LocationView` ja asukoha lisamise ülesandega. Kuna OCR ei anna alati taski koodi puhtalt välja, kirjeldan seda osa kui “uus LocationView ülesanne”, mitte ei väida jõuga täpset taskinime.

Repo praegune seis on osaliselt videost juba edasi:

- tabel on juba eraldi failis `src/components/LocationsTable.vue`
- `CitiesDropdown` on saanud juurde proppid `firstOptionLabel` ja `firstOptionIsDisabled`
- `LocationView` on olemas

Samas on kaks olulist erinevust, mida on kasulik teadvustada:

- `NavigationService.navigateToErrorView()` on praegu teadlikult välja kommenteeritud
- `App.vue` näitab `Asukoht` linki kõigile, kuigi videos räägitakse admini-põhisest kuvamisest

Selles õppematerjalis seon video teemad failidega `src/views/AtmsView.vue`, `src/components/LocationsTable.vue`, `src/components/CitiesDropdown.vue`, `src/components/ImageInput.vue`, `src/views/LocationView.vue`, `src/navigation/NavigationService.js`, `src/router/index.js` ja `src/App.vue`.

## Sisukord

- [Katastroofiline viga vajab alati `else` haru](#katastroofiline-viga-vajab-alati-else-haru) - `0:00:12`
- [`errorMessage` tuleb iga uue päringu alguses nullida](#errormessage-tuleb-iga-uue-paringu-alguses-nullida) - `0:03:27`
- [`Local History` päästab, kui muudatus läheb kaduma](#local-history-paastab-kui-muudatus-laheb-kaduma) - `0:09:45`
- [`v-for` käib tabeli rea peale, mitte suvalisse kohta](#v-for-kaib-tabeli-rea-peale-mitte-suvalisse-kohta) - `0:14:29`
- [`:key` aitab Vue'l aru saada, mis listis muutus](#key-aitab-vuel-aru-saada-mis-listis-muutus) - `0:19:43`
- [Pesastatud `v-for` joonistab teenused iga asukoha alla](#pesastatud-v-for-joonistab-teenused-iga-asukoha-alla) - `0:34:51`
- [Tühja tulemuse korral puhasta `locations` ja peida tabel](#tuhja-tulemuse-korral-puhasta-locations-ja-peida-tabel) - `0:46:15`
- [Kui tabel on stabiilne, tõsta see eraldi komponendiks](#kui-tabel-on-stabiilne-tosta-see-eraldi-komponendiks) - `0:58:11`
- [`FEB-10` saab valmis ja siis algab `LocationView`](#feb-10-saab-valmis-ja-siis-algab-locationview) - `1:07:50`
- [`LocationView` algab marsruudist, pealkirjast ja paigutusest](#locationview-algab-marsruudist-pealkirjast-ja-paigutusest) - `1:24:04`
- [`CitiesDropdown` on parem taaskasutada kui uuesti ehitada](#citiesdropdown-on-parem-taaskasutada-kui-uuesti-ehitada) - `1:36:11`
- [`firstOptionLabel` ja `firstOptionIsDisabled` teevad dropdowni paindlikuks](#firstoptionlabel-ja-firstoptionisdisabled-teevad-dropdowni-paindlikuks) - `1:58:46`
- [`ImageInput` teeb failist `base64` ja saadab selle parentile](#imageinput-teeb-failist-base64-ja-saadab-selle-parentile) - `2:45:11`

<a id="katastroofiline-viga-vajab-alati-else-haru"></a>
## Katastroofiline viga vajab alati `else` haru - `0:00:12`

Video algab eelmisest sammust jätkates: `404 + errorCode 222` olukord on juba lahendatud, aga õpetaja tuletab meelde, et see pole ainus võimalik viga.

### Selgitus

Kui server tagastab midagi “katastroofilisemat”, näiteks `500`, siis ei piisa enam ainult ühest kitsast `if`-kontrollist. Sul peab olema ka üldine varuplaan.

Mõtteviis on:

- konkreetne tuntud viga käsitle eraldi
- kõik muu loe üldiseks rikkeks
- üldise rikke korral vii kasutaja turvalisse vaatesse

Selleks kasutataksegi `NavigationService`-i, et navigeerimine ei oleks laiali pillutud juhuslikesse komponentidesse.

### Skeem

```text
catch(error)
  -> kui 404 + 222
       -> kuva veateade
  -> else
       -> navigateToErrorView()
```

### Koodinäide

Repo praegune `AtmsView` teeb seda juba nii:

```js
handleGetLocationsError(error) {
  this.errorResponse = error.response.data
  let statusCode = error.response.status

  if (statusCode === 404 && this.errorResponse.errorCode === 222) {
    this.errorMessage = this.errorResponse.message
    this.locations = []
  } else {
    NavigationService.navigateToErrorView()
  }
}
```

Ja teenus ise elab siin:

```js
navigateToErrorView() {
  // todo: peale arendust lülita sisse
  // router.push({ name: 'errorRoute' })
}
```

### Päriselu analoogia

Kui tead, et vahel saab toode lihtsalt laost otsa, siis sellele on eraldi silt “otsas”. Aga kui kogu kassasüsteem kukub kokku, siis see ei ole enam “toode otsas”, vaid terve poe süsteem on hädas.

<a id="errormessage-tuleb-iga-uue-paringu-alguses-nullida"></a>
## `errorMessage` tuleb iga uue päringu alguses nullida - `0:03:27`

See on video üks kõige praktilisemaid kohti. Õpetaja näitab vea, mis tuleb väga sageli päris töös ette: vana error jääb ekraanile, kuigi uus tegevus on juba edukas.

### Selgitus

Probleem on lihtne:

- alguses on `errorMessage = ''`
- vea korral saab see mingi teksti
- edukal järgmisel päringul see vana tekst ei kao, kui sa seda ise nulli ei pane

Seega tuleb uue tegevuse alguses taastada algseis. Video arutleb korraks, kas seda teha kutsuja meetodis või otse `getLocations()` sees. Lõpptulemus on see, et nullimine peaks olema võimalikult lähedal sellele kohale, kus uus päring päriselt käivitub.

### Skeem

```text
uus päring algab
  -> errorMessage = ''
  -> saada request
  -> kui tuleb viga, täida uuesti
```

### Koodinäide

Praegune repo teeb selle nii:

```js
getLocations() {
  this.errorMessage = ''
  LocationService.sendGetAtmLocations(this.selectedCityId)
    .then((response) => this.handleGetLocationsResponse(response.data))
    .catch((error) => this.handleGetLocationsError(error))
    .finally()
}
```

### Päriselu analoogia

Kui auto armatuurlaual jäi vana hoiatus tuli põlema, siis enne uut testi pead vaatama, et kas hoiatus on päriselt uus või lihtsalt eelmise sõidu jääk.

<a id="local-history-paastab-kui-muudatus-laheb-kaduma"></a>
## `Local History` päästab, kui muudatus läheb kaduma - `0:09:45`

Video esimese osa keskel teeb õpetaja väärt kõrvalepõike IDE tööriistadesse.

### Selgitus

Peamine sõnum on:

- Git ei ole ainus ajalugu
- IntelliJ / WebStorm hoiab ka lokaalset muudatuste ajalugu
- sellest on abi eriti siis, kui sa pole veel commit'i teinud

See ei asenda Git'i, aga aitab olukorras, kus midagi läks kogemata prügikasti või üle kirjutati.

### Skeem

```text
muudatus kadus
  -> Git commit puudub
  -> Local History
  -> leia vana versioon
  -> taasta vajalik osa
```

### Koodinäide

Siin pole eraldi koodiplokki, sest see on IDE funktsioon, mitte repo kood. Mõte on meeles pidada menüüteed:

```text
Right click failil või kaustal
  -> Local History
  -> Show History
```

### Päriselu analoogia

Git on nagu ametlik arhiiv. `Local History` on nagu valvekaamera salvestus, mis pole küll ametlik dokument, aga aitab täpselt näha, mis vahepeal juhtus.

<a id="v-for-kaib-tabeli-rea-peale-mitte-suvalisse-kohta"></a>
## `v-for` käib tabeli rea peale, mitte suvalisse kohta - `0:14:29`

Siin algab ATM tabeli päris dünaamiliseks tegemine.

### Selgitus

Õpetaja küsib väga õigesti: mis on see korduv tükk? Vastus ei ole:

- kogu `table`
- `tbody`
- üksik `td`

Vaid:

- üks tabelirida ehk `<tr>`

Sest iga `location` objekti kohta tahame ühe rea.

Kui massiivis on:

- `0` elementi, tuleb `0` rida
- `3` elementi, tuleb `3` rida

### Skeem

```text
locations massiiv
  -> iga element = üks asukoht
  -> iga asukoht = üks <tr>
```

### Koodinäide

Praegune repo teeb seda eraldi komponendis:

```vue
<tbody>
  <tr v-for="location in locations" :key="location.locationId">
    <td>{{ location.cityName }}</td>
    <td>{{ location.locationName }}</td>
    <td>...</td>
  </tr>
</tbody>
```

### Päriselu analoogia

Kui sul on kolm paberkausta, siis sa ei tee ühe kausta jaoks uut kappide ruumi. Sa teed kolm riiulirida samas kapis.

<a id="key-aitab-vuel-aru-saada-mis-listis-muutus"></a>
## `:key` aitab Vue'l aru saada, mis listis muutus - `0:19:43`

See on üks video parimaid selgitusi `key` kohta.

### Selgitus

Vue suudab ka ilma `key`-ta mõnikord midagi renderdada, aga see ei tähenda, et see on usaldusväärne.

`key` on vajalik, et Vue oskaks:

- võrrelda vana ja uut listi
- aru saada, milline rida jäi samaks
- aru saada, milline rida kadus või tuli juurde
- uuesti joonistada just seda, mida on vaja

Kõige parem `key` on midagi unikaalset, tavaliselt `id`.

Video toob hea mõtte:

- `locationName` võib korduda
- `locationId` ei tohiks korduda

### Skeem

```text
locations muutub
  -> Vue vaatab key väärtusi
  -> leiab, mis jäi samaks
  -> leiab, mis muutus
  -> renderdab õigesti ümber
```

### Koodinäide

```vue
<tr v-for="location in locations" :key="location.locationId">
```

Kui unikaalset numbrit poleks, võiks ajutiselt kokku panna mitme välja kombinatsiooni, aga `id` on tavaliselt kõige puhtam variant.

### Päriselu analoogia

See on nagu klassipäevikus õpilaste nimede asemel isikukood. Kui sul on kaks “Mari Tamm”-e, siis nimi üksi ei aita enam aru saada, kellest jutt käib.

<a id="pesastatud-v-for-joonistab-teenused-iga-asukoha-alla"></a>
## Pesastatud `v-for` joonistab teenused iga asukoha alla - `0:34:51`

Kui linn ja asukoha nimi on lihtsad väljad, siis teenused on juba järgmine tase: massiiv objekti sees.

### Selgitus

Ühe `location` objekti sees on:

- `cityName`
- `locationName`
- `transactionTypes`

ja `transactionTypes` ei ole string, vaid massiiv.

See tähendab, et tabeli kolmandas veerus tuleb teha teine tsükkel:

- väline tsükkel käib läbi `locations`
- sisemine tsükkel käib läbi ühe `location.transactionTypes`

### Skeem

```text
locations
  -> location 1
      -> transactionTypes
          -> transactionType 1
          -> transactionType 2
  -> location 2
      -> transactionTypes
```

### Koodinäide

```vue
<td>
  <div
    v-for="transactionType in location.transactionTypes"
    :key="transactionType.transactionTypeName"
  >
    {{ transactionType.transactionTypeName }}
  </div>
</td>
```

### Päriselu analoogia

Kui üks restoranikirje sisaldab mitut teenust, siis sa ei kirjuta neid ühe rea peale kõvasti sisse kivisse. Sa loed kõik selle restorani juurde kuuluvad teenused eraldi läbi.

<a id="tuhja-tulemuse-korral-puhasta-locations-ja-peida-tabel"></a>
## Tühja tulemuse korral puhasta `locations` ja peida tabel - `0:46:15`

See on loogiline jätk eelmisele error-state teemale. Kui linnas pole tulemusi, siis ei tohi vana tabel maha jääda.

### Selgitus

Kui `404 + errorCode 222` tuleb, siis toimub kaks asja:

- kuvatakse veateade
- tabeli andmed tuleb tühjendada

Muidu jäävad ekraanile eelmise päringu read ja kasutaja saab vale mulje, et need kuuluvad praeguse filtri alla.

Pärast seda on mõistlik tabel üldse peita, kui `locations.length === 0`.

### Skeem

```text
404 + 222
  -> errorMessage = backend message
  -> locations = []
  -> tabel ei renderdu
```

### Koodinäide

Praegune repo teeb mõlemad sammud juba ära:

```js
if (statusCode === 404 && this.errorResponse.errorCode === 222) {
  this.errorMessage = this.errorResponse.message
  this.locations = []
}
```

```vue
<table v-if="locations.length > 0" class="table table-dark table-hover">
```

### Päriselu analoogia

Kui otsid poes “ainult punaseid kingi” ja neid pole, siis ei tohi süsteem sulle näidata eelmise otsingu musti kingi lihtsalt sellepärast, et need olid juba lahti.

<a id="kui-tabel-on-stabiilne-tosta-see-eraldi-komponendiks"></a>
## Kui tabel on stabiilne, tõsta see eraldi komponendiks - `0:58:11`

Video üks tugev arhitektuuriline mõte on see, et komponenti ei maksa liiga vara välja tõsta.

### Selgitus

Õpetaja ütleb sisuliselt:

- kui veel palju klõpsimist ja muutmist toimub, hoia kood esialgu koos
- kui visuaal on paigas ja loogika arusaadav, siis ekstrakti

Miks? Sest liiga vara tehtud ekstrakt teeb arenduse kohmakaks. Liiga hilja tehtud ekstrakt jätab faili liiga suureks. Hea hetk on siis, kui plokk on piisavalt iseseisev.

### Skeem

```text
visuaal muutub palju
  -> hoia koos

visuaal on paigas
  -> extract component
  -> anna andmed propsidega sisse
```

### Koodinäide

Praegune repo on sellest sammust juba edasi:

```vue
<AlertError :error-message="errorMessage" />
<LocationsTable :locations="locations" />
```

ja eraldi komponent:

```js
export default {
  name: 'LocationsTable',
  props: {
    locations: {},
  },
}
```

### Päriselu analoogia

Kui ehitad köögimööblit, siis enne ei tasu sahtlit seina küljest lahti võtta ja teise tuppa viia, kui sa pole veel kindel, kas see üldse jääb sahtliks või muutub kapiks.

<a id="feb-10-saab-valmis-ja-siis-algab-locationview"></a>
## `FEB-10` saab valmis ja siis algab `LocationView` - `1:07:50`

Siin läheb video ühest teemast teise. ATM tabel loetakse sisuliselt tehtuks ja õpetaja liigub järgmise suure töö juurde.

### Selgitus

Oluline mõte pole ainult kood, vaid tööprotsess:

- lõpeta üks ülesanne
- merge see mõtestatult
- kustuta vana haru
- alusta järgmist ülesannet puhta fookusega

See aitab mitte vedada mitut poolikut mõtet ühes harus lõputult kaasa.

### Skeem

```text
FEB-10 valmis
  -> merge
  -> push
  -> haru kustutamine
  -> uus haru järgmise töö jaoks
```

### Koodinäide

Video kasutab Git tööriistu IDE kaudu, aga sisuline jada on sama ka käsureal:

```bash
git checkout master
git merge teacher-feb-10
git push origin master
```

### Päriselu analoogia

See on nagu lõpetad ühe toa remondi päriselt ära, viid tööriistad välja ja alles siis lähed järgmise toa kallale. Muidu hakkavad pooled asjad korraga laiali jooksma.

<a id="locationview-algab-marsruudist-pealkirjast-ja-paigutusest"></a>
## `LocationView` algab marsruudist, pealkirjast ja paigutusest - `1:24:04`

Uue vaate ehitamine ei alga kohe vormi sisust. Kõigepealt tehakse nähtav kest: route, pealkiri ja layout.

### Selgitus

Video järjekord on väga mõistlik:

1. loo uus `LocationView.vue`
2. lisa route `'/location'`
3. lisa lehele pealkiri `Lisa asukoht`
4. pane paika read ja veerud

See annab töötava karkassi, kuhu hiljem saab hakata juppe sisse panema.

### Skeem

```text
router
  -> /location
      -> LocationView
          -> pealkiri
          -> kolm ala:
             linn
             vorm
             pilt
```

### Koodinäide

Repo praegune marsruut:

```js
{
  path: '/location',
  name: 'locationRoute',
  component: LocationView,
}
```

Ja vaate pealkiri:

```vue
<div class="row mb-3">
  <div class="col">
    <h1>Lisa asukoht</h1>
  </div>
</div>
```

### Päriselu analoogia

Enne kui hakkad köögis kraanikaussi ja pliiti paigaldama, märgid ära, kus üldse seinad, uksed ja tööpinnad asuvad.

<a id="citiesdropdown-on-parem-taaskasutada-kui-uuesti-ehitada"></a>
## `CitiesDropdown` on parem taaskasutada kui uuesti ehitada - `1:36:11`

Video teises pooles tuleb väga oluline komponentide taaskasutuse õppetund.

### Selgitus

Kui `CitiesDropdown` on juba olemas, siis ei ole mõtet teha uut “peaaegu sama” dropdowni ainult selleks, et uus vaade vajab seda teistsuguses kohas.

Komponent ongi selleks, et:

- võtta väljast andmed sisse
- joonistada sama loogikat mitmes kohas
- erineda vajadusel ainult propside kaudu

`LocationView` kasutab sama dropdowni, aga teises kontekstis:

- ATM vaates tähendab esimene valik “Kõik linnad”
- asukoha lisamise vaates tähendab see “Vali linn”

### Skeem

```text
AtmsView -> CitiesDropdown
LocationView -> CitiesDropdown

sama child
  -> erinevad propsid
  -> erinev käitumine
```

### Koodinäide

Praegune `LocationView` kasutab sama komponenti nii:

```vue
<CitiesDropdown
  :cities="cities"
  :selected-city-id="selectedCityId"
  first-option-label="Vali linn"
  :first-option-is-disabled="true"
/>
```

Ja andmed tuuakse enne mount'i ära:

```js
beforeMount() {
  this.getCities()
}
```

### Päriselu analoogia

Kui sul on juba üks hea kohvitass, siis sa ei lõika seda pooleks ja ehita uut tassi nullist. Sa kasutad sama tassi teises toas ka.

<a id="firstoptionlabel-ja-firstoptionisdisabled-teevad-dropdowni-paindlikuks"></a>
## `firstOptionLabel` ja `firstOptionIsDisabled` teevad dropdowni paindlikuks - `1:58:46`

See on selle video kõige tugevam komponentide disaini koht.

### Selgitus

Algne `CitiesDropdown` oli liiga jäik, sest esimene rida oli sinna lihtsalt sisse kirjutatud.

Video mõte on:

- ära hardcode'i kõike childi sisse
- anna väljast proppidega kaasa see, mis peab muutuma

Nii tekib kaks uut proppi:

- `firstOptionLabel`
- `firstOptionIsDisabled`

Ja eriti hea nüanss on `default` väärtus. Sellega saab vana kasutuskoht edasi töötada ka siis, kui uus propp lisatakse hiljem.

### Skeem

```text
CitiesDropdown
  props:
    cities
    selectedCityId
    firstOptionLabel
    firstOptionIsDisabled

AtmsView
  -> kasutab default väärtusi

LocationView
  -> kirjutab need üle
```

### Koodinäide

Praegune komponent:

```js
props: {
  cities: Array,
  selectedCityId: Number,
  firstOptionLabel: {
    type: String,
    default: '-- Kõik linnad --',
  },
  firstOptionIsDisabled: {
    type: Boolean,
    default: false,
  },
}
```

Ja template:

```vue
<option selected :disabled="firstOptionIsDisabled" :value="0">
  {{ firstOptionLabel }}
</option>
```

### Päriselu analoogia

See on nagu hotellituba, kus saab külalise jaoks panna uksele eri sildi: “Do not disturb” või “Please clean room”. Ust ennast ei ehitata iga sildi jaoks uuesti.

<a id="imageinput-teeb-failist-base64-ja-saadab-selle-parentile"></a>
## `ImageInput` teeb failist `base64` ja saadab selle parentile - `2:45:11`

Video lõpus näidatakse, kuidas failiinputi komponent ei hoia pilti endale, vaid annab selle parentile edasi.

### Selgitus

`ImageInput` teeb mitu asja järjest:

1. kasutaja valib faili
2. brauser annab selle `event.target.files[0]` kaudu kätte
3. `FileReader` loeb faili
4. tulemus teisendatakse `base64` kujule
5. child saadab selle stringi event'iga parentile
6. parent paneb selle oma `data()` muutujasse
7. `<img :src="imageData" />` oskab seda stringi kohe pildina näidata

See on hea näide sellest, kuidas event liigub alt üles ja andmed elavad lõpuks parentis.

### Skeem

```text
ImageInput
  -> user valib faili
  -> FileReader teeb base64
  -> $emit('event-new-image-selected', imageData)

LocationView
  -> imageData = $event
  -> <img :src="imageData" />
```

### Koodinäide

`ImageInput.vue`:

```js
handleImage(event) {
  const selectedImage = event.target.files[0]
  this.emitBase64(selectedImage)
},

emitBase64(fileObject) {
  const reader = new FileReader()
  reader.onload = () => {
    let imageDataBase64 = reader.result
    this.$emit('event-new-image-selected', imageDataBase64)
  }
  reader.readAsDataURL(fileObject)
},
```

`LocationView.vue`:

```vue
<ImageInput @event-new-image-selected="imageData = $event" />
<img :src="imageData" alt="" />
```

### Päriselu analoogia

See on nagu laps toob vanemale paberkandjal foto, vanem skannib selle digitaalseks ja paneb külmkapile magnetiga üles. Laps ei otsusta ise, kuhu see lõpuks riputatakse.

## Kokkuvõte

Selle video lõpuks juhtub kaks suurt asja.

Esimene osa viib ATM vaate kindlamaks:

- error-state puhastatakse uue päringu alguses
- tühi tulemus puhastab `locations` massiivi
- tabel renderdub `v-for` + `:key` + pesastatud teenuse-tsükliga
- stabiilne tabel tõstetakse eraldi komponendiks

Teine osa avab järgmise töö:

- luuakse `LocationView`
- taaskasutatakse `CitiesDropdown`
- lisatakse paindlikud proppid esimese valiku jaoks
- `ImageInput` hakkab pildifaili `base64` kujul parentile tõstma

Järgmine loomulik samm on vormi ülejäänud väljade sidumine reaktiivsete muutujatega, `transactionTypes` pärimine backendist ja lõpuks POST-päringu koostamine uue asukoha salvestamiseks.
