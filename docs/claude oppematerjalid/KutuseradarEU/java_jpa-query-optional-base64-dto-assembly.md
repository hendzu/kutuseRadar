# Java: @Query subpäring, Spring Data tuletatud meetodid, Optional, Base64, mitmeallikaline DTO

## 1. `@Query` — millal ja miks

Spring Data saab lihtsad päringud tuletada meetodi nimest:

```java
List<Station> findByStatus(String status); // → WHERE status = ?
```

Aga keerukamad päringud (subpäringud, agregatsioonid) tuleb kirjutada käsitsi `@Query` annotatsiooni sees JPQL keeles.

**Näide — viimane hind iga kütuse kohta konkreetses jaamas:**

```java
@Query("""
    SELECT s FROM StationFuelPrice s
    WHERE s.stationFuel.station.id = :stationId
      AND s.stationFuel.status = :status
      AND s.time = (
          SELECT MAX(s2.time) FROM StationFuelPrice s2
          WHERE s2.stationFuel = s.stationFuel
      )
    ORDER BY s.stationFuel.fuel.name ASC
    """)
List<StationFuelPrice> findLatestPriceByStationId(Integer stationId, String status);
```

**Subpäring `SELECT MAX(...)`** — leiab iga `stationFuel` kohta kõige hilisema aja. Põhipäring filtreerib ainult need read, mille `time` klapib maksimumiga. Tulemus: üks rida kütuse kohta.

**Navigeerimine läbi seoste JPQL-is:**  
`s.stationFuel.station.id` tähendab: mine `StationFuelPrice` → `stationFuel` → `station` → `id`. Java entiteediväljad, mitte SQL veerunimed.

---

## 2. Spring Data tuletatud meetodid — `existsBy` ja `deleteBy`

Spring Data oskab tuletada päringuid meetodite nimede põhjal ilma `@Query`-ta:

```java
// Kontrollib, kas rida eksisteerib
boolean existsByUser_IdAndStation_Id(Integer userId, Integer stationId);

// Kustutab vastava rea
void deleteByUser_IdAndStation_Id(Integer userId, Integer stationId);
```

**Nimetamise reegel:**
- `existsBy` / `deleteBy` / `findBy` — operatsioon
- `User_Id` — navigeeri `user` välja kaudu `id` väljale (alakriips = seos)
- `And` — mitu tingimust

Spring genereerib SQL automaatselt käivitamisel. `@Query` pole vaja.

---

## 3. `Optional` — kui väärtust ei pruugi olla

Repositooriumi `findById` ja `findByChain_Id` tagastavad `Optional<T>`, mitte otse objekti — sest andmebaasis ei pruugi vastavat rida olla.

**Kaks levinud kasutusviisi:**

```java
// 1. Viska erand kui ei leita
Station station = stationRepository.findById(stationId)
        .orElseThrow(() -> new DataNotFoundException("Jaama ei leitud", 404));

// 2. Tagasta null kui ei leita
ChainImage chainImage = chainImageRepository.findByChain_Id(chainId).orElse(null);
if (chainImage != null) {
    // kasuta chainImage-t
}
```

`getReferenceById` vs `findById`:
- `findById` — teeb kohe SELECT, tagastab `Optional`
- `getReferenceById` — tagastab proxy ilma SELECT-ita, sobib FK seadmiseks (nt `setStation(stationRepository.getReferenceById(id))`)

---

## 4. Base64 — binaarandmete saatmine JSON-is

Andmebaasis on logo salvestatud `bytea` (baidid). JSON ei toeta binaari — seetõttu teisendatakse baidid Base64 tekstiks:

```java
String chainLogo = Base64.getEncoder().encodeToString(chainImage.getLogo());
```

Frontend saab stringi kujul `"iVBORw0KGgo..."` ja kuvab selle pildina:
```html
<img :src="'data:image/png;base64,' + chainLogo" />
```

Import: `java.util.Base64`

---

## 5. `getStationDetail` meetod — plokk ploki haaval

Kogu meetod on üles ehitatud järjestikuste sammudena, kus iga plokk lisab DTO-sse ühe osa:

```java
public StationDto getStationDetail(Integer stationId, Integer userId) {

    // PLOKK 1 — lae jaam andmebaasist
    // Miks: kõik muud andmed sõltuvad sellest objektist (chain, nimi)
    // Miks orElseThrow: jaam peab eksisteerima, muidu pole mõtet edasi minna
    Station station = stationRepository.findById(stationId)
            .orElseThrow(() -> new DataNotFoundException("Jaama ei leitud", 404));

    // PLOKK 2 — kas jaam on kasutaja lemmik?
    // Miks: userId võib puududa (külalisvaataja) — siis isFavorite = false
    // existsBy tagastab true/false ilma tervet objekti laadimata
    boolean isFavorite = userId != null &&
            favoriteStationRepository.existsByUser_IdAndStation_Id(userId, stationId);

    // PLOKK 3 — lae keti logo ja teisenda Base64-ks
    // Miks null vaikeväärtus: logot ei pruugi olla — frontend peab seda arvestama
    // Miks eraldi tabel: logo on suur binaarfail, ei taheta seda iga päringu juures laadida
    String chainLogo = null;
    ChainImage chainImage = chainImageRepository.findByChain_Id(station.getChain().getId()).orElse(null);
    if (chainImage != null) {
        chainLogo = Base64.getEncoder().encodeToString(chainImage.getLogo());
    }

    // PLOKK 4 — lae jaama kütuste viimased hinnad ja rakenda liikmesuse allahindlus
    // Miks findUserMemberships enne: applyMembershipDiscount vajab liikmesuste listi
    // Miks applyMembershipDiscount enne mapimist: discount rakendatakse otse hinnale,
    //   et frontend saaks juba allahinnatud hinna — eraldi discount välja DTO-s pole vaja
    List<StationFuelPrice> prices = stationFuelPriceRepository
            .findLatestPriceByStationId(stationId, Status.ACTIVE.getCode());
    List<UserMembership> userMemberships = findUserMemberships(userId);
    for (StationFuelPrice price : prices) {
        applyMembershipDiscount(price, userMemberships);
    }
    List<StationFuelPriceDto> fuels = new ArrayList<>();
    for (StationFuelPrice price : prices) {
        fuels.add(stationFuelPriceMapper.toStationFuelPriceDto(price));
    }

    // PLOKK 5 — pane DTO kokku kõigist eelnevatest andmetest
    StationDto dto = new StationDto();
    dto.setStationId(stationId);
    dto.setStationName(station.getName());
    dto.setStationFavorite(isFavorite);
    dto.setChainName(station.getChain().getName());
    dto.setChainLogo(chainLogo);
    dto.setFuels(fuels);
    return dto;
}
```

**Miks selline järjekord?**  
Iga plokk on sõltumatu — kui ükski neist ebaõnnestub, viskab erand ja tagastab kliendile vea. Andmebaasi päringud on grupeeritud teema järgi, mitte segatult.

---

## 6. Mitmeallikaline DTO koostamine teenuses

Kui DTO väljad tulevad mitmest erinevast allikast, koostatakse DTO teenuses käsitsi — MapStruct ei sobi, sest see töötab ühe entiteedi → ühe DTO põhimõttel.

```
StationDto
├── stationId, stationName     ← stationRepository
├── stationFavorite            ← favoriteStationRepository
├── chainName, chainLogo       ← chainImageRepository
└── fuels (allahinnatud)       ← stationFuelPriceRepository + membershipService + mapper
```

```java
StationDto dto = new StationDto();
dto.setStationId(stationId);
dto.setStationName(station.getName());
dto.setStationFavorite(isFavorite);
dto.setChainName(station.getChain().getName());
dto.setChainLogo(chainLogo);
dto.setFuels(fuels);
return dto;
```

**Reegel:** kui DTO nõuab rohkem kui ühte repositooriumi, tee koostamine teenuses käsitsi.

---

## 6. For-tsükkel vs mapper listi teisendamisel

Kui on vaja list entiteete → list DTO-sid:

```java
// For-tsükkel (selgem, sobib algajale)
List<StationFuelPriceDto> fuels = new ArrayList<>();
for (StationFuelPrice price : prices) {
    fuels.add(stationFuelPriceMapper.toStationFuelPriceDto(price));
}
```

Mõlemad teevad sama asja — kasuta seda mis on arusaadavam.

---

## Kokkuvõte

| Teema | Põhireegel |
|---|---|
| `@Query` | Kasuta subpäringute ja keerukate filtrite jaoks, lihtsad päringud tuleta nimest |
| `existsBy` / `deleteBy` | Spring Data tuletab automaatselt — `@Query` pole vaja |
| `Optional.orElseThrow` | Kohustuslikud andmed — viska erand kui ei leita |
| `Optional.orElse(null)` | Valikulised andmed — kontrolli `null`-i enne kasutamist |
| `Base64` | Binaarandmete (pildid) saatmiseks JSON-is |
| Mitmeallikaline DTO | Koosta teenuses käsitsi, ära proovi mapperiga teha |
| Discount rakendamine | Rakenda allahindlus otse hinnale enne mapimist — eraldi `discount` väli DTO-s pole vaja |
