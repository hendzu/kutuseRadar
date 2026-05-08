## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/Ls5G1d8NwjOkUqNYac1dZXsvGZUsmKz4NZhO6_yzXmDzsShRSDxosmFl2idP6kvn.X2Gvv71g6Ef-FE1H?startTime=1777025194000) |
| **Parool** | `7v?0r*AV` |
| **Transkript** | [GMT20260424-100634_v-2.vtt](../transcripts/GMT20260424-100634_v-2.vtt) |

## Märkus transkripti kohta

Transkriptis on automaatse kõnetuvastuse vigu. Näiteks `voe` tähendab `Vue`, `inpot` tähendab `input`, `mit` tähendab `$emit` või `emits`, `Dougle` tähendab `toggle`, `Pack` tähendab `back` või `backend` ja `Aktsias` tähendab `axios`.

Sellest transkriptist ei leidnud selget taskikoodi kujul `FEB-...`, `BEB-...` või `OPETAJA-...`. Seetõttu on sisukorras ainult teemade ajad.

Selles õppematerjalis seon video teemad failidega `src/views/LocationView.vue`, `src/components/location/LocationForm.vue`, `src/components/location/LocationNameInput.vue`, `src/components/location/NumberOfAtmsInput.vue`, `src/components/location/TransactionTypesCheckbox.vue`, `src/views/AtmImage.vue`, `src/components/AlertError.vue` ja `src/api-services/LocationService.js`.

## Sisukord

- [Õppeplaan: frontend ja backend seotakse hiljem kokku](#oppeplaan-frontend-ja-backend-seotakse-hiljem-kokku) - `0:00:02`
- [`@input` saadab iga tähemärgi muudatuse üles](#input-saadab-iga-tahemargi-muudatuse-ules) - `0:05:27`
- [`LocationForm` vahendab grandchildi event'i edasi](#locationform-vahendab-grandchildi-eventi-edasi) - `0:18:30`
- [Parent kirjutab eventiga tulnud väärtuse `location` objekti](#parent-kirjutab-eventiga-tulnud-vaartuse-location-objekti) - `0:23:18`
- [Numbriväli tuleb stringist numbriks teisendada](#numbrivali-tuleb-stringist-numbriks-teisendada) - `0:27:24`
- [`event.target.value` ja `event.target.checked`](#eventtargetvalue-ja-eventtargetchecked) - `0:31:36`
- [Checkboxi toggle ja propsi otse muutmise vältimine](#checkboxi-toggle-ja-propsi-otse-muutmise-valtimine) - `0:42:02`
- [`map` loob uue `transactionTypes` massiivi](#map-loob-uue-transactiontypes-massiivi) - `1:18:24`
- [`AtmImage` eraldab pildi kuvamise vaate seest](#atmimage-eraldab-pildi-kuvamise-vaate-seest) - `1:37:37`
- [`AlertError` ja `errorMessage` vormi vigade kuvamiseks](#alerterror-ja-errormessage-vormi-vigade-kuvamiseks) - `1:43:03`
- [`validateFormCorrectInput` kogub kõik veateated kokku](#validateformcorrectinput-kogub-koik-veateated-kokku) - `1:51:53`
- [`atLeastOneTransactionTypeIsSelected` kontrollib massiivi](#atleastonetransactiontypeisselected-kontrollib-massiivi) - `2:12:11`
- [`LocationService` saadab POST päringu backendile](#locationservice-saadab-post-paringu-backendile) - `2:47:37`

<a id="oppeplaan-frontend-ja-backend-seotakse-hiljem-kokku"></a>
## Õppeplaan: frontend ja backend seotakse hiljem kokku - `0:00:02`

Video alguses selgitab õpetaja, miks frontendit ei tehta kohe lõpuni valmis. Osa frontendi teemasid jäetakse ajaks, mil backend on juba alustatud.

### Selgitus

Mõte on hoida frontend ja backend õppimises lähestikku. Kui frontend tehakse pikalt enne backendit ära, ununevad Vue andmevoo, komponentide ja event'ide detailid projekti ajaks ära.

Õpetaja rõhutab ka, et frontendit õppides õpitakse tegelikult programmeerimise üldiseid mõisteid:

- muutuja
- meetod
- objekt
- andmevoog
- sisend ja väljund

Need tulevad backendis uuesti tagasi, lihtsalt teises kirjaviisis.

### Skeem

```text
frontend põhimõisted
  -> muutujad, meetodid, objektid, event'id
backend
  -> samad mõtted klasside, meetodite ja teenustena
projekt
  -> mõlemad pooled töötavad koos
```

### Koodinäide

```js
methods: {
  addLocation() {
    this.validateFormCorrectInput()
  },
}
```

See on tavaline meetodi mõte: mingi nimega tegevus, mida saab hiljem välja kutsuda.

### Päriselu analoogia

Kui õpid kõigepealt ainult liiklusmärke ja alles kuu aja pärast sõitmist, siis märgid hakkavad ununema. Parem on õppida märki ja kohe seda liikluses kasutada.

<a id="input-saadab-iga-tahemargi-muudatuse-ules"></a>
## `@input` saadab iga tähemärgi muudatuse üles - `0:05:27`

Esimene praktiline teema on `LocationNameInput`. Eelmises videos voolas väärtus parentist alla. Nüüd pannakse muudatused childist üles tagasi liikuma.

### Selgitus

`@change` käivitub tavaliselt siis, kui kasutaja on välja muutmise lõpetanud ja liigub väljalt ära. `@input` käivitub iga sisestuse peale.

Kui tahame hoida `location` objekti kogu aeg ajakohasena, on `@input` parem. Iga täht saadetakse kohe üles.

Child ei muuda propsi otse. Ta saadab event'i:

- event'i nimi ütleb, mis juhtus
- payload ehk pakk sisaldab uut väärtust

### Skeem

```text
kasutaja kirjutab "A"
  -> @input käivitub
  -> $emit('event-location-name-updated', 'A')
  -> parent uuendab location.locationName
```

### Koodinäide

```vue
<input
  :value="locationName"
  @input="$emit('event-location-name-updated', $event.target.value)"
  type="text"
  class="form-control"
  id="inputLocationName"
  placeholder="Asukoht"
/>
```

Näide on failist `src/components/location/LocationNameInput.vue`.

### Päriselu analoogia

See on nagu otseülekanne. `@change` annaks kokkuvõtte alles lõpus, aga `@input` saadab iga sammu kohe edasi.

<a id="locationform-vahendab-grandchildi-eventi-edasi"></a>
## `LocationForm` vahendab grandchildi event'i edasi - `0:18:30`

`LocationNameInput` ei ole otse `LocationView` sees. Ta on `LocationForm` sees. Seetõttu peab event liikuma kaks korrust üles.

### Selgitus

Komponentide suhe on:

```text
LocationView
  -> LocationForm
       -> LocationNameInput
```

`LocationNameInput` saadab event'i `LocationForm`ile. `LocationForm` ei muuda ise väärtust, vaid emiteerib sama info järgmisele korrusele edasi.

Oluline detail: kui esimene child saadab üles ainult stringi, siis järgmine korrus ei kasuta enam `$event.target.value`. Seal on `$event` juba valmis väärtus.

### Skeem

```text
LocationNameInput
  -> event-location-name-updated('Tartu')
LocationForm
  -> event-location-name-updated('Tartu')
LocationView
  -> location.locationName = 'Tartu'
```

### Koodinäide

```vue
<LocationNameInput
  :location-name="location.locationName"
  @event-location-name-updated="$emit('event-location-name-updated', $event)"
/>
```

```js
emits: [
  'event-location-name-updated',
  'event-number-of-atms-updated',
  'event-transaction-type-checkbox-toggled',
]
```

Näited on failist `src/components/location/LocationForm.vue`.

### Päriselu analoogia

Kui sõnum liigub klassist õpetajani läbi klassivanema, siis klassivanem ei muuda sõnumit. Ta annab sama info edasi.

<a id="parent-kirjutab-eventiga-tulnud-vaartuse-location-objekti"></a>
## Parent kirjutab eventiga tulnud väärtuse `location` objekti - `0:23:18`

Kui event jõuab `LocationView` komponenti, siis seal uuendatakse päris andmemudelit.

### Selgitus

`LocationView` on selle vormi state'i omanik. Seal elab `location` objekt.

Kui `LocationForm` saadab event'i `event-location-name-updated`, kirjutab parent `$event` väärtuse `location.locationName` sisse.

See hoiab ühe keskse objekti ajakohasena. Kui hiljem vajutatakse `Lisa`, on andmed juba õiges objektis olemas.

### Skeem

```text
event-location-name-updated($event)
  -> location.locationName = $event
```

### Koodinäide

```vue
<LocationForm
  :location="location"
  @event-location-name-updated="location.locationName = $event"
  @event-number-of-atms-updated="location.numberOfAtms = $event"
  @event-transaction-type-checkbox-toggled="handleTransactionTypeCheckboxToggle"
/>
```

Näide on failist `src/views/LocationView.vue`.

### Päriselu analoogia

See on nagu keskne tellimusleht. Iga väike vormiosa teatab muutusest ja tellimusleht uuendatakse kohe.

<a id="numbrivali-tuleb-stringist-numbriks-teisendada"></a>
## Numbriväli tuleb stringist numbriks teisendada - `0:27:24`

`NumberOfAtmsInput` töötab sarnaselt nime väljale, aga seal on üks oluline erinevus: inputi väärtus tuleb brauserist stringina.

### Selgitus

HTML input võib olla `type="number"`, aga `$event.target.value` on JavaScriptis ikkagi string.

Kui paneksime selle otse `location.numberOfAtms` sisse, oleks seal näiteks `"100"` mitte `100`.

Seetõttu kasutatakse `Number(...)`.

### Skeem

```text
$event.target.value
  -> "5"
Number($event.target.value)
  -> 5
```

### Koodinäide

```vue
<input
  :value="numberOfAtms"
  @input="$emit('event-number-of-atms-updated', Number($event.target.value))"
  type="number"
  min="1"
  class="form-control"
/>
```

Näide on failist `src/components/location/NumberOfAtmsInput.vue`.

### Päriselu analoogia

Kui keegi ütleb sulle telefoni teel "viis", siis see on heli või tekst. Arvutamiseks pead selle päris arvuks tõlgendama.

<a id="eventtargetvalue-ja-eventtargetchecked"></a>
## `event.target.value` ja `event.target.checked` - `0:31:36`

Õpetaja peatub sellel, mida `event.target` tegelikult tähendab.

### Selgitus

`$event` on brauseri sündmus. `target` on see HTML element, mille peal sündmus juhtus.

Tekstiväljal ja numbriväljal huvitab meid `value`.

Checkboxil huvitab meid tavaliselt `checked`, sest see ütleb, kas kast on linnukesega märgitud.

Selles projektis saadetakse checkboxi puhul lõpuks üles ainult `transactionTypeId`, sest parent saab ise õige objekti väärtuse ümber pöörata.

### Skeem

```text
text input:
  $event.target.value -> kasutaja kirjutatud tekst

number input:
  Number($event.target.value) -> arv

checkbox:
  $event.target.checked -> true või false
```

### Koodinäide

```vue
@input="$emit('event-location-name-updated', $event.target.value)"
```

```vue
@input="$emit('event-number-of-atms-updated', Number($event.target.value))"
```

```vue
@input="$emit('event-transaction-type-checkbox-toggled', transactionType.transactionTypeId)"
```

### Päriselu analoogia

`target` on nagu küsida: "Millise lüliti juures sündmus toimus?" Kui tead lülitit, saad küsida selle olekut.

<a id="checkboxi-toggle-ja-propsi-otse-muutmise-valtimine"></a>
## Checkboxi toggle ja propsi otse muutmise vältimine - `0:42:02`

Checkboxide osa on keerulisem, sest `transactionTypes` on massiiv objektidest.

### Selgitus

Child-komponent saab `transactionTypes` propsina. Seda ei tohiks childis otse muuta.

Halb mõte oleks teha childis nii:

```js
transactionType.isAvailable = !transactionType.isAvailable
```

See töötaks võib-olla visuaalselt, aga rikub Vue andmevoo põhimõtet: props alla, event üles.

Õigem lahendus on:

- child saadab üles ainult `transactionTypeId`
- parent leiab oma `location.transactionTypes` massiivist õige objekti
- parent muudab state'i ise

### Skeem

```text
TransactionTypesCheckbox
  -> event-transaction-type-checkbox-toggled(transactionTypeId)

LocationView
  -> leiab õige objekti
  -> pöörab isAvailable väärtuse ümber
```

### Koodinäide

```vue
<input
  :checked="transactionType.isAvailable"
  @input="$emit('event-transaction-type-checkbox-toggled', transactionType.transactionTypeId)"
  class="form-check-input"
  type="checkbox"
/>
```

Näide on failist `src/components/location/TransactionTypesCheckbox.vue`.

### Päriselu analoogia

Kui töötaja märkab, et tellimuses tuleb midagi muuta, siis ta ei kirjuta otse raamatupidamise andmebaasi. Ta saadab muutmistaotluse inimesele, kelle vastutus see andmebaas on.

<a id="map-loob-uue-transactiontypes-massiivi"></a>
## `map` loob uue `transactionTypes` massiivi - `1:18:24`

Parentis kasutatakse checkboxi muutmiseks `map` meetodit. See loob uue massiivi, kus ainult ühe objekti `isAvailable` pööratakse ümber.

### Selgitus

`map` käib massiivi läbi ja tagastab uue massiivi.

Kui objekti `transactionTypeId` vastab eventiga tulnud ID-le, luuakse sellest uus objekt ja `isAvailable` väärtus pööratakse ümber.

Kui ID ei klapi, jääb objekt samaks.

See on puhtam kui massiivi sees oleva objekti otse muutmine, sest Vue saab uue massiivi väärtuse.

### Skeem

```text
transactionTypeId = 2

[
  { id: 1, isAvailable: false },
  { id: 2, isAvailable: false },
  { id: 3, isAvailable: false }
]

map järel:

[
  { id: 1, isAvailable: false },
  { id: 2, isAvailable: true },
  { id: 3, isAvailable: false }
]
```

### Koodinäide

```js
handleTransactionTypeCheckboxToggle(transactionTypeId) {
  this.location.transactionTypes = this.location.transactionTypes.map((t) =>
    t.transactionTypeId === transactionTypeId ? { ...t, isAvailable: !t.isAvailable } : t,
  )
}
```

Näide on failist `src/views/LocationView.vue`.

### Päriselu analoogia

See on nagu teha nimekirjast uus koopia, kus ainult üks rida on parandatud. Originaalset rida ei sodita child-komponendis.

<a id="atmimage-eraldab-pildi-kuvamise-vaate-seest"></a>
## `AtmImage` eraldab pildi kuvamise vaate seest - `1:37:37`

Pärast eventide osa tõstetakse pildi kuvamine eraldi komponendiks `AtmImage`.

### Selgitus

`LocationView` ei pea teadma kõiki pildi kuvamise detaile. Ta annab `AtmImage` komponendile ainult `imageData`.

`AtmImage` otsustab:

- kui `imageData` on tühi, näita vaikimisi ATM pilti
- muidu näita kasutaja valitud pilti

See teeb `LocationView` template'i lühemaks ja loetavamaks.

### Skeem

```text
LocationView
  -> imageData
AtmImage
  -> v-if tühi: vaikimisi pilt
  -> v-else: kasutaja pilt
```

### Koodinäide

```vue
<AtmImage :image-data="location.imageData" />
```

```vue
<img
  v-if="imageData === ''"
  src="@/assets/images/atm.png"
  class="img-thumbnail"
  alt="Pangaautomaadi pilt"
/>
<img v-else :src="imageData" class="img-thumbnail" alt="Pangaautomaadi pilt" />
```

Näited on failidest `src/views/LocationView.vue` ja `src/views/AtmImage.vue`.

### Päriselu analoogia

Kui vaate ülesanne on kogu lehte juhtida, siis pildi kuvamise pisireeglid võiksid olla eraldi abilises, mitte suure lehe keskel.

<a id="alerterror-ja-errormessage-vormi-vigade-kuvamiseks"></a>
## `AlertError` ja `errorMessage` vormi vigade kuvamiseks - `1:43:03`

Vormi valideerimise jaoks lisatakse `AlertError` komponent ja `errorMessage` muutuja.

### Selgitus

`AlertError` kuvab punase Bootstrap alert'i ainult siis, kui `errorMessage` ei ole tühi.

`LocationView` hoiab `errorMessage` väärtust. Kui valideerimisel leitakse vigu, pannakse sinna tekst. Kui kõik on korras, jääb see tühjaks.

`white-space: pre-line` võimaldab veateated kuvada mitmel real, kui string sisaldab reavahetusi.

### Skeem

```text
errorMessage === ''
  -> alerti ei kuvata

errorMessage sisaldab teksti
  -> AlertError kuvab punase teate
```

### Koodinäide

```vue
<AlertError :error-message="errorMessage" />
```

```vue
<div v-if="errorMessage" class="alert alert-danger" role="alert" style="white-space: pre-line">
  {{ errorMessage }}
</div>
```

Näited on failidest `src/views/LocationView.vue` ja `src/components/AlertError.vue`.

### Päriselu analoogia

See on nagu vormi ülemine teadetetahvel. Kui kõik on korras, on tahvel tühi. Kui midagi on valesti, ilmub sinna nimekiri.

<a id="validateformcorrectinput-kogub-koik-veateated-kokku"></a>
## `validateFormCorrectInput` kogub kõik veateated kokku - `1:51:53`

`addLocation` ei saada kohe andmeid backendile. Kõigepealt kontrollitakse vorm üle.

### Selgitus

Valideerimine tähendab, et kontrollitakse kasutaja sisendi sobivust.

Siin kontrollitakse:

- linn on valitud
- asukoha nimi on täidetud
- automaatide arv on vähemalt 1
- vähemalt üks ATM toiming on valitud

Kõik vead kogutakse massiivi `errorMessages`. Lõpus tehakse neist üks string `join('\n')` abil.

Kui `errorMessage` jääb tühjaks, võib andmed backendile saata.

### Skeem

```text
addLocation()
  -> validateFormCorrectInput()
  -> kui errorMessage === ''
       saada POST päring
     muidu
       näita veateateid
```

### Koodinäide

```js
addLocation() {
  this.validateFormCorrectInput()

  if (this.errorMessage === '') {
    LocationService.sendPostAtmLocation(this.location)
  }
}
```

```js
validateFormCorrectInput() {
  this.errorMessage = ''
  let errorMessages = []

  if (this.location.cityId === 0) {
    errorMessages.push('Vali mingi linn')
  }

  if (this.location.locationName === '') {
    errorMessages.push('Täida askoha nimi')
  }

  if (this.location.numberOfAtms < 1) {
    errorMessages.push('Vali vähemalt 1 pangaautomaat')
  }

  if (!this.atLeastOneTransactionTypeIsSelected()) {
    errorMessages.push('Vali vähemalt 1 ATM toiming')
  }

  this.errorMessage = errorMessages.join('\n')
}
```

Näited on failist `src/views/LocationView.vue`.

### Päriselu analoogia

Enne paki postitamist kontrollid aadressi, saajat ja sisu. Kui midagi puudub, ei vii pakki postkontorisse.

<a id="atleastonetransactiontypeisselected-kontrollib-massiivi"></a>
## `atLeastOneTransactionTypeIsSelected` kontrollib massiivi - `2:12:11`

ATM toimingute kontroll ei ole ühe lihtsa välja kontroll. `transactionTypes` on massiiv, seega tuleb see läbi käia.

### Selgitus

Meetod käib kõik `transactionTypes` elemendid läbi.

Kui vähemalt ühe objekti `isAvailable` on `true`, tagastab meetod kohe `true`.

Kui tsükkel lõpeb ja ühtegi valitud toimingut ei leitud, tagastab meetod `false`.

Meetodi nimi on positiivne: `atLeastOneTransactionTypeIsSelected`. Kui vaja on vastupidist kontrolli, pannakse `!` ette.

### Skeem

```text
for iga transactionType:
  kui isAvailable === true
    return true

return false
```

### Koodinäide

```js
atLeastOneTransactionTypeIsSelected() {
  for (let transactionType of this.location.transactionTypes) {
    if (transactionType.isAvailable) {
      return true
    }
  }
  return false
}
```

```js
if (!this.atLeastOneTransactionTypeIsSelected()) {
  errorMessages.push('Vali vähemalt 1 ATM toiming')
}
```

Näited on failist `src/views/LocationView.vue`.

### Päriselu analoogia

Kui tahad teada, kas ostukorvis on vähemalt üks toode, vaatad järjest läbi. Esimese toote leidmisel ei pea edasi otsima.

<a id="locationservice-saadab-post-paringu-backendile"></a>
## `LocationService` saadab POST päringu backendile - `2:47:37`

Video lõpus lisatakse `LocationService` faili POST päringu meetod.

### Selgitus

GET päring küsib andmeid. POST päring saadab uue objekti backendile.

`axios.post` saab tavaliselt kolm argumenti:

- URL
- data ehk keha, mis saadetakse kaasa
- config ehk lisaseaded, kui neid on vaja

Selles näites piisab URL-ist ja `location` objektist.

Oluline mõte: `LocationService` ei tohi minna ise `LocationView` seest andmeid otsima. Ta peab olema korduvkasutatav teenus. Seetõttu antakse `location` meetodile parameetrina kaasa.

### Skeem

```text
LocationView
  -> LocationService.sendPostAtmLocation(this.location)

LocationService
  -> axios.post('/api/atm/location', location)
```

### Koodinäide

```js
sendPostAtmLocation(location) {
  return axios.post('/api/atm/location', location)
}
```

```js
if (this.errorMessage === '') {
  LocationService.sendPostAtmLocation(this.location)
}
```

Näited on failidest `src/api-services/LocationService.js` ja `src/views/LocationView.vue`.

### Päriselu analoogia

Kuller ei lähe ise sinu tuppa pakki otsima. Sina annad paki kullerile kaasa ja tema viib selle õigesse kohta.
