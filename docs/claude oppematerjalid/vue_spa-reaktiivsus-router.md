## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/ZCDrTfNAKA8_IXB6sP6aguihExz5HYoBjMRXbn5vakfC9hUn5z01D1LqvuJqi7DW.RfEhkql1n6CFeB-x?startTime=1776405544000) |
| **Parool** | `ke9n+N3w` |
| **Transkript** | [GMT20260417-055904_v-1.vtt](../transcripts/GMT20260417-055904_v-1.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Näiteks esineb kohati `Cloud`, kuigi kontekst ütleb väga tugevalt, et mõeldud on `Claude` või `Claude Code`. Samamoodi on mõni tehniline termin nagu `template`, `script`, `merge`, `squash`, `review`, `branch` või `Bootstrap` kohati vigaselt loetud.

Selles õppematerjalis kasutan tavapäraseid termineid ja sõnastan ideed algajasõbralikult ümber.

Selles videos on OCR-i järgi kõige selgemalt tuvastatav taskikood `FEB-5`. Mõnes kohas vilksatab näitena ka `FEB-1`, aga see ei ole sama kindel kui `FEB-5`.

Kuna selle repo koodibaas on Vue projekt, kasutan siin peamiselt päris näiteid failidest `src/App.vue`, `src/main.js`, `src/router/index.js`, `src/views/ErrorView.vue` ja `src/views/LoginView.vue`.

## Sisukord

- [Single Page Application uuendab ainult vajalikku osa lehest](#single-page-application-uuendab-ainult-vajalikku-osa-lehest) - `0:02:38`
- [Reaktiivsus ja mustri mõistmine on tähtsam kui süntaksi päheõppimine](#reaktiivsus-ja-mustri-moistmine-on-tahtsam-kui-suntaksi-paheoppimine) - `0:04:06`
- [AI väljundit ei tohi pimesi usaldada, vaid tuleb valideerida](#ai-valjundit-ei-tohi-pimesi-usaldada-vaid-tuleb-valideerida) - `0:07:46`
- [Keerulise `if`-tingimuse võib tõsta eraldi meetodisse](#keerulise-if-tingimuse-voib-tosta-eraldi-meetodisse) - `0:10:22`
- [Koodi loetavus on tähtsam kui liiga jäik reeglijärgimine](#koodi-loetavus-on-tahtsam-kui-liiga-jaik-reeglijargimine) - `0:16:46`
- [Puhtalt lehelt alustamine tähendab ka harude ja näidiskoodi koristamist](#puhtalt-lehelt-alustamine-tahendab-ka-harude-ja-naidiskoodi-koristamist) - `0:19:04`
- [Skill saab automatiseerida haru, commiti, merge'i ja koristuse](#skill-saab-automatiseerida-haru-commiti-mergei-ja-koristuse) - `0:26:34`
- [`Claude Code` ja lokaalne dev-server käivad käsikäes](#claude-code-ja-lokaalne-dev-server-kaivad-kasikaes) - `0:29:50`
- [Vue Single File Component jagab faili `template`, `script` ja `style` blokkideks](#vue-single-file-component-jagab-faili-template-script-ja-style-blokkideks) - `0:43:06`
- [Bootstrap aitab kiiresti UI püsti saada ilma nullist CSS-i kirjutamata](#bootstrap-aitab-kiiresti-ui-pusti-saada-ilma-nullist-css-i-kirjutamata) - `0:50:23`
- [Grid-süsteem `container`, `row`, `col` annab layout'ile karkassi](#grid-susteem-container-row-col-annab-layoutile-karkassi) - `0:57:58`
- [Epic, task ja tunnilogimine aitavad päris arendust juhtida](#epic-task-ja-tunnilogimine-aitavad-paris-arendust-juhtida) - `2:03:27`
- [FEB-5 on selles videos konkreetne taski- ja harunäide](#feb-5-on-selles-videos-konkreetne-taski-ja-harunaide) - `2:04:21`
- [Error-vaade on ootamatute backend-vigade jaoks, mitte iga väikse vea jaoks](#error-vaade-on-ootamatute-backend-vigade-jaoks-mitte-iga-vaikse-vea-jaoks) - `2:36:36`
- [Uus `ErrorView` tuleb luua nii vaates, routeris kui ka layout'is korrektselt](#uus-errorview-tuleb-luua-nii-vaates-routeris-kui-ka-layoutis-korrektselt) - `2:39:01`
- [Koodi vormindamine ja puhas diff on basic hügieen](#koodi-vormindamine-ja-puhas-diff-on-basic-hugieen) - `2:40:35`
- [Template'il peaks olema selge juurelement ja selle sees läbimõeldud struktuur](#templateil-peaks-olema-selge-juurelement-ja-selle-sees-labimoodud-struktuur) - `2:47:35`
- [Pull request, kommentaarid ja resolve conversation teevad code review jälgitavaks](#pull-request-kommentaarid-ja-resolve-conversation-teevad-code-review-jalgitavaks) - `3:27:08`
- [Squash merge, branch cleanup ja enne uut tööd fetchimine hoiavad git ajaloo puhtana](#squash-merge-branch-cleanup-ja-enne-uut-tood-fetchimine-hoiavad-git-ajaloo-puhtana) - `3:35:11`

<a id="single-page-application-uuendab-ainult-vajalikku-osa-lehest"></a>
## Single Page Application uuendab ainult vajalikku osa lehest - `0:02:38`

Video alguses tehakse eelmise päeva Vue-jutust kokkuvõte ja rõhutatakse SPA põhiideed.

### Selgitus

Single Page Application ehk SPA tähendab siin seda, et:

- rakendusel on üks põhisisenemisleht
- ülejäänud sisu pannakse kokku dünaamiliselt
- muudatuse korral ei laeta kogu lehte nullist uuesti

See annab kasutajale kiirema ja sujuvama tunde, sest uuendatakse ainult see osa, mis päriselt muutus.

### Skeem

```text
kasutaja teeb tegevuse
  -> frontend otsustab, mis muutus
      -> uuendab ainult vajaliku osa
          -> kogu leht ei vilgu nullist uuesti
```

### Koodinäide

Selle repo SPA-sisendpunkt on:

```html
<div id="app"></div>
<script type="module" src="/src/main.js"></script>
```

Ja rakendus ise pannakse sinna külge nii:

```js
const app = createApp(App)
app.use(router)
app.mount('#app')
```

### Päriselu analoogia

See on nagu vahetad toas ainult kardinaid, mitte ei ehita iga kord kogu maja uuesti üles.

<a id="reaktiivsus-ja-mustri-moistmine-on-tahtsam-kui-suntaksi-paheoppimine"></a>
## Reaktiivsus ja mustri mõistmine on tähtsam kui süntaksi päheõppimine - `0:04:06`

Õpetaja toob välja kaks väga tähtsat mõtet: Vue maailm on ehitatud reaktiivsusele ja arendaja peamine töö on mustri mõistmine, mitte pime süntaksi tuupimine.

### Selgitus

Reaktiivsus tähendab lihtsustatult:

- midagi muutub andmetes
- kasutajaliides reageerib sellele muutusele

Kui see loogika hakkab peas klikkima, siis paljud asjad tunduvad hiljem palju loogilisemad. Siis jääb süntaks ainult tööriistaks, mitte peamiseks probleemiks.

### Skeem

```text
andmed muutuvad
  -> raamistik märkab muutust
      -> UI värskendub
```

### Koodinäide

Vue poolel on selle üks nähtav tulemus `RouterView`:

```vue
<RouterView />
```

Sama koht näitab erinevat sisu sõltuvalt sellest, mis on rakenduse hetkeseis või rada.

### Päriselu analoogia

See on nagu valgusfoor, mis vahetab värvi vastavalt sellele, mis seis süsteemis on. Sina ei joonista iga kord uut foori, vaid olemasolev süsteem reageerib.

<a id="ai-valjundit-ei-tohi-pimesi-usaldada-vaid-tuleb-valideerida"></a>
## AI väljundit ei tohi pimesi usaldada, vaid tuleb valideerida - `0:07:46`

See on video üks tugevamaid mõtteid. Õpetaja ütleb sisuliselt välja, et AI on abiline, mitte vastutuse asendaja.

### Selgitus

Kui AI teeb sulle koodi, siis sul on vaja kontrollida:

- mida see rida teeb
- miks see üldse seal on
- kas see on antud kontekstis õige
- kas on olemas lihtsam või loetavam lahendus

Töötav kood ei pruugi olla hea kood. Ta võib olla:

- raskesti loetav
- liiga keeruline
- vales kohas dubleeritud

### Skeem

```text
AI pakub lahenduse
  -> arendaja loeb läbi
      -> arendaja mõistab
          -> arendaja otsustab, kas jätab, muudab või lükkab tagasi
```

### Koodinäide

Hea kontrollküsimus võiks olla:

```text
Kas ma saan iga rea kohta öelda:
- mida see teeb?
- miks seda vaja on?
- kas seda saab lihtsamaks teha?
```

### Päriselu analoogia

See on nagu keegi annab sulle valmis juhendi. Sa ei kasuta seda pimesi, kui juhend räägib elektritööst või piduritest.

<a id="keerulise-if-tingimuse-voib-tosta-eraldi-meetodisse"></a>
## Keerulise `if`-tingimuse võib tõsta eraldi meetodisse - `0:10:22`

Video üks praktilisemaid Clean Code mõtteid on see, et liiga keeruline tingimus tasub nimetada ja eraldada.

### Selgitus

Kui `if` sees on:

- palju võrdlusi
- palju `&&` ja `||`
- keeruline mõista, mida üldse kontrollitakse

siis saab selle loetavamaks teha, kui tõstad loogika eraldi meetodisse ja annad sellele hea nime.

### Skeem

```text
enne:
if (väga pikk tingimus) { ... }

pärast:
if (isUserEligibleForSomething(...)) { ... }
```

### Koodinäide

Selle repo koodis on sama mõte väiksemas vormis olemas:

```js
allFormFieldsAreCorrect() {
  return this.username && this.password
}
```

Ja siis põhiloogika loeb juba puhtamalt:

```js
if (this.allFormFieldsAreCorrect()) {
  // jätka
}
```

### Päriselu analoogia

See on nagu keerulise kontrollnimekirja asemel panna uksele silt "Kas kõik vajalik on olemas?". Siis ei pea iga kord kogu nimekirja peast uuesti läbi lugema.

<a id="koodi-loetavus-on-tahtsam-kui-liiga-jaik-reeglijargimine"></a>
## Koodi loetavus on tähtsam kui liiga jäik reeglijärgimine - `0:16:46`

Õpetaja arutab siin meetodinimede, reeglite ja loetavuse vahelisi väikseid vastuolusid.

### Selgitus

Näiteks:

- meetodi nimi võiks olla lühike
- aga samal ajal peaks ta olema võimalikult täpne

Need kaks soovi ei mahu alati ideaalselt kokku. Siis tuleb teha teadlik valik selle kasuks, mis aitab võõral arendajal koodi paremini mõista.

### Skeem

```text
liiga lühike nimi
  -> kiire kirjutada
  -> halb mõista

täpsem nimi
  -> natuke pikem
  -> parem lugeda
```

### Koodinäide

```js
// halb
check()

// parem
allFormFieldsAreCorrect()
```

### Päriselu analoogia

See on nagu sahtli silt. `Paberid` on lühike, aga `Lepingud 2026` on palju täpsem.

<a id="puhtalt-lehelt-alustamine-tahendab-ka-harude-ja-naidiskoodi-koristamist"></a>
## Puhtalt lehelt alustamine tähendab ka harude ja näidiskoodi koristamist - `0:19:04`

Enne uue töö alustamist tehakse videos teadlik "koristus": vanad demod, branchid ja näidiskood tuleb eest ära võtta.

### Selgitus

See on oluline selleks, et:

- uus töö ei läheks segamini vana katsetusega
- branchi nimi oleks arusaadav
- `index.html` või muud failid ei sisaldaks enam ajutist õppimisjääki

See on git-hügieeni ja projekti puhtuse küsimus.

### Skeem

```text
vana demo
  -> kustuta või vii eest ära
vana branch
  -> nimeta ümber või kustuta
uus töö
  -> alusta puhtast seisust
```

### Koodinäide

```text
enne uut tööd:
- puhasta ajutine näidiskood
- kontrolli branchi nime
- kontrolli, et server käivitub
```

### Päriselu analoogia

See on nagu enne uut sööki puhastad tööpinna ära. Vana segadus ei pea uue töö sisse sattuma.

<a id="skill-saab-automatiseerida-haru-commiti-mergei-ja-koristuse"></a>
## Skill saab automatiseerida haru, commiti, merge'i ja koristuse - `0:26:34`

Videos pakutakse väga praktiline mõte: korduvat git-töövoogu ei pea iga kord käsitsi läbi tegema.

### Selgitus

Kui töövoog on kogu aeg sarnane:

- loo haru
- tee commit
- tee pull request
- merge
- kustuta harud

siis saab sellest teha skilli, mis teeb suure osa tüütust tööst sinu eest ära.

### Skeem

```text
task
  -> create branch
  -> commit
  -> PR
  -> merge
  -> cleanup
        ->
automatiseeritav skill
```

### Koodinäide

```text
Skill võiks võtta sisendiks:
- taski koodi
- lähteharu
- merge-tüübi

ja teha väljundina:
- uue haru
- commitid
- PR-i
- branch cleanup'i
```

### Päriselu analoogia

See on nagu koostad endale valmis check-listi lennukipiloodi moodi. Sa ei leiuta enne iga starti protseduuri uuesti.

<a id="claude-code-ja-lokaalne-dev-server-kaivad-kasikaes"></a>
## `Claude Code` ja lokaalne dev-server käivad käsikäes - `0:29:50`

Selles videos läheb suur osa juttu `Claude Code` CLI peale ja sellele, et lokaalne arenduskeskkond peab päriselt töötama.

### Selgitus

Põhiidee on:

- AI tööriist on kasulik ainult siis, kui ta näeb päris projekti
- lokaalne server peab olema püsti
- terminal ja projektirajad peavad korras olema

Selles repoes on arendusserveriks Vite.

### Skeem

```text
projekt
  -> terminal
  -> AI tööriist
  -> dev server
      -> brauseri lokaalne vaade
```

### Koodinäide

`package.json` näitab siin selgelt:

```json
"scripts": {
  "dev": "vite --port 8081"
}
```

Ja vastavad käivituselemendid on:

```bash
npm run dev
```

### Päriselu analoogia

See on nagu töökojas kasutad elektritööriista ainult siis, kui tööpink on paigas ja vool sees.

<a id="vue-single-file-component-jagab-faili-template-script-ja-style-blokkideks"></a>
## Vue Single File Component jagab faili `template`, `script` ja `style` blokkideks - `0:43:06`

See on video keskne Vue-teema.

### Selgitus

Vue Single File Component ehk `.vue` fail jagab rollid selgelt:

- `template` on nähtav HTML-laadne osa
- `script` on JavaScripti loogika
- `style` on komponendipõhine CSS, kui seda üldse vaja on

Õpetaja rõhutab ka, et `template` on Vue enda ehitusplokk. Seda ei kopeerita lõpp-HTML-i üks ühele sellisel kujul.

### Skeem

```text
Component.vue
  +-- template -> mida näidatakse
  +-- script   -> kuidas käitutakse
  +-- style    -> kuidas välja näeb
```

### Koodinäide

Repo `ErrorView.vue`:

```vue
<template>
  <div class="container text-center">
    <div class="row">
      <div class="col">
        <h1>Uups, midagi läks valesti :)</h1>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ErrorView',
}
</script>
```

### Päriselu analoogia

See on nagu teatrilavastus:

- `template` on lava
- `script` on lavastaja juhised
- `style` on kostüümid ja valgus

<a id="bootstrap-aitab-kiiresti-ui-pusti-saada-ilma-nullist-css-i-kirjutamata"></a>
## Bootstrap aitab kiiresti UI püsti saada ilma nullist CSS-i kirjutamata - `0:50:23`

Video selgitab hästi, miks Bootstrap on õppetöös ja admin-laadsetes projektides kasulik.

### Selgitus

Bootstrap annab sulle:

- valmis nupud
- valmis tabelid
- valmis alertid
- valmis layout-klotsid

See tähendab, et sa ei pea alustama nullist iga värvi, paddingu ja äärise defineerimisega.

### Skeem

```text
Bootstrap
  -> valmis klassid
      -> kiirem UI
          -> vähem käsitsi CSS-i alguses
```

### Koodinäide

Repo `main.js` toob Bootstrapi sisse:

```js
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.js'
```

Ja `AlertError.vue` kasutab kohe Bootstrapi klassi:

```vue
<div v-if="errorMessage" class="alert alert-danger" role="alert">
  {{ errorMessage }}
</div>
```

### Päriselu analoogia

See on nagu kasutada mööblipoe valmis riiulisüsteemi, mitte saagida iga lauda nullist ise.

<a id="grid-susteem-container-row-col-annab-layoutile-karkassi"></a>
## Grid-süsteem `container`, `row`, `col` annab layout'ile karkassi - `0:57:58`

Õpetaja suunab siin Bootstrapi kõige praktilisema osa juurde: grid-süsteemi.

### Selgitus

Grid annab sulle kolm põhiklotsi:

- `container` loob välise ala
- `row` loob rea
- `col` loob veeru

Selle abil saad paigutada pealkirjad, pildid, vormid ja muud elemendid mõistlikku ruudustikku.

### Skeem

```text
container
  -> row
      -> col
      -> col
```

### Koodinäide

Repo `HomeView.vue`:

```vue
<div class="container text-center">
  <div class="row">
    <div class="col">
      <h1>Siit leiad kõik Eesti pangautomaatide asukohad</h1>
    </div>
    <div class="col">
      <img class="img-fluid" />
    </div>
  </div>
</div>
```

### Päriselu analoogia

See on nagu ehitad näituseruumi moodulriiulitest. Sa ei aseta asju juhuslikult põrandale, vaid järjestad need ruudustikku.

<a id="epic-task-ja-tunnilogimine-aitavad-paris-arendust-juhtida"></a>
## Epic, task ja tunnilogimine aitavad päris arendust juhtida - `2:03:27`

Siin minnakse töökorralduse juurde.

### Selgitus

Õpetaja selgitab:

- `epic` on suurem teema või tööplokk
- selle alla tulevad väiksemad taskid
- mõnes ettevõttes logitakse töö taski kaupa tundidena

Seda infot kasutatakse:

- planeerimiseks
- kulude hindamiseks
- ülevaate saamiseks, kuhu aeg läheb

### Skeem

```text
epic
  -> task 1
  -> task 2
  -> task 3

iga task
  -> töö
  -> tunnid
```

### Koodinäide

```text
Näide töövoost:
epic: "Error handling"
  -> task: loo ErrorView
  -> task: lisa route
  -> task: kuva backend error
```

### Päriselu analoogia

Epic on nagu ehitusprojekti peatükk "köök". Selle all on väiksemad tööd: torud, elekter, mööbel, plaadid.

<a id="feb-5-on-selles-videos-konkreetne-taski-ja-harunaide"></a>
## FEB-5 on selles videos konkreetne taski- ja harunäide - `2:04:21`

OCR-i järgi on see video kõige selgem taskikood `FEB-5`.

### Selgitus

Seda koodi kasutatakse videos kahel tasandil:

- Jira või boardi taski näitena
- harunime näitena

Õppeprojekti jaoks pannakse branchi ette ka inimese nimi, et oleks selge, kelle tööga on tegu. Päriselus võib haru nimi olla lihtsam.

### Skeem

```text
õppeprojekt:
Artur-FEB-5

pärisprojektis sageli:
FEB-5
```

### Koodinäide

```text
task: FEB-5
  -> loo ErrorView
  -> lisa route /error
  -> testi, et vaade avaneb
```

### Päriselu analoogia

See on nagu töökorraldusleht laos. `FEB-5` on tellimuse number ja inimese nimi ütleb, kes seda parasjagu käsitleb.

<a id="error-vaade-on-ootamatute-backend-vigade-jaoks-mitte-iga-vaikse-vea-jaoks"></a>
## Error-vaade on ootamatute backend-vigade jaoks, mitte iga väikse vea jaoks - `2:36:36`

See on video praktiline arendusülesanne.

### Selgitus

Õpetaja teeb siin hea eristuse:

- mõni viga on kasutajale arusaadavalt ette teada
- mõni viga on sisemine ja ootamatu

Näiteks:

- "see e-post on juba kasutuses" on konkreetne äriviga
- "serveris läks midagi katki" on üldine süsteemiviga

Üldise vea jaoks ongi vaja eraldi error-vaadet.

### Skeem

```text
teada viga
  -> näita konkreetset teadet

tundmatu sisemine viga
  -> suuna ErrorView peale
```

### Koodinäide

Repo `ErrorView.vue` teeb täpselt seda:

```vue
<h1>Uups, midagi läks valesti :)</h1>
<img src="https://media.tenor.com/nANqORN7qhQAAAAM/explosion-explode.gif" class="img-fluid"/>
```

### Päriselu analoogia

Kui kassas on vale PIN, ütled kasutajale täpselt seda. Kui kogu süsteem kukub maha, ütled lihtsalt "Palun proovi hiljem uuesti".

<a id="uus-errorview-tuleb-luua-nii-vaates-routeris-kui-ka-layoutis-korrektselt"></a>
## Uus `ErrorView` tuleb luua nii vaates, routeris kui ka layout'is korrektselt - `2:39:01`

Video näitab siin head frontend-järjekorda: kõigepealt tee vaatefail, siis ühenda see routeriga.

### Selgitus

Loogiline järjekord on:

1. loo uus `ErrorView.vue`
2. anna komponendile nimi
3. lisa route routerisse
4. kontrolli, et `/error` aadress avab selle vaate

### Skeem

```text
views/ErrorView.vue
  -> import routerisse
      -> lisa route /error
          -> kuva läbi RouterView
```

### Koodinäide

Repo `router/index.js`:

```js
import ErrorView from '@/views/ErrorView.vue'

{
  path: '/error',
  name: 'errorRoute',
  component: ErrorView,
}
```

Ja `App.vue`:

```vue
<RouterView />
```

### Päriselu analoogia

See on nagu lisad majja uue toa. Ei piisa toa ehitamisest. Sa pead lisama ka ukse ja sildi, et sinna üldse ligi pääseks.

<a id="koodi-vormindamine-ja-puhas-diff-on-basic-hugieen"></a>
## Koodi vormindamine ja puhas diff on basic hügieen - `2:40:35`

See on videos väga tugev rõhuasetus.

### Selgitus

Põhisõnum:

- loetav kood peab olema ühtlase kujuga
- tühikud, taanded ja impordid ei ole "pisiasi"
- review's ei tohiks raisata aega sellele, et keegi unustas vormindada

Õpetaja annab ka praktilise mnemoonika otseteede jaoks: `I L O`.

### Skeem

```text
kirjuta kood
  -> vorminda
  -> korrasta read
  -> optimise imports
      -> puhtam diff
```

### Koodinäide

Repo `package.json` näitab, et ka masinlikud tööriistad on olemas:

```json
"scripts": {
  "lint": "run-s lint:*",
  "lint:oxlint": "oxlint . --fix",
  "lint:eslint": "eslint . --fix --cache",
  "format": "prettier --write --experimental-cli src/"
}
```

### Päriselu analoogia

See on nagu lähed koosolekule puhta särgiga. Keegi ei peaks kulutama aega sinu kortsus krae kommenteerimisele.

<a id="templateil-peaks-olema-selge-juurelement-ja-selle-sees-labimoodud-struktuur"></a>
## Template'il peaks olema selge juurelement ja selle sees läbimõeldud struktuur - `2:47:35`

Video toob siin välja ühe olulise Vue- ja layout-harjumuse.

### Selgitus

Praktiline mõte on:

- hoia `template` sees üks selge peamine ümbriskonteiner
- selle sees ehita oma `row` ja `col` struktuur
- nii on lihtsam mõista ja hallata kogu vaate paigutust

### Skeem

```text
template
  -> üks peamine wrapper
      -> row
          -> col
              -> sisu
```

### Koodinäide

Repo `ErrorView.vue` teeb seda puhtalt:

```vue
<template>
  <div class="container text-center">
    <div class="row">
      <div class="col">
        <h1>Uups, midagi läks valesti :)</h1>
      </div>
    </div>
  </div>
</template>
```

### Päriselu analoogia

See on nagu paned kõik kolimiskastid kõigepealt ühte suuremasse ruumi ja alles siis hakkad neid riiulitele jagama.

<a id="pull-request-kommentaarid-ja-resolve-conversation-teevad-code-review-jalgitavaks"></a>
## Pull request, kommentaarid ja resolve conversation teevad code review jälgitavaks - `3:27:08`

Video lõpuosa liigub päris arenduse review-protsessi juurde.

### Selgitus

PR-i mõte ei ole ainult "siin on minu kood", vaid:

- reviewer saab kommenteerida kindlat rida või plokki
- autor saab vastata
- vestlus jääb konkreetse koha külge
- kui asi on parandatud, saab conversation'i sulgeda

See on palju parem kui kirjeldada viga kuskil eraldi chatis.

### Skeem

```text
PR
  -> reviewer jätab kommentaari
      -> autor parandab
          -> autor vastab
              -> resolve conversation
```

### Koodinäide

```text
Näide review-kommentaarist:
"Vale blokkide järjekord, kõigepealt tuleb script ja siis template."

Näide autori tegevusest:
- teeb paranduse
- vastab "tehtud"
- märgib vestluse lahendatuks
```

### Päriselu analoogia

See on nagu õpetaja kirjutab vihikusse punase märkuse täpselt selle lause kõrvale, mida peab parandama, mitte ei ütle ainult "kuskil keskel oli viga".

<a id="squash-merge-branch-cleanup-ja-enne-uut-tood-fetchimine-hoiavad-git-ajaloo-puhtana"></a>
## Squash merge, branch cleanup ja enne uut tööd fetchimine hoiavad git ajaloo puhtana - `3:35:11`

See on video üks kõige praktilisemaid git-lõpusõnumeid.

### Selgitus

Siin on mitu eri põhimõtet:

- `squash merge` teeb ajaloost puhtama ühe commit'i
- vana arendusharu tuleks pärast merge'i kustutada
- enne uut haru tuleb tuua masteri värske seis

Muidu juhtub see, et:

- hakkad töötama vanalt baasilt
- merge conflictide tõenäosus kasvab
- git-ajalugu läheb müraseks

### Skeem

```text
fetch
  -> update master
      -> create new branch
          -> töö
              -> PR
                  -> squash merge
                      -> delete branch
```

### Koodinäide

```text
hea mõttejada:
1. fetchi värske seis
2. võta uus haru värske masteri pealt
3. tee töö ära
4. tee PR
5. merge või squash merge
6. kustuta arendusharu
```

### Päriselu analoogia

See on nagu alustad uut ehitust kõige uuema joonise pealt. Kui võtad vana versiooni, ehitad lõpuks vastu seina.

## Kokkuvõte

See video ühendab kaks suurt telge. Esimene on frontend-arhitektuur: SPA, reaktiivsus, Vue `template`/`script` loogika, Bootstrap ja `ErrorView` loomine. Teine on päris tööprotsess: AI valideerimine, taskid ja epikud, `FEB-5`, branchid, PR-id, code review, merge ja git-hügieen.

Kui sellest videost võtta kaasa viis kõige tähtsamat mõtet, siis need võiksid olla:

- SPA ei lae iga muutusega kogu lehte uuesti, vaid uuendab ainult vajalikke osi
- AI aitab süntaksiga, aga arendaja peab mõistma loogikat ja kontrollima lahenduse kvaliteeti
- Vue `.vue` failis on `template`, `script` ja `style` eri rollidega plokid
- taski kood, branch, PR ja review on päris arenduse igapäevane töökorraldus
- enne uut haru võta alati värske baas, hoia ajalugu puhas ja kustuta tarbetud harud ära
