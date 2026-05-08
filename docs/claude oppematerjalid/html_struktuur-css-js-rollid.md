## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/T_2Tko0uxM-suJcQ8Pscnmg0QP4b7NBGRRizir9Sji__5At5WGHlcWD1N2GRdM6M.fhSk2wCv2Wqk07Jt?startTime=1776231985000) |
| **Parool** | `#^vAq1J9` |
| **Transkript** | [GMT20260415-054625-v1.vtt](../transcripts/GMT20260415-054625-v1.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Kõige olulisem neist on see, et nimi `Claude` on mitmes kohas loetud kujul `Cloud`.

Selles õppematerjalis kasutan nime `Claude`, kui jutt käib AI tööriistast, skilli loomisest või projektikonteksti kasutamisest.

Selles videos otseseid taskikoode stiilis `FE-124` või `BEB-7` ei tuvastanud.

## Sisukord

- [HTML, CSS ja JavaScript teevad eri tööd](#html-css-ja-javascript-teevad-eri-tood) — `0:14:35`
- [`head` ja `body`](#head-ja-body) — `0:16:38`
- [Tagid, elemendid ja süntaks](#tagid-elemendid-ja-suntaks) — `0:18:15`
- [`div` kui nähtamatu karp](#div-kui-nahtamatu-karp) — `0:21:17`
- [Atribuudid ja väärtused](#atribuudid-ja-vaartused) — `0:22:52`
- [Kuidas õpetajale kiiresti järgi jõuda](#kuidas-opetajale-kiiresti-jargi-jouda) — `0:25:59`
- [Miks lahtised muudatused harude vahel kaasa liiguvad](#miks-lahtised-muudatused-harude-vahel-kaasa-liiguvad) — `0:26:38`
- [Vale branch, vale push ja reverse patch](#vale-branch-vale-push-ja-reverse-patch) — `0:37:10`
- [Kui Gitis läks segaseks, peatu ja küsi abi](#kui-gitis-laks-segaseks-peatu-ja-kusi-abi) — `0:55:05`
- [Tööriistad muutuvad, kontseptsioonid jäävad](#tooriistad-muutuvad-kontseptsioonid-jaavad) — `1:01:06`
- [Frontend peab arvestama päris kasutajatega](#frontend-peab-arvestama-paris-kasutajatega) — `1:10:45`
- [`textarea`, `input`, `placeholder` ja `value`](#textarea-input-placeholder-ja-value) — `1:54:09`
- [`radio` ja `checkbox` ei ole sama asi](#radio-ja-checkbox-ei-ole-sama-asi) — `2:02:23`
- [Mitu HTML faili ja lingid nende vahel](#mitu-html-faili-ja-lingid-nende-vahel) — `2:18:36`
- [Nupp, `input`-nupp ja link nupu moodi](#nupp-input-nupp-ja-link-nupu-moodi) — `2:31:08`
- [Korduva prompti asemel skill](#korduva-prompti-asemel-skill) — `2:40:13`
- [Kontekst, tokenid ja AI tööriista mõistlik kasutus](#kontekst-tokenid-ja-ai-tooriista-moistlik-kasutus) — `3:16:27`

<a id="html-css-ja-javascript-teevad-eri-tood"></a>
## HTML, CSS ja JavaScript teevad eri tööd — `0:14:35`

Video alguses tuletatakse uuesti meelde väga oluline baasidee: frontendis ei tee kõik tehnoloogiad sama asja.

### Selgitus

- HTML kirjeldab, mis elemendid lehel olemas on.
- CSS määrab, kuidas need elemendid välja näevad.
- JavaScript lisab käitumise ja loogika.

Kui need rollid peas segi lähevad, muutub õppimine palju raskemaks. Algajal on kasulik iga uue näite juures küsida: kas ma muudan praegu struktuuri, välimust või käitumist?

### Skeem

```text
HTML  -> mis asi see on
CSS   -> milline see välja näeb
JS    -> mida see teeb
```

### Koodinäide

`src/views/LoginView.vue` näitab seda hästi:

```vue
<h1 class="mb-3">Sisse logimine</h1>
<input
  v-model="username"
  type="text"
  class="form-control"
  id="inputUsername"
  placeholder="Kasutajanimi"
/>
<button @click="login" type="submit" class="btn btn-outline-secondary">Login</button>
```

Siin:

- HTML-laadne template ütleb, et lehel on pealkiri, väli ja nupp
- CSS klassid nagu `mb-3` ja `form-control` kujundavad välimust
- `@click="login"` seob nupu käitumise JavaScripti meetodiga

### Päriselu analoogia

Mõtle majale:

- HTML on seinad, uksed ja aknad
- CSS on värv, tapeet ja mööbel
- JavaScript on elektrisüsteem ja automaatika

<a id="head-ja-body"></a>
## `head` ja `body` — `0:16:38`

Õpetaja seletab, et HTML failis ei ole kõik osad kasutajale nähtavad.

### Selgitus

HTML dokumendis on kaks väga tähtsat suurt ala:

- `head` sisaldab infot brauserile ja lehele
- `body` sisaldab seda, mida kasutaja reaalselt näeb

`head` sees võivad olla näiteks:

- lehe pealkiri
- metaandmed
- stiilide või skriptide viited

`body` sees on:

- pealkirjad
- tekstid
- vormid
- pildid
- nupud

### Skeem

```html
<html>
  <head>
    <!-- brauserile vajalik info -->
  </head>
  <body>
    <!-- kasutajale nähtav sisu -->
  </body>
</html>
```

### Koodinäide

Vue projektis ei kirjuta me tavaliselt iga vaate sisse kogu HTML dokumenti, aga sama põhimõte kehtib endiselt. `src/main.js` ühendab rakenduse nähtava osa lehe külge:

```js
const app = createApp(App)

app.use(createPinia())
app.use(router)
app.mount('#app')
```

See tähendab, et rakenduse nähtav sisu renderdatakse DOM-i sellesse kohta, mis asub lõppkokkuvõttes lehe `body` sees.

### Päriselu analoogia

`head` on nagu poe laos olev tehniline info ja tööjuhendid. `body` on see saaliosa, kuhu klient sisse astub.

<a id="tagid-elemendid-ja-suntaks"></a>
## Tagid, elemendid ja süntaks — `0:18:15`

Selles osas selgitatakse, kuidas HTML süntaks tehniliselt koosneb.

### Selgitus

Olulised mõisted:

- tag ehk märgend, näiteks `<div>` või `</div>`
- element ehk tervik, mis koosneb avavast märgendist, sisust ja sulgevast märgendist
- mõned elemendid on paaris
- mõned on tühjad või isesulguvad

Frontendis on väga tavaline, et üks puudu olev sulgev märgend tekitab vea hoopis lehe järgmises osas. Sellepärast rõhutab õpetaja, et HTML-i süntaks peab olema puhas.

### Skeem

```text
<p>Tekst</p>
 ^    ^   ^
 |    |   |
 avav sisu sulgev
 tag       tag
```

### Koodinäide

`src/App.vue` sisaldab mitut üksteise sisse paigutatud elementi:

```vue
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-3 mb-4">
  <RouterLink class="navbar-brand" to="/">Bank40</RouterLink>
  <button
    class="navbar-toggler"
    type="button"
    data-bs-toggle="collapse"
    data-bs-target="#navMenu"
  >
    <span class="navbar-toggler-icon"></span>
  </button>
</nav>
```

Kui näiteks `</button>` või `</nav>` jääks puudu, läheks ülejäänud struktuur väga kiiresti segaseks.

### Päriselu analoogia

See on nagu sulud matemaatikas. Kui üks sulg jääb sulgemata, ei ole enam selge, milline osa millega kokku kuulub.

<a id="div-kui-nahtamatu-karp"></a>
## `div` kui nähtamatu karp — `0:21:17`

Õpetaja rõhutab, et `div` ei tähenda vaikimisi midagi ilusat ega erilist. Ta on lihtsalt struktuurielement.

### Selgitus

`div` on kasulik siis, kui tahad:

- grupeerida elemente
- teha paigutust
- lisada ühisele grupile klassi või stiili
- luua loogilisi sektsioone

Ilma CSS-ita on `div` enamasti lihtsalt nähtamatu kast. Alles stiilid annavad talle piiri, tausta, vahe või paigutuse.

### Skeem

```text
div
 |
 +-- pealkiri
 +-- sisendväli
 +-- nupp
```

### Koodinäide

`src/views/LoginView.vue` kasutab `div`-e paigutuse jaoks:

```vue
<div class="container text-center">
  <div class="row justify-content-center">
    <div class="col col-3">
      <h1 class="mb-3">Sisse logimine</h1>
    </div>
  </div>
</div>
```

Siin ei ole `div` ise äriloogika, vaid pigem kast, mille abil sisu paika pannakse.

### Päriselu analoogia

`div` on nagu pappkarp kolimise ajal. Karbil ei pruugi olla iseenesest erilist väärtust, aga ta aitab asju koos hoida ja õiges kohas hoida.

<a id="atribuudid-ja-vaartused"></a>
## Atribuudid ja väärtused — `0:22:52`

Video järgmine oluline osa räägib atribuutidest: kuidas elemendile lisainfot anda.

### Selgitus

Atribuut ütleb elemendi kohta midagi täiendavat. Näiteks:

- kust pilt laadida
- mis tüüpi sisestusvälja näidata
- milline CSS klass rakendub
- millise ID või nimega element on tegemist

Tavaline kuju on:

```html
atribuut="väärtus"
```

### Skeem

```text
<input type="text" id="inputUsername" placeholder="Kasutajanimi" />
        |           |                          |
      atribuut    atribuut                 atribuut
```

### Koodinäide

Projektis on mitu head näidet.

Pildi puhul `src/views/HomeView.vue`:

```vue
<img
  src="https://i1.sndcdn.com/avatars-gA2VdBW6Iik3G4Nc-LvUPgw-t240x240.jpg"
  class="img-fluid"
/>
```

Vormi puhul `src/views/LoginView.vue`:

```vue
<input
  v-model="password"
  type="password"
  class="form-control"
  id="inputPassword"
  placeholder="Parool"
/>
```

### Päriselu analoogia

Atribuudid on nagu inimese profiili väljad:

- nimi
- roll
- vanus
- kontakt

Inimene ise on olemas, aga atribuudid annavad tema kohta lisateavet.

<a id="kuidas-opetajale-kiiresti-jargi-jouda"></a>
## Kuidas õpetajale kiiresti järgi jõuda — `0:25:59`

Üks praktilisemaid osi videos on see, kuidas maha jäänud õppija saab kiiresti puhta seisu ja liigub õigesse punkti tagasi.

### Selgitus

Põhiidee ei ole see, et kopeerid paaniliselt kõik õpetaja klõpsud järgi. Parem lähenemine on:

1. tee oma tööpuu puhtaks
2. too remote'ist uus info kohale
3. loo õigest kohast uus haru
4. jätka sealt

See säästab aega ja vähendab segadust.

### Skeem

```text
olen maas
   |
   v
eemalda kohalik segadus
   |
   v
fetch remote muudatused
   |
   v
loo uus branch õigest kohast
   |
   v
jätka rahulikult
```

### Koodinäide

CLI-s näeks sama mõte välja näiteks nii:

```bash
git fetch origin
git switch -c minu-haru-v2 origin/opetaja-haru
```

Kui tööpuus on pooleli ja commit'imata muudatused, tuleb need enne korda teha. Videos näidati sama mõtet ka IDE Git tööriistade kaudu.

### Päriselu analoogia

Kui loengus maha jääd, ei ole mõistlik vihikusse iga vahepealne kriips kiiruga ümber joonistada. Palju mõistlikum on võtta puhas leht ja alustada õigest peatükist.

<a id="miks-lahtised-muudatused-harude-vahel-kaasa-liiguvad"></a>
## Miks lahtised muudatused harude vahel kaasa liiguvad — `0:26:38`

See on Gitis üks kõige sagedasemaid algaja komistuskohti.

### Selgitus

Commit'imata muudatused ei "ela" veel päriselt branchi ajaloos. Need on lihtsalt sinu töökaustas lahti. Seepärast võib juhtuda, et:

- muudad faile branchis A
- lähed branchi B
- samad muudatused tulevad sinuga kaasa

See tekitab tunde, et Git käitub suvaliselt, aga tegelikult on põhjus lihtne: muudatusi pole veel commit'iga branchi külge kinnitatud.

### Skeem

```text
branch A + lahtised muudatused
            |
            v
switch branch B
            |
            v
lahtised muudatused võivad ikka alles olla
```

### Koodinäide

Turvaline kontroll enne branchi vahetust:

```bash
git status
git branch --show-current
```

Kui `git status` näitab muudatusi, pead enne otsustama:

- commit
- stash
- rollback

### Päriselu analoogia

See on nagu tass kohvi, mille sa võtad ühelt laualt teisele kaasa. Tass ei kuulu veel kummagi laua külge, kuni sa ei pane seda teadlikult kindlasse kohta.

<a id="vale-branch-vale-push-ja-reverse-patch"></a>
## Vale branch, vale push ja reverse patch — `0:37:10`

Video keskel räägitakse sellest, kuidas eksimusi parandada ilma olukorda hullemaks tegemata.

### Selgitus

Peamised mõtted:

- enne push'i vaata alati üle, mis branchis sa oled
- kui vale asi sai push'itud, ära hakka paanikas ajalugu lõhkuma
- tihti on kõige turvalisem teha parandav commit
- patch ja reverse patch aitavad muudatusi liigutada või tagasi keerata

See on eriti oluline tiimitöös, kus history rewrite võib teiste töö katki teha.

### Skeem

```text
vale branch
   |
   v
vale commit või vale push
   |
   +-- halb reaktsioon: klõpsin suvaliselt
   |
   +-- hea reaktsioon: teen teadliku paranduse
```

### Koodinäide

Üks lihtne mõtteline patch näeb välja selline:

```diff
- <label for="inputPassword">Parol</label>
+ <label for="inputPassword">Parool</label>
```

Patch tähendab sisuliselt kirjeldust sellest, mis muutus. Reverse patch tähendab sama muudatuse tagurpidi rakendamist.

### Päriselu analoogia

Kui saatsid kliendile vale faili, ei hakka sa tavaliselt postisüsteemi ajalugu lõhkuma. Sa saadad parandatud faili ja kirjutad selgelt juurde, mis juhtus.

<a id="kui-gitis-laks-segaseks-peatu-ja-kusi-abi"></a>
## Kui Gitis läks segaseks, peatu ja küsi abi — `0:55:05`

Õpetaja rõhutab väga selgelt, et Gitis juhuslik klõpsimine ei ole hea strateegia.

### Selgitus

Kui sa ei saa aru, mida mingi nupp või tegevus teeb, siis:

- peatu
- ära kinnita suvalisi toiminguid
- vaata diff üle
- küsi abi

Algaja suurim risk ei ole tavaliselt üks väike viga. Suurem risk on see, et vea peale tehakse veel kolm uut tegevust, millest ka aru ei saada.

### Skeem

```text
ebakindlus
   |
   +-- halb tee: klõpsin edasi
   |
   +-- hea tee: peatan ja küsin
```

### Koodinäide

Minimaalne ohutu kontrollnimekiri:

```text
1. Vaata, mis branchis oled
2. Vaata, mis failid muutusid
3. Vaata diff läbi
4. Kui ikka ei saa aru, küsi abi
```

### Päriselu analoogia

Kui auto armatuurlaual süttib tundmatu hoiatustuli, ei ole tark lahendus vajutada kõiki nuppe järjest läbi. Kõigepealt tuleb aru saada, mis probleem üldse on.

<a id="tooriistad-muutuvad-kontseptsioonid-jaavad"></a>
## Tööriistad muutuvad, kontseptsioonid jäävad — `1:01:06`

Selles videos käib läbi mitu tööriista: IDE, Git, brauserid, Claude. Põhisõnum on, et tööriist on oluline, aga mõtlemine on tähtsam.

### Selgitus

Olulised järeldused:

- VS Code, IntelliJ ja muud IDE-d on töövahendid
- AI võib tööd kiirendada
- aga programmeerimise põhimõtteid tuleb ikkagi mõista
- ainult nuppe pähe õppides kaugele ei jõua

Siia juurde käib ka video laiem mõte: tööd peab päriselt tegema. Ei piisa sellest, et vaatad teiste tegemist pealt või lased tööriistal midagi valmis arvata.

### Skeem

```text
tööriist
   |
   v
aitab kiiremini teha
   |
   v
aga ei asenda arusaamist
```

### Koodinäide

`src/main.js` on lühike, aga hea näide sellest, et väikese faili taga on mitu olulist kontseptsiooni:

```js
const app = createApp(App)

app.use(createPinia())
app.use(router)
app.mount('#app')
```

Kui inimene ei saa aru, mis on rakenduse käivitamine, plugin, router või mountimine, siis ainuüksi IDE või AI teda siin lõpuni välja ei päästa.

### Päriselu analoogia

Kallis puurpink ei tee kellestki automaatselt head tislerit. Hea tisler kasutab tööriista hästi, sest ta saab materjalist ja töövõttest aru.

<a id="frontend-peab-arvestama-paris-kasutajatega"></a>
## Frontend peab arvestama päris kasutajatega — `1:10:45`

Ühes pikemas kõrvalepõikes räägitakse sellest, et kasutajad ei käitu alati ilusasti ega tehniliselt korrektselt.

### Selgitus

Frontend arendaja peab mõtlema:

- mis brauserit kasutaja avab
- kas vorm on arusaadav
- kas nuppe on lihtne leida
- kas veateade on loetav

See tähendab, et hea frontend ei ole ainult "mul töötab minu arvutis". Hea frontend arvestab päris inimestega.

### Skeem

```text
arendaja vaade != kasutaja vaade

hea frontend
  = töötab
  + on arusaadav
  + arvestab kasutajaga
```

### Koodinäide

`src/views/LoginView.vue` teeb vähemalt mõned õiged baassammud:

```vue
<AlertError :error-message="errorMessage" />
<label for="inputUsername">Kasutajanimi</label>
<label for="inputPassword">Parool</label>
```

Kasutaja jaoks on oluline, et:

- väljal oleks nimi
- vead oleksid nähtavad
- parooliväli käituks teisiti kui tavaline tekstiväli

### Päriselu analoogia

See on nagu hoone sissepääs. Omanik võib öelda, et "uks ju on olemas", aga kasutaja vaatest loeb see, kas ust on lihtne leida, avada ja õigesti kasutada.

<a id="textarea-input-placeholder-ja-value"></a>
## `textarea`, `input`, `placeholder` ja `value` — `1:54:09`

Video lõpuosa läheb jälle väga praktiliseks ja võtab lahti vormielementide tähtsad erinevused.

### Selgitus

Oluline vahe:

- `input` sobib tavaliselt ühe rea jaoks
- `textarea` sobib pikema mitmerealise teksti jaoks

Samuti ei tohi segi ajada:

- `placeholder` ehk vihjetekst
- `value` ehk tegelik väärtus

`placeholder` ei ole kasutaja päris sisend. Kui kasutaja midagi ei sisesta, ei ole placeholder "päris andmed".

### Skeem

```text
placeholder -> vihje
value       -> tegelik sisu
```

### Koodinäide

Projektis on `placeholder` kasutusel login-vormis:

```vue
<input
  v-model="username"
  type="text"
  class="form-control"
  id="inputUsername"
  placeholder="Kasutajanimi"
/>
```

Kui kasutaja kirjutab väljale teksti, hoiab tegelikku väärtust siin Vue poolel `username`, mitte placeholder.

Mitmerealise välja näide:

```html
<textarea name="comment" rows="5" placeholder="Kirjuta siia pikem kirjeldus"></textarea>
```

### Päriselu analoogia

`placeholder` on nagu märkmepaber laua peal kirjaga "kirjuta siia nimi". `value` on see nimi, mille inimene päriselt vormi sisse kirjutab.

<a id="radio-ja-checkbox-ei-ole-sama-asi"></a>
## `radio` ja `checkbox` ei ole sama asi — `2:02:23`

See on algajatele väga oluline koht, sest visuaalselt tunduvad need elemendid sarnased, aga loogika on erinev.

### Selgitus

- `radio` tähendab tavaliselt "vali üks variant"
- `checkbox` tähendab "võid valida mitu või ühe eraldi linnukese"

Radio-nuppude puhul on kriitiline see, et sama grupi nuppudel peab olema sama `name` atribuut. Just see seob nad omavahel kokku.

### Skeem

```text
radio group -> üks valik mitmest
checkbox    -> sõltumatu jah/ei märge
```

### Koodinäide

```html
<input type="radio" id="yes" name="newsletter" value="yes" />
<label for="yes">Jah</label>

<input type="radio" id="no" name="newsletter" value="no" />
<label for="no">Ei</label>

<input type="checkbox" id="terms" name="terms" />
<label for="terms">Nõustun tingimustega</label>
```

Siin:

- kaks `radio` välja kuuluvad kokku, sest mõlemal on `name="newsletter"`
- `checkbox` on eraldi, sõltumatu märge

### Päriselu analoogia

Radio on nagu küsimus "millise joogi sa valid?" ja valida saab ühe. Checkbox on nagu nimekiri "mida sa soovid lisaks?" ning linnukesi võib olla mitu.

<a id="mitu-html-faili-ja-lingid-nende-vahel"></a>
## Mitu HTML faili ja lingid nende vahel — `2:18:36`

Videos tehakse mitu eraldi HTML faili ja liigutakse nende vahel linkidega.

### Selgitus

Lihtsas veebis võib täiesti vabalt olla mitu eraldi faili:

- `index.html`
- `tingimused.html`
- `hinnakiri.html`

Siis ühendab neid omavahel link:

```html
<a href="tingimused.html">Tingimused</a>
```

See on väga hea viis õppida, kuidas navigeerimine baasveebis töötab.

### Skeem

```text
index.html
   |
   +-- link -> tingimused.html
   |
   +-- link -> hinnakiri.html
```

### Koodinäide

Selles Vue projektis tehakse sama mõte kaasaegsemalt routeri abil. `src/router/index.js` kirjeldab eri vaated:

```js
routes: [
  {
    path: '/',
    name: 'homeRoute',
    component: HomeView,
  },
  {
    path: '/login',
    name: 'loginRoute',
    component: LoginView,
  },
]
```

Ja `src/App.vue` lubab kasutajal nende vahel liikuda:

```vue
<RouterLink class="nav-link" to="/">Kodu</RouterLink>
<RouterLink class="nav-link" to="/login">Sisse logimine</RouterLink>
```

### Päriselu analoogia

Mitme HTML faili lahendus on nagu mitu tuba, mille vahel liigud ustest läbi. Routeriga SPA on nagu sama hoone, kus sisu vahetub sujuvamalt ilma kogu maja uuesti ehitamata.

<a id="nupp-input-nupp-ja-link-nupu-moodi"></a>
## Nupp, `input`-nupp ja link nupu moodi — `2:31:08`

Visuaalselt võivad need tunduda sarnased, aga semantiliselt on need erinevad tööriistad.

### Selgitus

Lihtne rusikareegel:

- kui kasutaja käivitab tegevuse, kasuta `button`
- kui kasutaja liigub teisele lehele, kasuta linki
- `input type="button"` ja `input type="submit"` on vanemad, aga endiselt olemas variandid

CSS võib muuta lingi nupu moodi välja nägema, aga elemendi päris eesmärk peab jääma loogiliseks.

### Skeem

```text
button -> tee midagi
a      -> liigu kuhugi
input  -> vormi vanem nuputüüp
```

### Koodinäide

Tegevuse käivitamine `src/views/LoginView.vue` failis:

```vue
<button @click="login" type="submit" class="btn btn-outline-secondary">Login</button>
```

Navigeerimine `src/App.vue` failis:

```vue
<RouterLink class="nav-link" to="/atms">Pangaautomaadid</RouterLink>
```

Need kaks võivad välja näha sarnased, aga üks käivitab tegevuse ja teine viib teise vaatesse.

### Päriselu analoogia

`button` on nagu uksekell: vajutad ja midagi juhtub. Link on nagu uks ise: kasutad seda, et teise kohta liikuda.

<a id="korduva-prompti-asemel-skill"></a>
## Korduva prompti asemel skill — `2:40:13`

Video üks huvitavamaid osi on see, kus õpetaja liigub üksikust promptist edasi korduvkasutatava töövooni.

### Selgitus

Kui teed sama tüüpi ülesannet korduvalt, ei ole mõistlik iga kord nullist pikka prompti kirjutada. Selle asemel saab teha skilli, mis:

- küsib vajalikud sisendid
- järgib kindlat formaati
- salvestab tulemuse õigesse kausta
- hoiab kvaliteedi ühtlasena

Selles videos jõutaksegi mõtteni, et õppematerjali loomine võiks olla eraldi skill.

### Skeem

```text
sama ülesanne korduvalt
   |
   v
käsitsi prompt iga kord
   |
   v
aeglane ja ebaühtlane

sama ülesanne korduvalt
   |
   v
skill
   |
   v
kiirem ja ühtlasem tulemus
```

### Koodinäide

Sama mõtet saab väljendada väga lihtsalt:

```text
Sisend:
- video link
- video parool
- transkript

Väljund:
- algajasõbralik õppematerjal
- õiges kaustas
- kindla struktuuriga
```

Just selle loogika järgi töötab ka kasutatav `skill-transkript-oppematerjal`.

### Päriselu analoogia

See on nagu teha endale valmis retsept. Kui tead, et küpsetad sama kooki mitu korda, ei mõtle sa iga kord nullist välja, mis järjekorras koostisained käivad.

<a id="kontekst-tokenid-ja-ai-tooriista-moistlik-kasutus"></a>
## Kontekst, tokenid ja AI tööriista mõistlik kasutus — `3:16:27`

Video lõpus selgitatakse, et AI tööriista kasutamine ei ole ainult prompti sisestamine. Tähtis on ka konteksti maht ja töövoo distsipliin.

### Selgitus

Peamised mõtted:

- tööriista kontekst ei ole lõpmatu
- mida rohkem ebavajalist infot sees on, seda kallimaks ja segasemaks töö läheb
- täpsem ülesanne annab parema vastuse
- AI tehtud muudatused tuleb diffist üle kontrollida
- staging alale ei tohiks pimesi kõike lisada

See sobib väga hästi kokku ka ülejäänud video tooniga: tööriist aitab, aga inimene vastutab.

### Skeem

```text
väike ja täpne kontekst
   |
   v
parem vastus

suur ja segane kontekst
   |
   v
rohkem müra
```

### Koodinäide

Praktiline AI kasutuse kontrollnimekiri:

```text
1. Anna konkreetne ülesanne
2. Hoia kontekst võimalikult asjakohane
3. Vaata loodud failid üle
4. Stage ainult kontrollitud muudatused
```

Sama põhimõte kehtib ka dokumentatsiooni puhul: AI võib mustandi teha kiiresti, aga lõppvastutuse võtab inimene.

### Päriselu analoogia

Kontekst on nagu seljakott matkale minnes. Kui topid sinna kõike võimalikku, muutub liikumine aeglaseks. Kui võtad kaasa ainult vajaliku, liigud kiiremini ja kindlamalt.

## Kokkuvõte

Selle video kõige tähtsamad õppetunnid on:

- HTML, CSS ja JavaScript tuleb peas rollide järgi lahus hoida
- HTML süntaksis võib üks väike viga lõhkuda suure osa lehest
- Gitis peab branchi, diffi ja commit'imata muudatusi teadlikult jälgima
- vormielementidel on erinev eesmärk ja semantika
- korduva AI töö jaoks tasub teha skill, mitte kirjutada iga kord uut pikka prompti
- AI kasutamisel loeb kontekst, täpsus ja inimese tehtud kontroll

Kui tahad, saab sellest videost teha ka eraldi lühema spikri ainult Git teemadel või teise variandi ainult HTML vormielementide kohta.
