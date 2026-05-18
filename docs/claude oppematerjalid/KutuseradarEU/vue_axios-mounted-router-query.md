# Vue: mounted API kutsed, .catch, Router query parameetrid, Multiselect slot

## 1. `mounted()` — mitu API kutset korraga

`mounted()` käivitub kui komponent on ekraanil. Sinna pannakse API kutsed, mis vajavad andmeid kohe lehe avamisel.

```js
mounted() {
  stationService.getBestPrices(this.userId).then((response) => {
    this.bestPrices = response.data
  }).catch(() => NavigationService.navigateToErrorView())

  stationService.getStations(this.userId).then((response) => {
    this.stations = response.data.sort((a, b) => b.favorite - a.favorite)
  }).catch(() => NavigationService.navigateToErrorView())
}
```

Mõlemad kutsed käivituvad **samaaegselt** — ei oota üksteist.

---

## 2. `.catch()` — vigade käsitlemine

`.then()` käivitub kui päring õnnestus, `.catch()` kui midagi läks valesti (server maas, võrguviga jne).

```js
stationService.getStations(this.userId)
  .then((response) => {
    this.stations = response.data   // õnnestus
  })
  .catch(() => {
    NavigationService.navigateToErrorView()  // midagi läks valesti
  })
```

Ilma `.catch()`-ita jääb viga konsooli ja kasutaja näeb katki lehte. `.catch()` annab võimaluse kasutajat viisakalt teavitada.

---

## 3. Listi sorteerimine frontendis

Backend ei garanteeri järjekorda — lemmikud võivad tulla listi lõppu. Frontendis saab sorteerida kohe pärast vastuse kätte saamist:

```js
this.stations = response.data.sort((a, b) => b.favorite - a.favorite)
```

`sort()` võrdleb kahte elementi korraga (`a` ja `b`):
- `b.favorite - a.favorite` — `true` (1) tuleb enne `false` (0)
- Tulemus: lemmikud listi algusesse

---

## 4. Router — navigeerimine query parameetritega

Tavaline navigeerimine:
```js
router.push({ name: 'stationRoute' })
// → /station
```

Navigeerimine koos andmetega URL-is:
```js
router.push({ name: 'stationRoute', query: { stationId: stationId } })
// → /station?stationId=5
```

`query` on objekt — saab mitu parameetrit korraga:
```js
query: { stationId: 5, tab: 'prices' }
// → /station?stationId=5&tab=prices
```

Sihtlehel loetakse parameeter nii:
```js
this.$route.query.stationId  // "5" (string!)
```

---

## 5. Multiselect — custom option kuvamine slotiga

`@vueform/multiselect` võimaldab muuta kuidas iga option välja näeb `#option` slotiga:

```vue
<Multiselect
  v-model="selectedStation"
  :options="stations"
  label="stationName"
  value-prop="stationId"
  :searchable="true"
  @select="goToSelect"
>
  <template #option="{ option }">
    <span :class="{ 'text-warning fw-bold': option.favorite }">
      {{ option.stationName }}
    </span>
  </template>
</Multiselect>
```

- `#option` — slot mille sisu asendab vaikimisi teksti
- `{ option }` — üks list-element (antud juhul `StationOptionDto`)
- `:class="{ 'text-warning fw-bold': option.favorite }"` — Bootstrap klass lisatakse ainult kui `favorite === true`

**Tulemus:** lemmikjaamad on kollased ja boldis, tavalised jaamad vaikekujundusega.

---

## Kokkuvõte

| Teema | Põhireegel |
|---|---|
| `mounted()` | API kutsed lehe avamisel — käivituvad samaaegselt |
| `.catch()` | Alati lisada — kasutaja ei peaks nägema katki lehte |
| `sort()` | Saab kasutada kohe `.then()` sees enne `this.x = ...` |
| Router query | `query: { key: value }` → URL-i `?key=value` |
| Multiselect slot | `#option` slotiga saab iga rea välimust muuta |
