## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/T_2Tko0uxM-suJcQ8Pscnmg0QP4b7NBGRRizir9Sji__5At5WGHlcWD1N2GRdM6M.fhSk2wCv2Wqk07Jt?startTime=1776248819000) |
| **Parool** | `#^vAq1J9` |
| **Transkript** | [GMT20260415-102659_v-2.vtt](../transcripts/GMT20260415-102659_v-2.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Kõige olulisem neist on see, et nimi `Claude` on mitmes kohas loetud kujul `Cloud`.

Mõnes kohas on vigaselt loetud ka CSS terminid nagu `selector`, `important` ja `refactor`. Selles õppematerjalis kasutan tavapäraseid termineid.

Selles videos otseseid taskikoode stiilis `FE-124` või `BEB-7` ei tuvastanud.

## Sisukord

- [Kuidas õpetajale branchiga järgi jõuda](#kuidas-opetajale-branchiga-jargi-jouda) - `0:01:28`
- [Mis on CSS ja miks inline style on halb vaikimisi valik](#mis-on-css-ja-miks-inline-style-on-halb-vaikimisi-valik) - `0:03:02`
- [Kolm viisi CSS-i HTML-iga ühendada](#kolm-viisi-css-i-html-iga-uhendada) - `0:03:40`
- [Element-, class- ja id-selectorid](#element-class-ja-id-selectorid) - `0:06:17`
- [Miks class on kujunduse jaoks tavaliselt parem kui id](#miks-class-on-kujunduse-jaoks-tavaliselt-parem-kui-id) - `0:15:56`
- [CSS reegli ehitus: selector, property ja value](#css-reegli-ehitus-selector-property-ja-value) - `0:17:15`
- [`margin`, `border` ja `padding`](#margin-border-ja-padding) - `0:20:26`
- [Kaskaad, spetsiifilisus ja pärimine](#kaskaad-spetsiifilisus-ja-parimine) - `0:23:57`
- [Õppeprojekti fookus ei ole pikslitäpne responsive disain](#oppeprojekti-fookus-ei-ole-pikslitapne-responsive-disain) - `0:25:53`
- [Eraldi CSS fail ja `<link rel="stylesheet">`](#eraldi-css-fail-ja-link-rel-stylesheet) - `0:30:50`
- [Kuidas Claude'ilt IDE sees valitud koodi kohta küsida](#kuidas-claude-ilt-ide-sees-valitud-koodi-kohta-kusida) - `0:34:38`
- [AI ei vabasta sind vastutusest](#ai-ei-vabasta-sind-vastutusest) - `0:36:06`
- [Skilliga saab korduvat tööd standardiseerida](#skilliga-saab-korduvat-tood-standardiseerida) - `0:39:48`
- [Õppimiseks tee oma projekt ja kasuta AI-d teadlikult](#oppimiseks-tee-oma-projekt-ja-kasuta-ai-d-teadlikult) - `0:42:55`
- [Refaktoreerimine ja Rename](#refaktoreerimine-ja-rename) - `0:51:07`
- [Sama tugevusega reeglites võidab viimane](#sama-tugevusega-reeglites-voidab-viimane) - `0:52:08`
- [`!important` on varuvõti, mitte põhistrateegia](#important-on-varuvoti-mitte-pohistrateegia) - `0:53:07`

<a id="kuidas-opetajale-branchiga-jargi-jouda"></a>
## Kuidas õpetajale branchiga järgi jõuda - `0:01:28`

Video päris algus ei ole veel CSS-ist. Õpetaja tuletab meelde, kuidas õpetajale või tiimile kiiresti järgi jõuda ilma oma pooleliolevat tööd segamini ajamata.

### Selgitus

- Kui sul on commit'imata muudatused, siis need tekitavad branchi vahetamisel segadust.
- Kui tahad oma pooleliolevat asja alles hoida, tee kõigepealt commit.
- Kui õpetaja on oma branchi ära push'inud, võta sealt uus branch ja jätka puhtast seisust.

Põhiidee on lihtne: enne kui hakkad teise inimese värsket seisu üle võtma, tee oma tööpuu teadlikult puhtaks.

### Skeem

```text
pooleli töö
   |
   +-- tahan alles hoida -> commit
   |
   +-- ei taha alles hoida -> rollback
   |
   v
fetch õpetaja muudatused
   |
   v
uus branch õpetaja branchi pealt
```

### Koodinäide

```bash
git status
git add <failid>
git commit -m "Pooleli töö enne järgi jõudmist"
git fetch origin
git switch -c minu-haru-v2 origin/opetaja-haru
```

### Päriselu analoogia

See on nagu märkmiku korrastamine enne, kui kopeerid tahvlilt uue lahenduse. Kui vana sodipadi jääb ette, läheb uus osa lihtsalt segamini.

<a id="mis-on-css-ja-miks-inline-style-on-halb-vaikimisi-valik"></a>
## Mis on CSS ja miks inline style on halb vaikimisi valik - `0:03:02`

Siit algab video põhiline teema: CSS.

### Selgitus

CSS on keel, millega sa ütled brauserile, kuidas HTML elemendid välja peavad nägema.

Oluline vahe:

- HTML ütleb, mis asi lehel olemas on
- CSS ütleb, milline see välja näeb

Õpetaja toob kohe välja, miks `style=""` lahendus ei ole tavaliselt hea põhivalik:

- kujundus läheb HTML sisse laiali
- sama muudatust peab hiljem tegema paljudes kohtades
- faili lugemine muutub segasemaks

### Skeem

```text
HTML -> struktuur
CSS  -> välimus
JS   -> käitumine
```

### Koodinäide

Mitte eriti hea püsilahendus:

```html
<h1 style="background-color: red">Pealkiri</h1>
```

Parem on hoida kujundus eraldi failis. Selles projektis on näiteks [src/assets/style.css](/mnt/c/Projects/grupp/40/bank40front/src/assets/style.css:1):

```css
body {
  background-color: aqua;
}

h5 {
  background-color: violet;
}
```

### Päriselu analoogia

Kui värvid iga mööblieseme peale käsitsi märkuse "tee mind punaseks", on see tülikas. Palju parem on hoida kujundusreeglid ühes kataloogis.

<a id="kolm-viisi-css-i-html-iga-uhendada"></a>
## Kolm viisi CSS-i HTML-iga ühendada - `0:03:40`

Õpetaja räägib läbi kolm tavapärast viisi, kuidas HTML ja CSS omavahel kokku pannakse.

### Selgitus

Kolm põhilist lähenemist on:

- inline style ehk stiil otse elemendi sees
- `<style>` plokk HTML faili sees
- eraldi `.css` fail

Õppe ja pärisprojekti jaoks on välise faili lahendus tavaliselt kõige mõistlikum, sest see teeb muudatused korduvkasutatavaks.

### Skeem

```text
1. element ise      -> kiire katse
2. style plokk      -> ühe faili piires
3. väline css fail  -> korduvkasutus ja korrashoid
```

### Koodinäide

```html
<!-- 1. inline -->
<h1 style="color: red">Pealkiri</h1>

<!-- 2. style plokk -->
<style>
  h1 {
    color: red;
  }
</style>

<!-- 3. väline fail -->
<link rel="stylesheet" href="src/assets/style.css">
```

### Päriselu analoogia

See on nagu riiete hoiustamine. Võid hoida sokke suvaliselt laiali, ühes sahtlis või terves kapis süsteemselt. Väline CSS fail on see "korralik kapp".

<a id="element-class-ja-id-selectorid"></a>
## Element-, class- ja id-selectorid - `0:06:17`

Selles osas tehakse väga praktiliselt selgeks, mille järgi CSS üldse elementi üles leiab.

### Selgitus

Selector tähendab reeglit, mille järgi CSS otsustab, kellele stiil rakendada.

Põhivariandid:

- ilma märgita nimi, näiteks `body` või `h5` - see viitab HTML elemendi tüübile
- punktiga nimi, näiteks `.awesomeRed` - see viitab klassile
- trelliga nimi, näiteks `#censored` - see viitab ID-le

Projektis on need kõik korraga näha failis [src/assets/style.css](/mnt/c/Projects/grupp/40/bank40front/src/assets/style.css:1).

### Skeem

```text
body         -> kõik body elemendid
h5           -> kõik h5 elemendid
.awesomeRed  -> kõik selle klassiga elemendid
#censored    -> üks kindel id
```

### Koodinäide

```css
#censored {
  background-color: black;
}

body {
  background-color: aqua;
}

h5 {
  background-color: violet;
}

.awesomeRed {
  background-color: red;
}
```

### Päriselu analoogia

Element-selector on nagu öelda "värvi kõik riiulid". Class-selector on nagu kleeps "allahindlus" mitmel tootel. ID on nagu ühe konkreetse asja seerianumber.

<a id="miks-class-on-kujunduse-jaoks-tavaliselt-parem-kui-id"></a>
## Miks class on kujunduse jaoks tavaliselt parem kui id - `0:15:56`

Õpetaja rõhutab, et tavakasutuses kujundatakse enamasti klassidega.

### Selgitus

`class` on hea siis, kui tahad sama kujundust kasutada mitmes kohas. `id` peab olema ühel lehel unikaalne.

Seepärast:

- kujunduse jaoks sobib `class`
- tehnilise sidumise, labeli või ankrute jaoks võib vaja minna `id`

See tuleb hästi välja ka projektis kasutatavate vormiväljade juures.

### Skeem

```text
class -> korduvkasutatav
id    -> üks kindel element
```

### Koodinäide

`src/views/LoginView.vue` kasutab mõlemat:

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

Siin:

- `class="form-control"` annab korduvkasutatava stiili
- `id="inputUsername"` seob konkreetse välja konkreetse `label`-iga

### Päriselu analoogia

`class` on nagu koolivorm - sama asi võib olla paljudel. `id` on nagu isikukood - see peab olema konkreetse inimese oma.

<a id="css-reegli-ehitus-selector-property-ja-value"></a>
## CSS reegli ehitus: selector, property ja value - `0:17:15`

Pärast selectorite ideed võetakse lahti ka ühe CSS reegli siseehitus.

### Selgitus

Tavaline CSS reegel koosneb kolmest mõttelisest osast:

- selector - kellele reegel kehtib
- property - mida muudetakse
- value - mis väärtuseks see seatakse

Kõige tavalisem kuju on:

```css
selector {
  property: value;
}
```

### Skeem

```text
a {
  color: green;
}

a      -> selector
color  -> property
green  -> value
```

### Koodinäide

`src/assets/main.css` näitab päris projekti näidet:

```css
a,
.green {
  text-decoration: none;
  color: hsla(160, 100%, 37%, 1);
  transition: 0.4s;
  padding: 3px;
}
```

Siin on üks reegel, millel on mitu selectorit ja mitu omadust.

### Päriselu analoogia

See on nagu tööjuhis:

- kellele juhis kehtib
- mida peab muutma
- milliseks peab muutuma

<a id="margin-border-ja-padding"></a>
## `margin`, `border` ja `padding` - `0:20:26`

See on üks video olulisemaid baasteemasid, sest väga paljud algajad ajavad need kolm mõistet segamini.

### Selgitus

Lihtne vahe on järgmine:

- `padding` on ruum elemendi sees, sisu ja piiri vahel
- `border` on piir ise
- `margin` on ruum elemendi väljaspool, järgmiste elementide suhtes

Kui sa tahad, et kaks asja ei oleks üksteise seljas, siis mõtled tavaliselt `margin`-i peale.

### Skeem

```text
|<------ margin ------>|
  |<-- border -->|
    |<- padding ->|
      [  sisu  ]
```

### Koodinäide

Selles projektis on olemas vähemalt üks lihtne `padding` näide failis `src/assets/main.css`:

```css
a,
.green {
  padding: 3px;
}
```

Mõiste lahtitegemiseks on hea vaadata ka täielikumat näidet:

```css
.card {
  border: 1px solid #ccc;
  padding: 12px;
  margin: 16px 0;
}
```

### Päriselu analoogia

Fotoraami näide töötab hästi:

- pilt ise on sisu
- raami serv on `border`
- valge ala pildi ja raami vahel on `padding`
- kahe raami vahe seinal on `margin`

<a id="kaskaad-spetsiifilisus-ja-parimine"></a>
## Kaskaad, spetsiifilisus ja pärimine - `0:23:57`

CSS nimi ise viitab sellele, et reeglid "voolavad" üksteise peale.

### Selgitus

Siin on kolm mõistet:

- kaskaad - mitu reeglit võivad kehtida samale elemendile
- spetsiifilisus - täpsem reegel on tugevam kui üldisem
- pärimine - mõni omadus tuleb vanemalt elemendilt kaasa

Näiteks võib elemendile korraga kehtida:

- üldine `body` reegel
- `h5` reegel
- klassi reegel
- ID reegel

Siis ei jää kõigest kõik korraga nähtavaks. Brauser otsustab, milline reegel millise omaduse puhul lõpuks peale jääb.

### Skeem

```text
body      -> üldine
h5        -> täpsem
.class    -> veel täpsem
#id       -> kõige konkreetsem
```

### Koodinäide

`src/assets/style.css` sobib selle näite jaoks ideaalselt:

```css
body {
  background-color: aqua;
}

h5 {
  background-color: violet;
}

.awesomeRed {
  background-color: red;
}

#censored {
  background-color: black;
}
```

Kui samale elemendile kehtib korraga mitu neist, siis tugevam või hilisem reegel määrab lõpptulemuse.

Pärimise mõtet näeb hästi ka failis `src/assets/base.css`:

```css
body {
  color: var(--color-text);
  line-height: 1.6;
}
```

Paljud tekstilised omadused kanduvad lapselementidele edasi.

### Päriselu analoogia

See on nagu riietumine kihiti. Sul võib olla särk, kampsun ja jakk korraga seljas, aga pealmine kiht määrab sageli selle, mida esimesena nähakse.

<a id="oppeprojekti-fookus-ei-ole-pikslitapne-responsive-disain"></a>
## Õppeprojekti fookus ei ole pikslitäpne responsive disain - `0:25:53`

Õpetaja teeb siin väga teadliku piiritluse, et õppimise fookus ei hajuks.

### Selgitus

Selles faasis ei ole eesmärk:

- taga ajada iga viimast pikslit
- optimeerida kõike iga ekraanisuuruse jaoks
- kulutada aega üksikute kujundusvigade lihvimisele

Eesmärk on saada aru:

- kuidas HTML, CSS ja projektistruktuur töötavad
- kuidas koodi lugeda
- kuidas probleemist üle saada

### Skeem

```text
praegune eesmärk
   |
   +-- mõista põhimõtteid
   +-- saada asi tööle
   +-- osata edasi uurida

mitte praegu põhirõhk
   |
   +-- pixel perfect
   +-- kõik ekraanisuurused
   +-- lõputu iluravi
```

### Koodinäide

Projekt kasutab palju Bootstrapi klasse, mis annavad juba baaspaigutuse ette:

```vue
<div class="container text-center">
  <div class="row justify-content-center">
    <div class="col col-3">
      <h1 class="mb-3">Sisse logimine</h1>
    </div>
  </div>
</div>
```

See on õppimise mõttes piisav, et näha paigutuse loogikat, isegi kui lõpplahendus ei ole veel detailideni lihvitud.

### Päriselu analoogia

Kui õpid jalgrattaga sõitma, ei alusta sa sellest, et valid võistlusratta jaoks ideaalset aerodünaamilist sadulat. Esmalt pead tasakaalu kätte saama.

<a id="eraldi-css-fail-ja-link-rel-stylesheet"></a>
## Eraldi CSS fail ja `<link rel="stylesheet">` - `0:30:50`

Selles osas näidatakse praktiliselt ära, miks lihtsalt faili loomine ei tähenda veel, et brauser seda kasutaks.

### Selgitus

Kui lood uue CSS faili, ei tea HTML sellest automaatselt midagi. HTML peab saama teadlikuks, et see fail on olemas ja tuleb laadida.

Selleks kasutatakse tavaliselt `link` elementi `head` sees.

### Skeem

```text
style.css olemas
   |
   v
HTML ei tea sellest veel midagi
   |
   v
link rel="stylesheet"
   |
   v
brauser loeb faili sisse
```

### Koodinäide

Selles projektis on see olemas failis [index.html](/mnt/c/Projects/grupp/40/bank40front/index.html:1):

```html
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="/favicon.ico">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vite App</title>
  <link rel="stylesheet" href="src/assets/style.css">
</head>
```

Projektis kasutatakse ka CSS failide omavahelist importi. `src/assets/main.css` alustab nii:

```css
@import './base.css';
```

### Päriselu analoogia

See on nagu maja elektrikapp. Juhe võib olemas olla, aga kui seda ei ole süsteemiga ühendatud, siis lamp põlema ei lähe.

<a id="kuidas-claude-ilt-ide-sees-valitud-koodi-kohta-kusida"></a>
## Kuidas Claude'ilt IDE sees valitud koodi kohta küsida - `0:34:38`

Video keskel liigub jutt töövoole: kuidas kasutada AI-d nii, et ta seletaks just sinu ees olevat koodi.

### Selgitus

Õpetaja loogika on:

- vali koodilõik
- küsi selle konkreetse lõigu kohta
- lase tööriistal kasutada valitud konteksti

See on palju parem kui küsida liiga üldiselt, sest muidu võib AI hakata vastama vale konteksti pealt.

### Skeem

```text
vali kood
   |
   v
esita täpne küsimus
   |
   v
AI vastab valitud konteksti põhjal
```

### Koodinäide

Hea küsimuse kuju võiks olla näiteks:

```text
Mis asi see on ja kuidas see töötab?
Miks siin kasutatakse just seda rida?
Kuidas see fail on seotud järgmise failiga?
```

Kui valid näiteks `index.html`-ist selle rea:

```html
<link rel="stylesheet" href="src/assets/style.css">
```

siis on mõistlik küsida just selle rea eesmärgi kohta, mitte "seleta mulle kogu projekti CSS".

### Päriselu analoogia

See on nagu mehhaanikule küsimuse esitamine. Kui näitad täpselt, milline juhe või detail segadust tekitab, saad palju kasulikuma vastuse kui lihtsalt "auto ei meeldi mulle".

<a id="ai-ei-vabasta-sind-vastutusest"></a>
## AI ei vabasta sind vastutusest - `0:36:06`

See on video üks tähtsamaid sõnumeid.

### Selgitus

Õpetaja rõhutab väga selgelt:

- AI võib aidata
- plugin võib koodi selgitada
- tööriist võib isegi koodi kirjutada

Aga:

- sina vastutad iga koodirea eest
- kui sa ei saa aru, mida rida teeb, siis ei tohiks sa seda pimesi endale sisse võtta

Õppimise eesmärk ei ole "projekti valmis saada ükskõik kuidas", vaid aru saada, mis tegelikult toimub.

### Skeem

```text
AI soovitab
   |
   v
inimene loeb üle
   |
   v
inimene saab aru
   |
   v
siis alles võtab kasutusse
```

### Koodinäide

Näiteks `src/views/LoginView.vue` sisaldab sellist loogikat:

```js
axios
  .get('/api/login', {
    params: {
      username: 'AAA',
      password: 'BBB',
    },
  })
  .then((response) => {
    this.loginResponse = response.data
    localStorage.setItem('userId', this.loginResponse.userId)
    localStorage.setItem('roleName', this.loginResponse.roleName)
  })
```

Kui AI selle sulle kirjutab, pead sa ikkagi ise aru saama:

- mis endpointi kutsutakse
- kust andmed tulevad
- mida response'iga tehakse
- miks `localStorage`-i midagi salvestatakse

### Päriselu analoogia

Kalkulaator võib sulle vastuse anda, aga kui sa ei saa aru, mida valem üldse tegi, siis eksam või päris probleem jääb ikkagi sinu lahendada.

<a id="skilliga-saab-korduvat-tood-standardiseerida"></a>
## Skilliga saab korduvat tööd standardiseerida - `0:39:48`

Selles kohas näitab õpetaja väga praktilist mõtet: korduvat tööd ei pea iga kord nullist promptima.

### Selgitus

Kui sa teed sama tüüpi ülesannet korduvalt, on kasulik teha sellest korduvkasutatav töövoog.

Skilli mõte on:

- küsida õiged sisendid
- hoida väljundi vorm ühtlane
- säästa aega
- vähendada korduvat käsitsi juhendamist

### Skeem

```text
sama ülesanne korduvalt
   |
   v
iga kord uus pikk prompt
   |
   v
aeglane ja ebaühtlane

sama ülesanne korduvalt
   |
   v
skill
   |
   v
kiirem ja stabiilsem tulemus
```

### Koodinäide

Sama loogikat näeb ka siin repo skilli kirjelduse tasemel:

```text
Sisend:
- video link
- video parool
- transkriptifail

Väljund:
- algajasõbralik õppematerjal
- õigesse kausta
- kindla struktuuriga
```

Just sellise mõttega töötab ka `.claude/skills/skill-transkript-oppematerjal/SKILL.md`.

### Päriselu analoogia

Kui kokk teab, et teeb sama retsepti iga päev, ei kirjuta ta iga hommik nullist ümber, mis järjekorras mune kloppida tuleb.

<a id="oppimiseks-tee-oma-projekt-ja-kasuta-ai-d-teadlikult"></a>
## Õppimiseks tee oma projekt ja kasuta AI-d teadlikult - `0:42:55`

Video lõpuosas läheb jutt sellest, kuidas päriselt areneda, mitte ainult loengut kaasa kuulata.

### Selgitus

Õpetaja soovitus on väga praktiline:

- ära jää ainult videoid vaatama
- mõtle välja oma projekt
- kirjuta user story'd
- lase AI-l aidata plaani, selgituste ja näidetega
- kontrolli pidevalt, et saad kõigest aru

Sama ploki lõpus räägitakse ka sellest, et AI on päris meeskondades juba kasutusel, aga:

- igas ettevõttes ei tohi kõiki reposid otse mudelile anda
- turva- ja konfidentsiaalsuspiirid jäävad alles
- õppimiseks saab alati kasutada oma näidisprojekti või pseudokoodi

### Skeem

```text
oma idee
   |
   v
user storyd
   |
   v
väikesed taskid
   |
   v
ehita, küsi, kontrolli, õpi
```

### Koodinäide

Lihtne algus oma projekti jaoks võiks olla näiteks selline:

```text
Projekt: väike pangaliidese demo

User storyd:
1. Kasutaja näeb avalehte
2. Kasutaja saab avada login-vaate
3. Kasutaja saab sisestada kasutajanime ja parooli
4. Kasutaja näeb veateadet, kui väljad on tühjad
```

Selles repo projektis on sellised vaated juba olemas:

```js
routes: [
  { path: '/', component: HomeView },
  { path: '/atms', component: AtmsView },
  { path: '/login', component: LoginView },
]
```

### Päriselu analoogia

Sõitmist ei õpi nii, et vaatad lõputult sõiduvideoid. Ühel hetkel pead ise rooli istuma, aga alguses võib kõrval olla õpetaja ja juhend.

<a id="refaktoreerimine-ja-rename"></a>
## Refaktoreerimine ja Rename - `0:51:07`

Siin näitab õpetaja üht lihtsat, aga väga kasulikku tööriistalist mõtet: ära muuda nime käsitsi igas kohas eraldi, kui IDE oskab seda teadlikult teha.

### Selgitus

Refaktoreerimine tähendab koodi ümberkujundamist nii, et käitumine ei muutuks, aga struktuur, nimi või loetavus läheks paremaks.

Selles videos on fookus eelkõige `Rename` tegevusel:

- muudad nime ühes kohas
- tööriist leiab seotud kasutuskohad
- muudab need samuti ära

See on turvalisem kui käsitsi otsida ja asendada ilma konteksti arvestamata.

### Skeem

```text
vana nimi
   |
   v
Rename / Refactor
   |
   v
kõik seotud kohad uuenevad
```

### Koodinäide

Mõtteline enne-pärast näide:

```css
.awesomeRed {
  background-color: red;
}
```

Kui otsustad, et nimi peaks olema selgem:

```css
.warningTitle {
  background-color: red;
}
```

Hea IDE uuendaks sama nime ka kohtades, kus seda klassi HTML-is kasutatakse.

### Päriselu analoogia

See on nagu muuta tänava nime ametlikult registris, mitte käia iga maja ukse peal eraldi silti üle kleepimas.

<a id="sama-tugevusega-reeglites-voidab-viimane"></a>
## Sama tugevusega reeglites võidab viimane - `0:52:08`

Kui kaks reeglit on sama spetsiifilised, hakkab rolli mängima järjekord.

### Selgitus

Kui näiteks kaks klassireeglit sihivad sama elementi ja mõlemad muudavad sama omadust, siis jääb peale see, mis tuleb failis hiljem.

See on väga levinud põhjus, miks algaja ütleb: "Ma ju panin värvi paika, miks ta ikkagi teine on?"

### Skeem

```text
sama tugevus
   |
   v
failis hiljem olev reegel
   |
   v
võidab
```

### Koodinäide

```css
.awesomeRed {
  background-color: red;
}

.awesomeRed {
  background-color: blue;
}
```

Lõpptulemus on sinine, sest teine reegel tuleb hiljem.

### Päriselu analoogia

Kui kaks võrdselt tähtsat inimest annavad sulle vastukäivad juhised ja üks neist annab viimase sõna, siis tavaliselt lähed selle viimase juhise järgi.

<a id="important-on-varuvoti-mitte-pohistrateegia"></a>
## `!important` on varuvõti, mitte põhistrateegia - `0:53:07`

Õpetaja näitab, miks `!important` võib vahel aidata, aga miks see on ohtlik, kui seda hakata laialt loopima.

### Selgitus

`!important` ütleb brauserile sisuliselt: "see reegel peab väga tugevalt kehtima".

See võib aidata siis, kui:

- raamistik või muu fail kirjutab sinu stiili üle
- sul on vaja ajutiselt midagi kindlalt peale suruda

Aga probleem on selles, et kui kasutad seda liiga palju, hakkad iseendaga võistlema:

- siis tuleb järgmine `!important`
- siis järgmine veel tugevam lahendus
- kood muutub raskesti hooldatavaks

### Skeem

```text
tavaline reegel
   |
   v
ei võida
   |
   v
!important
   |
   v
ajutine päästerõngas
```

### Koodinäide

```css
.awesomeRed {
  background-color: red !important;
}
```

See võib kirjutada üle mõne teise sama omaduse reegli, aga seda tuleks kasutada viimase võimalusena, mitte esimese valikuna.

### Päriselu analoogia

`!important` on nagu hädapidur. Hea, et ta olemas on, aga kui iga kurvi peal hädapidurit tõmbad, siis ei ole probleem enam rongis, vaid juhtimisstiilis.

## Kokkuvõte

Selle video kõige tähtsamad õppetunnid on:

- CSS kirjeldab välimust ja seda tasub hoida eraldi failides, mitte laiali inline stiilidena
- selectorite põhitüübid on element, `class` ja `id`, aga kujunduses kasutatakse enamasti `class`-e
- `margin`, `border` ja `padding` on eri asjad ning neid peab teadlikult eristama
- CSS lõpptulemust mõjutavad kaskaad, spetsiifilisus, pärimine, reeglite järjekord ja vahel ka `!important`
- AI on tugev õppimise tööriist, aga iga koodirea eest vastutab inimene ise
- korduvat tööd tasub muuta skilliks või muuks korduvkasutatavaks töövooguks

Kui tahad, saab sellest videost teha ka eraldi lühema CSS spikri või puhtalt AI-töövoo põhise kokkuvõtte.
