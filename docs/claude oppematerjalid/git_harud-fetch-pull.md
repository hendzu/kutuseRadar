## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/Wm-f8JxlMUWdku7VTSv23I5i1K_zCP_Y0JiBxYUh-gOMIiowMUJmWXxzVvJlPqtx.VnR0ZDBSpxB10Uxc?startTime=1776147867000) |
| **Parool** | `*ye%1JAC` |
| **Transkript** | [GMT20260414-062427_v-1.vtt](../transcripts/GMT20260414-062427_v-1.vtt) |

## Märkus transkripti kohta

Transkriptis on OCR-vigu. Eriti mõjutab see taskinumbreid ja Git termineid.

Selles materjalis on taskikoodid `FE-124` ja `FE-130` taastatud õpetaja häälduse põhjal. VTT failis on need kohati kirjas sõnade või vigaste tähtedena, näiteks "Fee sada kakskümmend neli".

## Sisukord

- [Homse rühmatöö juhised](#homse-rühmatöö-juhised) — `0:07:05`
- [Abstraktsioon programmeerimises ja AI roll](#abstraktsioon-programmeerimises-ja-ai-roll) — `0:14:22`
- [Miks arendaja vastutab iga rea eest](#miks-arendaja-vastutab-iga-rea-eest) — `0:20:39`
- [Git checkout ja harud](#git-checkout-ja-harud) — `0:28:44`
- [Local vs remote: kaks eri kihti](#local-vs-remote-kaks-eri-kihti) — `0:32:11`
- [Fetch vs update/pull](#fetch-vs-updatepull) — `0:35:28`
- [Branch hygiene](#branch-hygiene) — `0:51:27`
- [`FE-124` - taski järgi haru nimetamine](#fe-124) — `0:58:11`
- [`FE-130` - teine arendaja, teine haru](#fe-130) — `0:59:17`
- [Pull request ja code review](#pull-request-ja-code-review) — `1:00:24`
- [Noolte tähendus Git tööriistas](#noolte-tähendus-git-tööriistas) — `1:10:23`
- [Kommentaarid vs selged meetodinimed](#kommentaarid-vs-selged-meetodinimed) — `1:20:11`
- [Merge conflict](#merge-conflict) — `1:22:57`
- [Kuidas tiimis konflikte vältida](#kuidas-tiimis-konflikte-vältida) — `1:28:55`

<a id="homse-rühmatöö-juhised"></a>
## Homse rühmatöö juhised — `0:07:05`

Loo alguses räägitakse homsest rühmatööst. See ei ole veel Git ega Vue teema, aga siin pannakse paika oluline mõtteviis: kui sa oskad midagi lihtsalt selgitada, siis sa päriselt saad sellest aru.

### Selgitus

Õpetaja annab ülesande teha lühike esitlus ühe Java baasteema kohta. Fookus ei ole ainult õigel vastusel. Fookus on selles, et:

- selgitus oleks lihtne
- sees oleks päriselu näide
- sees oleks visuaal või skeem
- sees oleks väike koodinäide

See on väga hea harjutus ka arendajale. Tööl tuleb sul sama oskust vaja siis, kui sa seletad tiimikaaslasele, testijale või kliendile, miks mingi muudatus tehti.

### Skeem

```text
teema selge peas
      |
      v
oskan lihtsalt seletada
      |
      v
teine inimene saab aru
```

### Koodinäide

Transkriptis viidatakse Java algteemadele. Väga väike näide võiks olla selline:

```java
int age = 19;

if (age >= 18) {
  System.out.println("Täisealine");
}
```

Siin on ainult kaks mõtet:

- `age` on muutuja
- `if` kontrollib tingimust

### Päriselu analoogia

See on nagu õpetaksid kellelegi kohvimasinat kasutama. Kui sa ütled ainult "vajuta õiget nuppu", ei saa algaja midagi aru. Kui sa ütled "esmalt pane tass alla, siis vali jook, siis vajuta start", on asi palju selgem.

<a id="abstraktsioon-programmeerimises-ja-ai-roll"></a>
## Abstraktsioon programmeerimises ja AI roll — `0:14:22`

See on video üks tähtsamaid mõtteid. Õpetaja selgitab, et programmeerimine on ajas liikunud järjest kõrgema abstraktsioonitaseme poole.

### Selgitus

Abstraktsioon tähendab lihtsas keeles seda, et sa ei pea kogu süsteemi kõige alumist kihti ise juhtima. Sa kasutad kõrgema taseme tööriista.

Näide videost:

- alguses olid bitid ja perfokaardid
- siis assembler
- siis high-level keeled
- nüüd liigume AI-toega tööriistade poole

Mõte ei ole see, et alumised kihid kaovad ära. Need jäävad alles. Lihtsalt inimene töötab järjest kõrgemal tasemel.

### Skeem

```text
AI juhised
   |
high-level keel
   |
assembler
   |
0 ja 1
   |
protsessor
```

### Koodinäide

Sama mõtet näeb ka selles Vue projektis. `src/router/index.js` kirjeldab marsruute väga kõrgel tasemel:

```js
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: '/', component: HomeView },
    { path: '/login', component: LoginView },
  ],
})
```

Sina ütled lihtsalt:

- mis URL on olemas
- millist vaadet tuleb näidata

Sa ei kirjuta ise brauseri history mehhanismi nullist valmis. See ongi abstraktsioon.

### Päriselu analoogia

See on nagu GPS kasutamine. Sa ei arvuta ise kaardil iga pööret ja kaugust. Sa ütled ainult sihtkoha ning tööriist lahendab suure osa detailidest sinu eest.

<a id="miks-arendaja-vastutab-iga-rea-eest"></a>
## Miks arendaja vastutab iga rea eest — `0:20:39`

Õpetaja ütleb väga otse: isegi kui AI aitab, vastutab arendaja ikkagi iga rea eest.

### Selgitus

See tähendab:

- kui kood läheb katki, siis vastutus ei kao ära
- "AI pakkus nii" ei ole piisav vabandus
- sa pead aru saama, mida su kood teeb

Video seob selle mõtte tarkvaravigade, makseprobleemide ja post-mortem analüüsiga. Suur süsteem ei kuku tavaliselt katki ühe maagilise põhjuse tõttu. Enamasti langeb mitu asja halvasti kokku.

### Skeem

```text
AI annab soovituse
        |
        v
arendaja kontrollib
        |
        v
kood läheb tootmisse
        |
        v
tagajärgede eest vastutab tiim
```

### Koodinäide

`src/views/LoginView.vue` sisaldab lihtsat kontrolli:

```js
allFormFieldsAreCorrect() {
  return this.username && this.password
}
```

Kui siin on loogikaviga, siis võib juhtuda näiteks see, et tühi vorm läheb läbi või õige kasutaja blokeeritakse. Isegi väike tingimus mõjutab päris käitumist.

### Päriselu analoogia

See on nagu allkiri lepingu all. Võib-olla aitas jurist teksti ette valmistada, aga allkirja andja vastutab ikkagi selle eest, millega ta nõustus.

<a id="git-checkout-ja-harud"></a>
## Git checkout ja harud — `0:28:44`

Siit algab video tehnilisem põhiosa. Õpetaja seletab, mida tähendab haru vahetamine ja miks üldse harusid vaja on.

### Selgitus

`git checkout` tähendab kõige lihtsamas mõttes seda, et sa liigud teise haru peale. Haru on eraldi töökoht, kus saad rahulikult muudatusi teha ilma põhiharule kohe mõju avaldamata.

Olulised mõtted:

- ühe projekti sees võib olla mitu haru
- iga haru on nagu omaette tööliin
- tööd tehakse tavaliselt mitte `master` või `main` peal, vaid eraldi feature-branchis

### Skeem

```text
master
  |
  +---- FE-124
  |
  +---- FE-130
```

### Koodinäide

Kõige lihtsam käsurea näide:

```bash
git checkout master
git checkout -b FE-124
```

Kui näiteks ülesanne puudutab `src/router/index.js` faili, on mõistlik teha see muudatus eraldi harus, mitte põhiharus.

### Päriselu analoogia

See on nagu köögis lõikelaua võtmine. Sa ei hakka salatit otse suure laua peale tükeldama, kui kõrval valmistatakse juba teist rooga.

<a id="local-vs-remote-kaks-eri-kihti"></a>
## Local vs remote: kaks eri kihti — `0:32:11`

See osa on algajatele väga oluline. Suur segadus tekib tihti sellest, et "projekt pilves" ja "projekt minu arvutis" tunduvad sama asjana. Tegelikult need ei ole sama asi.

### Selgitus

Video põhisõnum:

- local tähendab sinu arvutit
- remote tähendab pilves olevat repositooriumi
- need ei ole automaatselt kogu aeg sünkroonis

Sa võid enda arvutis teha muudatusi nii, et keegi teine neid veel ei näe. Samamoodi võib pilves toimuda muudatusi nii, et sinu arvuti ei tea neist enne, kui sa ise sünkroonid.

### Skeem

```text
Pilv / remote
    |
    |  fetch / pull / push
    |
Minu arvuti / local
```

### Koodinäide

Oletame, et sinu arvutis on see vaade:

```js
<RouterLink class="nav-link" to="/login">Sisse logimine</RouterLink>
```

See rida võib olla olemas sinu kohalikus failis `src/App.vue`, aga pilves veel mitte. Alles `push` viib selle remote'i.

### Päriselu analoogia

See on nagu mustand sinu laual ja ametlik dokument jagatud kettal. Mustand võib olla väga hea, aga enne üleslaadimist ei ole see veel teiste jaoks ametlik versioon.

<a id="fetch-vs-updatepull"></a>
## Fetch vs update/pull — `0:35:28`

Õpetaja rõhutab siin vahet kahe tegevuse vahel, mida algajad väga tihti segamini ajavad.

### Selgitus

`fetch` tähendab:

- too alla info selle kohta, mis pilves on
- ära muuda veel minu tööfaile

`pull` või IDE-s tehtud update tähendab tavaliselt:

- too uus info alla
- püüa see minu kohalikku harusse sisse tõmmata

Algaja jaoks kasulik rusikareegel:

- `fetch` = "anna mulle värske pilt"
- `pull` = "too muudatused ka minu tööseisu"

### Skeem

```text
fetch
remote -> kohalik peegeldus

pull / update
remote -> kohalik peegeldus -> minu aktiivne haru
```

### Koodinäide

```bash
git fetch
git pull origin master
```

Kui tiimikaaslane lisab pilves uue route'i faili `src/router/index.js`, siis `fetch` annab sulle teada, et muudatus on olemas. `pull` püüab selle sinu kohalikku seisu ka sisse tuua.

### Päriselu analoogia

`fetch` on nagu vaadata teadetetahvlit. `pull` on nagu võtta uus juhend teadetetahvlilt maha ja panna see oma töökausta sisse.

<a id="branch-hygiene"></a>
## Branch hygiene — `0:51:27`

See osa räägib arenduse hügieenist. Mõte on lihtne: lõpetatud harusid ei hoita niisama vedelemas.

### Selgitus

Kui töö on:

- valmis
- kontrollitud
- code review läbitud
- masterisse või maini sulatatud

siis vana tööharu tuleks ära kustutada. Muidu tekib segadus:

- milline haru on veel aktiivne
- milline haru on vana
- kelle töö see oli

Video toob hea praktilise mõtte: vana branch on nagu vana ajutine töölaud. Kui töö on ammu tehtud, siis selle hoidmine teeb süsteemi mürasemaks.

### Skeem

```text
haru loodud
   |
arendus
   |
review
   |
merge masterisse
   |
haru kustuta
```

### Koodinäide

```bash
git branch -d FE-124
git push origin --delete FE-124
```

### Päriselu analoogia

See on nagu tellingud ehitusel. Kui sein on valmis, ei jäeta tellinguid maja külge lihtsalt sellepärast, et "äkki läheb veel vaja".

<a id="fe-124"></a>
## `FE-124` - taski järgi haru nimetamine — `0:58:11`

Siin jõuab video väga praktilise töövõtteni: branchi nimi seotakse tööülesande ehk tiketiga.

### Selgitus

Õpetaja kirjeldab olukorda, kus Jira-laadses süsteemis on ülesanne nimega `FE-124`. See tähendab tavaliselt:

- `FE` viitab frontend projektile
- `124` on konkreetse töö number

Selline nimetus on kasulik, sest see seob omavahel:

- ülesande
- branchi
- pull requesti
- hilisema arutelu

### Skeem

```text
Jira task -> FE-124
      |
      v
branch -> FE-124
      |
      v
pull request -> FE-124
```

### Koodinäide

Selline task võib puudutada näiteks navigeerimist. Selles projektis on olemas päris failid, mis sellise töö käigus muutuda võiksid:

```js
<RouterLink class="nav-link" to="/login">Sisse logimine</RouterLink>
```

ja

```js
{
  path: '/login',
  name: 'loginRoute',
  component: LoginView,
}
```

Need kaks koodilõiku asuvad failides `src/App.vue` ja `src/router/index.js`.

### Päriselu analoogia

See on nagu pakile jälgimiskoodi panemine. Kui igal tööl on oma number, saab palju kiiremini aru, kust see tuli ja kuhu ta edasi liigub.

<a id="fe-130"></a>
## `FE-130` - teine arendaja, teine haru — `0:59:17`

Kohe pärast `FE-124` näidet kirjeldab õpetaja teist arendajat, kellel on samal ajal oma tööharu `FE-130`.

### Selgitus

See näitab hästi, miks harusid üldse vaja on:

- sina töötad oma ülesande kallal
- teine arendaja töötab samal ajal teise ülesande kallal
- kumbki ei sega teise töö pooleliolevat seisu

See on meeskonnatöö normaalne mudel. Kõik ei kirjuta ühte ja samasse kohta otse.

### Skeem

```text
master
  |\
  | \__ FE-124
  |
  \____ FE-130
```

### Koodinäide

Teine tööharu võiks muuta näiteks sisselogimise vaadet:

```js
<input
  v-model="username"
  type="text"
  class="form-control"
  id="inputUsername"
  placeholder="Kasutajanimi"
/>
```

See on pärit failist `src/views/LoginView.vue`. Samal ajal võib keegi teine muuta `src/router/index.js` faili. Mõlemad töötavad, kuni tuleb aeg neid ühendada.

### Päriselu analoogia

See on nagu kaks inimest teevad korraga sama maja eri tubades remonti. Üks paigaldab kööki valgustit, teine värvib esikut.

<a id="pull-request-ja-code-review"></a>
## Pull request ja code review — `1:00:24`

Õpetaja sõnastab selle hästi: pull request on sisuliselt palve oma töö põhiharusse sisse tõmmata.

### Selgitus

Pull requesti mõte on:

- näidata, mis täpselt muutus
- lasta teisel arendajal muudatus üle vaadata
- saada kinnitust enne merge'i

Code review eesmärk ei ole autorit kiusata. Eesmärk on teha kood paremaks, loetavamaks ja turvalisemaks.

### Skeem

```text
oma haru
   |
   v
pull request
   |
   v
review
   |
   v
merge masterisse
```

### Koodinäide

Kui `FE-124` lisab route'i ja `FE-130` muudab login-vormi, siis pull requestis on kohe näha:

- millised failid muutusid
- millised read lisati või eemaldati
- kas muudatus on loogiline

Näiteks võib reviewer vaadata faili `src/views/LoginView.vue` meetodit:

```js
resetErrorMessage() {
  this.errorMessage = ''
}
```

ja küsida: kas see meetod kutsutakse alati enne uut päringut välja?

### Päriselu analoogia

See on nagu enne avaldamist laseksid toimetajal artikli üle lugeda. Autor kirjutab, aga teine inimene aitab vead üles leida.

<a id="noolte-tähendus-git-tööriistas"></a>
## Noolte tähendus Git tööriistas — `1:10:23`

Video üks kõige praktilisemaid osi on noolekeste tähendus.

### Selgitus

Õpetaja mõte on lihtne:

- nool alla tähendab, et pilves on midagi uuemat kui sinu arvutis
- nool üles tähendab, et sinu arvutis on commit, mida pilves veel ei ole

Kui mõlemad korraga põlevad, siis oled sünkroonist väljas ja pead teadlikult tegutsema.

Kasulik meelespea videost:

> kui näed noolt, siis kanna hoolt

### Skeem

```text
uparrow   = mul on kohalik muudatus, mida pilves pole
downarrow = pilves on muudatus, mida mul veel pole
```

### Koodinäide

Kui muudad `src/components/AlertError.vue` või `src/views/LoginView.vue` faili ja commitid selle ära, aga ei tee `push`, siis näed üles noolt.

Kui samal ajal teine arendaja on pilves uuendanud `src/router/index.js` faili, näed alla noolt.

### Päriselu analoogia

See on nagu telefonis sõnumirakendus:

- üks märguanne ütleb, et sul on saatmata sõnum
- teine märguanne ütleb, et sulle on saabunud uus sõnum

Mõlemad vajavad eri tegevust.

<a id="kommentaarid-vs-selged-meetodinimed"></a>
## Kommentaarid vs selged meetodinimed — `1:20:11`

Siin läheb video korraks Clean Code teema peale. Mõte on oluline: hea kood peaks võimalikult palju iseennast seletama.

### Selgitus

Õpetaja ütleb sisuliselt:

- kommentaar ei tohiks olla kark, mis peidab segast koodi
- kui sul on vaja pikka selgitavat kommentaari, võib see olla märk, et kood tuleks jagada väiksemateks osadeks
- meetodi nimi võib tihti teha sama töö ära palju puhtamalt

### Skeem

```text
segane pikk plokk
    |
    v
jaga väikesteks osadeks
    |
    v
anna osadele head nimed
```

### Koodinäide

`src/views/LoginView.vue` on selles mõttes hea lihtne näide:

```js
methods: {
  login() {
    this.resetErrorMessage()
    if (this.allFormFieldsAreCorrect()) {
      // ...
    }
  },

  resetErrorMessage() {
    this.errorMessage = ''
  },

  allFormFieldsAreCorrect() {
    return this.username && this.password
  },
}
```

Miks see on parem kui üks suur anonüümne plokk?

- `login` ütleb, mis on peamine tegevus
- `resetErrorMessage` ütleb, mida see jupp teeb
- `allFormFieldsAreCorrect` ütleb, mida kontrollitakse

Lugeja ei pea iga rida peas kommenteerima.

### Päriselu analoogia

See on nagu kapis sildid kastidel. Kui kastil on kiri "talveriided", ei pea sa iga kord kasti avama ja sisu eraldi lahti seletama.

<a id="merge-conflict"></a>
## Merge conflict — `1:22:57`

Siin seletatakse lõpuks lahti see koht, mis algajatele kõige rohkem stressi teeb.

### Selgitus

Merge conflict tekib siis, kui kaks eri muudatust tahavad sama faili või sama faili sama piirkonda eri moodi muuta.

Git ei ole "loll". Git on lihtsalt ettevaatlik. Ta ütleb:

- ma näen kahte versiooni
- ma ei tea, kumb peab lõplikuks jääma
- inimene peab otsustama

Õpetaja soovitab läheneda nii:

1. tõmba kõige uuem master enda harusse
2. vaata konflikti kolme vaatega
3. võta master baasiks
4. lisa sinna oma muudatus teadlikult juurde

### Skeem

```text
vasak   = master
keskel  = lõplik tulemus
parem   = sinu haru
```

### Koodinäide

Lihtsustatud konflikt võib välja näha nii:

```diff
<<<<<<< master
{ path: '/atms', component: AtmsView }
=======
{ path: '/login', component: LoginView }
>>>>>>> FE-124
```

Siin peab arendaja otsustama, kuidas fail päriselt jääb. Tihti ei tähenda see "vali üks". Tihti tähendab see "mõlemad peavad alles jääma, aga õigesse kohta".

### Päriselu analoogia

See on nagu kaks inimest parandavad sama dokumenti eri koopiates. Kui koopiad hiljem kokku viiakse, peab keegi otsustama, milline lõppversioon on õige.

<a id="kuidas-tiimis-konflikte-vältida"></a>
## Kuidas tiimis konflikte vältida — `1:28:55`

Video lõpus antakse väga praktiline nõuanne: ära kogu muudatusi liiga kauaks enda arvutisse.

### Selgitus

Konflikte vähendab see, kui tiim töötab väikeste sammudega:

- üks inimene teeb väikese jupi valmis
- commit
- push
- review
- merge
- teised tõmbavad uuenduse sisse

Miks see aitab?

- konfliktid tekivad varem
- konfliktid on väiksemad
- kõik mäletavad veel hästi, mida nad just muutsid

### Skeem

```text
väike muudatus
   ->
push
   ->
merge
   ->
tiim uuendab
   ->
järgmine väike muudatus
```

### Koodinäide

Kui üks tiimiliige muudab `src/router/index.js` ja teine `src/views/LoginView.vue`, siis on konfliktioht väike.

Kui aga mõlemad hoiavad nädal aega enda arvutis muutusi failis `src/views/LoginView.vue`, siis kasvab tõenäosus kiiresti, et lõpuks peab käsitsi konflikti lahendama.

### Päriselu analoogia

See on nagu ühise köögi koristamine. Kui kõik pesevad oma tassi kohe ära, on köök korras. Kui kõik jätavad nõud nädalaks kraanikaussi, on lõpuks segadus suur ja keegi peab tükk aega koristama.

## Kokkuvõte

Selle video põhifookus on Git töövoog ja meeskonnas arendamine:

- miks tehakse tööd harudes
- kuidas eristada local ja remote seisu
- mida tähendavad `fetch`, `pull`, `push` ja pull request
- kuidas taskinumbrid nagu `FE-124` aitavad tööd siduda
- miks merge conflict ei ole katastroof, vaid lahendatav tööetapp

Kui tahad sellest videost võtta ainult ühe meelespea, siis see võiks olla:

> hoia oma töö väike, nähtav ja sünkroonis
