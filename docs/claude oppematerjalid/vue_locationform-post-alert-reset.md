## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/HqIIq_pzKRqM9Z_qV7dBU1gc3x64EjZUoUMBUg6j_2sfqdkL-EMYcig1FmUOUNO5.QbXWQc-eou7OhFn_?startTime=1777270045000) |
| **Parool** | `t74@K+$9` |
| **Transkript** | [GMT20260427-060725_v-1.vtt](../transcripts/GMT20260427-060725_v-1.vtt) |

## Sisukord

- [Plaan ja poolelioleva töö jätkamine](#plaan-ja-poolelioleva-too-jatkamine) — `0:00:06`
- [LocationView ja LocationForm andmevoog](#locationview-ja-locationform-andmevoog) — `0:03:06`
- [Props ja event’id komponentide vahel](#props-ja-eventid-komponentide-vahel) — `0:08:07`
- [Vormi valideerimine ja POST päring](#vormi-valideerimine-ja-post-paring) — `0:13:52`
- [Backend response: then, catch ja status code](#backend-response-then-catch-ja-status-code) — `0:19:49`
- [FEB-11 – success alert ja vormi reset](#feb-11-success-alert-ja-vormi-reset) — `0:41:09`
- [Alertide kaust ja successMessage kuvamine](#alertide-kaust-ja-successmessage-kuvamine) — `0:50:08`
- [Teadete reset ja kasutaja tagasiside](#teadete-reset-ja-kasutaja-tagasiside) — `0:53:12`
- [Vormi väljade taastamine algseisu](#vormi-valjade-taastamine-algseisu) — `1:05:07`
- [Pildi input, ref ja watcher](#pildi-input-ref-ja-watcher) — `1:20:56`
- [Error response ja erijuht 403/333](#error-response-ja-erijuht-403333) — `2:04:33`
- [Muud vead ja navigeerimine error vaatesse](#muud-vead-ja-navigeerimine-error-vaatesse) — `2:16:37`
- [Git merge ja töö lõpetamine](#git-merge-ja-too-lopetamine) — `2:19:09`

## Plaan ja poolelioleva töö jätkamine — `0:00:06` {#plaan-ja-poolelioleva-too-jatkamine}

Loengu alguses pannakse paika päevaplaan. Kõigepealt lõpetatakse pangaautomaatide asukoha lisamise funktsionaalsus. Seejärel on plaan liikuda backend'i juurde.

Oluline mõte oli ka tiimiprojektide planeerimine. Enne programmeerimist tuleb läbi mõelda, mida ehitatakse, milline toode välja näeb ja kuidas tiimis töö jaguneb.

### Selgitus

Arenduses on tavaline, et enne uue suure teema alustamist lõpetatakse pooleliolev kasutajavoog ära. Siin on kasutajavoog:

1. kasutaja valib linna;
2. sisestab asukoha nime;
3. valib automaatide arvu;
4. valib toimingud;
5. lisab soovi korral pildi;
6. vajutab `Lisa`;
7. frontend saadab andmed backend'ile;
8. kasutaja näeb õnnestumise või vea teadet.

### Päriselu analoogia

See on nagu paberankeedi täitmine. Enne kui ankeet arhiveeritakse, peab süsteem kontrollima, kas kohustuslikud väljad on täidetud ja kas vastuvõtja kinnitab, et ankeet võeti vastu.

## LocationView ja LocationForm andmevoog — `0:03:06` {#locationview-ja-locationform-andmevoog}

`LocationView` on vaade, kus kasutaja lisab uut pangaautomaadi asukohta. `LocationForm` on alamkomponent, mis kuvab osa vormiväljadest.

Põhiobjekt on `location`. Selle sees hoitakse vormi andmeid:

```js
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
}
```

### Selgitus

`location` on üks ühine andmemudel. Kui vormis midagi muutub, muudetakse seda objekti. Kui kasutaja vajutab `Lisa`, saadetakse sama objekt POST päringuga backend'ile.

### Skeem

```text
LocationView
  location objekt
      |
      | props
      v
LocationForm
  inputid ja checkboxid
      |
      | event'id
      v
LocationView muudab location objekti
```

### Koodinäide

Näide failist `src/views/LocationView.vue`:

```vue
<LocationForm
  :location="location"
  @event-location-name-updated="location.locationName = $event"
  @event-number-of-atms-updated="location.numberOfAtms = $event"
  @event-transaction-type-checkbox-toggled="handleTransactionTypeCheckboxToggle"
/>
```

Siin liigub `location` alla `props` abil. Muudatused tulevad tagasi üles `event` abil.

## Props ja event’id komponentide vahel — `0:08:07` {#props-ja-eventid-komponentide-vahel}

`props` tähendab Vue komponendis andmeid, mis antakse parent komponendist child komponendile. `event` on sõnum, mille child saadab parentile tagasi.

### Selgitus

Vue puhul on hea hoida andmevoog arusaadav:

- parent annab andmed alla `props` abil;
- child kuvab andmeid;
- child ei muuda parenti otse;
- child saadab muutuse kohta `event`i üles;
- parent otsustab, mida andmetega teha.

### Skeem

```text
Parent
  :location-name="location.locationName"
        |
        v
Child input
        |
        | $emit('event-location-name-updated', uusVaartus)
        v
Parent
  location.locationName = uusVaartus
```

### Koodinäide

Näide failist `src/components/location/LocationForm.vue`:

```vue
<LocationNameInput
  :location-name="location.locationName"
  @event-location-name-updated="$emit('event-location-name-updated', $event)"
/>
```

`LocationForm` ei salvesta nime ise. Ta võtab alamkomponendist tulnud event'i ja saadab selle järgmisele korrusele edasi.

### Päriselu analoogia

`props` on nagu õpetaja jagatud tööleht: laps saab selle kätte ja täidab. `event` on nagu käe tõstmine: laps annab teada, et midagi muutus.

## Vormi valideerimine ja POST päring — `0:13:52` {#vormi-valideerimine-ja-post-paring}

Enne backend'ile saatmist kontrollitakse, kas vormis on vajalikud andmed olemas.

### Selgitus

Valideerimine tähendab kontrollimist. Siin kontrollitakse näiteks:

- linn peab olema valitud;
- asukoha nimi peab olema täidetud;
- automaatide arv peab olema vähemalt `1`;
- vähemalt üks toiming peab olema valitud.

Kui vigu on, pannakse need `errorMessage` muutujasse. Kui vigu pole, saadetakse `location` objekt backend'ile.

### Koodinäide

Näide failist `src/views/LocationView.vue`:

```js
addLocation() {
  this.resetAllMessages()
  this.validateFormCorrectInput()

  if (this.errorMessage === '') {
    LocationService.sendPostAtmLocation(this.location)
      .then(() => this.handleAddLocationResponse())
      .catch((error) => this.handleAddLocationError(error))
      .finally()
  }
}
```

See loeb algajasõbralikult nii:

1. puhasta vanad teated;
2. kontrolli vormi;
3. kui vigu pole, saada andmed;
4. õnnestumisel käivita success handler;
5. vea korral käivita error handler.

### POST päringu näide

Näide failist `src/api-services/LocationService.js`:

```js
sendPostAtmLocation(location) {
  return axios.post('/api/atm/location', location)
}
```

`axios.post` esimene argument on URL. Teine argument on saadetav data ehk siin `location` objekt.

## Backend response: then, catch ja status code — `0:19:49` {#backend-response-then-catch-ja-status-code}

Backend ei pea alati andmeid tagasi saatma. Mõnikord piisab sellest, et backend ütleb: kõik läks hästi.

### Selgitus

Kui POST päring õnnestub, võib backend tagastada ainult `200 OK`. Frontend ei vaja alati uut objekti. Näiteks asukoha lisamisel piisab teadmisest, et lisamine õnnestus.

Kui midagi läheb valesti, on vaja rohkem infot:

- HTTP status code, näiteks `403`;
- rakenduse oma error code, näiteks `333`;
- kasutajale kuvatav message.

### Skeem

```text
POST /api/atm/location
        |
        v
Backend
  200 OK        -> .then(...)
  403 + body    -> .catch(...)
  500           -> .catch(...)
```

### Päriselu analoogia

Kui annad dokumendi leti töötajale ja kõik sobib, ütleb ta lihtsalt "korras". Kui dokument ei sobi, peab ta ütlema, mis täpselt valesti on.

## FEB-11 – success alert ja vormi reset — `0:41:09` {#feb-11-success-alert-ja-vormi-reset}

Loengus mainitud task oli `FEB-11`. Selle eesmärk oli lisada edukale asukoha lisamisele kasutaja tagasiside ja teha vorm uuesti tühjaks.

### Selgitus

Taski järgi peab õnnestumise korral juhtuma kaks asja:

- kasutajale näidatakse rohelist success teadet;
- vormi väljad taastatakse algseisu, et saaks lisada järgmise asukoha.

### Koodinäide

Näide failist `src/components/alerts/AlertSuccess.vue`:

```vue
<template>
  <div v-if="successMessage" class="alert alert-success" role="alert" style="white-space: pre-line">
    {{ successMessage }}
  </div>
</template>

<script>
export default {
  name: 'AlertSuccess',
  props: {
    successMessage: String,
  },
}
</script>
```

`v-if="successMessage"` tähendab: kuva alert ainult siis, kui sõnum ei ole tühi.

### Päriselu analoogia

See on nagu pangaterminali roheline teade "Toiming õnnestus". Kui toimingut pole tehtud, pole mõtet seda teadet ekraanil hoida.

## Alertide kaust ja successMessage kuvamine — `0:50:08` {#alertide-kaust-ja-successmessage-kuvamine}

Kui rakenduses tekib mitu sarnast komponenti, on mõistlik need kokku grupeerida. Siin pandi `AlertError` ja `AlertSuccess` kausta `src/components/alerts/`.

### Selgitus

Kaust aitab koodi lugeda. Kui näed `components/alerts`, saad kohe aru, et seal on kasutajateadete komponendid.

### Koodinäide

Näide failist `src/views/LocationView.vue`:

```vue
<AlertSuccess :success-message="successMessage" />
<AlertError :error-message="errorMessage" />
```

Mõlemad komponendid töötavad sama põhimõttega:

- parent hoiab sõnumit data blokis;
- alert saab sõnumi propsina;
- kui sõnum on tühi, alerti ei kuvata;
- kui sõnumis on tekst, alert ilmub nähtavale.

### Skeem

```text
successMessage = ''
  -> AlertSuccess peidus

successMessage = 'Pangaautomaadi asukoht "A" on süsteemi lisatud :)'
  -> AlertSuccess nähtaval
```

## Teadete reset ja kasutaja tagasiside — `0:53:12` {#teadete-reset-ja-kasutaja-tagasiside}

Loengus märgati bugi: success message jäi nähtavale ka siis, kui järgmine lisamise katse oli vigane.

### Selgitus

Kui kasutaja vajutab uuesti `Lisa`, peab vana tagasiside kaduma. Muidu näeb kasutaja korraga vana õnnestumist ja uut viga.

Selle jaoks loodi eraldi meetod:

```js
resetAllMessages() {
  this.successMessage = ''
  this.errorMessage = ''
}
```

See käivitatakse `addLocation()` alguses:

```js
addLocation() {
  this.resetAllMessages()
  this.validateFormCorrectInput()
  // ...
}
```

### Päriselu analoogia

See on nagu kustutaksid tahvli enne uut ülesannet. Vana vastus ei tohi segada uut kontrolli.

## Vormi väljade taastamine algseisu — `1:05:07` {#vormi-valjade-taastamine-algseisu}

Pärast edukat lisamist peab vorm olema jälle valmis uue asukoha sisestamiseks.

### Selgitus

Kuna kogu vorm sõltub `location` objektist, piisab selle objekti väljade algväärtustesse panemisest. Toimingute nimekiri tuuakse backend'ist uuesti, sest vahepeal võib valikuid juurde tulla.

### Koodinäide

Näide failist `src/views/LocationView.vue`:

```js
resetLocationFields() {
  this.location.cityId = 0
  this.location.locationName = ''
  this.location.numberOfAtms = 1
  this.location.imageData = ''
  this.getLocationTransactionTypes()
}
```

`getLocationTransactionTypes()` saadab uue GET päringu ja täidab checkboxide valikud värske infoga.

### Skeem

```text
Edukalt lisatud
      |
      v
resetLocationFields()
      |
      |-- cityId = 0
      |-- locationName = ''
      |-- numberOfAtms = 1
      |-- imageData = ''
      |-- transactionTypes tuuakse uuesti
```

## Pildi input, ref ja watcher — `1:20:56` {#pildi-input-ref-ja-watcher}

Pildi input on erijuht. Tavaline `input type="file"` ei käitu alati nii mugavalt nagu tekstiväli. Failivaliku tühjendamiseks vaadati kahte lahendust: `ref` ja `watcher`.

### Selgitus

`ref` lubab programmiliselt otse komponendi või HTML elemendi poole pöörduda. See töötab, aga sellega peab ettevaatlik olema, sest element peab selleks hetkeks juba renderdatud olema.

Loengus eelistati lõpuks andmepõhist lahendust:

- parent hoiab muutujat `resetImageInput`;
- parent annab selle childile propsina;
- child jälgib seda propsi watcheriga;
- kui väärtus muutub `true`, tühjendab child file inputi;
- child saadab parentile event'i, et reset on tehtud;
- parent paneb `resetImageInput` tagasi `false`.

### Koodinäide

Näide failist `src/views/LocationView.vue`:

```vue
<ImageInput
  ref="imageInputRef"
  :reset-file-input="resetImageInput"
  @event-new-image-selected="location.imageData = $event"
  @event-reset-image-select-complete="resetImageInput = false"
/>
```

Näide failist `src/components/ImageInput.vue`:

```js
watch: {
  resetFileInput(newValue) {
    if (newValue) {
      this.clearFileInput()
    }
  },
},
methods: {
  clearFileInput() {
    if (this.$refs.fileInput) {
      this.$refs.fileInput.value = ''
      this.$emit('event-reset-image-select-complete')
    }
  },
}
```

### Skeem

```text
LocationView
  resetImageInput = true
        |
        | props
        v
ImageInput watcher
  resetFileInput muutus true-ks
        |
        v
clearFileInput()
        |
        | event-reset-image-select-complete
        v
LocationView
  resetImageInput = false
```

### Päriselu analoogia

Watcher on nagu valvur, kes jälgib ust. Kui uks avaneb, teeb ta tegevuse. Kui uks on kogu aeg samas asendis, ei tee ta midagi. Watcher vajab muutust.

## Error response ja erijuht 403/333 — `2:04:33` {#error-response-ja-erijuht-403333}

Vea korral tuleb backend'ist rohkem infot. Loengus käsitleti olukorda, kus sama nimega pangaautomaadi asukoht on juba süsteemis olemas.

### Selgitus

Kõik vead ei ole ühesugused. Mõni viga on kasutajale parandatav. Näiteks kui asukoht on juba olemas, saab kasutajale kuvada konkreetse teate.

Selleks kontrollitakse:

- HTTP status code on `403`;
- backend'i enda `errorCode` on `333`.

Kui mõlemad klapivad, kuvatakse backend'ist tulnud `message`.

### Koodinäide

Näide failist `src/views/LocationView.vue`:

```js
handleAddLocationError(error) {
  const statusCode = error.response.status
  this.errorResponse = error.response.data

  if (statusCode === 403 && this.errorResponse.errorCode === 333) {
    this.errorMessage = this.errorResponse.message
  } else {
    NavigationService.navigateToErrorView()
  }
}
```

### Skeem

```text
.catch(error)
   |
   v
statusCode = error.response.status
errorResponse = error.response.data
   |
   +-- 403 ja errorCode 333 -> näita errorMessage
   |
   +-- muu viga -> mine ErrorView peale
```

### Päriselu analoogia

See on nagu teenindaja ütleb: "Selle nimega avaldus on juba olemas." Sellisel juhul saab kasutaja nime muuta. Kui aga süsteem ise ei tööta, ei saa kasutaja seda vormis parandada.

## Muud vead ja navigeerimine error vaatesse — `2:16:37` {#muud-vead-ja-navigeerimine-error-vaatesse}

Kõik muud vead suunatakse üldisele error vaatele.

### Selgitus

Kui viga ei ole kasutaja poolt parandatav, ei ole mõtet näidata vormi juures tehnilist infot. Selle asemel viiakse kasutaja error vaatesse.

Näide failist `src/navigation/NavigationService.js`:

```js
navigateToErrorView() {
  // todo: peale arendust lülita sisse
  // router.push({ name: 'errorRoute' })
}
```

Arenduse ajal võib navigeerimine olla välja kommenteeritud, sest muidu on testimine tüütu: iga vea järel viiakse kasutaja vormilt ära.

### Päriselu analoogia

Kui vormis on väike viga, saab inimene selle parandada. Kui aga andmebaas ei tööta, tuleb näidata üldist "midagi läks valesti" lehte.

## Git merge ja töö lõpetamine — `2:19:09` {#git-merge-ja-too-lopetamine}

Loengu lõpus räägiti arendusharu lõpetamisest ja masterisse liitmisest.

### Selgitus

Arenduses tehakse töö tavaliselt eraldi branchis. Kui töö on valmis, liidetakse see põhiharusse. Päriselus ei lükata koodi otse masterisse, vaid tehakse review.

Oluline järjekord:

1. töö valmib arendusbranchis;
2. muudatused commititakse;
3. tehakse merge või pull request;
4. keegi vaatab muudatused üle;
5. pärast kinnitamist jõuab töö põhiharusse;
6. vana arendusbranch kustutatakse.

### Skeem

```text
feature/FEB-11
      |
      | review
      v
master
      |
      v
push remote repository'sse
```

### Päriselu analoogia

See on nagu dokumendi mustand ja kinnitatud versioon. Mustandis võib teha muudatusi. Kinnitatud versiooni jõuab ainult üle vaadatud töö.
