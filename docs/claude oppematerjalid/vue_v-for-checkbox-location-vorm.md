## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/Ls5G1d8NwjOkUqNYac1dZXsvGZUsmKz4NZhO6_yzXmDzsShRSDxosmFl2idP6kvn.X2Gvv71g6Ef-FE1H?startTime=1777011020000) |
| **Parool** | `7v?0r*AV` |
| **Transkript** | [GMT20260424-061020_v-1.vtt](../transcripts/GMT20260424-061020_v-1.vtt) |

## Märkus transkripti kohta

Transkriptis on palju automaatse kõnetuvastuse vigu. Näiteks `voe` tähendab kontekstis `Vue`, `veemodel` tähendab `v-model`, `Ghee` tähendab `key`, `Templeid` tähendab `template`, `Sväger` tähendab `Swagger` ja `respons` tähendab `response`.

Taski mainimine `Õpetaja veb üksteist` on selles materjalis tõlgendatud kui `FEB-11`, sest kontekstis räägitakse sama arendussammu tööharust.

Selles õppematerjalis seon video teemad failidega `src/views/LocationView.vue`, `src/components/ImageInput.vue`, `src/components/CitiesDropdown.vue`, `src/components/location/LocationForm.vue`, `src/components/location/LocationNameInput.vue`, `src/components/location/NumberOfAtmsInput.vue`, `src/components/location/TransactionTypesCheckbox.vue` ja `src/api-services/TransactionTypeService.js`.

## Sisukord

- [Pilt liigub childist parentisse eventiga](#pilt-liigub-childist-parentisse-eventiga) - `0:00:03`
- [Vaikimisi ATM pilt ja `v-if` / `v-else`](#vaikimisi-atm-pilt-ja-v-if--v-else) - `0:08:26`
- [`FEB-11` - taski hetk ja komponendiks tõstmise ettevalmistus](#feb-11-taski-hetk-ja-komponendiks-tostmise-ettevalmistus) - `0:17:51`
- [Nupurida ja Bootstrap vahed](#nupurida-ja-bootstrap-vahed) - `0:29:09`
- [`location` objekt on vormi ühine andmemudel](#location-objekt-on-vormi-uhine-andmemudel) - `0:33:16`
- [`value` ja `checked` v-modeli asemel](#value-ja-checked-v-modeli-asemel) - `0:56:33`
- [`v-for`, `:key` ja dünaamilised checkboxid](#v-for-key-ja-dunaamilised-checkboxid) - `1:03:21`
- [`LocationForm` ja alamkomponendid](#locationform-ja-alamkomponendid) - `1:25:34`
- [`TransactionTypeService` toob teenused backendist](#transactiontypeservice-toob-teenused-backendist) - `1:38:50`
- [`emits` dokumenteerib childi sündmused](#emits-dokumenteerib-childi-sundmused) - `2:36:26`
- [Eventiga üles tulev väärtus kirjutatakse parenti mudelisse](#eventiga-ules-tulev-vaartus-kirjutatakse-parenti-mudelisse) - `2:41:25`

<a id="pilt-liigub-childist-parentisse-eventiga"></a>
## Pilt liigub childist parentisse eventiga - `0:00:03`

Video algab `ImageInput` komponendist. Selle komponendi ülesanne on lasta kasutajal valida pildifail ja saata valitud pildi info parent-komponendile.

### Selgitus

Vue komponendis liiguvad andmed tavaliselt alla `props` abil. Kui child tahab parentile midagi öelda, siis kasutatakse event'i.

Siin on child `ImageInput`. Parent on `LocationView`. Kui kasutaja valib faili, loeb `ImageInput` selle `FileReader` abil base64 kujule ja saadab event'i `event-new-image-selected`.

Parent kuulab seda event'i ja kirjutab saadud väärtuse `location.imageData` sisse.

### Skeem

```text
kasutaja valib pildi
  -> ImageInput loeb faili
  -> $emit('event-new-image-selected', imageDataBase64)
  -> LocationView paneb väärtuse location.imageData sisse
```

### Koodinäide

```vue
<ImageInput @event-new-image-selected="location.imageData = $event" />
```

```js
reader.onload = () => {
  let imageDataBase64 = reader.result
  this.$emit('event-new-image-selected', imageDataBase64)
}
```

Esimene näide on failist `src/views/LocationView.vue`. Teine näide on failist `src/components/ImageInput.vue`.

### Päriselu analoogia

Child ei kirjuta parenti märkmikku ise. Ta annab parentile sedeli ja parent otsustab, kuhu see info kirja panna.

<a id="vaikimisi-atm-pilt-ja-v-if--v-else"></a>
## Vaikimisi ATM pilt ja `v-if` / `v-else` - `0:08:26`

Kui `imageData` on tühi string, siis brauser ei oska sellest pilti kuvada. Selle asemel tuleb näidata vaikimisi pilti.

### Selgitus

`v-if` kuvab elementi ainult siis, kui tingimus on tõene. `v-else` kuvab teise variandi siis, kui esimene tingimus ei kehti.

Selles vaates on kaks võimalikku seisu:

- kasutaja ei ole pilti valinud: näita `src/assets/images/atm.png`
- kasutaja valis pildi: näita `location.imageData` väärtusest tulevat pilti

See teeb kasutajaliidese arusaadavaks, sest katkise pildi ikooni ei näidata.

### Skeem

```text
location.imageData === ''
  jah -> näita vaikimisi ATM pilti
  ei  -> näita kasutaja valitud pilti
```

### Koodinäide

```vue
<img
  v-if="location.imageData === ''"
  src="@/assets/images/atm.png"
  class="img-thumbnail"
  alt="Pangaautomaadi pilt"
/>
<img v-else :src="location.imageData" class="img-thumbnail" alt="Pangaautomaadi pilt" />
```

Näide on failist `src/views/LocationView.vue`.

### Päriselu analoogia

Kui inimesel pole profiilipilti, näitad üldist avatari. Kui inimene lisab päris pildi, vahetad avatari tema pildi vastu.

<a id="feb-11-taski-hetk-ja-komponendiks-tostmise-ettevalmistus"></a>
## `FEB-11` - taski hetk ja komponendiks tõstmise ettevalmistus - `0:17:51`

Transkriptis kõlab taski mainimine kujul `Õpetaja veb üksteist`. Kontekstist on see `FEB-11`, kus ehitatakse `LocationView` vormi edasi.

### Selgitus

Õpetaja näitab, et enne komponendiks tõstmist tuleb mõelda andmevoo peale. Kui valida koodilõik ja teha sellest uus komponent, annab IDE kaasa need andmed, mida lõigus kasutatakse.

See on mugav, aga alati ei anna see parimat tulemust. Näiteks väikesele input-komponendile ei ole vaja tervet `location` objekti kaasa anda, kui tal on vaja ainult `locationName`.

### Skeem

```text
halb liiga lai sisend:
LocationNameInput <- location

parem kitsam sisend:
LocationNameInput <- locationName
```

### Koodinäide

```vue
<LocationNameInput :location-name="location.locationName" />
<NumberOfAtmsInput :number-of-atms="location.numberOfAtms" />
<TransactionTypesCheckbox :transaction-types="location.transactionTypes" />
```

Näide on failist `src/components/location/LocationForm.vue`.

### Päriselu analoogia

Kui kellelgi on vaja ainult toa numbrit, ei anna sa talle kogu maja plaani. Annad ainult selle info, mida tal päriselt vaja on.

<a id="nupurida-ja-bootstrap-vahed"></a>
## Nupurida ja Bootstrap vahed - `0:29:09`

Järgmisena lisatakse vaate alla nupud `Tagasi` ja `Lisa`. Oluline osa ei ole ainult nupu lisamine, vaid ka elementide vahe.

### Selgitus

Bootstrap klassid annavad kiiresti valmis kujunduse:

- `btn` teeb elemendist nupu
- `btn-outline-secondary` teeb halli äärega nupu
- `btn-outline-success` teeb rohelise äärega nupu
- `me-3` lisab paremale vahe

`me` tähendab `margin end`. Vasakult paremale kirjutatavas keeles on see parempoolne vahe.

### Skeem

```text
[ Tagasi ]   [ Lisa ]
     ^
     me-3 lükkab järgmise nupu eemale
```

### Koodinäide

```vue
<button type="submit" class="btn btn-outline-secondary me-3">Tagasi</button>
<button type="submit" class="btn btn-outline-success">Lisa</button>
```

Näide on failist `src/views/LocationView.vue`.

### Päriselu analoogia

Kui kaks nuppu on täiesti üksteise küljes, on see nagu kaks ust ilma vaheseinata. Kasutaja ei saa kohe aru, kus üks lõpeb ja teine algab.

<a id="location-objekt-on-vormi-uhine-andmemudel"></a>
## `location` objekt on vormi ühine andmemudel - `0:33:16`

Õpetaja selgitab, miks eraldi muutujate asemel tehakse üks `location` objekt.

### Selgitus

Lõpuks peab frontend saatma backendile ühe JSON objekti. Kui vormi andmed on juba sama kujuga objektis, ei pea nupuvajutusel kõike käsitsi ümber tõstma.

Halvem variant oleks hoida eraldi muutujad:

- `locationName`
- `numberOfAtms`
- `imageData`
- `transactionTypes`

Siis peaks enne saatmist nendest uue objekti kokku ehitama.

Parem variant on hoida kohe ühte objekti:

```js
location: {
  cityId: 0,
  locationName: '',
  numberOfAtms: 1,
  imageData: '',
  transactionTypes: [],
}
```

### Skeem

```text
vormi väljad
  -> muudavad location objekti
  -> nupuvajutusel saab location objekti saata backendile
```

### Koodinäide

```js
data() {
  return {
    location: {
      cityId: 0,
      locationName: '',
      numberOfAtms: 1,
      imageData: '',
      transactionTypes: [
        {
          transactionTypeId: 0,
          transactionTypeName: '',
          isAvailable: false,
        },
      ],
    },
  }
}
```

Näide põhineb failil `src/views/LocationView.vue`.

### Päriselu analoogia

Kui pead saatma pakiautomaati ühe paki, siis on mõistlik kõik asjad kohe ühte karpi panna. Kui jätad asjad eraldi lauale, pead saatmise hetkel alles karpi komplekteerima.

<a id="value-ja-checked-v-modeli-asemel"></a>
## `value` ja `checked` v-modeli asemel - `0:56:33`

Videos rõhutatakse, et child-komponent ei tohiks otse muuta propsina saadud väärtust. Seetõttu ei kasutata siin `v-model`it.

### Selgitus

`v-model` teeb kahesuunalise sidumise. See on lihtne siis, kui input ja muutuja elavad samas komponendis.

Kui väärtus tuleb propsina parentist, peab child olema ettevaatlik. Props on mõeldud parentilt childile voolavaks andmeks. Child ei kirjuta seda otse üle.

Seetõttu kasutatakse:

- tekstil ja numbril `:value`
- checkboxil `:checked`
- muudatuste saatmiseks hiljem event'i

### Skeem

```text
parent -> prop -> child inputi value

child inputi muutus -> event -> parent muudab oma objekti
```

### Koodinäide

```vue
<input
  :value="locationName"
  type="text"
  class="form-control"
  id="inputLocationName"
  placeholder="Asukoht"
/>
```

```vue
<input
  class="form-check-input"
  type="checkbox"
  :checked="transactionType.isAvailable"
/>
```

Näited on failidest `src/components/location/LocationNameInput.vue` ja `src/components/location/TransactionTypesCheckbox.vue`.

### Päriselu analoogia

Kui saad kellegi käest dokumendi koopia, siis sa ei kirjuta otse originaali peale. Teed ettepaneku või saadad muudatuse tagasi dokumendi omanikule.

<a id="v-for-key-ja-dunaamilised-checkboxid"></a>
## `v-for`, `:key` ja dünaamilised checkboxid - `1:03:21`

Teenuste checkboxid ei tohi olla HTMLi käsitsi kirjutatud. Need peavad tulema andmetest.

### Selgitus

`v-for` teeb ühe HTML-ploki iga massiivi elemendi kohta. Kui `transactionTypes` massiivis on kolm elementi, tekib kolm checkboxi.

`:key` aitab Vue'l aru saada, milline element on milline. Hea `key` on unikaalne ja stabiilne, näiteks `transactionTypeId`.

Kui checkboxi `id` on igal real sama, rikub see HTML reeglit. `id` peab lehel olema unikaalne. Seetõttu pannakse `id` sisse ka `transactionTypeId`.

### Skeem

```text
transactionTypes:
  1 Sularaha sisse
  2 Sularaha välja
  3 Maksed

v-for joonistab:
  [ ] Sularaha sisse
  [ ] Sularaha välja
  [ ] Maksed
```

### Koodinäide

```vue
<div
  v-for="transactionType in transactionTypes"
  :key="transactionType.transactionTypeId"
  class="form-check"
>
  <input
    class="form-check-input"
    type="checkbox"
    :id="'transactionTypeId-' + transactionType.transactionTypeId"
    :checked="transactionType.isAvailable"
  />
  <label class="form-check-label" :for="'transactionTypeId-' + transactionType.transactionTypeId">
    {{ transactionType.transactionTypeName }}
  </label>
</div>
```

Näide on failist `src/components/location/TransactionTypesCheckbox.vue`.

### Päriselu analoogia

See on nagu nimekirjast siltide printimine. Sa ei kirjuta iga silti käsitsi, vaid annad nimekirja ja printer teeb iga rea kohta ühe sildi.

<a id="locationform-ja-alamkomponendid"></a>
## `LocationForm` ja alamkomponendid - `1:25:34`

Kui `LocationView` muutub liiga pikaks, tõstetakse vorm eraldi komponenti `LocationForm`. Hiljem tõstetakse selle seest veel väiksemad osad eraldi komponentideks.

### Selgitus

Komponentideks jagamine annab kaks kasu:

- ülemine vaade jääb loetavamaks
- väikseid osi saab vajadusel uuesti kasutada

Samas tuleb meeles pidada tradeoff'i: mida rohkem komponente, seda rohkem peab jälgima, kust andmed tulevad ja kuhu event'id lähevad.

Video lõpus on komponentide suhe selline:

```text
LocationView
  -> CitiesDropdown
  -> LocationForm
       -> LocationNameInput
       -> NumberOfAtmsInput
       -> TransactionTypesCheckbox
  -> ImageInput
```

### Koodinäide

```vue
<LocationForm :location="location" />
```

```vue
<template>
  <div class="mb-3">
    <LocationNameInput :location-name="location.locationName" />
    <NumberOfAtmsInput :number-of-atms="location.numberOfAtms" />
    <TransactionTypesCheckbox :transaction-types="location.transactionTypes" />
  </div>
</template>
```

Näited on failidest `src/views/LocationView.vue` ja `src/components/location/LocationForm.vue`.

### Päriselu analoogia

Suur vorm on nagu pikk töölaud, kus kõik tööriistad on korraga laiali. Komponendid on nagu tööriistakastid: nimi ütleb, mis seal sees on.

<a id="transactiontypeservice-toob-teenused-backendist"></a>
## `TransactionTypeService` toob teenused backendist - `1:38:50`

Teenuste nimekiri ei ole frontendisse käsitsi kirjutatud. See küsitakse backendist.

### Selgitus

Kui teenused tulevad andmebaasist, saab süsteemi muuta ilma frontendi HTMLi muutmata. Näiteks kui lisandub uus teenus, tuleb see API vastusesse ja frontend joonistab checkboxi automaatselt.

Selle jaoks luuakse `TransactionTypeService`, mis teeb GET päringu.

`LocationView` kutsub seda lehe laadimisel välja ja paneb `response.data` väärtuse `location.transactionTypes` sisse.

### Skeem

```text
LocationView beforeMount
  -> getLocationTransactionTypes()
  -> TransactionTypeService.sendGetTransactionTypesRequest()
  -> axios.get('/api/atm/transaction-types')
  -> response.data
  -> location.transactionTypes
```

### Koodinäide

```js
import axios from 'axios'

export default {
  sendGetTransactionTypesRequest() {
    return axios.get('/api/atm/transaction-types')
  },
}
```

```js
getLocationTransactionTypes() {
  TransactionTypeService.sendGetTransactionTypesRequest()
    .then((response) => (this.location.transactionTypes = response.data))
    .catch(() => NavigationService.navigateToErrorView())
    .finally()
}
```

Näited on failidest `src/api-services/TransactionTypeService.js` ja `src/views/LocationView.vue`.

### Päriselu analoogia

Restoran ei trüki iga päev uut äppi ainult sellepärast, et menüüsse tuli uus roog. Äpp küsib menüü serverist ja näitab seda, mis täna olemas on.

<a id="emits-dokumenteerib-childi-sundmused"></a>
## `emits` dokumenteerib childi sündmused - `2:36:26`

Video lõpuosas lisatakse `CitiesDropdown` komponenti `emits`.

### Selgitus

`emits` ütleb Vue'le ja arendajale, milliseid sündmusi komponent välja saadab.

See ei ole kõige väiksemas näites alati tehniliselt hädavajalik, aga see on hea dokumentatsioon. Kui avad komponendi script-osa, näed kohe, milliseid event'e parent saab kuulata.

Lihtne süntaks on massiiv:

```js
emits: ['event-new-city-selected']
```

Kui event'e on mitu, pannakse need samasse massiivi komadega.

### Skeem

```text
CitiesDropdown
  emits:
    event-new-city-selected
```

### Koodinäide

```js
export default {
  name: 'CitiesDropdown',
  props: {
    cities: Array,
    selectedCityId: Number,
  },
  emits: ['event-new-city-selected'],
}
```

Näide on failist `src/components/CitiesDropdown.vue`.

### Päriselu analoogia

See on nagu seadme kasutusjuhendi pesa nimekiri. Sa näed kohe, milliseid juhtmeid saab selle seadme külge ühendada.

<a id="eventiga-ules-tulev-vaartus-kirjutatakse-parenti-mudelisse"></a>
## Eventiga üles tulev väärtus kirjutatakse parenti mudelisse - `2:41:25`

Viimane oluline praktiline samm on city valiku sünkroonimine tagasi `location.cityId` sisse.

### Selgitus

Alla antakse `selected-city-id` väärtusena `location.cityId`. Kui kasutaja muudab dropdownis valikut, saadab child üles event'i. Parent võtab `$event` väärtuse ja kirjutab selle samasse kohta tagasi.

See teeb andmevoo selgeks:

- parent annab praeguse väärtuse alla
- child kuvab selle
- child saadab muutuse üles
- parent muudab oma objekti

### Skeem

```text
LocationView location.cityId
  -> CitiesDropdown :selected-city-id
  -> kasutaja valib uue linna
  -> event-new-city-selected($event)
  -> location.cityId = $event
```

### Koodinäide

```vue
<CitiesDropdown
  :cities="cities"
  :selected-city-id="location.cityId"
  first-option-label="Vali linn"
  :first-option-is-disabled="true"
  @event-new-city-selected="location.cityId = $event"
/>
```

Näide on failist `src/views/LocationView.vue`.

### Päriselu analoogia

Parent annab childile praeguse aadressi paberil. Child ei kirjuta parenti andmebaasi otse, vaid ütleb: "kasutaja valis uue aadressi". Parent uuendab oma kirje ise.
