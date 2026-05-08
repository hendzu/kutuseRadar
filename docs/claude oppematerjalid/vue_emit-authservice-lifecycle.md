## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/wgAXbsSJUOkMd3Mu9B9FEg9YkVYKLQ2haNas7pHcFD3zv94Qwt_igT_2Gbs9jEuS.5ccE6uysoMhRsB1v?startTime=1776766028000) |
| **Parool** | `S19I!GgF` |
| **Transkript** | [GMT20260421-100708_v-2.vtt](../transcripts/GMT20260421-100708_v-2.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu. Näiteks esinevad kohati `voe`, `loged`, `taask`, `outservice` ja `not outdoor ised`, kuigi kontekst ütleb üsna selgelt, et mõeldud on `Vue`, `logged`, `task`, `AuthService` ja `NotAuthorized`.

Selgelt loetavaid `FEB-4`, `BEB-7` või `OPETAJA-3` tüüpi taskikoode selles videos ei esine. Õpetaja viitab korduvalt lihtsalt "taskile", seega sisukord keskendub teemadele ja ajamärkidele.

Selles õppematerjalis seon video teemad päris näidetega failidest `src/views/LoginView.vue`, `src/App.vue`, `src/auth/AuthService.js`, `src/views/AtmsView.vue`, `src/views/NotAuthorizedView.vue`, `src/navigation/NavigationService.js` ja `src/router/index.js`.

## Sisukord

- [Login-vaade peab muutma parenti navigatsioonimenüüd](#login-vaade-peab-muutma-parenti-navigatsioonimenuud) - `0:02:20`
- [`$emit` saadab childist üles sündmuse](#emit-saadab-childist-ules-sundmuse) - `0:05:29`
- [`RouterView` on koht, kus `LoginView` tegelikult parenti jõuab](#routerview-on-koht-kus-loginview-tegelikult-parenti-jouab) - `0:17:36`
- [`App.vue` hoiab `isLoggedIn` olekut](#appvue-hoiab-isloggedin-olekut) - `0:20:05`
- [`localStorage` teeb login-oleku refresh-kindlaks](#localstorage-teeb-login-oleku-refresh-kindlaks) - `0:27:59`
- [`AuthService` tõstab kontrolli eraldi taaskasutatavasse faili](#authservice-tostab-kontrolli-eraldi-taaskasutatavasse-faili) - `0:36:44`
- [`beforeMount` käivitab kontrolli enne renderdamist](#beforemount-kaivitab-kontrolli-enne-renderdamist) - `0:49:44`
- [`updateLoggedInStatus()` küsib tõe teenuse käest](#updateloggedinstatus-kusib-toe-teenuse-kaest) - `1:07:06`
- [`v-if` ja `v-else` vahetavad menüüs login/logout linke](#v-if-ja-v-else-vahetavad-menuus-loginlogout-linke) - `1:10:03`
- [`executeLogOut()` puhastab võtmed ja sünkroonib UI](#executelogout-puhastab-votmed-ja-sunkroonib-ui) - `1:11:20`
- [Terve flow: login -> emit -> listener -> nav uuendus](#terve-flow-login-emit-listener-nav-uuendus) - `1:18:11`
- [Kaitstud vaade vajab `NotAuthorizedView` route'i](#kaitstud-vaade-vajab-notauthorizedview-routei) - `2:23:53`
- [`getLoggedInUserId()` annab numbri või suunab ära](#getloggedinuserid-annab-numbri-voi-suunab-ara) - `2:27:19`

<a id="login-vaade-peab-muutma-parenti-navigatsioonimenuud"></a>
## Login-vaade peab muutma parenti navigatsioonimenüüd - `0:02:20`

Video alguse põhiprobleem on lihtne: kasutaja vajutab login-nuppu `LoginView` sees, aga nähtav muutus peab toimuma hoopis ülemises menüüs.

### Selgitus

See on klassikaline `parent` ja `child` olukord:

- `LoginView` on child, sest ta renderdatakse peamise äpi sisse
- navigatsioonimenüü elab `App.vue` sees, mis on selles suhtes parent

Child ei peaks minema parenti HTML-i otse ümber kirjutama. Õige mõtteviis on: child teatab, et midagi juhtus, ja parent otsustab, mida selle teadmisega teha.

### Skeem

```text
App.vue
  -> navbar
  -> RouterView
      -> LoginView
          -> "Login" nupp

klõps toimub all
muutus peab paistma üleval
```

### Koodinäide

```vue
<button v-else @click="login" type="submit" class="btn btn-outline-secondary">
  Login
</button>
```

Nupp elab `LoginView` sees, aga tema mõju peab jõudma välja `App.vue` menüüni.

### Päriselu analoogia

See on nagu korteri uksekell. Nupp on ukse taga, aga heli tuleb korteri sees.

<a id="emit-saadab-childist-ules-sundmuse"></a>
## `$emit` saadab childist üles sündmuse - `0:05:29`

Õpetaja toob sisse Vue ühe tähtsa tööriista: `$emit`.

### Selgitus

`$emit` tähendab, et child saadab üles ühe sündmuse nime. Soovi korral võib kaasa panna ka andmeobjekti, aga selles videos piisab ainult teadest: "login õnnestus".

Õpetaja rõhutab ka nimevalikut. Hea sündmuse nimi kirjeldab juhtunut, mitte seda, mis meetodit keegi kutsus. Seepärast on `event-user-logged-in` loetavam kui midagi hägusat nagu `loginUser`.

### Skeem

```text
LoginView
  -> $emit('event-user-logged-in')
      -> parent kuuleb
          -> parent uuendab olekut
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

Siin ei saadeta üles tervet kasutajaobjekti. Parentile piisab teadmisest, et kasutaja on nüüd sisse logitud.

### Päriselu analoogia

See on nagu laps hüüab teise tuppa: "Ma sain valmis!" Ta ei vii ise seinal olevat kalendrit ümber tõstma, vaid annab märku.

<a id="routerview-on-koht-kus-loginview-tegelikult-parenti-jouab"></a>
## `RouterView` on koht, kus `LoginView` tegelikult parenti jõuab - `0:17:36`

Video keskel tuletatakse meelde, et `LoginView` ei ole `App.vue` sees käsitsi välja kirjutatud. Ta jõuab sinna ruuteri kaudu.

### Selgitus

See on oluline, sest listener tuleb panna sinna kohta, kus child tegelikult renderdatakse. Selles projektis on see koht `RouterView`.

Kui URL on `/login`, siis ruuter joonistab `LoginView` selle `RouterView` sisse. Just seetõttu saabki `App.vue` sinna sündmuse kuulaja külge panna.

### Skeem

```text
router/index.js
  -> /login = LoginView

App.vue
  -> <RouterView />
      -> siia ilmub LoginView
```

### Koodinäide

```js
{
  path: '/login',
  name: 'loginRoute',
  component: LoginView,
}
```

```vue
<RouterView @event-user-logged-in="updateLoggedInStatus" />
```

Esimene rida ütleb, millal `LoginView` üldse ekraanile tuleb. Teine rida ütleb, mida parent teeb siis, kui child login-edu välja hõikab.

### Päriselu analoogia

See on nagu lavaauk teatris. Näitleja tuleb lavale just sealt avast, kuhu ta sisse suunatakse. Kui tahad teda märgata, seisad õiges kohas.

<a id="appvue-hoiab-isloggedin-olekut"></a>
## `App.vue` hoiab `isLoggedIn` olekut - `0:20:05`

Kui parent peab menüüd ümber joonistama, siis tal peab olema oma seis.

### Selgitus

`App.vue` hoiab boolean-muutujat `isLoggedIn`. `boolean` tähendab lihtsalt kahte võimalust: `true` või `false`.

See on oluline ka seetõttu, et iga `refresh` alustab komponendi uuesti. Vaikeväärtus pannakse alguses `false`, aga hiljem tuleb see õigeks arvutada.

### Skeem

```text
App.vue data
  -> isLoggedIn: false

hiljem:
  -> arvutatakse uuesti
  -> navbar renderdatakse selle järgi
```

### Koodinäide

```js
data() {
  return {
    isLoggedIn: false,
  }
}
```

See ei tähenda, et kasutaja oleks päriselt alati väljas. See tähendab ainult, et esialgne väärtus pannakse paika enne kontrolli.

### Päriselu analoogia

See on nagu poe silt, mis on hommikul vaikimisi "suletud", kuni töötaja päriselt kontrollib, kas pood avatakse.

<a id="localstorage-teeb-login-oleku-refresh-kindlaks"></a>
## `localStorage` teeb login-oleku refresh-kindlaks - `0:27:59`

Õpetaja rõhutab, et ainult Vue `data()` sees hoidmisest ei piisa.

### Selgitus

Kui kasutaja vajutab `refresh`, siis komponent luuakse nullist uuesti. Seepärast peab kuskil olema püsivam koht, kust kontrollida, kas login toimus juba varem.

Selles õppeprojektis kasutatakse selleks `localStorage`-it. Päriselus räägitakse videos ka `JWT` tokenitest, aga siin tehakse lihtsustatud versioon: salvestatakse `userId` ja `roleName`.

### Skeem

```text
login õnnestub
  -> localStorage.setItem('userId', ...)
  -> localStorage.setItem('roleName', ...)

refresh
  -> Vue state nullitakse
  -> localStorage jääb alles
  -> saab uuesti kontrollida
```

### Koodinäide

```js
this.loginResponse = response.data
localStorage.setItem('userId', this.loginResponse.userId)
localStorage.setItem('roleName', this.loginResponse.roleName)
```

Need kaks võtit ongi selles videos login-oleku alus.

### Päriselu analoogia

See on nagu garderoobinumber. Isegi kui korraks toast välja lähed, on sul märk alles ja saad hiljem uuesti tõestada, et mantel on sinu oma.

<a id="authservice-tostab-kontrolli-eraldi-taaskasutatavasse-faili"></a>
## `AuthService` tõstab kontrolli eraldi taaskasutatavasse faili - `0:36:44`

Video järgmine hea mõte on: ära kirjuta login-kontrolli igasse vaatesse uuesti.

### Selgitus

Selle asemel tehakse eraldi teenus. Teenus tähendab siin lihtsalt faili, kus elab konkreetne vastutus. `AuthService` ülesanne on vastata küsimustele autentimise kohta.

See on parem kui `localStorage.getItem(...)` kopeerimine igasse komponenti, sest:

- loogika on ühes kohas
- nime saab lugeda nagu küsimust
- muudatused tehakse hiljem ainult ühes failis

### Skeem

```text
App.vue
AtmsView.vue
teised vaated
  -> AuthService
      -> localStorage
```

### Koodinäide

```js
export default {
  isLoggedIn() {
    return localStorage.getItem('userId') !== null
  },
}
```

Meetodi nimi kõlabki nagu küsimus: "Kas kasutaja on sisse logitud?"

### Päriselu analoogia

See on nagu infolaud koolis. Selle asemel, et iga õpetaja ise kooli kõigi ruumide võtmete seisu uurib, küsitakse ühest kohast.

<a id="beforemount-kaivitab-kontrolli-enne-renderdamist"></a>
## `beforeMount` käivitab kontrolli enne renderdamist - `0:49:44`

Õpetaja eelistab siin `beforeMount` hook'i.

### Selgitus

`beforeMount` tähendab: tee vajalik kontroll enne, kui komponent oma template'i ekraanile joonistab.

Selle video kontekstis on mõte järgmine: kui menüü peab kohe esimesel renderdusel teadma, kas näidata `Sisse logimine` või `Logi välja`, siis kontroll tasub teha nii vara kui võimalik.

### Skeem

```text
komponent luuakse
  -> beforeMount
      -> updateLoggedInStatus()
          -> AuthService.isLoggedIn()
  -> alles siis renderdus
```

### Koodinäide

```js
beforeMount() {
  this.updateLoggedInStatus()
}
```

See on lühike, aga mõjus rida. Ta tagab, et menüü ei sõltu ainult kasutaja järgmisest klikist.

### Päriselu analoogia

See on nagu vaatad enne loengu algust osalejate nimekirja üle, mitte ei hakka alles keset tundi mõtlema, kes pidi kohal olema.

<a id="updateloggedinstatus-kusib-toe-teenuse-kaest"></a>
## `updateLoggedInStatus()` küsib tõe teenuse käest - `1:07:06`

Siin jõuab video ühe väga hea disainiotsuseni: parent ei pane login-olekut pimesi `true` või `false`.

### Selgitus

Selle asemel küsib parent iga kord teenuselt: "Mis on päris seis praegu?"

See on tugevam lahendus kui otse `this.isLoggedIn = true`, sest sama meetod töötab:

- pärast edukat login-eventi
- pärast `refresh`-i
- pärast logouti

### Skeem

```text
updateLoggedInStatus()
  -> AuthService.isLoggedIn()
      -> loe localStorage
          -> tagasta true/false
```

### Koodinäide

```js
updateLoggedInStatus() {
  this.isLoggedIn = AuthService.isLoggedIn()
}
```

See meetod ei arva, vaid kontrollib.

### Päriselu analoogia

See on nagu ei küsi õpilaselt "sa vist oled kohal?", vaid kontrollid päevikust, kas nimi on kirjas.

<a id="v-if-ja-v-else-vahetavad-menuus-loginlogout-linke"></a>
## `v-if` ja `v-else` vahetavad menüüs login/logout linke - `1:10:03`

Kui seis on olemas, saab template teha väga selgeks.

### Selgitus

`v-if` tähendab: näita seda ainult siis, kui tingimus on tõene.  
`v-else` tähendab: muul juhul näita teist varianti.

Selles projektis kasutatakse seda login/logout menüü jaoks. Kui `isLoggedIn` on `true`, näeb kasutaja väljalogimise linki. Kui `false`, näeb ta sisselogimise linki.

### Skeem

```text
isLoggedIn = true
  -> "Logi välja"

isLoggedIn = false
  -> "Sisse logimine"
```

### Koodinäide

```vue
<RouterLink v-if="isLoggedIn" @click="executeLogOut" class="nav-link" to="/">
  Logi välja
</RouterLink>
<RouterLink v-else class="nav-link" to="/login">
  Sisse logimine
</RouterLink>
```

See on loetav ka algajale: kaks võimalikku vaadet, üks tingimus.

### Päriselu analoogia

See on nagu uksel on kas silt "Siseneda" või "Välju siit". Korraga mõlemat näidata poleks mõistlik.

<a id="executelogout-puhastab-votmed-ja-sunkroonib-ui"></a>
## `executeLogOut()` puhastab võtmed ja sünkroonib UI - `1:11:20`

Video ei piirdu ainult loginiga. Sama oluline on korrektne logout.

### Selgitus

Õpetaja arutab ka varianti `localStorage.clear()`, kuid praktilisem lahendus on eemaldada ainult need võtmed, mille rakendus ise loginiga lisas.

Pärast kustutamist peab UI kohe uuenema. Muidu jääb menüü vale seisu kuni järgmise `refresh`-ini.

### Skeem

```text
klikid "Logi välja"
  -> eemalda userId
  -> eemalda roleName
  -> arvuta login-seis uuesti
  -> menüü muutub kohe
```

### Koodinäide

```js
executeLogOut() {
  localStorage.removeItem('userId')
  localStorage.removeItem('roleName')
  this.updateLoggedInStatus()
}
```

See on viisakas logout: kustutab oma andmed ja värskendab nähtava oleku kohe ära.

### Päriselu analoogia

See on nagu külastajakaardi tagastamine vastuvõttu. Sa ei viska tervet kapisüsteemi tühjaks, vaid annad tagasi ainult enda kaardi.

<a id="terve-flow-login-emit-listener-nav-uuendus"></a>
## Terve flow: login -> emit -> listener -> nav uuendus - `1:18:11`

Umbes selles kohas teeb õpetaja kogu ahela uuesti läbi. See on video tähtsaim kokkuvõte.

### Selgitus

Terve töövoog on järgmine:

1. kasutaja klikib `LoginView` nupule
2. `LoginService` saadab päringu
3. edukas vastus salvestatakse `localStorage`-isse
4. `LoginView` emiteerib `event-user-logged-in`
5. `App.vue` kuulab sündmust `RouterView` peal
6. `updateLoggedInStatus()` küsib teenuselt uue tõeseisu
7. navbar renderdatakse ümber

See on hea näide sellest, kuidas üks kasutaja tegevus liigub läbi mitme faili, aga iga fail teeb ainult oma osa.

### Skeem

```text
LoginView.login()
  -> LoginService.sendGetLoginRequest()
      -> handleLoginResponse()
          -> localStorage.setItem(...)
          -> $emit('event-user-logged-in')
              -> App.vue kuulab
                  -> updateLoggedInStatus()
                      -> AuthService.isLoggedIn()
                          -> navbar muutub
```

### Koodinäide

```vue
<RouterView @event-user-logged-in="updateLoggedInStatus" />
```

```js
LoginService.sendGetLoginRequest(this.username, this.password)
  .then((response) => this.handleLoginResponse(response))
  .catch((error) => this.handleLoginError(error))
  .finally(() => this.stopSpinner())
```

Esimene koodiplokk on kuulamiskoht. Teine on käivituskoht.

### Päriselu analoogia

See on nagu teatejooks. Iga jooksja teeb oma lõigu ja annab teatepulga järgmisele üle.

<a id="kaitstud-vaade-vajab-notauthorizedview-routei"></a>
## Kaitstud vaade vajab `NotAuthorizedView` route'i - `2:23:53`

Video lõpus liigub fookus menüüst edasi turvalisuse poole.

### Selgitus

Mõte on lihtne: kui keegi üritab minna URL-ile, kuhu tal pole õigust, siis rakendus peaks suunama ta selgesse "ei saa ligi" vaatesse.

Selleks on vaja kahte osa:

- eraldi vaatefaili `NotAuthorizedView.vue`
- ruuteris route'i, kuhu saab kasutaja suunata

### Skeem

```text
keegi avab kaitstud URL-i
  -> kontroll ebaõnnestub
      -> router.push('notAuthorizedRoute')
          -> NotAuthorizedView
```

### Koodinäide

```js
{
  path: '/not-authorized',
  name: 'notAuthorizedRoute',
  component: NotAuthorizedView,
}
```

Ja sellele vastab navigatsiooniteenus:

```js
navigateToNotAuthorizedView() {
  router.push({ name: 'notAuthorizedRoute' })
}
```

### Päriselu analoogia

See on nagu töötaja ukse peal on kaartlugeja. Kui kaart ei sobi, ei jää uks lihtsalt tummaks, vaid süsteem annab selge märgi, et siia ei pääse.

<a id="getloggedinuserid-annab-numbri-voi-suunab-ara"></a>
## `getLoggedInUserId()` annab numbri või suunab ära - `2:27:19`

Video viimane kasulik muster on see, et kasutaja ID küsimine ise võib olla kaitsekoht.

### Selgitus

`localStorage.getItem('userId')` tagastab stringi. Kui tahad seda kasutada päris ID-na, tuleb sellest teha number.

Aga enne seda on vaja kontrollida, kas kasutaja üldse on sisse logitud. Kui ei ole, siis suunatakse ta `NotAuthorizedView` peale.

See tähendab, et meetod teeb kahte asja:

- kaitseb ligipääsu
- tagastab juba õiges tüübis väärtuse

### Skeem

```text
AtmsView vajab userId-d
  -> AuthService.getLoggedInUserId()
      -> if !isLoggedIn()
          -> navigateToNotAuthorizedView()
      -> Number(localStorage.getItem('userId'))
```

### Koodinäide

```js
getLoggedInUserId() {
  if (!this.isLoggedIn()) {
    NavigationService.navigateToNotAuthorizedView()
  }
  return Number(localStorage.getItem('userId'))
}
```

Ja kasutus `AtmsView` sees:

```js
data() {
  return {
    userId: AuthService.getLoggedInUserId(),
  }
}
```

See ei ole veel globaalne route guard, aga õppematerjalina on see väga hea vaheaste: üks keskne koht otsustab, kas andmeid tohib üldse kätte anda.

### Päriselu analoogia

See on nagu registratuur. Kui sul puudub ligipääs, ei anta sulle isegi kabineti numbrit kätte, vaid saadetakse õigesse infopunkti tagasi.
