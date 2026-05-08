## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/Wm-f8JxlMUWdku7VTSv23I5i1K_zCP_Y0JiBxYUh-gOMIiowMUJmWXxzVvJlPqtx.VnR0ZDBSpxB10Uxc?startTime=1776164077000) |
| **Parool** | `*ye%1JAC` |
| **Transkript** | [GMT20260414-105437_v-2.vtt](../transcripts/GMT20260414-105437_v-2.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Kõige tähtsam neist on see, et nimi `Claude` on mitmes kohas loetud kujul `Cloud`.

Selles õppematerjalis kasutan nime `Claude`, kui kontekst räägib AI tööriistast, dokumentatsiooni loomisest või projekti reeglitest.

Selles videos otseseid taskikoode stiilis `FE-124` või `BEB-7` ei mainita.

## Sisukord

- [Development ring ja miks nõuded teel muutuvad](#development-ring-ja-miks-nõuded-teel-muutuvad) — `0:00:41`
- [Küberturvalisus kui omaette spetsialiseerumine](#küberturvalisus-kui-omaette-spetsialiseerumine) — `0:04:05`
- [Claude projektikontekstis](#claude-projektikontekstis) — `0:11:47`
- [HTML ei ole programmeerimiskeel](#html-ei-ole-programmeerimiskeel) — `0:15:50`
- [HTML faili põhistruktuur](#html-faili-põhistruktuur) — `0:19:07`
- [Tagid ja atribuudid](#tagid-ja-atribuudid) — `0:21:05`
- [Pildid ja `alt` atribuut](#pildid-ja-alt-atribuut) — `0:23:01`
- [Listid ja brauseri vaikekäitumine](#listid-ja-brauseri-vaikekäitumine) — `0:32:46`
- [`div` kui nähtamatu struktuurielement](#div-kui-nähtamatu-struktuurielement) — `0:35:29`
- [Vanem, laps ja DOM-puu](#vanem-laps-ja-dom-puu) — `0:41:28`
- [„Meie pank” kui harjutusprojekt](#meie-pank-kui-harjutusprojekt) — `0:57:12`
- [IDE shortcutid ja töötempo](#ide-shortcutid-ja-töötempo) — `1:00:25`
- [Input tüübid](#input-tüübid) — `2:06:13`
- [Miks `placeholder` ei asenda `label`-it](#miks-placeholder-ei-asenda-label-it) — `2:13:14`
- [Select, button, `disabled` ja `selected`](#select-button-disabled-ja-selected) — `2:20:03`
- [Miks `option value` peaks hoidma ID-d](#miks-option-value-peaks-hoidma-id-d) — `2:25:13`

<a id="development-ring-ja-miks-nõuded-teel-muutuvad"></a>
## Development ring ja miks nõuded teel muutuvad — `0:00:41`

Video algab klassikalise pildiga sellest, kuidas tellija mõte liigub läbi erinevate rollide ja muutub teel.

### Selgitus

Arenduses ei ole probleem sageli ainult kood. Väga suur probleem on see, et:

- tellija mõtleb üht asja
- projektijuht sõnastab selle veidi teisiti
- analüütik kirjutab selle lahti omas keeles
- arendaja ehitab midagi juba tehnilise loogika järgi

Lõpus võib tulemus olla korrektne, aga mitte see, mida algselt tegelikult taheti.

### Skeem

```text
tellijal on mõte
      |
      v
projektijuht sõnastab
      |
      v
analüütik kirjeldab
      |
      v
arendaja ehitab
      |
      v
klient näeb tulemust
```

### Koodinäide

Lihtne näide nõudest:

```text
Soov: "Mul on vaja kliendi lisamise vormi"

Võib muutuda:
- nimi
- vanus
- linn
- nupp "Lisa klient"
```

Just selline vorm loodi ka video teises pooles HTML harjutusena.

### Päriselu analoogia

See on nagu üks inimene ütleb: "Tahan väikest riiulit esikusse." Kui see liigub läbi kolme inimese, võib lõpptulemus olla hoopis suur kapp, sest igaüks tõlgendas vajadust natuke omamoodi.

<a id="küberturvalisus-kui-omaette-spetsialiseerumine"></a>
## Küberturvalisus kui omaette spetsialiseerumine — `0:04:05`

Õpetaja rõhutab, et security ei ole tavaliselt algaja esimene tööots.

### Selgitus

Küberturvalisus on:

- väga vajalik
- väga perspektiivikas
- aga tihti sügavam eriala kui tavaline algtaseme frontend või backend arendus

Algaja puutub küll turvaga kokku, aga ettevõttes pannakse suuremad security otsused tavaliselt paika kogenumate inimeste poolt.

### Skeem

```text
algaja arendaja
    |
    v
õpib tavarakendust
    |
    v
saab kogemust
    |
    v
liigub sügavama security teema poole
```

### Koodinäide

Selles projektis on kohe näha üks väike turvateema:

```vue
<input
  v-model="password"
  type="password"
  class="form-control"
  id="inputPassword"
  placeholder="Parool"
/>
```

`type="password"` ei tee süsteemi automaatselt turvaliseks, aga see on esimene õige samm, et tundlikku välja ei kuvataks tavatekstina.

### Päriselu analoogia

See on nagu maja ehitamisel lukud ja valvesüsteem. Kõik majaelanikud puutuvad nendega kokku, aga süsteemi projekteerib tavaliselt keegi, kes oskab seda põhjalikumalt teha.

<a id="claude-projektikontekstis"></a>
## Claude projektikontekstis — `0:11:47`

Siin näitab õpetaja, kuidas AI tööriist saab projektis konteksti kasutada, mitte ainult juhuslikke vastuseid anda.

### Selgitus

Põhiidee on see:

- kui AI avatakse konkreetse projekti kaustas
- ja projektis on reeglifailid või juhised
- siis AI saab neid kasutada oma vastuste taustana

See teeb vastused kasulikumaks, sest tööriist arvestab:

- mis projekt see on
- kus dokumentatsioon peab asuma
- mis keeles sisu peab olema

### Skeem

```text
projektikaust
   |
   +-- reeglid
   +-- failid
   +-- kaustad
   |
   v
Claude saab konteksti
   |
   v
parem vastus
```

### Koodinäide

See mõte on sarnane sellele, kuidas Vue projektis seadistatakse rakendus kord ära ja siis kõik osad kasutavad sama raamistikku:

```js
const app = createApp(App)

app.use(createPinia())
app.use(router)
app.mount('#app')
```

Kord tehtud seadistus loob konteksti kogu rakendusele. Õpetaja näitas sama mõtet AI tööriista puhul.

### Päriselu analoogia

See on nagu uus töötaja, kellele antakse kohe ettevõtte tööjuhend. Kui juhend on ees, teeb ta vähem juhuslikke otsuseid.

<a id="html-ei-ole-programmeerimiskeel"></a>
## HTML ei ole programmeerimiskeel — `0:15:50`

See on kogu video üks põhiväiteid.

### Selgitus

HTML on märgenduskeel. See tähendab:

- HTML kirjeldab, mis asi lehel on
- HTML ei kirjelda peamiselt loogikat
- HTML annab struktuuri ja sisu

Lihtne kokkuvõte:

- HTML = mis lehel olemas on
- CSS = kuidas see välja näeb
- JavaScript = kuidas see käitub

### Skeem

```text
HTML  -> struktuur ja sisu
CSS   -> välimus
JS    -> käitumine
```

### Koodinäide

`src/views/LoginView.vue` template on hea näide HTML-i rollist:

```vue
<h1 class="mb-3">Sisse logimine</h1>
<input v-model="username" type="text" class="form-control" />
<button @click="login" type="submit" class="btn btn-outline-secondary">Login</button>
```

Siin HTML-laadne template ütleb:

- siin on pealkiri
- siin on sisestusväli
- siin on nupp

### Päriselu analoogia

HTML on nagu maja karkass ja ruumide plaan. Sa näed, kus on uks, sein ja aken, aga mitte veel värve ega valgustust.

<a id="html-faili-põhistruktuur"></a>
## HTML faili põhistruktuur — `0:19:07`

Õpetaja käib läbi klassikalise HTML faili ehituse: `doctype`, `html`, `head`, `body`.

### Selgitus

Põhiloogika on selline:

- `<!DOCTYPE html>` ütleb brauserile, et tegu on HTML5 dokumendiga
- `<html>` ümbritseb kogu dokumenti
- `<head>` hoiab meta-infoga seotud asju
- `<body>` sisaldab seda, mida kasutaja näeb

### Skeem

```text
html
├── head
└── body
```

### Koodinäide

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Meie pank</title>
  </head>
  <body>
    <h1>Meie pank</h1>
  </body>
</html>
```

### Päriselu analoogia

`head` on nagu maja tehniline dokumentatsioon. `body` on see osa, kuhu inimene päriselt sisse astub.

<a id="tagid-ja-atribuudid"></a>
## Tagid ja atribuudid — `0:21:05`

HTML põhiehituskivid on tagid. Atribuudid annavad tagidele lisainfot.

### Selgitus

Tüüpiline tag:

- algab avava märgendiga
- võib sisaldada sisu
- lõpeb sulgeva märgendiga

Atribuut käib tavaliselt avava märgendi sees.

### Skeem

```text
<tag atribuut="vaartus">sisu</tag>
```

### Koodinäide

Projekti navigeerimises on mitu head atribuudi näidet:

```vue
<RouterLink class="nav-link" to="/login">Sisse logimine</RouterLink>
<button type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
```

Siin:

- `class` määrab CSS klassi
- `to` ütleb, kuhu liikuda
- `type` kirjeldab nupu tüüpi
- `data-*` atribuudid annavad lisakäitumise infot

### Päriselu analoogia

Tag on nagu kast. Atribuut on kasti silt, mis ütleb, mis tüüpi kast see on või kuhu see kuulub.

<a id="pildid-ja-alt-atribuut"></a>
## Pildid ja `alt` atribuut — `0:23:01`

Selles osas rõhutab õpetaja, et pilt ei ole ainult visuaalne objekt. Tal peaks olema ka tekstiline varuplaan.

### Selgitus

`alt` atribuut on oluline kahel põhjusel:

- kui pilt ei lae, kuvatakse asendustekst
- abitehnoloogiad saavad selle järgi kasutajale sisu kirjeldada

### Skeem

```text
img
├── src = kust pilt tuleb
└── alt = mida see pilt tähistab
```

### Koodinäide

Praeguses koodibaasis on pildid olemas, aga `alt` puudub:

```vue
<img
  src="https://i1.sndcdn.com/avatars-gA2VdBW6Iik3G4Nc-LvUPgw-t240x240.jpg"
  class="img-fluid"
/>
```

Õpetaja mõtte järgi oleks algajasõbralikum ja korrektsem variant:

```html
<img src="..." alt="Pangaga seotud illustratsioon" class="img-fluid" />
```

### Päriselu analoogia

See on nagu muuseumis silt maali kõrval. Kui inimene pilti hästi ei näe, saab ta vähemalt tekstist aru, mis seal olema peaks.

<a id="listid-ja-brauseri-vaikekäitumine"></a>
## Listid ja brauseri vaikekäitumine — `0:32:46`

Siin näidatakse vahet järjestamata ja järjestatud nimekirja vahel.

### Selgitus

Kaks põhilist listi:

- `ul` = täppidega nimekiri
- `ol` = numbritega nimekiri

Brauseril on nende jaoks oma vaikestiilid juba olemas. See on hea näide, et HTML üksi annabki mõningase algkuju.

### Skeem

```text
ul
└── li

ol
└── li
```

### Koodinäide

```html
<ul>
  <li>Tallinn</li>
  <li>Tartu</li>
  <li>Viljandi</li>
</ul>
```

ja

```html
<ol>
  <li>Esimene</li>
  <li>Teine</li>
  <li>Kolmas</li>
</ol>
```

### Päriselu analoogia

`ul` on nagu poenimekiri. `ol` on nagu juhend, kus sammude järjekord on tähtis.

<a id="div-kui-nähtamatu-struktuurielement"></a>
## `div` kui nähtamatu struktuurielement — `0:35:29`

`div` on selle video üks keskseid mõisteid.

### Selgitus

`div` ise ei tähenda tavaliselt kasutajale midagi visuaalset. Tema töö on:

- grupeerida sisu
- anda struktuuri
- luua konteiner, millele saab hiljem CSS-i või JavaScripti külge panna

### Skeem

```text
div
├── h1
├── p
└── button
```

### Koodinäide

`src/views/LoginView.vue` kasutab `div` elemente väga palju:

```vue
<div class="row justify-content-center">
  <div class="col col-3">
    <h1 class="mb-3">Sisse logimine</h1>
  </div>
</div>
```

Need `div`-id ei ole seal niisama. Need loovad paigutuse, mille CSS ja Bootstrap hiljem nähtavaks teevad.

### Päriselu analoogia

`div` on nagu riiulid laos. Riisul endal ei ole sisu väärtust, aga ilma riiulita on kaubad väga halvasti organiseeritud.

<a id="vanem-laps-ja-dom-puu"></a>
## Vanem, laps ja DOM-puu — `0:41:28`

Õpetaja seletab HTML pesastumist perekonna analoogia kaudu.

### Selgitus

Kui üks element on teise sees, tekib nende vahele suhe:

- parent = vanem
- child = laps
- sibling = õde-vend

See on oluline, sest nii mõtlevad:

- CSS valijad
- brauser
- JavaScript

### Skeem

```text
div (parent)
├── h1 (child)
└── p  (child)
```

### Koodinäide

`src/App.vue` on lihtne pesastumise näide:

```vue
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-3 mb-4">
  <div class="collapse navbar-collapse justify-content-center" id="navMenu">
    <div class="navbar-nav">
      <RouterLink class="nav-link" to="/">Kodu</RouterLink>
    </div>
  </div>
</nav>
```

Siin:

- `nav` on kõige välimine konteiner
- sees on `div`
- selle sees on veel üks `div`
- selle sees on link

### Päriselu analoogia

See on nagu karbid karpide sees. Väiksem karp asub suurema sees ja kõik kuuluvad samasse puustruktuuri.

<a id="meie-pank-kui-harjutusprojekt"></a>
## „Meie pank” kui harjutusprojekt — `0:57:12`

Siit alates minnakse teooriast kiiremini praktikasse.

### Selgitus

Õpetaja ütleb välja olulise töövõtte:

- harjutuskood ei ole püha
- kõike ei pea ilusaks viimistlema
- oluline on läbi proovida, mis võimalused HTML-is olemas on

See on väga tervislik mõtteviis algajale. Harjutuskood on mõeldud õppimiseks, mitte imetlemiseks.

### Skeem

```text
õppimiseks tehtud näide
      |
      v
katsetamine
      |
      v
arusaamine
      |
      v
hiljem päris lahendus
```

### Koodinäide

Minimaalne harjutusnäide:

```html
<h1>Meie pank</h1>
<h5>Meie panga kontorid</h5>
<ul>
  <li>Tallinn</li>
  <li>Tartu</li>
  <li>Viljandi</li>
</ul>
```

### Päriselu analoogia

See on nagu sõiduõpe tühjal platsil. Esialgu ei treeni keegi sind kesklinna tipptunnis.

<a id="ide-shortcutid-ja-töötempo"></a>
## IDE shortcutid ja töötempo — `1:00:25`

Video keskel on pikk osa sellest, kuidas vähem hiirt kasutada ja rohkem klaviatuuriga töötada.

### Selgitus

Mõte ei ole lihtsalt „kiirem olla”. Mõte on selles, et:

- väiksed liigutused korduvad sadu kordi
- aeglane liigutus muutub päeva lõpuks suureks ajakaoks
- hea shortcut vähendab mehaanilist tööd

### Skeem

```text
väike sääst ühe liigutuse pealt
          |
          v
sajad kordused päevas
          |
          v
suur ajavõit
```

### Koodinäide

Olulisemad näited videost:

```text
Ctrl + D            dubleeri rida või valik
Ctrl + /            kommenteeri sisse-välja
Shift + Enter       lisa uus rida alla
Win + 1 / Win + 2   liigu rakenduste vahel
```

Need ei muuda HTML-i loogikat, aga muudavad arendaja töö sujuvamaks.

### Päriselu analoogia

See on nagu kokal terav nuga. Ta saab ka nüri noaga hakkama, aga päev läheb asjatult raskemaks.

<a id="input-tüübid"></a>
## Input tüübid — `2:06:13`

Selles osas näidatakse, et `<input>` ei ole üksainus asi. Sama element võib käituda eri viisidel.

### Selgitus

Oluline mõte:

- `input` on üldine sisestuselement
- tema käitumine sõltub `type` atribuudist

Näited:

- `text`
- `number`
- `password`
- `date`
- `file`

### Skeem

```text
input
├── type="text"
├── type="number"
├── type="password"
├── type="date"
└── type="file"
```

### Koodinäide

Praegusest projektist:

```vue
<input
  v-model="username"
  type="text"
  class="form-control"
  id="inputUsername"
  placeholder="Kasutajanimi"
/>

<input
  v-model="password"
  type="password"
  class="form-control"
  id="inputPassword"
  placeholder="Parool"
/>
```

### Päriselu analoogia

See on nagu sahtlikapp. Kõik on sahtlid, aga üks on dokumentidele, teine tööriistadele ja kolmas võtmetele.

<a id="miks-placeholder-ei-asenda-label-it"></a>
## Miks `placeholder` ei asenda `label`-it — `2:13:14`

See on video üks praktilisemaid UX-teemasid.

### Selgitus

`placeholder` on vihje. Ta ei ole sama asi mis silt.

Probleem tekib siis, kui kasutaja:

- sisestab väärtuse ära
- tuleb hiljem vormi tagasi
- peab aru saama, mis väli mis asja jaoks oli

Kui silt puudub ja alles oli ainult `placeholder`, kaob vajalik info ära kohe, kui väli täidetakse.

### Skeem

```text
halb:
[eesnimi]
Kui kasutaja kirjutab, vihje kaob

hea:
Eesnimi
[Rain]
```

### Koodinäide

`src/views/LoginView.vue` kasutab head tava:

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

Siin on olemas mõlemad:

- `placeholder` annab vihje
- `label` ütleb püsivalt, mis väli see on

### Päriselu analoogia

`placeholder` on nagu pliiatsiga kirjutatud märkus, mis võib ära kustuda. `label` on nagu ukse peal olev ametlik silt.

<a id="select-button-disabled-ja-selected"></a>
## Select, button, `disabled` ja `selected` — `2:20:03`

Siin ehitatakse samm-sammult rippmenüü ja nupp kliendi lisamise vormi jaoks.

### Selgitus

Oluline idee on see, et vormi esimene valik võib olla ainult juhis, mitte päris sisuline valik.

Selleks kasutatakse:

- `disabled` = kasutaja ei saa seda valida
- `selected` = see on alguses ette valitud

### Skeem

```text
select
├── option disabled selected -> "Linn"
├── option -> Tallinn
├── option -> Tartu
└── option -> Viljandi
```

### Koodinäide

```html
<select id="city">
  <option value="0" disabled selected>Linn</option>
  <option value="2">Tallinn</option>
  <option value="3">Tartu</option>
  <option value="1">Viljandi</option>
</select>

<button type="submit">Lisa klient süsteemi</button>
```

### Päriselu analoogia

See on nagu ankeedil juhis „Vali linn”. See juhis peab olema nähtav, aga see ei tohi olla päris vastus.

<a id="miks-option-value-peaks-hoidma-id-d"></a>
## Miks `option value` peaks hoidma ID-d — `2:25:13`

Video lõpus jõutakse väga tähtsa andmemudelduse mõtteni.

### Selgitus

Kasutaja näeb tavaliselt nime:

- Tallinn
- Tartu
- Viljandi

Süsteem tahab sageli hoopis ID-d:

- 2
- 3
- 1

Miks?

- nimi võib muutuda
- kuvatekst on kasutajale
- ID on süsteemile stabiilsem ja kiirem

Kui uus linn lisandub, on targem muuta andmeid andmebaasis, mitte käia arenduse täistsüklit ainult ühe tekstirea pärast läbi.

### Skeem

```text
kasutaja näeb: Tallinn
süsteem saab: 2
```

### Koodinäide

```html
<option value="2">Tallinn</option>
```

Programmi loogika saab hiljem kontrollida näiteks:

```js
if (selectedCityId === '0') {
  alert('Palun vali linn')
}
```

### Päriselu analoogia

See on nagu inimese nimi ja isikukood. Igapäevaelus kasutad nime, aga süsteemis on unikaalne tunnus tavaliselt kindlam.

## Kokkuvõte

See video liigub kolmes suures blokis:

- arendustöö suurem pilt: rollid, kommunikatsioon ja security
- HTML baasteadmised: struktuur, tagid, atribuudid, `div`, DOM ja vormielemendid
- praktiline töövoog: AI abiga materjalide loomine, editori shortcutid ja lihtsa vormi ehitamine

Kõige tähtsamad mõtted algajale on:

- HTML kirjeldab struktuuri, mitte kogu loogikat
- vormis on `label` tähtsam kui ainult `placeholder`
- kasutajale kuvatav tekst ja süsteemi sisemine väärtus ei pea olema sama asi
- kõike ei pea peast teadma, aga peab teadma, mis võimalused olemas on
