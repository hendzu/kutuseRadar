## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/RPt3tVF_nAfVSODsfi48jmSdsPgYyWf9zSJkBToGO0Pu5_STJb2lhlrG5cF804A_.ZFalL74x0lUjC8Cv?startTime=1776852049000) |
| **Parool** | `!QO0FuN&` |
| **Transkript** | [GMT20260422-100049_v-2.vtt](../transcripts/GMT20260422-100049_v-2.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Näiteks esinevad kohati `Respons`, `tatablok`, `City Strop Town`, `Electricity Id` ja `voe`, kuigi kontekst ütleb selgelt, et mõeldud on `response`, `data block`, `CitiesDropdown`, `selectedCityId` ja `Vue`.

Selgelt loetavaid `FEB-4`, `BEB-7` või `OPETAJA-3` tüüpi taskikoode selles videos ei esine. Fookus on pigem ühe konkreetse vaate ja alamkomponendi andmevoo ehitamisel.

Selles õppematerjalis seon video teemad päris näidetega failidest `src/views/AtmsView.vue`, `src/components/CitiesDropdown.vue`, `src/api-services/CityService.js`, `src/navigation/NavigationService.js`, `src/views/ErrorView.vue` ja võrdlusena `src/views/LoginView.vue`.

## Sisukord

- [`getCities()` ei anna kohe linnu, vaid promise'i](#getcities-ei-anna-kohe-linnu-vaid-promisei) - `0:00:20`
- [`handleGetCitiesResponse(response)` teeb eduka haru loetavaks](#handlegetcitiesresponseresponse-teeb-eduka-haru-loetavaks) - `0:06:45`
- [`response` on kogu vastus, `response.data` on see, mida dropdown vajab](#response-on-kogu-vastus-responsedata-on-see-mida-dropdown-vajab) - `0:10:02`
- [`cities` elab `data()` sees ja algab mudeliga, mitte parisandmetega](#cities-elab-data-sees-ja-algab-mudeliga-mitte-parisandmetega) - `0:18:14`
- [Massiivil pole `cityName` valja, elemendil on](#massiivil-pole-cityname-valja-elemendil-on) - `0:33:49`
- [Uldine API-viga suunab kasutaja `ErrorView` lehele](#uldine-api-viga-suunab-kasutaja-errorview-lehele) - `0:37:47`
- [`aria-label` aitab screen reader'it, mitte disaini](#aria-label-aitab-screen-readerit-mitte-disaini) - `1:52:16`
- [`selectedCityId` ja vaartus `0` hoiavad filtriseisu](#selectedcityid-ja-vaartus-0-hoiavad-filtriseisu) - `1:54:18`
- [`@change` + `$emit` saadab valitud linna ID parentile](#change--emit-saadab-valitud-linna-id-parentile) - `2:16:13`
- [Child ei muuda proppi, parent teeb `setSelectedCityId()`](#child-ei-muuda-proppi-parent-teeb-setselectedcityid) - `2:41:30`
- [`beforeMount()` paneb linnade laadimise kohe kaima](#beforemount-paneb-linnade-laadimise-kohe-kaima) - `2:55:23`
- [Luhike inline-lahendus ja eraldi meetod on molemad lubatud](#luhike-inline-lahendus-ja-eraldi-meetod-on-molemad-lubatud) - `3:05:37`

<a id="getcities-ei-anna-kohe-linnu-vaid-promisei"></a>
## `getCities()` ei anna kohe linnu, vaid promise'i - `0:00:20`

Video algab meeldetuletusega, et `CityService.sendGetCitiesRequest()` ei tagasta kohe Tallinna, Tartut ja Parnut. Ta tagastab `promise` objekti.

### Selgitus

`promise` on lubadus stiilis "vastus tuleb hiljem". See on oluline, sest frontend ei tohi eeldada, et serveri vastus on juba olemas samal hetkel, kui meetod kaivitatakse.

Seepärast jagatakse kood kolmeks haruks:

- `then` - kui paring onnistus
- `catch` - kui paring ebaonnestus
- `finally` - kui on vaja loppkoristus teha olenemata tulemusest

Praeguses `AtmsView` failis on `finally()` veel tuhi koht. See on siiski tahtis koht, sest samas repos kasutab `LoginView` seda spinneri peatamiseks.

### Skeem

```text
AtmsView
  -> getCities()
      -> CityService saadab HTTP paringu
          -> promise
              -> then = edu
              -> catch = viga
              -> finally = loppkoristus
```

### Koodinaide

```js
getCities() {
  CityService.sendGetCitiesRequest()
    .then((response) => this.handleGetCitiesResponse(response))
    .catch(() => NavigationService.navigateToErrorView())
    .finally()
}
```

```js
sendGetCitiesRequest() {
  return axios.get('/api/cities')
}
```

### Pariselu analoogia

See on nagu tellid kulleri. Paki sisu ei ole sul veel kaes, aga sul on juba teadmine, et kas pakk joudis kohale, laks kaduma voi tuli vaja lihtsalt uksekell kinni panna.

<a id="handlegetcitiesresponseresponse-teeb-eduka-haru-loetavaks"></a>
## `handleGetCitiesResponse(response)` teeb eduka haru loetavaks - `0:06:45`

Opetaja votab `then` haru seest tegevuse valja eraldi meetodisse.

### Selgitus

Seda tehakse kahel pohjusel:

- promise'i ahel jaab luhikeseks ja loetavaks
- meetodi nimi utleb, mis selle haru vastutus on

See on sama motteviis, mida repos kasutatakse ka `LoginView` puhul:

- `handleLoginResponse(response)`
- `handleLoginError(error)`
- `stopSpinner()`

Kui koik tegevused kirjutada otse `then(...)` sisse, muutub kood kiiresti pikaks ja raskesti loetavaks.

### Skeem

```text
then(response => ...)
  -> liiga palju loogikat uhel real

parem:
then(response => this.handleGetCitiesResponse(response))
  -> nimeline meetod
  -> lihtsam lugeda
  -> lihtsam muuta
```

### Koodinaide

```js
CityService.sendGetCitiesRequest()
  .then((response) => this.handleGetCitiesResponse(response))
  .catch(() => NavigationService.navigateToErrorView())
```

```js
handleGetCitiesResponse(response) {
  this.cities = response.data
}
```

### Pariselu analoogia

See on nagu laopidaja ei kirjuta saatelehele koiki juhiseid korraga, vaid paneb juurde sildi "vota kaup vastu". Luhike nimi teeb tegevuse kohe arusaadavaks.

<a id="response-on-kogu-vastus-responsedata-on-see-mida-dropdown-vajab"></a>
## `response` on kogu vastus, `response.data` on see, mida dropdown vajab - `0:10:02`

Video koige olulisem tehniline eristus on see, et `response` ja `response.data` ei ole sama asi.

### Selgitus

`response` on terve serveri vastus koos lisainfoga:

- staatuskood
- headerid
- muu meta-info
- andmed ehk `data`

Aga dropdowni ehitamiseks ei huvita meid kogu umbrik. Meid huvitab ainult kiri selle sees ehk `response.data`.

Just selleparast tehaksegi:

```js
this.cities = response.data
```

mitte:

```js
this.cities = response
```

### Skeem

```text
response
  -> status
  -> headers
  -> data
      -> [{ cityId, cityName }, ...]
```

### Koodinaide

```js
handleGetCitiesResponse(response) {
  this.cities = response.data
}
```

### Pariselu analoogia

See on nagu postiumber, saatja ja margid on umbrikul, aga kiri ise on see, mida sa tegelikult lugeda tahad.

<a id="cities-elab-data-sees-ja-algab-mudeliga-mitte-parisandmetega"></a>
## `cities` elab `data()` sees ja algab mudeliga, mitte parisandmetega - `0:18:14`

Opetaja selgitab, et serverist tulnud linnad tuleb kuhugi pivaalt salvestada. See koht on Vue komponendi `data()` blokk.

### Selgitus

Kui tahad, et Vue oskaks andmete muutumisel HTML-i uuesti joonistada, peavad need andmed elama komponendi reaktiivses olekus. Selles vaates on selleks `cities`.

Oluline nuanss on algvaartus:

- siia ei kirjutata paris serveri sisu nagu `Tallinn`, `Tartu`, `Parnu`
- siia kirjutatakse mudel ehk millise kujuga objektid hiljem saabuvad

See aitab algajal paremini moista, mis tyypi andmeid muutujast oodata.

### Skeem

```text
enne serveri vastust
  -> cities = mudel

parast serveri vastust
  -> cities = paris massiiv API-st
```

### Koodinaide

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

### Pariselu analoogia

See on nagu teed riiulile sildi "siia tulevad kruvid". Riiul ei ole veel kruve tais, aga koht ja kuju on juba teada.

<a id="massiivil-pole-cityname-valja-elemendil-on"></a>
## Massiivil pole `cityName` valja, elemendil on - `0:33:49`

Video keskel tehakse vaikne, aga algajale vega oluline peatus: `cities` on massiiv, mitte uksik city objekt.

### Selgitus

See tahendab, et:

- `this.cities` ei oma ise valja `cityName`
- koigepealt tuleb valida massiivist element
- alles siis saad minna selle elemendi `cityName` voi `cityId` peale

Praktilises Vue template'is tehakse seda tavaliselt `v-for` abil. Siis annab Vue sulle igas ringis uhe `city` objekti.

### Skeem

```text
this.cities
  -> [0] -> { cityId, cityName }
  -> [1] -> { cityId, cityName }
  -> [2] -> { cityId, cityName }

cityName ei ela massiivi peal
cityName elab massiivi uhe elemendi peal
```

### Koodinaide

```vue
<option v-for="city in cities" :key="city.cityId" :value="city.cityId">
  {{ city.cityName }}
</option>
```

Kui kirjutaksid motte kujul `cities.cityName`, oleks see vale, sest `cities` on kogum, mitte yks linn.

### Pariselu analoogia

See on nagu raamaturiiul. Riiulil endal ei ole pealkirja "Tartu". Uhel kindlal raamatul riiulis on.

<a id="uldine-api-viga-suunab-kasutaja-errorview-lehele"></a>
## Uldine API-viga suunab kasutaja `ErrorView` lehele - `0:37:47`

Siin videos eristatakse kahte sorti vigu:

- spetsiaalselt ette nahtud vead, mida saab kasutajale tapselt selgitada
- uldised serveri- voi tehnilised vead, mille puhul pole moistlik dropdowni samal lehel edasi elus hoida

### Selgitus

Linnade laadimine on vaate eeldus. Kui see ebaonnestub, ei saa kasutaja tegelikult oma toogu teha. Seepärast on lihtne ja praktiline valik suunata ta kohe eraldi vea-vaatesse.

Repos on selle jaoks kaks kasulikku klotsi:

- `NavigationService.navigateToErrorView()`
- `ErrorView.vue`, mis kuvab kasutajale "Uups, midagi laks valesti :)"

### Skeem

```text
getCities()
  -> catch
      -> NavigationService
          -> /error route
              -> ErrorView
```

### Koodinaide

```js
.catch(() => NavigationService.navigateToErrorView())
```

```js
navigateToErrorView() {
  router.push({ name: 'errorRoute' })
}
```

### Pariselu analoogia

See on nagu pangaautomaadi ekraan ei lase pooleldi katkise menuu otsas edasi klopsida, vaid naitab kohe "teenus ajutiselt maas".

<a id="aria-label-aitab-screen-readerit-mitte-disaini"></a>
## `aria-label` aitab screen reader'it, mitte disaini - `1:52:16`

Video teises pooles tehakse vaike, aga oluline koorvalepoge ligipaasetavusele.

### Selgitus

`aria-label` ei muuda tava-kasutaja jaoks selecti vaadet ilusamaks ega tosta selle funktsionaalsust hiirega klikides. Selle eesmark on aidata abitehnoloogiaid kasutavat inimest.

Kui kasutaja liigub lehel klaviatuuri voi screen reader'iga, loetakse see tekst ette. Seepärast peab see olema sisukas, mitte mingi juhuslik demo-voi koopia-tekst.

### Skeem

```text
tavaline kasutaja
  -> ei nae aria-label teksti eraldi

screen reader
  -> loeb "Vali linn"
  -> kasutaja saab aru, millel fookus on
```

### Koodinaide

```vue
<select
  :value="selectedCityId"
  class="form-select"
  aria-label="Vali linn"
>
```

### Pariselu analoogia

See on nagu lifti nuppudel olev punktkiri. See ei tee nuppu valjast suuremaks, aga oigele inimesele teeb kogu seadme kasutatavaks.

<a id="selectedcityid-ja-vaartus-0-hoiavad-filtriseisu"></a>
## `selectedCityId` ja vaartus `0` hoiavad filtriseisu - `1:54:18`

Dropdowni teine oluline pool ei ole linnade nimekiri, vaid see, milline linn on parajasti valitud.

### Selgitus

Selle jaoks hoiab parent-komponent `AtmsView` muutujat `selectedCityId`.

Vaikevaartus on `0`, mis tahistab siin projektis valikut "Koik linnad". See on praktiline, sest:

- `0` ei kattu tavaliselt parisi linna ID-ga
- null on lihtne "filtrit pole" marker
- sama mehhanismi saab hiljem kasutada ka muutmisvormis, kus ette tuleb juba konkreetne linn

Samal ajal hoiab child-komponent selle vaartuse peal `<select>` elementi:

- parentilt tuleb alla `selectedCityId`
- child seob selle `:value` kaudu valitud optioniga

### Skeem

```text
AtmsView data
  -> selectedCityId = 0

props alla
  -> CitiesDropdown saab 0

select
  -> value = 0
  -> valitud on "-- Koik linnad --"
```

### Koodinaide

```js
data() {
  return {
    selectedCityId: 0,
  }
}
```

```vue
<select :value="selectedCityId" class="form-select" aria-label="Vali linn">
  <option selected :value="0">-- Koik linnad --</option>
</select>
```

### Pariselu analoogia

See on nagu autoraadios on nupp "kogu sagedusala" enne konkreetseid salvestatud kanaleid.

<a id="change--emit-saadab-valitud-linna-id-parentile"></a>
## `@change` + `$emit` saadab valitud linna ID parentile - `2:16:13`

Kui kasutaja valib dropdownist teise linna, peab see info kuidagi childist ules liikuma.

### Selgitus

Oluline vahe:

- `click` juhtub juba siis, kui sa lihtsalt elemendi avad
- `change` juhtub siis, kui valik tegelikult muutus

Just selleparast on selecti puhul oige sundmus `@change`.

Teine oluline detail on tuubimuutus. Brauser annab `event.target.value` enamasti `string` kujul. Kuna meil on `selectedCityId` sisuliselt number, tehakse teisendus kohe kohapeal:

```js
Number($event.target.value)
```

See on hea harjumus, sest siis liigub ulespoole juba oiget tuupi andmepakk.

### Skeem

```text
kasutaja valib "Tartu"
  -> select change
      -> $event.target.value = "3"
          -> Number(...) = 3
              -> $emit(...)
```

### Koodinaide

```vue
<select
  @change="$emit('event-new-city-selected', Number($event.target.value))"
  :value="selectedCityId"
  class="form-select"
  aria-label="Vali linn"
>
```

### Pariselu analoogia

See on nagu laps ei karju uldiselt "midagi juhtus", vaid utleb kohe taislauses "valisin linna ID 3".

<a id="child-ei-muuda-proppi-parent-teeb-setselectedcityid"></a>
## Child ei muuda proppi, parent teeb `setSelectedCityId()` - `2:41:30`

See on kogu video keskne Vue-reegel: child ei muuda parentilt saadud proppi otse.

### Selgitus

Kui child muudaks `selectedCityId` vaartust ise, tekiks kaks probleemi:

- tekiks segadus, kus on tegelik allikas
- parent ja child voiksid naidata eri seisusid

Seepärast kaib oige flow nii:

1. parent hoiab oiget vaartust
2. child saab selle proppina alla
3. child saadab `emit`-iga teate ules
4. parent muudab omaenda `data()` vaartust
5. uus prop voolab childi tagasi alla

### Skeem

```text
AtmsView
  -> selectedCityId
      -> props alla CitiesDropdowni
          -> kasutaja muudab valikut
              -> child emitib ules
                  -> parent teeb setSelectedCityId(...)
                      -> uus vaartus voolab alla tagasi
```

### Koodinaide

```vue
<CitiesDropdown
  :cities="cities"
  :selected-city-id="selectedCityId"
  @event-new-city-selected="setSelectedCityId"
/>
```

```js
getSelectedCityLocations(selectedCityId)
{
  this.selectedCityId = selectedCityId
}
```

### Pariselu analoogia

See on nagu termostaat saadab katlale teate, aga temperatuuri ametlik nait elab ikkagi keskseadmes, mitte nupus endas.

<a id="beforemount-paneb-linnade-laadimise-kohe-kaima"></a>
## `beforeMount()` paneb linnade laadimise kohe kaima - `2:55:23`

Video lopuosas votab opetaja kogu flow uhte lausesse kokku: algseis on tuhi mudel, siis kaivitub `beforeMount`, siis tehakse HTTP paring, ja alles seejarel tulevad parislinnad ekraanile.

### Selgitus

`beforeMount()` on siin sobiv koht, sest kasutaja ei pea eraldi nuppu vajutama. Linnad peavad ilmuma kohe, kui vaade avatakse.

See annab algajale hea tervikpildi:

- alguses on `selectedCityId = 0`
- alguses on `cities` ainult mudel
- `beforeMount()` kutsub `getCities()`
- serveri vastus kirjutatakse `this.cities` sisse
- dropdown joonistab optionid nende andmete pealt

### Skeem

```text
AtmsView avaneb
  -> beforeMount()
      -> getCities()
          -> response.data
              -> this.cities
                  -> CitiesDropdown optionid
```

### Koodinaide

```js
beforeMount() {
  this.getCities()
}
```

### Pariselu analoogia

See on nagu kohvik avab ukse alles siis, kui menuu on tahvlile kirjutatud. Klient ei pea koigepealt eraldi meelde tuletama, et "palun tooge menuu valja".

<a id="luhike-inline-lahendus-ja-eraldi-meetod-on-molemad-lubatud"></a>
## Luhike inline-lahendus ja eraldi meetod on molemad lubatud - `3:05:37`

Video lopp ei utle, et alati on ainult uks "oige" stiil. Pigem antakse praktiline rusikareegel.

### Selgitus

Kui sundmuse loogika mahub uhele reale ja on kohe loetav, voib see vabalt jaada template'i sisse.

Naiteks:

```vue
@change="$emit('event-new-city-selected', Number($event.target.value))"
```

Kui aga tegevus laheb pikaks, haruneb voi vajab lisaselgitust, tasub teha eraldi meetod. Sama motteviisi naeme parentis:

- childis on vaike inline `emit`
- parentis on eraldi `setSelectedCityId(selectedCityId)`

See kombinatsioon on taitsa normaalne. Koik ei pea olema iga hinna eest kas ainult inline voi ainult meetod.

### Skeem

```text
luhike ja arusaadav
  -> inline

pikem voi mitme sammuga
  -> eraldi meetod
```

### Koodinaide

```vue
<select
  @change="$emit('event-new-city-selected', Number($event.target.value))"
  :value="selectedCityId"
  class="form-select"
  aria-label="Vali linn"
>
```

```js
getSelectedCityLocations(selectedCityId)
{
  this.selectedCityId = selectedCityId
}
```

### Pariselu analoogia

See on nagu poenimekirjas. Kui vaja on ainult "osta piim", piisab uhest reast. Kui aga hakkad koostama terve peolaua ettevalmistust, teed eraldi kontrollnimekirja.

## Kokkuvote

Selle video pohimote on lihtne: serverist tulnud linnad kirjutatakse parent-komponendi olekusse, child-kujuline dropdown naitab neid andmeid, ja kasutaja valik liigub `emit`-iga uuesti parenti tagasi. See on klassikaline Vue andmevoog "props alla, sundmused ules".

Kui tahad seda videot uhes lauses meelde jatta, siis jaa meelde jargmine:

```text
beforeMount -> getCities -> response.data -> this.cities -> dropdown
dropdown change -> emit -> setSelectedCityId -> prop tagasi alla
```
