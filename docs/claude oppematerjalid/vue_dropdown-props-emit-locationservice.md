## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/NXlV3L3iaa00-xkOVAhO5FRnyxZjqkBvMKjnQYB3CGpci1s4N8EIo0NliM88zxgx.SkluJr26uO_ikv70?startTime=1776924927000) |
| **Parool** | `4uX#*q2m` |
| **Transkript** | [GMT20260423-061527_v-1.vtt](../transcripts/GMT20260423-061527_v-1.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Näiteks esinevad kujul `Electric City Id`, `City Strop Down`, `Respons`, `voe`, `Stop light` ja `peeb kumme`, kuigi kontekstist on selge, et mõeldud on `selectedCityId`, `CitiesDropdown`, `response`, `Vue`, `Stoplight` ja `FEB-10`.

Taski nimetused `FEB-9` ja `FEB-10` on selles materjalis tuletatud õppejõu hääldusest `Feb üheksa` ja `Feb kümme`. Varasem algusmärkus on liiga vigane, et seda mõne muu taski kindla koodina kasutada.

Selles õppematerjalis seon video teemad failidega `src/views/AtmsView.vue`, `src/components/CitiesDropdown.vue`, `src/api-services/LocationService.js`, `src/api-services/CityService.js`, `src/components/AlertError.vue`, `src/navigation/NavigationService.js` ja võrdlusena `src/views/LoginView.vue`.

## Sisukord

- [`@change` võib jääda otse templatisse](#change-voib-jaada-otse-templatisse) - `0:03:27`
- [`props` toovad `cities` ja `selectedCityId` childi](#props-toovad-cities-ja-selectedcityid-childi) - `0:05:08`
- [`$emit` saadab valiku parentile tagasi](#emit-saadab-valiku-parentile-tagasi) - `0:06:08`
- [`FEB-9` - esimene dropdowni samm on tehtud ja harud tuleb korras hoida](#feb-9-esimene-dropdowni-samm-on-tehtud-ja-harud-tuleb-korras-hoida) - `0:07:21`
- [`FEB-10` - ATM asukohtade tabel algab andmemudelist](#feb-10-atm-asukohtade-tabel-algab-andmemudelist) - `0:14:04`
- [`LocationService` küsib `cityId` põhjal õigeid ATM asukohti](#locationservice-kusib-cityid-pohjal-oigeid-atm-asukohti) - `1:36:52`
- [`then / catch / finally` ja abimeetodid hoiavad vaate loetavana](#then-catch-finally-ja-abimeetodid-hoiavad-vaate-loetavana) - `1:44:44`
- [`response.data` läheb `locations` muutujasse, mis elab `data()` blokis](#responsedata-laheb-locations-muutujasse-mis-elab-data-blokis) - `1:48:22`
- [`404 + errorCode 222` kuvab veateate, muu viga viib `ErrorView` lehele](#404--errorcode-222-kuvab-veateate-muu-viga-viib-errorview-lehele) - `2:32:01`
- [`selectedCityId` muutmine peab kohe käivitama uue päringu](#selectedcityid-muutmine-peab-kohe-kaivitama-uue-paringu) - `2:59:43`
- [Meetodi nimi peab rääkima tõtt](#meetodi-nimi-peab-raakima-tott) - `3:00:20`

<a id="change-voib-jaada-otse-templatisse"></a>
## `@change` võib jääda otse templatisse - `0:03:27`

Video alguses võtab õpetaja maha üleliigse meetodi ja tuletab meelde lihtsat reeglit: kui tegevus on ühe rea pikkune ja arusaadav, võib see elada otse template'is.

### Selgitus

`@change` tähendab Vue sündmusekuulajat. See kuulab, millal kasutaja muudab `select` valikut.

Kui tegevus on väike:

- loe väärtus välja
- muuda see numbriks
- saada see üles

siis ei ole alati vaja eraldi meetodit.

Kui tegevus kasvab pikemaks, siis on eraldi meetod jälle hea, sest sellele saab anda nime ja seda on lihtsam lugeda, muuta ja testida.

Õpetaja lisab siia ka praktilise harjumuse: kustuta blokke koos alguse ja lõpuga. Nii ei jää sulud tasakaalust välja ja süntaks ei lagune.

### Skeem

```text
kasutaja muudab dropdowni
  -> @change käivitub
  -> loe $event.target.value
  -> tee Number(...)
  -> saada väärtus edasi
```

### Koodinäide

```vue
<select
  @change="$emit('event-new-city-selected', Number($event.target.value))"
  :value="selectedCityId"
  class="form-select"
  aria-label="Vali linn"
>
```

See näide on praegu olemas failis `src/components/CitiesDropdown.vue`.

### Päriselu analoogia

Kui sul on vaja ainult uksekella vajutada, siis sa ei ehita selle jaoks eraldi juhtimiskeskust. Üks lihtne tegevus võibki olla otse nupu all.

<a id="props-toovad-cities-ja-selectedcityid-childi"></a>
## `props` toovad `cities` ja `selectedCityId` childi - `0:05:08`

Järgmine suur teema on andmevoog parentilt childile. Dropdown ei loo ise linnu ega otsusta ise, milline linn on valitud. Ta saab selle info ülevalt.

### Selgitus

`props` on Vue mehhanism, millega parent-komponent annab child-komponendile andmeid kaasa.

Siin voolab `AtmsView` failist `CitiesDropdown` faili kaks olulist asja:

- `cities` - millised valikud tuleb rippmenüüsse joonistada
- `selectedCityId` - milline valik peab hetkel aktiivne olema

See on oluline, sest seis ehk state elab parentis. Child on siin pigem esitluskiht.

### Skeem

```text
AtmsView
  -> cities
  -> selectedCityId
        |
        v props
CitiesDropdown
  -> joonistab optionid
  -> näitab aktiivset valikut
```

### Koodinäide

```vue
<CitiesDropdown
  :cities="cities"
  :selected-city-id="selectedCityId"
  @event-new-city-selected="getSelectedCityLocations"
/>
```

```js
data() {
  return {
    selectedCityId: 0,
    cities: [
      {
        cityId: 0,
        cityName: '',
      },
    ],
  }
}
```

### Päriselu analoogia

See on nagu köögis oleks menüü juhtimine peakokal. Saalitöötaja ei mõtle ise roogi välja, vaid saab nimekirja ja kehtiva valiku köögist.

<a id="emit-saadab-valiku-parentile-tagasi"></a>
## `$emit` saadab valiku parentile tagasi - `0:06:08`

Video oluline hetk on see, kui õpetaja tuletab meelde, et andmed voolavad alla propsidega, aga kasutaja tegevus tuleb üles event'iga.

### Selgitus

Kui kasutaja valib dropdownist linna, siis `CitiesDropdown` ei muuda parenti otse. Selle asemel ta saadab sõnumi üles.

Selle sõnumi nimi on `event-new-city-selected` ja kaasa läheb valitud `cityId`.

Parent kuulab seda sõnumit ja teeb pärast ise otsuse:

- salvestab uue `selectedCityId`
- käivitab vajadusel uue päringu

See on hea tava, sest child ei puutu parenti andmeid salaja.

### Skeem

```text
props liiguvad alla:
AtmsView -> CitiesDropdown

event liigub üles:
CitiesDropdown -> event-new-city-selected(cityId) -> AtmsView
```

### Koodinäide

```vue
<select
  @change="$emit('event-new-city-selected', Number($event.target.value))"
  :value="selectedCityId"
>
```

```js
getSelectedCityLocations(selectedCityId) {
  this.selectedCityId = selectedCityId
  this.getLocations()
}
```

### Päriselu analoogia

Laps ei võta ise vanema pangakaarti. Ta ütleb vanemale, mida ta soovib, ja vanem otsustab, mida selle teadmisega edasi teha.

<a id="feb-9-esimene-dropdowni-samm-on-tehtud-ja-harud-tuleb-korras-hoida"></a>
## `FEB-9` - esimene dropdowni samm on tehtud ja harud tuleb korras hoida - `0:07:21`

Õpetaja markeerib eelmise dropdowni sammu tehtuks ja liigub kohe Git-hügieeni juurde. See osa pole Vue loogika ise, aga see selgitab, kuidas õppetöö tuleb ohutult masterisse tagasi tuua.

### Selgitus

Peamine mõte on:

- `pull` tehakse aktiivsel harul
- merge'itud remote-harud kustutatakse ära
- pilves ja lokaalis peab seis olema arusaadav

Miks see oluline on? Kui remote'i ja kohalikku Git ajalugu ei hooldata, siis tekib tunne, et mingi töö on veel pooleli, kuigi see on tegelikult ammu merge'itud.

### Skeem

```text
feature branch
  -> tee töö valmis
  -> push remote'i
  -> merge
  -> kustuta vana remote branch
```

### Koodinäide

```bash
git checkout teacher-feb-9
git pull origin teacher-feb-9
git push origin teacher-feb-9
```

Täpsed harunimed võivad projektiti erineda. Oluline õppetund on tööjärjekord, mitte just see nimi.

### Päriselu analoogia

Kui ehitad riiulit ja tööriistad on kõik põrandale jäetud, siis järgmine inimene ei saa aru, kas töö veel käib või on juba lõppenud. Git-hügieen teeb sama asja digitaalselt korda.

<a id="feb-10-atm-asukohtade-tabel-algab-andmemudelist"></a>
## `FEB-10` - ATM asukohtade tabel algab andmemudelist - `0:14:04`

Uus task ei alga HTML-ist, vaid andmetest. See on tugev insenerihaare: enne kui joonistad tabeli, pead teadma, millist struktuuri backend lubab.

### Selgitus

Õpetaja käib läbi, et juurde tulevad tabelid:

- `location`
- `image`
- `transaction_type`
- `location_transaction_type`

ja `location` on seotud `city` tabeliga läbi `cityId` välisvõtme.

See on oluline, sest UI tabeli kolm veergu:

- linn
- asukoht
- teenused

ei tule ühest lihtsast stringist, vaid seostatud andmemudelist.

### Skeem

```text
city 1 ---- * location * ---- * location_transaction_type * ---- 1 transaction_type
                  |
                  * ---- 1 image
```

### Koodinäide

```html
<table class="table table-dark table-hover">
  <thead>
    <tr>
      <th scope="col">Linn</th>
      <th scope="col">Asukoht</th>
      <th scope="col">Teenused</th>
    </tr>
  </thead>
</table>
```

See tabeli pealkirjade plokk on juba olemas failis `src/views/AtmsView.vue`.

### Päriselu analoogia

Enne kui laod poes sildid riiulitele, pead teadma, millisest laost ja milliste kastidega kaup tuleb. Vastasel juhul kujundad ilusa riiuli valede toodete jaoks.

<a id="locationservice-kusib-cityid-pohjal-oigeid-atm-asukohti"></a>
## `LocationService` küsib `cityId` põhjal õigeid ATM asukohti - `1:36:52`

Siin hakkab video praktiline kooditöö. Idee on lihtne: vaade ei saada HTTP päringut suvalisest kohast, vaid kasutab selleks eraldi teenuskihti.

### Selgitus

`LocationService` on eraldi fail, kuhu on pandud "kuidas serveriga suhelda".

See annab kaks kasu:

- `AtmsView` saab keskenduda vaate loogikale
- HTTP detailid nagu URL, `params` ja `headers` elavad ühes kohas

Oluline detail on `cityId`:

- esimesel lehelaadimisel on see `0`, mis tähendab "kõik linnad"
- hiljem tuleb sinna kasutaja valitud linna ID

### Skeem

```text
beforeMount()
  -> getLocations()
     -> LocationService.sendGetAtmLocations(selectedCityId)
        -> GET /api/atm/locations?cityId=...
```

### Koodinäide

```js
beforeMount() {
  this.getCities()
  this.getLocations()
}
```

```js
sendGetAtmLocations(cityId) {
  return axios.get('/api/atm/locations', {
    headers: { Prefer: this.getPreferValue(cityId) },
    params: {
      cityId: cityId,
    },
  })
}
```

Repo hetkeolukorras on see loogika failis `src/api-services/LocationService.js`.

### Päriselu analoogia

Teenusekiht on nagu logistikaosakond. Vaade ütleb ainult "too mulle Tallinna automaadid", aga ei hakka ise kaubikut juhtima.

<a id="then-catch-finally-ja-abimeetodid-hoiavad-vaate-loetavana"></a>
## `then / catch / finally` ja abimeetodid hoiavad vaate loetavana - `1:44:44`

Kui teenus tagastab `promise` objekti, siis tuleb otsustada, mida teha edu, vea ja lõpetuse korral. Video kõige tähtsam loetavuse õppetund on see, et neid harusid ei tasu paisutada pikaks.

### Selgitus

`promise` on lubadus, et vastus tuleb hiljem.

Selle küljes olevad kolm peamist haru on:

- `then(...)` - kui vastus tuli edukalt
- `catch(...)` - kui tuli viga
- `finally(...)` - kui tahad midagi lõpus alati teha

Õpetaja soovitus on viia päris toimetamine abimeetoditesse. Siis jääb peameetod lühikeseks ja selle nimi näitab kohe, mis toimub.

### Skeem

```text
getLocations()
  -> then    = handleGetLocationsResponse(...)
  -> catch   = handleGetLocationsError(...)
  -> finally = lõppkoristus, kui seda vaja on
```

### Koodinäide

```js
getLocations() {
  LocationService.sendGetAtmLocations(this.selectedCityId)
    .then((response) => this.handleGetLocationsResponse(response.data))
    .catch((error) => this.handleGetLocationsError(error))
    .finally()
}
```

Kontrollimiseks näitab õpetaja kahte head tööriista:

- brauseri `Network` tab - kas URL-is läheb `cityId=0`, `cityId=2` või muu väärtus
- Vue Devtools - kas `locations` massiiv sai päriselt uue sisu

### Päriselu analoogia

See on nagu restoranis teenindus:

- köögist tuleb tellimus valmis - `then`
- köögis läks midagi valesti - `catch`
- laud koristatakse lõpus alati ära - `finally`

<a id="responsedata-laheb-locations-muutujasse-mis-elab-data-blokis"></a>
## `response.data` läheb `locations` muutujasse, mis elab `data()` blokis - `1:48:22`

Video järgmine suur mõiste on see, et abimeetodile ei anta kaasa kogu `response` objekti, kui tegelikult on vaja ainult `response.data`.

### Selgitus

`response` sisaldab palju asju:

- staatuskood
- headerid
- muud metaandmed
- tegelikud andmed ehk `data`

Kui abimeetod tahab ainult ATM asukohtade nimekirja, siis on parem anda talle kohe see väiksem osa.

Seejärel salvestatakse see `locations` muutujasse, mis elab `data()` blokis. Miks see oluline on?

- Vue muudab `data()` sees olevad väärtused reaktiivseks
- template saab neid hiljem kasutada
- IDE hakkab paremini välju pakkuma, kui algmudel on paigas

### Skeem

```text
response
  -> status
  -> headers
  -> data
      -> [ location, location, ... ]

this.locations = response.data
```

### Koodinäide

```js
handleGetLocationsResponse(locations) {
  this.locations = locations
}
```

```js
locations: [
  {
    locationId: 0,
    locationName: '',
    cityName: '',
    transactionTypes: [
      {
        transactionTypeName: '',
      },
    ],
  },
],
```

See kuju on praegu olemas failis `src/views/AtmsView.vue`.

### Päriselu analoogia

Kui kuller toob sulle paki, siis sa ei pane esikusse alles kogu transpordisüsteemi. Sa võtad pakist välja just selle asja, mida sul on vaja kasutada.

<a id="404--errorcode-222-kuvab-veateate-muu-viga-viib-errorview-lehele"></a>
## `404 + errorCode 222` kuvab veateate, muu viga viib `ErrorView` lehele - `2:32:01`

Siin hakkab video tegelema vealogikaga. Õppemõttes on seatud spetsiaalne olukord: kui valitud linnas ei ole ühtegi ATM-i, siis backend tagastab `404` ja `errorCode` väärtuseks `222`.

### Selgitus

Mida front peab selle teadmisega tegema?

- kui `status === 404` ja `errorCode === 222`, siis kuva backendist saadud sõnum kasutajale
- kõik muud vead tuleb käsitleda raskema rikkega ja suunata kasutaja `ErrorView` lehele

Repo praegune seis teeb juba erijuhtumi ära:

```js
handleGetLocationsError(error) {
  this.errorResponse = error.response.data
  let statusCode = error.response.status

  if (statusCode === 404 && this.errorResponse.errorCode === 222) {
    this.errorMessage = this.errorResponse.message
  }
}
```

`LoginView` näitab sama mustri teist poolt:

```js
if (statusNumber === 403 && this.errorResponse.errorCode === 111) {
  this.errorMessage = this.errorResponse.message
} else {
  NavigationService.navigateToErrorView()
}
```

See on hea võrdlus, sest õppevideo siht on ehitada `AtmsView`-sse samalaadne mõtlemine.

### Skeem

```text
catch(error)
  -> loe status ja error.response.data
  -> kui 404 + 222
       -> kuva sõnum
  -> muu viga
       -> suuna ErrorView lehele
```

### Koodinäide

```vue
<AlertError :error-message="errorMessage" />
```

```js
navigateToErrorView() {
  router.push({ name: 'errorRoute' })
}
```

### Päriselu analoogia

Kui poes pole soovitud toodet, siis on see kasutajale arusaadav teade. Kui aga poe kassasüsteem ise kukub kokku, siis pole see enam "toode puudub", vaid kogu pood on rikkis.

<a id="selectedcityid-muutmine-peab-kohe-kaivitama-uue-paringu"></a>
## `selectedCityId` muutmine peab kohe käivitama uue päringu - `2:59:43`

Video lõpus jõuab õpetaja olulise refaktoreerimiseni. Ainult sellest ei piisa, et parent muudab `selectedCityId` ära. Kui filtrit muudetakse, peab kohe järgnema uus andmepäring.

### Selgitus

Loogiline jada on:

1. kasutaja valib dropdownist linna
2. parent salvestab uue ID
3. parent kutsub `getLocations()` uuesti välja
4. tabel peaks hakkama näitama uut sisu

See on see koht, kus lihtsalt "vali linn" muutub reaalseks filtreerimiseks.

### Skeem

```text
user valib linna
  -> selectedCityId saab uue väärtuse
  -> getLocations() käivitub
  -> backend saab uue cityId
  -> UI peaks uuenema
```

### Koodinäide

```js
getSelectedCityLocations(selectedCityId) {
  this.selectedCityId = selectedCityId
  this.getLocations()
}
```

Video hetkel pole tabeli `tbody` veel `locations` massiiviga ära seotud. See tähendab, et andmepäring ise juba uueneb, aga tabeli ridade joonistamine jäi järgmisse sammu.

### Päriselu analoogia

Kui keerad auto navigatsioonis sihtkohta, aga marsruuti ei arvutata uuesti, siis on uus sihtpunkt kasutu. Filtri muutus peab kohe kaasa tooma uue arvutuse.

<a id="meetodi-nimi-peab-raakima-tott"></a>
## Meetodi nimi peab rääkima tõtt - `3:00:20`

Video viimane oluline õppetund ei ole tehniline nipp, vaid nimetamise kvaliteet. Õpetaja juhib tähelepanu, et vana meetodinimi valetas.

### Selgitus

Kui meetod oleks nimega `setSelectedCityId`, siis see lubaks justkui üht asja: "ma ainult muudan ID ära".

Aga tegelik tegevus on suurem:

- muudan ID ära
- toon selle uue ID põhjal serverist uued asukohad

Seega peab nimi kirjeldama päris vastutust.

Praegune repo nimi `getSelectedCityLocations` on juba ausam kui puhas setter, sest see vihjab, et valiku muutusega kaasneb ka asukohtade hankimine.

### Skeem

```text
halb nimi:
setSelectedCityId()
  -> lubab ainult seisu muutust

ausam nimi:
getSelectedCityLocations()
  -> seob valiku ja uue päringu
```

### Koodinäide

```js
@event-new-city-selected="getSelectedCityLocations"
```

```js
getSelectedCityLocations(selectedCityId) {
  this.selectedCityId = selectedCityId
  this.getLocations()
}
```

### Päriselu analoogia

Kui nupul on kiri "Ava aken", aga vajutades läheb ka konditsioneer käima, siis nimi on eksitav. Hea nimi ütleb ette, mis tegelikult juhtub.

## Kokkuvõte

Selle video lõpuks on valmis kolm tugevat asja:

- linnavalik liigub childist parenti tagasi
- `LocationService` toob `cityId` põhjal õiged andmed ära
- vealoogika hakkab eristama "pole tulemusi" olukorda ja suuremat rikket

Järgmine loomulik samm on siduda `locations` massiiv `tbody` sisse `v-for` abil, et staatiline tabel muutuks päriselt andmepõhiseks tabeliks.
