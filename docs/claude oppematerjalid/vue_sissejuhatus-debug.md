## Video info

| | |
|---|---|
| **Video** | [Vaata videot](https://us02web.zoom.us/rec/share/cefItO6Bx60uONN9VupAh4DmGj46GJsADMsbUu59ItbZQpWvhnO4mCGQ4uNey1Q0.iogCQ6FBSJ3L2jeR?startTime=1776319053000) |
| **Parool** | `D6dexQH@` |
| **Transkript** | [GMT20260416-055733_v-1.vtt](../transcripts/GMT20260416-055733_v-1.vtt) |

## Märkus transkripti kohta

Selles transkriptis on OCR-vigu ja terminid on kohati loetud valesti. Näiteks esineb kohati `Cloud`, kuigi kontekst ütleb väga tugevalt, et mõeldud on `Claude`. Samamoodi on `Docker`, `debug`, `breakpoint`, `stylesheet`, Java ja JavaScripti terminid kohati vigaselt tuvastatud.

Selles õppematerjalis kasutan tavapäraseid tehnilisi termineid ja sõnastan mõtted selges algajasõbralikus vormis ümber.

Selles videos otseseid taskikoode stiilis `FE-124` või `BEB-7` ei tuvastanud.

Kuna selle repo koodibaas on Vue/JavaScript projekt, mitte Java backend, kasutan siin kaht tüüpi koodinäiteid:

- päris näited repo `src/` kaustast, kui mõte on sama
- lihtsad Java või pseudokoodi näited seal, kus videos selgitatakse backendi loogikat

## Sisukord

- [Transkripti saab Zoomist eraldi alla laadida](#transkripti-saab-zoomist-eraldi-alla-laadida) - `0:01:23`
- [Korduv prompt tuleks muuta skilliks](#korduv-prompt-tuleks-muuta-skilliks) - `0:04:53`
- [Windowsi rada ja WSL-i rada ei ole sama asi](#windowsi-rada-ja-wsl-i-rada-ei-ole-sama-asi) - `0:05:52`
- [Miks WSL ja Docker arenduses vajalikud on](#miks-wsl-ja-docker-arenduses-vajalikud-on) - `0:09:05`
- [Breakpoint aitab näha, mis kood päriselt teeb](#breakpoint-aitab-naha-mis-kood-pariselt-teeb) - `0:15:00`
- [AI tööriistad vahetuvad kiiresti, aga vastutus jääb arendajale](#ai-tooriistad-vahetuvad-kiiresti-aga-vastutus-jaab-arendajale) - `0:24:06`
- [Muutuja on silt, mitte asi ise](#muutuja-on-silt-mitte-asi-ise) - `0:28:49`
- [Muutuja defineerimine ja scope annavad konteksti](#muutuja-defineerimine-ja-scope-annavad-konteksti) - `0:37:32`
- [Väärtuse andmine ei ole sama mis võrdlemine](#vaartuse-andmine-ei-ole-sama-mis-vordlemine) - `0:42:50`
- [Üks silt ei saa viidata kahele objektile korraga](#uks-silt-ei-saa-viidata-kahele-objektile-korraga) - `0:50:06`
- [Pangaülekande näide seob `TransferRequest`-i, kontod ja saldod](#pangaulekande-naide-seob-transferrequest-i-kontod-ja-saldod) - `1:11:30`
- [Juuniorit on endiselt vaja, aga ootus on laiem](#juuniorit-on-endiselt-vaja-aga-ootus-on-laiem) - `1:40:49`
- [Projektipõhine õpe ja AI orkestreerimine on õige suund](#projektipohine-ope-ja-ai-orkestreerimine-on-oige-suund) - `2:09:51`
- [`if`, `else if` ja `else` juhivad protsessi](#if-else-if-ja-else-juhivad-protsessi) - `2:11:57`
- [Eitavaid meetodinimesid tasub vältida](#eitavaid-meetodinimesid-tasub-valtida) - `2:24:21`
- [CSS töötab ainult siis, kui leht stylesheet'i teab](#css-tootab-ainult-siis-kui-leht-stylesheeti-teab) - `2:43:46`
- [JavaScriptis `let`, `const`, parameetrid ja `return` käituvad teisiti kui Javas](#javascriptis-let-const-parameetrid-ja-return-kaituvad-teisiti-kui-javas) - `2:46:33`
- [Meetod ei tea oma välisest elust midagi ja tagastus tuleb kinni püüda](#meetod-ei-tea-oma-valisest-elust-midagi-ja-tagastus-tuleb-kinni-puuda) - `2:59:45`

<a id="transkripti-saab-zoomist-eraldi-alla-laadida"></a>
## Transkripti saab Zoomist eraldi alla laadida - `0:01:23`

Video alguses näidatakse praktilist töövõtet: salvestuselt ei pea alati käsitsi kuulama, vaid saab võtta Zoomist kaasa ka audio transcripti.

### Selgitus

See on oluline sellepärast, et:

- saad hiljem videot otsimata teemad tekstina läbi töötada
- saad teha kokkuvõtteid, õppematerjale ja sisukordi
- saad kiiremini leida, kus mingi teema videos algab

Praktikas tähendab see, et salvestus ei ole ainult video, vaid tooraine, millest saab teha uue õppematerjali.

### Skeem

```text
Zoomi salvestus
  -> transcript fail
  -> kokkuvõte
  -> õppematerjal
  -> uuesti kasutatav teadmus
```

### Koodinäide

```text
Recording
  -> Audio transcript
  -> Download
  -> GMT20260416-055733_v-1.vtt
```

### Päriselu analoogia

See on nagu loengu salvestamine koos automaatsete märkmetega. Sa ei pea hiljem kõike uuesti kõrvaga läbi kuulama, vaid saad tekstist kiiresti tuuma kätte.

<a id="korduv-prompt-tuleks-muuta-skilliks"></a>
## Korduv prompt tuleks muuta skilliks - `0:04:53`

Õpetaja toob välja väga tugeva töövoo-mõtte: kui sama asja tehakse korduvalt, ei ole mõistlik iga kord nullist prompti uuesti kirjutada.

### Selgitus

Kui ülesanne on korduv, siis tasub selle jaoks teha standardne tööriist või oskus:

- sisendid on alati samad
- väljund on sarnase struktuuriga
- töövoog muutub kiiremaks ja stabiilsemaks

See ongi üks põhjus, miks skillid on kasulikud: nad vähendavad juhuslikkust ja hoiavad kokku mõtlemist seal, kus muster on juba teada.

### Skeem

```text
sama prompt täna
sama prompt homme
sama prompt ülehomme
        ->
tee sellest skill
```

### Koodinäide

```text
Sisend:
- video link
- video parool
- transkriptifail

Väljund:
- sisukord
- teemapõhised seletused
- koodinäited
- salvestatud markdown fail
```

### Päriselu analoogia

Kui teed iga päev sama kohvi, siis sa ei kirjuta endale igal hommikul uut retsepti. Sa teed retseptikaardi ja kasutad seda uuesti.

<a id="windowsi-rada-ja-wsl-i-rada-ei-ole-sama-asi"></a>
## Windowsi rada ja WSL-i rada ei ole sama asi - `0:05:52`

Siin tehakse väga praktiline eristus: sama projekt võib olla näha nii Windowsi kui ka Linuxi vaates, aga rajad ei näe välja ühesugused.

### Selgitus

Windowsis võib projekt olla näiteks `C:\Projects\...`, aga WSL-is paistab sama koht teise kujuga, näiteks `/mnt/c/...`.

See ei ole kosmeetiline erinevus. See mõjutab:

- kuidas terminalis liigud
- kuidas skriptid faile leiavad
- kuidas tööriistad projekti näevad

### Skeem

```text
Windows:
C:\Projects\grupp\40\bank40front

WSL:
/mnt/c/Projects/grupp/40/bank40front
```

### Koodinäide

```bash
cd /mnt/c/Projects/grupp/40/bank40front
pwd
# /mnt/c/Projects/grupp/40/bank40front
```

### Päriselu analoogia

See on nagu sama maja kaks erinevat aadressikirjutust eri süsteemides. Maja on sama, aga postiaadressi vorm muutub.

<a id="miks-wsl-ja-docker-arenduses-vajalikud-on"></a>
## Miks WSL ja Docker arenduses vajalikud on - `0:09:05`

Õpetaja selgitab, miks Windowsi sees üldse Linuxi alamsüsteemi vaja läheb ja miks mõned arendustööriistad tahavad Linuxi-laadset keskkonda.

### Selgitus

Põhiidee on lihtne:

- osa tööriistu on disainitud Linuxi jaoks
- arendaja ei taha tingimata kogu arvutit Linuxiks ümber teha
- WSL annab Windowsi sees Linuxi-laadse tööruumi

`Docker` lisab siia veel konteineriloogika: rakendus pakitakse kaasa oma keskkonnaga, et see töötaks eri arvutites võimalikult ühtemoodi.

### Skeem

```text
Windows
  -> WSL
      -> Linuxi-laadne terminal
      -> tööriistad, mis tahavad Linuxit

Rakendus
  -> Docker container
      -> käitub eri masinates sarnasemalt
```

### Koodinäide

```bash
docker run my-app
```

Mõte ei ole siin käsus endas, vaid selles, et rakendus jookseb konteineri sees, mitte "lihtsalt kuskil arvutis".

### Päriselu analoogia

WSL on nagu tõlk, kes laseb sul samas majas kasutada teise keeleruumi tööriistu. Docker on nagu standardkast, kuhu paned kogu vajaliku komplekti sisse ja viid selle teise kohta kaasa.

<a id="breakpoint-aitab-naha-mis-kood-pariselt-teeb"></a>
## Breakpoint aitab näha, mis kood päriselt teeb - `0:15:00`

Siin tuleb üks arendaja kõige olulisemaid tööriistu: debugging.

### Selgitus

`Breakpoint` tähendab kohta, kus kood peatatakse täpselt enne mingi rea täitmist. See annab võimaluse:

- vaadata muutujate hetkeväärtusi
- liikuda samm-sammult edasi
- näha, kas `if` läks sinna harusse, kuhu sa arvasid

See on palju tugevam kui lihtsalt "ma arvan, et kood teeb nii".

### Skeem

```text
kood käivitub
  -> jõuab breakpointini
  -> jääb seisma
  -> vaatad väärtusi
  -> liigud järgmise sammu peale
```

### Koodinäide

Selles projektis oleks hea breakpoint panna näiteks siia:

```js
login() {
  this.resetErrorMessage()

  if (this.allFormFieldsAreCorrect()) {
    // breakpoint siia
  } else {
    this.errorMessage = 'Täida kõik väljad'
  }
}
```

Siis näed kohe ära, kas tingimus läheb `true` või `false` harusse.

### Päriselu analoogia

See on nagu video pausile panemine täpselt olulisel hetkel, et vaadata, kes kuhu liikus, mitte ainult lõpptulemust.

<a id="ai-tooriistad-vahetuvad-kiiresti-aga-vastutus-jaab-arendajale"></a>
## AI tööriistad vahetuvad kiiresti, aga vastutus jääb arendajale - `0:24:06`

Videos rõhutatakse, et AI tööriistu tuleb väga kiiresti juurde ja parim valik võib muutuda lausa nädalatega.

### Selgitus

Põhisõnum ei ole "kasuta ühte kindlat tööriista", vaid:

- tööriistad muutuvad kiiresti
- võrdlemine on normaalne
- plaani ja tulemuse kvaliteeti peab inimene ise hindama

See seob hästi kokku ka eelmise mõtte debuggingust: AI võib aidata, aga arendaja peab aru saama, mida süsteem päriselt teeb.

### Skeem

```text
AI tööriist A
AI tööriist B
AI tööriist C
      ->
inimene võrdleb
inimene vastutab
```

### Koodinäide

```text
1. Küsi tööriistalt plaan
2. Küsi teiselt tööriistalt sama plaan
3. Võrdle
4. Kontrolli koodis ja testides
```

### Päriselu analoogia

See on nagu tööintervjuul mitme kandidaadi võrdlemine. CV üksi ei otsusta. Lõplik otsus on sinu vastutus.

<a id="muutuja-on-silt-mitte-asi-ise"></a>
## Muutuja on silt, mitte asi ise - `0:28:49`

See on video üks kõige tähtsamaid kontseptsioone. Õpetaja sõnastab muutuja ümber kui sildi, mitte lihtsalt "kasti".

### Selgitus

Muutuja nimi ei ole andmed ise. Muutuja on viis, kuidas programm saab mingi väärtuse või objekti poole pöörduda.

See aitab aru saada, miks:

- nimed on tähtsad
- ühele asjale saab viidata nime kaudu
- ilma sildita ei saa objektiga enam edasi töötada

### Skeem

```text
muutuja nimi
   |
   +-- silt
         |
         +-- viitab väärtusele või objektile
```

### Koodinäide

Vue komponendi `data()` plokk on hea näide siltidest:

```js
data() {
  return {
    username: '',
    password: '',
    errorMessage: '',
    loginResponse: {
      userId: 0,
      roleName: '',
    },
  }
}
```

Siin on `username`, `password` ja `errorMessage` sildid, mille kaudu komponent andmetele ligi pääseb.

### Päriselu analoogia

See on nagu kaustakapi silt. Silt ei ole dokument ise, aga ilma sildita on dokumenti palju raskem üles leida.

<a id="muutuja-defineerimine-ja-scope-annavad-konteksti"></a>
## Muutuja defineerimine ja scope annavad konteksti - `0:37:32`

Pärast sildi-ideed liigub video edasi selle juurde, kuidas uus muutuja üldse süsteemi tekib ja kui kaua ta "elab".

### Selgitus

Muutuja defineerimine tähendab sisuliselt:

- luuakse uus nimi
- see nimi kehtib mingis konkreetses plokis
- väljaspool seda plokki ei pruugi seda enam olemas olla

Seda nimetatakse scope'iks ehk nähtavuspiirkonnaks.

### Skeem

```text
{
  siin defineeritud muutuja elab siin
}

väljaspoole plokki
see nimi enam ei kehti
```

### Koodinäide

Selles projektis on komponendi andmed olemas üle meetodite `this` kaudu:

```js
allFormFieldsAreCorrect() {
  return this.username && this.password
}
```

`this.username` ja `this.password` on komponendi küljes olemas. Kui teeksid aga meetodi sees uue kohaliku muutuja, siis see elaks ainult selle meetodi või ploki piires.

### Päriselu analoogia

See on nagu külalistunnus kontoris. See kehtib ainult teatud ruumis või teatud ajani, mitte kogu majas igavesti.

<a id="vaartuse-andmine-ei-ole-sama-mis-vordlemine"></a>
## Väärtuse andmine ei ole sama mis võrdlemine - `0:42:50`

See on klassikaline algajate komistuskoht: väärtuse andmine ja võrdlemine näevad sarnased välja, aga tähendavad eri asju.

### Selgitus

Põhieristus on selline:

- `=` annab muutujale väärtuse
- `==` kontrollib, kas kaks asja on võrdsed

Videos rõhutatakse ka seda, et tekstiväärtuste võrdlemisel ei piisa alati lihtsalt `==`-st. Javas kasutatakse selleks sageli `.equals(...)`.

### Skeem

```text
=   -> pane väärtus sisse
==  -> küsi, kas need on võrdsed
.equals(...) -> võrdle sisu korrektselt
```

### Koodinäide

```java
String firstName = "Riho";   // väärtuse andmine

if (firstName.equals("Riho")) {
    System.out.println("Nimi klapib");
}
```

### Päriselu analoogia

`=` on nagu sildi kleepimine kaustale. `==` või `.equals(...)` on nagu kahe kausta sisu võrdlemine, et näha, kas need päriselt klapivad.

<a id="uks-silt-ei-saa-viidata-kahele-objektile-korraga"></a>
## Üks silt ei saa viidata kahele objektile korraga - `0:50:06`

Õpetaja rõhutab siin üht väga tähtsat mõttepiiri: silt ja objekt ei ole sama asi.

### Selgitus

Kui sul on korraga vaja rääkida kahest eri objektist, siis vajad kaht eri silti. Muidu kaob loetavus ära ja programm muutub segaseks.

See on põhjus, miks nimed nagu `accountFrom` ja `accountTo` on palju paremad kui üks udune `account`.

### Skeem

```text
accountFrom -> konto A
accountTo   -> konto B

mitte:
account -> konto A ja konto B korraga
```

### Koodinäide

```java
Account accountFrom = findFromAccount();
Account accountTo = findToAccount();
```

Kui sul oleks ainult üks `account`, siis peaksid kogu aeg mõtlema, millisest kontost jutt käib.

### Päriselu analoogia

Kui sul on kaks kruusi laual, siis sa ei kleebi mõlemale silti `kruus`. Sa paned näiteks `minu kruus` ja `külalise kruus`, et segadust ei tekiks.

<a id="pangaulekande-naide-seob-transferrequest-i-kontod-ja-saldod"></a>
## Pangaülekande näide seob `TransferRequest`-i, kontod ja saldod - `1:11:30`

See video keskmine suur näide aitab siduda muutujad, objektid, getterid, setterid ja meetodid üheks realistlikuks protsessiks.

### Selgitus

Loogika on järgmine:

- internetist tuleb sisse `TransferRequest`
- sellest saab kätte kasutaja ID, sihtkonto numbri ja summa
- süsteem peab leidma lähtekonto ja sihtkonto
- saldod tuleb lugeda välja, ümber arvutada ja tagasi salvestada

Just siin muutub sildi-idee väga praktiliseks. Kui sul ei ole eraldi nimesid `request`, `accountFrom`, `accountTo`, `amount`, siis kaob protsessi mõte käest.

### Skeem

```text
TransferRequest
  -> userId
  -> toAccountNumber
  -> amount

userId -> accountFrom
toAccountNumber -> accountTo

loe saldod
muuda saldosid
salvesta tagasi
```

### Koodinäide

```java
TransferRequest request = ...;

Account accountFrom = findByUserId(request.getUserId());
Account accountTo = findByAccountNumber(request.getToAccountNumber());

BigDecimal fromBalance = accountFrom.getBalance();
BigDecimal toBalance = accountTo.getBalance();

accountFrom.setBalance(fromBalance.subtract(request.getAmount()));
accountTo.setBalance(toBalance.add(request.getAmount()));
```

### Päriselu analoogia

See on nagu pangatöötaja laual kolm paberit:

- kliendi taotlus
- lähtekonto andmed
- sihtkonto andmed

Kui kõik paberid oleks nimega lihtsalt `paber`, siis läheks ülekanne kiiresti sassi.

<a id="juuniorit-on-endiselt-vaja-aga-ootus-on-laiem"></a>
## Juuniorit on endiselt vaja, aga ootus on laiem - `1:40:49`

Videos lükatakse ümber lihtne loosung "juuniore pole enam vaja". Sõnum on nüansirikkam.

### Selgitus

Põhimõte ei ole see, et juunior kaob ära. Pigem:

- juuniore on endiselt vaja
- aga ettevõte tahab tugevamat algtaset
- ainult süntaksist enam ei piisa

Oluline on laiem pilt:

- äriprotsess
- turvalisus
- arhitektuuri baas
- suhtlemine
- õppimisvõime

### Skeem

```text
vana ootus:
"oska natuke koodi"

uus ootus:
kood
+ äriloogika
+ suhtlus
+ analüüs
+ õppimisvõime
+ AI kasutamine
```

### Koodinäide

```text
Hea juunior ei küsi ainult:
"Kuidas see if kirjutada?"

Hea juunior küsib ka:
"Mis ärireegel siin kehtib?"
"Mis juhtub vigase sisendiga?"
"Kust see andmeobjekt tuleb?"
```

### Päriselu analoogia

See on nagu autojuhi palkamine. Ei piisa sellest, et inimene oskab rooli keerata. Ta peab lugema liiklust, tundma reegleid ja aru saama, mis ümberringi toimub.

<a id="projektipohine-ope-ja-ai-orkestreerimine-on-oige-suund"></a>
## Projektipõhine õpe ja AI orkestreerimine on õige suund - `2:09:51`

See on video üks strateegilisemaid osi. Õpetaja ütleb sisuliselt välja, et praegune õppevorm liigub õiges suunas.

### Selgitus

Validatsioon tuleb sellele, et:

- tehakse päris projekti
- tehakse tiimitööd
- harjutatakse suhtlust
- õpitakse AI-ga töövoogu ehitama
- õpitakse, kuidas ise juurde õppida

See on tähtis, sest tänapäeva arendaja väärtus ei ole ainult "oskan kirjutada rea koodi", vaid "oskan ehitada töövoogu, lahendada probleemi ja liikuda edasi".

### Skeem

```text
projekt
  + tiimitöö
  + suhtlus
  + AI kasutus
  + iseseisev õppimine
      ->
parem valmisolek päris tööks
```

### Koodinäide

```text
Tüüpiline projektitsükkel:
1. loe ülesanne
2. tee plaan
3. küsi AI-lt abi kitsas kohas
4. kontrolli tulemus ise üle
5. näita tiimile
6. paranda
```

### Päriselu analoogia

See on nagu õppida kokaks päris köögis, mitte ainult retseptiraamatut lugedes.

<a id="if-else-if-ja-else-juhivad-protsessi"></a>
## `if`, `else if` ja `else` juhivad protsessi - `2:11:57`

Siin liigub video tagasi programmeerimise tuuma juurde: kuidas süsteem teeb otsuseid.

### Selgitus

`if`-plokkide mõte ei ole ainult süntaks. Need on peamine viis, kuidas programm otsustab:

- mine vasakule või paremale
- tee midagi või ära tee
- kasuta üht või teist haru

Õpetaja rõhutab ka loogikatabeli mõtet: oluline ei ole ainult üks rida, vaid kõik võimalikud sisendolukorrad.

### Skeem

```text
tingimus
  -> true  -> tee A
  -> false -> tee B

mitu tingimust
  -> else if
  -> else
```

### Koodinäide

Selles projektis on väga selge mini-näide:

```js
login() {
  this.resetErrorMessage()

  if (this.allFormFieldsAreCorrect()) {
    // jätka sisselogimisega
  } else {
    this.errorMessage = 'Täida kõik väljad'
  }
}
```

See on täpselt protsessi juhtimine: ühel juhul liigud edasi, teisel juhul peatad voo ja näitad viga.

### Päriselu analoogia

See on nagu valgusfoor. Rohelisega liigud edasi, punasega peatad tegevuse.

<a id="eitavaid-meetodinimesid-tasub-valtida"></a>
## Eitavaid meetodinimesid tasub vältida - `2:24:21`

Õpetaja toob siin välja väga hea loetavusreegli: meetodi nimi peaks võimalusel olema jaatavas vormis.

### Selgitus

Miks see on kasulik:

- positiivset nime on lihtsam lugeda
- vajadusel saad tulemuse ümber pöörata `!` abil
- väldid topelteitust ja mõtlemisvigu

Näiteks:

- parem `hasDrivingLicense()`
- halvem `doesNotHaveDrivingLicense()`

### Skeem

```text
parem:
hasDrivingLicense()
!hasDrivingLicense()

halvem:
doesNotHaveDrivingLicense()
!doesNotHaveDrivingLicense()
```

### Koodinäide

```js
if (!user.hasDrivingLicense()) {
  sendReminder()
}
```

Sellist koodi on tavaliselt lihtsam lugeda kui pikka eitava nimega meetodit.

### Päriselu analoogia

See on nagu küsimus "Kas sul on võti?" Sellele on lihtne vastata. Küsimus "Kas sul ei ole mitte võtit?" ajab palju rohkem segadusse.

<a id="css-tootab-ainult-siis-kui-leht-stylesheeti-teab"></a>
## CSS töötab ainult siis, kui leht stylesheet'i teab - `2:43:46`

Videos tuletatakse meelde väga praktiline baasasi: CSS fail ei mõjuta HTML-i automaatselt. Leht peab sellest teadlik olema.

### Selgitus

Selektorid käivad HTML-i üle ja otsivad sobivaid elemente. Aga see töötab ainult siis, kui HTML fail seob vastava stylesheet'i sisse.

Seega on kaks eraldi küsimust:

- kas CSS reegel eksisteerib
- kas see HTML fail üldse teab sellest CSS failist

### Skeem

```text
HTML fail
  -> link stylesheet'ile
      -> CSS loetakse sisse
          -> selektorid otsivad elemente
              -> stiil rakendub
```

### Koodinäide

Selles projektis on ühendus olemas:

```html
<link rel="stylesheet" href="src/assets/style.css">
```

Ja CSS failis on näiteks:

```css
body {
  background-color: aqua;
}
```

Kui link puudub, siis `body` ei muutu sellest reeglist teadlikuks.

### Päriselu analoogia

See on nagu valjuhääldi. Sul võib olla valmis kõne, aga kui sa seda kõlariga ei ühenda, siis saalis keegi seda ei kuule.

<a id="javascriptis-let-const-parameetrid-ja-return-kaituvad-teisiti-kui-javas"></a>
## JavaScriptis `let`, `const`, parameetrid ja `return` käituvad teisiti kui Javas - `2:46:33`

Selles osas tehakse mitu kasulikku võrdlust Java ja JavaScripti vahel.

### Selgitus

Põhipunktid:

- Java on kompileeritav ja tüübiteadlikum
- JavaScript on interpreteeritav ja paindlikum
- `let` tähendab, et sidumine võib hiljem muutuda
- `const` tähendab, et sama sidumist enam ümber ei seota
- JavaScript ei kaitse sind alati sama rangelt nagu Java

Samuti rõhutatakse, et funktsioonid ja meetodid on sisuliselt nimelised koodilõigud, mida saab nime järgi välja kutsuda.

### Skeem

```text
Java:
tüüp + kompilaator + rangem kontroll

JavaScript:
let / const + paindlikum käitumine + rohkem vastutust arendajale
```

### Koodinäide

Selles projektis on hea `const` näide Pinia store'ist:

```js
const count = ref(0)
const doubleCount = computed(() => count.value * 2)

function increment() {
  count.value++
}
```

Siin:

- `count` on nimi, mis viitab ref-objektile
- ref-i sees olev väärtus võib muutuda
- nime `count` ennast ei seota ümber mingi teise objektiga

### Päriselu analoogia

`const` on nagu kindla nimega võtmehoidja, kuhu kuuluvad kindlad võtmed. Sa võid mõne võtme asendisse midagi muuta, aga sa ei vaheta kogu võtmehoidjat salaja teiseks.

<a id="meetod-ei-tea-oma-valisest-elust-midagi-ja-tagastus-tuleb-kinni-puuda"></a>
## Meetod ei tea oma välisest elust midagi ja tagastus tuleb kinni püüda - `2:59:45`

See on video kõige olulisem lõputeema. Siin pannakse kokku meetodi piirid, parameetrid, `return`, muutuja-sildi idee ja niinimetatud "meetodi palve".

### Selgitus

Põhisõnum on mitmeosaline:

- meetod ei tea oma välisest kontekstist midagi
- kõik vajalik info tuleb talle anda parameetrite kaudu
- kui meetod tagastab midagi ja sa tahad sellega edasi töötada, seo see muutujaga
- meetodi nimi ei tohi valetada selle kohta, mida ta teeb või tagastab

See on algajale kriitiline, sest väga paljud vead ei tule mitte sellest, et meetod oleks vale, vaid sellest, et tagastatud tulemust ei seota ühegi nimega.

### Skeem

```text
sisend -> meetod -> return
             |
             +-- ei tea välisest elust midagi

caller:
result = methodCall(...)
```

### Koodinäide

```js
function square(n) {
  return n * n
}

const result = square(2)
```

Ja sama mõte panga näites:

```java
Account account = accountRepository.findAccountByUserId(userId);
```

Kui sa jätad vasaku poole ära, siis said küll vastuse, aga sul ei ole enam silti, mille kaudu selle vastusega edasi töötada.

### Päriselu analoogia

See on nagu kuller, kes toob sulle paki. Kui sa paki vastu ei võta ega pane seda enda nime alla lauale, siis pakk justkui käis läbi, aga sul ei ole hiljem enam midagi kasutada.

## Kokkuvõte

See video ühendab kolm eri tasandit üheks tervikuks:

- praktiline töövoog transkriptide, skillide, WSL-i, Dockeri ja debugginguga
- laiem arusaam sellest, millist arendajat ettevõtted praegu vajavad
- väga oluline programmeerimisbaas: muutuja kui silt, `if`-loogika, meetodid, `return` ja tagastusväärtuse sidumine muutujaga

Kui sellest videost võtta kaasa ainult kolm asja, siis need võiksid olla:

- korduv töö tasub standardiseerida skilliks või töövooguks
- muutuja on silt, mille kaudu sa andmetega suhtled
- kui meetod tagastab sulle info ja sa tahad seda kasutada, siis pane see muutujasse
