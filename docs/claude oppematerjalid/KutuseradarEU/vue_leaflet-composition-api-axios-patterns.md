# Vue: Leaflet kaart, Composition API, Axios mustrid, closure, ternary

## 1. Composition API (`<script setup>`) vs Options API

Projektis on kaks stiili — `views/` kasutavad **Options API**-t, `components/` kasutavad **Composition API**-t.

**Options API** (vaated):
```js
export default {
  name: 'MapView',
  data() { return { selectedStation: null } },
  methods: { onMarkerClick(id) { ... } },
  mounted() { ... }
}
```

**Composition API** (`<script setup>`):
```js
import { onMounted, ref } from 'vue'
const mapContainer = ref(null)
onMounted(() => { ... })
```

`ref(null)` on reaktiivne muutuja — Vue jälgib selle väärtuse muutusi. Lihtsa väärtuse jaoks mis ei muutu kasuta `const`.

---

## 2. Ternary operator `? :`

Lühike `if/else` mis tagastab väärtuse:

```js
const favorite = response.data.stationFavorite ? '★' : '☆'
// sama mis:
// if (stationFavorite) { favorite = '★' } else { favorite = '☆' }
```

Saab kasutada ka HTML stringi sees:
```js
const star = userId ? `<span>${favorite}</span>` : ''
// kui userId olemas → kuvab tähe, muidu tühi string
```

---

## 3. Axios POST — params vs body

`axios.post` puhul on argumendid järjekorras: `(url, body, config)`.

```js
// GET ja DELETE — params läheb teise argumendina (config)
axios.get('/api/station', { params: { stationId, userId } })
axios.delete('/api/station/favorite', { params: { stationId, userId } })

// POST — teine argument on body, params läheb kolmandasse argumendina
axios.post('/api/station/favorite', null, { params: { stationId, userId } })
//                                  ^^^^  body on null kui backendi @RequestParam ootab
```

**Miks:** backend `@RequestParam` ootab parameetreid URL-is (`?stationId=5`), mitte päringu sees (body). `params` saadab need URL-i, `body` saadab päringu sisse.

---

## 4. Closure — funktsioon mis mäletab muutujaid

`forEach` tsüklis loob iga markeri click listener sulundi (closure) — funktsioon mis "mäletab" oma `station` objekti isegi pärast tsükli lõppu:

```js
response.data.forEach((station) => {
  const marker = L.marker([station.stationLat, station.stationLong]).addTo(map)
  marker.on('click', () => {
    // station on siin kättesaadav — see on closure
    StationService.getStationDetail(station.stationId, userId)
  })
})
```

Iga marker mäletab oma `station` — mitte tsükli viimast väärtust nagu mõnes keeles võiks arvata.

---

## 5. Leaflet + Vue — markerid, tooltipid, popupid

Leaflet töötab väljaspool Vue-d — Vue reaktiivsus, `v-if`, `@click` ei tööta Leaflet popupide sees.

**Markeripiltide Vite fix** — lisada `onMounted` algusesse:
```js
import markerIcon from 'leaflet/dist/images/marker-icon.png'
import markerIcon2x from 'leaflet/dist/images/marker-icon-2x.png'
import markerShadow from 'leaflet/dist/images/marker-shadow.png'

delete L.Icon.Default.prototype._getIconUrl
L.Icon.Default.mergeOptions({ iconUrl: markerIcon, iconRetinaUrl: markerIcon2x, shadowUrl: markerShadow })
```

**Markeri loomine tooltipiga:**
```js
const marker = L.marker([station.stationLat, station.stationLong]).addTo(map)
marker.bindTooltip(station.stationName)  // hiirega üle liikudes näitab nime
```

**Popup HTML stringina:**
```js
marker.on('click', () => {
  const html = `<strong>${station.stationName}</strong><br>
    <button onclick="window.goToStation(${station.stationId})">Vaata tanklat</button>`
  marker.bindPopup(html).openPopup()
})
```

**`window` funktsioonid nuppude jaoks** — kuna popup on puhas HTML, peavad nupud kutsuma globaalseid funktsioone:
```js
window.goToStation = (id) => NavigationService.navigateToStationView(id)
window.goToAddPrice = (id) => NavigationService.navigateToAddPriceView(id)
```

---

## 6. State tracker objekt

Lihtne objekt võtmena stationId, väärtusena boolean — asendab andmebaasikutset kui vajad kiiret olekut frontendis:

```js
const favoriteState = {}
// Initsialiseerimine:
favoriteState[station.stationId] = station.isInFavorites
// Lugemine:
const isFav = favoriteState[id]   // true või false
// Kirjutamine:
favoriteState[id] = !isFav        // flippimine
```

DOM uuendamine pärast muutust:
```js
document.getElementById('star-' + id).textContent = favoriteState[id] ? '★' : '☆'
```

---

## 7. `@Transactional` Spring repositooriumis

Spring Data lisab vaikimisi transaktsiooni `save()` ja `delete()` meetoditele, aga **kohandatud `deleteBy...` meetodid vajavad `@Transactional` annotatsiooni käsitsi:**

```java
@Transactional
void deleteByUser_IdAndStation_Id(Integer userId, Integer stationId);
```

Ilma selleta: `TransactionRequiredException` — andmebaas keeldub kustutamast.

**Miks:** kustutamine on kirjutamisoperatsioon mis vajab transaktsiooni garantiid — kui midagi läheb valesti, võetakse muutus tagasi.

---

## 8. Router — `params` vs `query`

```js
// params — URL-i osa (route: '/addprice/:stationId?')
router.push({ name: 'addPriceRoute', params: { stationId } })
// → /addprice/5

// query — URL-i ? järel (route: '/station')
router.push({ name: 'stationRoute', query: { stationId } })
// → /station?stationId=5
```

Kasuta `params` kui route definitsioonist on `:paramName` olemas, muidu `query`.

---

## 9. `.then / .catch / .finally`

```js
StationService.addFavorite(id, userId)
  .then(() => {
    // käivitub kui päring õnnestus
    favoriteState[id] = true
  })
  .catch((err) => {
    // käivitub kui päring ebaõnnestus
    console.log(err)
  })
  .finally(() => {
    // käivitub ALATI — nii õnnestuse kui vea korral
    toggling[id] = false
  })
```

---

## Kokkuvõte

| Teema | Põhireegel |
|---|---|
| Ternary `? :` | Lühike `if/else` mis tagastab väärtuse |
| Axios POST params | `(url, null, { params: {...} })` — body on null kui backend ootab `@RequestParam` |
| Closure | `forEach` sees loodud funktsioon mäletab oma iteratsiooni muutujaid |
| Leaflet popup | Puhas HTML string — Vue direktiivid ei tööta, kasuta `window` funktsioone |
| `favoriteState` | Tavaline objekt `{ stationId: boolean }` kiireks oleku jälgimiseks |
| `@Transactional` | Kohandatud `deleteBy` meetodid vajavad seda käsitsi |
| `params` vs `query` | `params` kui route-is `:param`, muidu `query` |
| `.finally()` | Käivitub alati — sobib cleanup loogikaks |