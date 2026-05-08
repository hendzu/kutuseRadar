## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/Ta5FZBL9H1-i-yK3KLyzCP-OqhxsGKZaE86r-0qBkR6UtYAsXYR6bAtcylW_I9Sp.JDceAiF2D661Mo4s?startTime=1776837638000) |
| **Parool** | `!QO0FuN&` |
| **Transkript** | [GMT20260422-060038_v-1.vtt](../transcripts/GMT20260422-060038_v-1.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Näiteks esinevad kohati `Templeid`, `Dato`, `rehv`, `Mountaid`, `Valeri terror`, `Voe`, `vee model` ja `ato autorise`, kuigi kontekst ütleb üsna selgelt, et mõeldud on `template`, `data`, `ref`, `mounted`, `AlertError`, `Vue`, `v-model` ja `NotAuthorized`.

Videos on ebamäärased viited kujudele nagu `veb seitse` ja hiljem `veb üheksa`, kuid OCR ei võimalda taskikoodi piisava kindlusega taastada. Seepärast keskendub see õppematerjal teemadele ja ajamärkidele, mitte oletuslikele taskinumbritele.

Selles õppematerjalis seon video teemad päris näidetega failidest `src/views/LoginView.vue`, `src/components/AlertError.vue`, `src/api-services/LoginService.js`, `src/auth/AuthService.js`, `src/views/AtmsView.vue`, `src/components/CitiesDropdown.vue`, `vite.config.js` ja `database/`.

## Sisukord

- [AI tehtud transkriptimaterjal sobib kordamiseks, mitte pimedaks päheõppeks](#ai-tehtud-transkriptimaterjal-sobib-kordamiseks-mitte-pimedaks-paheoppeks) - `0:00:33`
- [`template`, `data()` ja `methods` jagavad sama seisundit](#template-data-ja-methods-jagavad-sama-seisundit) - `0:01:54`
- [DOM-i ei tasu käsitsi näppida, `ref` on pigem erand](#dom-i-ei-tasu-kasitsi-nappida-ref-on-pigem-erand) - `0:03:14`
- [`v-if` ja `v-model` lasevad andmetel kasutajaliidest juhtida](#v-if-ja-v-model-lasevad-andmetel-kasutajaliidest-juhtida) - `0:07:09`
- [Bootstrapi utiliidid hoiavad layout'i ilma pikslivõimlemiseta](#bootstrapi-utiliidid-hoiavad-layouti-ilma-pikslivoimlemiseta) - `0:08:02`
- [Frontend saab backendita edasi liikuda tänu teenusele, proxy'le ja Stoplightile](#frontend-saab-backendita-edasi-liikuda-tanu-teenusele-proxyle-ja-stoplightile) - `0:10:46`
- [Skriptiplokis viitad oma andmetele sõnaga `this`](#skriptiplokis-viitad-oma-andmetele-sonaga-this) - `0:24:33`
- [`AuthService` koondab login-oleku üheks taaskasutatavaks kohaks](#authservice-koondab-login-oleku-uheks-taaskasutatavaks-kohaks) - `0:28:59`
- [`validateUserIsLoggedIn()` eemaldab dubleeritud kaitseloogika](#validateuserisloggedin-eemaldab-dubleeritud-kaitseloogika) - `0:37:25`
- [`roleName` tõestab, et loginist talletatud info jõuab ka teise vaatesse](#rolename-toestab-et-loginist-talletatud-info-jouab-ka-teise-vaatesse) - `0:45:22`
- [`database/` skriptid taastavad arenduse jaoks puhta algseisu](#database-skriptid-taastavad-arenduse-jaoks-puhta-algseisu) - `1:17:30`
- [IDE andmebaasitööriist ja SQL-konsool näitavad, mis päriselt tabelites toimub](#ide-andmebaasitooriist-ja-sql-konsool-naitavad-mis-pariselt-tabelites-toimub) - `1:22:07`
- [Selectbox ehitatakse esmalt vaatesse ja Bootstrapi peale](#selectbox-ehitatakse-esmalt-vaatesse-ja-bootstrapi-peale) - `1:58:15`
- [Koolon `:` tähendab: child saab muutuja väärtuse, mitte sõna](#koolon-tahendab-child-saab-muutuja-vaartuse-mitte-sona) - `2:15:56`
- [Komponent tükelda siis, kui sul on visuaal paigas, mitte siis kui click-loogika alles ujub](#komponent-tukelda-siis-kui-sul-on-visuaal-paigas-mitte-siis-kui-click-loogika-alles-ujub) - `2:18:03`
- [`Network` tab kinnitab, et `/api/cities` päring läks päriselt teele](#network-tab-kinnitab-et-apicities-paring-laks-pariselt-teele) - `2:48:15`
- [`getCities()` peaks elama nimelise meetodina, mitte otse elutsüklis](#getcities-peaks-elama-nimelise-meetodina-mitte-otse-elutsuklis) - `2:50:10`

<a id="ai-tehtud-transkriptimaterjal-sobib-kordamiseks-mitte-pimedaks-paheoppeks"></a>
## AI tehtud transkriptimaterjal sobib kordamiseks, mitte pimedaks päheõppeks - `0:00:33`

Video algus ei lähe kohe koodi kirjutama. Õpetaja näitab hoopis, kuidas AI-ga tehtud õppematerjal aitab eelnevate päevade teemasid uuesti meelde tuletada.

### Selgitus

Põhiidee on lihtne:

- Zoomi transkript on toorandmed
- AI teeb sellest lühema, struktureeritud õppematerjali
- õppematerjal aitab sul kiiremini õige koha üles leida

Aga õpetaja rõhutab ka piiri: see ei asenda päris arusaamist. Kui mingi mõte ei kliki, siis tuleb minna tagasi konkreetse ajatempli juurde ja vaadata video lõik uuesti läbi.

### Skeem

```text
video
  -> transkript
      -> AI kokkuvõte
          -> sisukord + ajatemplid
              -> kiire kordamine
                  -> vajadusel tagasi videosse
```

### Koodinäide

Praegune repo kasutabki seda töövoogu:

```text
docs/transcripts/
  -> VTT failid

docs/transcript-materials/
  -> kuupäeva järgi õppematerjalid
```

### Päriselu analoogia

See on nagu loengu järel tehtud konspekt. Konspekt aitab järje üles võtta, aga kui mõni samm jäi segaseks, pead ikka tagasi tahvli või salvestuse juurde minema.

<a id="template-data-ja-methods-jagavad-sama-seisundit"></a>
## `template`, `data()` ja `methods` jagavad sama seisundit - `0:01:54`

Video esimene päris Vue kordus käib üle kolme põhibloki rollid.

### Selgitus

Õpetaja sõnastab selle väga praktiliselt:

- `template` näitab kasutajale midagi
- `methods` teevad tegevusi
- `data()` hoiab nende kahe vahelist ühist seisu

See on oluline, sest algaja kipub vaatama HTML-i, JavaScripti ja andmeid eraldi saartena. Vue mõte on vastupidi see, et need kolm töötavad ühe mudeli ümber.

`LoginView.vue` on selleks väga hea näide:

- `template` kuvab inputid, nupu ja veateate
- `data()` hoiab `username`, `password`, `errorMessage`, `showSpinner`
- `methods` muudavad neid väärtusi

### Skeem

```text
template
  -> kuvab väärtusi

methods
  -> muudavad väärtusi

data()
  -> hoiab ühise tõe
```

### Koodinäide

```js
data() {
  return {
    showSpinner: false,
    username: '',
    password: '',
    errorMessage: '',
  }
}
```

```js
login() {
  this.startSpinner()
  this.resetErrorMessage()
}
```

### Päriselu analoogia

See on nagu köögis on üks ühine töölaud. Üks inimene loeb retsepti, teine lõikab köögivilju, aga mõlemad kasutavad sama lauda ja sama toorainet.

<a id="dom-i-ei-tasu-kasitsi-nappida-ref-on-pigem-erand"></a>
## DOM-i ei tasu käsitsi näppida, `ref` on pigem erand - `0:03:14`

Õpetaja kordab mitu korda sama mõtet: ära hakka Vue rakenduses HTML-elemente käsitsi taga ajama, kui andmete pealt renderdamine lahendab töö ära.

### Selgitus

Miks see on halb harjumus?

- element ei pruugi veel olemas olla
- `v-if` võib selle ajutiselt peita
- kood hakkab viitama millelegi, mida parajasti pole

Õpetaja näitab, et `ref` ja `this.$refs` on olemas, aga see ei tähenda, et neid peaks vaikimisi kasutama. Need on pigem erandjuhtudeks, näiteks faili-inputi nullimiseks.

### Skeem

```text
halb tee:
kood -> otsi DOM-ist element -> äkki pole olemas -> viga

parem tee:
muuda andmeid -> Vue renderdab õige HTML-i ise
```

### Koodinäide

Praeguses repos on `AtmsView.vue` sees isegi üks `ref` näide:

```vue
<h1 ref="MingiNimiRef">Pangaautomaadid</h1>
```

Aga tegelik funktsionaalne loogika ei toetu sellele. Vaate töö käib endiselt `data()` ja meetodite kaudu.

### Päriselu analoogia

See on nagu tõmbaksid lavakardinat käsitsi iga kord, kui stseen muutub. Palju kindlam on, kui lavamehaanik teeb selle sinu eest õige märguande peale.

<a id="v-if-ja-v-model-lasevad-andmetel-kasutajaliidest-juhtida"></a>
## `v-if` ja `v-model` lasevad andmetel kasutajaliidest juhtida - `0:07:09`

Video kõige kasulikum algaja-idee on see, et UI ei peaks muutuma käsitsi, vaid andmete järgi.

### Selgitus

Siin tuleb korraga mängu kaks Vue põhilist tööriista:

- `v-if` otsustab, kas midagi üldse ekraanile joonistatakse
- `v-model` seob inputi ja muutuja kahes suunas

`AlertError.vue` kasutab `v-if`-i nii, et tühi veateade tähendab "ära kuva midagi". `LoginView.vue` kasutab `v-model`-it nii, et inputivälja ja andmemudeli väärtus käivad kogu aeg koos.

### Skeem

```text
errorMessage = ''
  -> alerti ei kuvata

errorMessage = 'Täida kõik väljad'
  -> alert kuvatakse

input väärtus muutub
  -> username muutub
username muutub
  -> input kuvab uut väärtust
```

### Koodinäide

```vue
<div v-if="errorMessage" class="alert alert-danger" role="alert">
  {{ errorMessage }}
</div>
```

```vue
<input
  v-model="username"
  type="text"
  class="form-control"
  id="inputUsername"
  placeholder="Kasutajanimi"
/>
```

### Päriselu analoogia

See on nagu valgusfoor ei vaja eraldi töömeest, kes lambipirni keeraks. Sensor annab seisu ja süsteem näitab õiget värvi ise.

<a id="bootstrapi-utiliidid-hoiavad-layouti-ilma-pikslivoimlemiseta"></a>
## Bootstrapi utiliidid hoiavad layout'i ilma pikslivõimlemiseta - `0:08:02`

Õpetaja käib üle ka selle, miks Bootstrapi utility-klassid on õppimise alguses väga mõistlikud.

### Selgitus

Mõte ei ole selles, et "pikslid on keelatud", vaid et algaja ei peaks iga väikese vahe või laiuse jaoks ehitama ise uut CSS-i, kui raamistik pakub juba tähenduslikud ehituskivid:

- `row`
- `col`
- `justify-content-center`
- `mb-3`

Need klassid aitavad hoida paigutuse arusaadava ja kiiresti muudetava.

### Skeem

```text
container
  -> row
      -> col
          -> vormi elemendid

utility klassid
  -> annavad laiuse
  -> annavad joondamise
  -> annavad vahed
```

### Koodinäide

```vue
<div class="row justify-content-center">
  <div class="col col-3">
    <h1 class="mb-3">Sisse logimine</h1>
  </div>
</div>
```

### Päriselu analoogia

See on nagu ehitad riiulit valmis mõõdus detailidest, mitte ei sae iga kruviaugu jaoks uut lauda nullist.

<a id="frontend-saab-backendita-edasi-liikuda-tanu-teenusele-proxyle-ja-stoplightile"></a>
## Frontend saab backendita edasi liikuda tänu teenusele, proxy'le ja Stoplightile - `0:10:46`

Video keskel selgitatakse väga praktilist töövoogu: frontendi saab edasi arendada ka siis, kui päris backend pole veel valmis.

### Selgitus

Selleks kasutatakse korraga kolme asja:

- eraldi teenusefail, mis saadab HTTP päringu
- Vite proxy, mis tunneb `/api` tee ära
- Stoplight, mis mängib ajutiselt backendi rolli

See tähendab, et frontendi kood ei pea teadma kõiki päris serveri detaile. Piisab kokkuleppest:

- päring läheb aadressile `/api/...`
- proxy suunab selle edasi õigesse sihtkohta
- Stoplight annab testvastuse tagasi

### Skeem

```text
LoginView
  -> LoginService
      -> /api/login
          -> Vite proxy
              -> Stoplight mock
                  -> näidisvastus tagasi
```

### Koodinäide

```js
sendGetLoginRequest(username, password) {
  return axios.get('/api/login', {
    headers: { Prefer: this.getPreferValue(username) },
    params: {
      username: username,
      password: password,
    },
  })
}
```

```js
server: {
  proxy: {
    '/api': 'https://stoplight.io/mocks/valiit/myproject/170385130'
  }
}
```

### Päriselu analoogia

See on nagu filmivõttel kasutatakse ajutist rekvisiiti enne, kui päris hoone või objekt valmis saab.

<a id="skriptiplokis-viitad-oma-andmetele-sonaga-this"></a>
## Skriptiplokis viitad oma andmetele sõnaga `this` - `0:24:33`

Üks läbiv õpetaja rõhuasetus on see, et template'is ja scriptis ei viidata andmetele samamoodi.

### Selgitus

Template'is kirjutad lihtsalt:

```vue
{{ errorMessage }}
```

Aga scripti poolel tuleb kasutada:

```js
this.errorMessage
```

Põhjus on lihtne: scriptis pead ütlema, et otsi seda muutujat just selle komponendi seest.

Video näitab seda `mounted()` näite kaudu, kus õpetaja kuvab `userId` väärtust kohe lehe saabumisel.

### Skeem

```text
template
  -> errorMessage

script
  -> this.errorMessage
  -> this.userId
  -> this.getCities()
```

### Koodinäide

```js
mounted() {
  alert('User Id: ' + this.userId)
}
```

Praeguses repos seda demo-alerti enam ei ole, aga sama reegel kehtib kõigis komponentides.

### Päriselu analoogia

See on nagu klassiruumis ei piisa ainult hüüdest "vihik". Sa pead ütlema, kelle vihikust jutt käib.

<a id="authservice-koondab-login-oleku-uheks-taaskasutatavaks-kohaks"></a>
## `AuthService` koondab login-oleku üheks taaskasutatavaks kohaks - `0:28:59`

Siin jõuab video ühe väga hea arhitektuurse sammuni: ära küsi `localStorage` väärtusi igas vaates eraldi, vaid tõsta see loogika teenusesse.

### Selgitus

Kui sama küsimus esineb mitmes kohas:

- kas kasutaja on sisse logitud?
- mis on tema `userId`?
- mis on tema `roleName`?

siis on parem teha selleks üks koht, kust kogu rakendus neid vastuseid küsib.

Praeguses repos on selleks `src/auth/AuthService.js`.

### Skeem

```text
AtmsView
  -> AuthService
      -> localStorage

teised vaated
  -> AuthService
      -> localStorage
```

### Koodinäide

```js
isLoggedIn() {
  return localStorage.getItem('userId') !== null
}

getLoggedInUserId() {
  this.validateUserIsLoggedIn()
  return Number(localStorage.getItem('userId'))
}

getLoggedInUserRoleName() {
  this.validateUserIsLoggedIn()
  return localStorage.getItem('roleName')
}
```

### Päriselu analoogia

See on nagu kontori võtmed ei ole laiali kümnes sahtlis. On üks võtmekapp, kust kõik käivad õige võtme järgi.

<a id="validateuserisloggedin-eemaldab-dubleeritud-kaitseloogika"></a>
## `validateUserIsLoggedIn()` eemaldab dubleeritud kaitseloogika - `0:37:25`

Video väga hea õpetusmoment on dubleeritud koodi äratundmine.

### Selgitus

Kui `getLoggedInUserId()` ja `getLoggedInUserRoleName()` mõlemad peavad enne kontrollima, kas kasutaja üldse tohib neid andmeid küsida, siis ei ole mõistlik kopeerida sama `if`-lauset iga meetodi sisse eraldi.

Lahendus on eraldi nimeline abimeetod:

- nimi ütleb, mida ta kontrollib
- sama kontrolli saab kutsuda mitmest kohast
- hilisem muutus tuleb teha ühes failis

### Skeem

```text
getLoggedInUserId()
  -> validateUserIsLoggedIn()
  -> tagasta userId

getLoggedInUserRoleName()
  -> validateUserIsLoggedIn()
  -> tagasta roleName
```

### Koodinäide

```js
validateUserIsLoggedIn() {
  if (!this.isLoggedIn()) {
    NavigationService.navigateToNotAuthorizedView()
  }
}
```

### Päriselu analoogia

See on nagu valvelaud kontrollib sissepääsuloa ühe korra ukse peal, mitte iga koridori alguses nullist uuesti.

<a id="rolename-toestab-et-loginist-talletatud-info-jouab-ka-teise-vaatesse"></a>
## `roleName` tõestab, et loginist talletatud info jõuab ka teise vaatesse - `0:45:22`

Video kasutab `roleName`-i tõestusena, et loginist talletatud info ei ela ainult `LoginView` sees.

### Selgitus

See on väga tähtis samm mõistmiseks:

- `LoginView` salvestab `userId` ja `roleName`
- teine vaade saab need hiljem kätte ilma uuesti sisse logimata
- järelikult on meil rakenduseülene püsivam olek, mitte ainult ühe komponendi hetkeseis

Praeguses `AtmsView.vue` failis on see juba näha:

```js
userId: AuthService.getLoggedInUserId(),
roleName: AuthService.getLoggedInUserRoleName(),
```

### Skeem

```text
LoginView
  -> localStorage.setItem(...)

AtmsView
  -> AuthService loeb väärtused välja
      -> kasutab neid uues vaates
```

### Koodinäide

```js
async handleLoginResponse(response) {
  this.loginResponse = response.data
  localStorage.setItem('userId', this.loginResponse.userId)
  localStorage.setItem('roleName', this.loginResponse.roleName)
  this.$emit('event-user-logged-in')
  NavigationService.navigateToAtmsView()
}
```

```js
data() {
  return {
    userId: AuthService.getLoggedInUserId(),
    roleName: AuthService.getLoggedInUserRoleName(),
  }
}
```

### Päriselu analoogia

See on nagu administraator teeb sulle sissepääsukaardi fuajees, aga pärast saad sama kaardiga liikuda ka teistesse ruumidesse.

<a id="database-skriptid-taastavad-arenduse-jaoks-puhta-algseisu"></a>
## `database/` skriptid taastavad arenduse jaoks puhta algseisu - `1:17:30`

Teine suur teemaplokk läheb üle kohaliku andmebaasi seadistamisele.

### Selgitus

Repo `database/` kaustas on kolm skripti, mis moodustavad ühe korduva "reseti":

1. vana skeem kustutatakse
2. tabelid luuakse uuesti
3. algandmed imporditakse

See on arenduses väga mugav, sest saad testandmed alati tagasi tuntud algseisu viia.

### Skeem

```text
1_reset_database.sql
  -> kustuta vana skeem

2_create.sql
  -> loo tabelid + seosed

3_import.sql
  -> lisa algandmed
```

### Koodinäide

```sql
DROP SCHEMA IF EXISTS bank CASCADE;
CREATE SCHEMA bank
    GRANT ALL ON SCHEMA bank TO postgres;
GRANT ALL ON SCHEMA bank TO PUBLIC;
```

```sql
INSERT INTO bank.city (id, name) VALUES (default, 'Tartu');
INSERT INTO bank.city (id, name) VALUES (default, 'Tallinn');
INSERT INTO bank.city (id, name) VALUES (default, 'Pärnu');
```

### Päriselu analoogia

See on nagu ehitad harjutusväljakut: enne trenni lükkad vanad koonused eest, paned platsi uuesti paika ja laod stardiolukorra valmis.

<a id="ide-andmebaasitooriist-ja-sql-konsool-naitavad-mis-pariselt-tabelites-toimub"></a>
## IDE andmebaasitööriist ja SQL-konsool näitavad, mis päriselt tabelites toimub - `1:22:07`

Õpetaja ei piirdu ainult tabeli "brauseris vaatamisega", vaid näitab, et iga kliki taga jookseb tegelikult SQL.

### Selgitus

See on tähtis, sest algaja võib muidu jääda uskuma, et IDE teeb "mingit oma maagiat". Tegelikult saadab tööriist andmebaasile päringuid täpselt samamoodi nagu sinu enda kirjutatud SQL-konsool.

Sellest plokist on hea kaasa võtta kolm mõtet:

- andmebaasitööriist on lihtsalt mugav vaade
- tabeli sisu tuleb päringutest
- `serial`/`default` väärtused kasutavad sequence-counter'it, seega ID-d ei pea pärast kustutamist ilusasti järjestuma

### Skeem

```text
IDE tabelivaade
  -> tegelikult SQL päring

SQL konsool
  -> sama andmebaas
  -> sama sisu
```

### Koodinäide

```sql
CREATE TABLE city (
  id serial NOT NULL,
  name varchar(255) NOT NULL,
  CONSTRAINT city_pk PRIMARY KEY (id)
);
```

```sql
ALTER TABLE location ADD CONSTRAINT location_city
  FOREIGN KEY (city_id)
  REFERENCES city (id);
```

### Päriselu analoogia

See on nagu poe kassas näed ilusat ekraani, aga taustal tehakse ikka päris lao päringud, mitte ei joonistata numbreid niisama.

<a id="selectbox-ehitatakse-esmalt-vaatesse-ja-bootstrapi-peale"></a>
## Selectbox ehitatakse esmalt vaatesse ja Bootstrapi peale - `1:58:15`

Kui andmebaasi osa on ette valmistatud, liigub video tagasi frontendi vaatesse ja hakkab rajama uut selectbox'i.

### Selgitus

Õpetaja soovitus on siin väga praktiline:

- enne tee element ekraanile nähtavaks
- kasuta alguses Bootstrapi valmis `<select>` põhja
- timmi paigutus paika
- alles siis hakka seda keerulisemaks tegema

See väldib olukorda, kus üritad samaaegselt lahendada:

- kujundust
- andmevoogu
- alamkomponenti
- sündmusi

### Skeem

```text
AtmsView
  -> uus row
      -> col
          -> select
              -> esmalt visuaalne karkass
```

### Koodinäide

Praegune lõpptulemus on juba alamkomponendiks tõstetud, aga sama mõte on seal sees alles:

```vue
<div class="row">
  <div class="col col-3">
    <CitiesDropdown
      :cities="cities"
      :selected-city-id="selectedCityId"
      @event-new-city-selected="setSelectedCityId"
    />
  </div>
</div>
```

### Päriselu analoogia

See on nagu paned kööki kõigepealt kapi õigesse kohta ja alles siis hakkad otsustama, mis läheb ülemisse sahtlisse ja mis alumisse.

<a id="koolon-tahendab-child-saab-muutuja-vaartuse-mitte-sona"></a>
## Koolon `:` tähendab: child saab muutuja väärtuse, mitte sõna - `2:15:56`

Video üks olulisemaid Vue süntaksi hetki on kooloni tähendus.

### Selgitus

Kui kirjutad atribuudi ilma koolonita:

```vue
role-name="roleName"
```

siis saadab parent childile sõna `roleName` kui teksti.

Kui kirjutad kooloniga:

```vue
:role-name="roleName"
```

siis saab child päriselt selle muutuja väärtuse.

See sama reegel kehtib kogu repos:

- `:error-message="errorMessage"`
- `:cities="cities"`
- `:selected-city-id="selectedCityId"`

### Skeem

```text
ilma koolonita
  -> string

kooloniga
  -> JavaScripti avaldis või muutuja väärtus
```

### Koodinäide

```vue
<AlertError :error-message="errorMessage" />
```

```vue
<CitiesDropdown
  :cities="cities"
  :selected-city-id="selectedCityId"
  @event-new-city-selected="setSelectedCityId"
/>
```

### Päriselu analoogia

See on nagu aadressi asemel ei anna sa kullerile sõna "aadress", vaid päris aadressi enda.

<a id="komponent-tukelda-siis-kui-sul-on-visuaal-paigas-mitte-siis-kui-click-loogika-alles-ujub"></a>
## Komponent tükelda siis, kui sul on visuaal paigas, mitte siis kui click-loogika alles ujub - `2:18:03`

See on selle video väga hea praktiline reegel.

### Selgitus

Õpetaja ei ütle, et komponente ei tohi vara teha. Ta ütleb täpsemalt:

- visuaalset ja andmesisest osa võib rahulikult tükeldada
- aga kui element sõltub tugevalt parenti meetoditest ja click-loogikast, siis liiga varane ekstraheerimine muudab pildi segaseks

Teisisõnu:

- tekst, paigutus ja propsid on hea varajane ekstrakt
- parenti konkreetset tegevust käivitav nupu- või click-loogika nõuab rohkem läbimõtlemist

See on ka põhjus, miks `CitiesDropdown` kujuneb eraldi komponendiks, aga parent hoiab endiselt oma äriloogikat.

### Skeem

```text
esmalt:
vaates valmis visuaal
  -> näha, mida üldse vaja on

siis:
ekstrakti alamkomponent
  -> propsid alla

hiljem:
sündmused üles
  -> parent teeb päris tegevuse
```

### Koodinäide

Praegune `CitiesDropdown.vue` on hea näide sellest, et child on väike ja keskendub oma ülesandele:

```vue
<select
  @change="$emit('event-new-city-selected', Number($event.target.value))"
  :value="selectedCityId"
  class="form-select"
  aria-label="Vali linn"
>
```

### Päriselu analoogia

See on nagu ehitad auto armatuurlaua esialgu paika enne, kui hakkad otsustama, milline juhtaju millist andurit käivitab.

<a id="network-tab-kinnitab-et-apicities-paring-laks-pariselt-teele"></a>
## `Network` tab kinnitab, et `/api/cities` päring läks päriselt teele - `2:48:15`

Õpetaja näitab väga praktilist kontrolli: kui tahad teada, kas brauser saatis päringu, siis ära vaata pimesi `console.log`-i või localStorage'it. Mine `Network` tabi.

### Selgitus

See aitab eristada kahte küsimust:

- kas meetod üldse käivitus?
- kas HTTP päring päriselt läks teele ja sai vastuse?

`Network` annab sellele kõige kindlama vastuse:

- näed URL-i
- näed staatust
- näed response'i

Selles videos on see hetk, kus `/api/cities` hakkab vaate saabumisel tööle.

### Skeem

```text
leht avaneb
  -> elutsükkel käivitub
      -> HTTP päring läheb teele
          -> Network näitab /api/cities
              -> response näitab linnasid
```

### Koodinäide

```js
sendGetCitiesRequest() {
  return axios.get('/api/cities')
}
```

`Network` vaates peaks selle peale ilmuma `/api/cities` staatuskoodiga `200`, kui mock või backend vastab edukalt.

### Päriselu analoogia

See on nagu postkontori jälgimisnumber. Sa ei arva, kas pakk läks teele, vaid vaatad päris logi.

<a id="getcities-peaks-elama-nimelise-meetodina-mitte-otse-elutsuklis"></a>
## `getCities()` peaks elama nimelise meetodina, mitte otse elutsüklis - `2:50:10`

Video viimane tehniline järeldus on väga hea: ära topi kogu päringu loogikat otse `mounted()` või `beforeMount()` sisse.

### Selgitus

Parem ja loetavam lahendus on:

1. tee nimeline meetod `getCities()`
2. pane päringu loogika sinna
3. käivita see elutsükli hook'ist

Nii jääb elutsükkel ise väga lühikeseks ja ütleb lihtsalt *millal* midagi juhtub, mitte ei sisalda kogu *kuidas* loogikat.

Praeguses repos on see lahendus juba olemas ja isegi järgmise video jaoks edasi arendatud:

- `getCities()` elab `methods` blokis
- `beforeMount()` kutsub selle välja
- edu- ja veaharu on juba promise-ahelasse pandud

### Skeem

```text
beforeMount()
  -> this.getCities()

getCities()
  -> CityService.sendGetCitiesRequest()
      -> then(...)
      -> catch(...)
```

### Koodinäide

```js
getCities() {
  CityService.sendGetCitiesRequest()
    .then((response) => this.handleGetCitiesResponse(response))
    .catch(() => NavigationService.navigateToErrorView())
    .finally()
}

beforeMount() {
  this.getCities()
}
```

### Päriselu analoogia

See on nagu päevaplaan ei sisalda kogu retsepti detaili. Päevaplaan ütleb "hommikul tee kohv", retsept ise elab eraldi kohvikannule kleebitud juhendis.

## Kokkuvõte

See video teeb kaks tähtsat asja korraga. Esmalt korratakse läbi Vue põhialused: `template`, `data()`, `methods`, `v-model`, `v-if`, teenused, proxy ja login-oleku hoidmine. Seejärel valmistatakse ette järgmine suurem samm: kohalik andmebaas, `AtmsView`, selectbox, child-komponendi propsid ja linnade laadimise esimene karkass.

Kui tahad selle video üheks tervikmõtteks kokku võtta, siis see oleks umbes nii:

```text
õpi andmete järgi renderdama,
hoia ühine loogika teenustes,
ehita vaade sammhaaval,
ja anna võrguliiklusel end Network tabis tõestada.
```
