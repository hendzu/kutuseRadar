# Java: Service kihi koostamine — kutuseRadar mustrid

## 1. Service klassi alus

Iga service vajab kolme asja: `@Service`, `@RequiredArgsConstructor` ja `private final` väljad injectimiseks.

```java
@Service
@RequiredArgsConstructor
public class ChainService {
    private final ChainRepository chainRepository;
    private final ChainMapper chainMapper;
}
```

**`@RequiredArgsConstructor`** — Lombok genereerib konstruktori kõikide `private final` väljade jaoks. Spring injekteerib need automaatselt. `@Autowired` pole vaja.

**Mida injectida:**
- Repository — andmete lugemiseks/kirjutamiseks
- Mapper — entiteedi → DTO teisenduseks
- Teine service — kui vajad teise domeeni loogikat (nt `MembershipService` → `StationService`-s)

---

## 2. Lihtsaim meetod — list kõigist aktiivsest

Kõige levinum muster: too aktiivsed read, teisenda DTOdeks, tagasta.

```java
public List<ChainOptionDto> getActiveChains() {
    List<Chain> chains = chainRepository.findByStatus(Status.ACTIVE.getCode());
    return chainMapper.toChainOptionDtos(chains);
}
```

**Sammud:**
1. Kutsu repo meetodit `Status.ACTIVE.getCode()` filtriga (`"A"`)
2. Anna tulemus mapperile
3. Tagasta DTO list

**Millal mapper, millal for-tsükkel:**  
Mapper sobib kui kõik DTO väljad tulevad ühest entiteedist. For-tsükkel sobib kui on vaja lisaarvutusi või -tingimusi iga elemendi kohta.

---

## 3. Meetod nullable userId-ga

Mitmel endpoint-il on `userId` valikuline — külalisvaataja ei pea olema sisse logitud.

```java
public List<UserMembership> getUserMemberships(Integer userId) {
    return userMembershipRepository.findValidMembershipChainDiscountBy(userId, Status.ACTIVE.getCode());
}
```

Kui `userId` võib puududa, tee kontroll enne repo kutset:

```java
private List<UserMembership> findUserMemberships(Integer userId) {
    if (userId != null) {
        return membershipService.getUserMemberships(userId);
    }
    return new ArrayList<>();
}
```

**Reegel:** ära eelda et `userId` on alati olemas. Kontrolli `null` enne kasutamist.

---

## 4. Olemasoleva meetodi peal ehitamine

Kui servicel on juba meetod mis toob entiteete, ehita DTOd tagastav meetod selle peale:

```java
// Olemasolev — tagastab entiteete (kasutatakse teiste servicete poolt)
public List<UserMembership> getUserMemberships(Integer userId) {
    return userMembershipRepository.findValidMembershipChainDiscountBy(userId, Status.ACTIVE.getCode());
}

// Uus — tagastab DTOsid (kasutatakse controlleri poolt)
public List<UserMembershipDto> getUserMembershipDtos(Integer userId) {
    List<UserMembership> userMemberships = getUserMemberships(userId);
    return userMembershipMapper.toUserMembershipDtos(userMemberships);
}
```

**Miks kaks meetodit?**  
Entiteete tagastav meetod on vajalik teistele servicetele (nt `StationService` vajab `UserMembership` objekte et rakendada allahindlusi). DTO meetod on ainult controlleri jaoks.

---

## 5. Lisamine (POST loogika)

Uue rea lisamine andmebaasi:

```java
public MessageResponseDto addFavorite(Integer stationId, Integer userId) {
    FavoriteStation favoriteStation = new FavoriteStation();
    favoriteStation.setStation(stationRepository.getReferenceById(stationId));
    favoriteStation.setUser(userRepository.getReferenceById(userId));
    favoriteStationRepository.save(favoriteStation);
    return new MessageResponseDto("Lemmikjaam lisatud!");
}
```

**`getReferenceById` vs `findById`:**
- `getReferenceById` — tagastab proxy ilma SELECT-ita, sobib FK seadmiseks
- `findById` — teeb SELECT, tagastab `Optional`, sobib kui vajad objekti andmeid

**Reegel:** FK seadmisel (setStation, setUser) kasuta `getReferenceById` — andmebaasipäring toimub hiljem `save()` ajal.

---

## 6. Kustutamine (DELETE loogika)

```java
public MessageResponseDto deleteFavorite(Integer stationId, Integer userId) {
    favoriteStationRepository.deleteByUser_IdAndStation_Id(userId, stationId);
    return new MessageResponseDto("Lemmikjaam kustutatud!");
}
```

Spring Data `deleteBy` meetod genereerib DELETE päringu automaatselt — `@Query` pole vaja.

---

## 7. Mitmeallikaline meetod — plokk ploki haaval

Keerukamad meetodid koosnevad järjestikustest sammudest. Igal sammul on selge eesmärk:

```java
public StationDto getStationDetail(Integer stationId, Integer userId) {

    // PLOKK 1 — põhiobjekt, millest kõik sõltub
    Station station = stationRepository.findById(stationId)
            .orElseThrow(() -> new DataNotFoundException("Jaama ei leitud", 404));

    // PLOKK 2 — boolean kontroll
    boolean isFavorite = userId != null &&
            favoriteStationRepository.existsByUser_IdAndStation_Id(userId, stationId);

    // PLOKK 3 — valikuline andmeplokk (võib olla null)
    String chainLogo = null;
    ChainImage chainImage = chainImageRepository.findByChain_Id(station.getChain().getId()).orElse(null);
    if (chainImage != null) {
        chainLogo = Base64.getEncoder().encodeToString(chainImage.getLogo());
    }

    // PLOKK 4 — list + töötlus
    List<StationFuelPrice> prices = stationFuelPriceRepository
            .findLatestPriceByStationId(stationId, Status.ACTIVE.getCode());
    List<UserMembership> userMemberships = findUserMemberships(userId);
    for (StationFuelPrice price : prices) {
        applyMembershipDiscount(price, userMemberships);
    }

    // PLOKK 5 — DTO koostamine kõigist eelnevatest andmetest
    StationDto dto = new StationDto();
    dto.setStationId(stationId);
    dto.setStationName(station.getName());
    dto.setStationFavorite(isFavorite);
    dto.setChainName(station.getChain().getName());
    dto.setChainLogo(chainLogo);
    return dto;
}
```

**Mõtlemise järjekord enne kirjutamist:**
1. Mis andmed tulevad sisendina?
2. Mis andmed pean andmebaasist tooma ja millises järjekorras?
3. Mis töötlust pean tegema (filtrid, allahindlused, teisendused)?
4. Kuidas panen DTO kokku?

---

## 8. Abimeetodid (private)

Korduv loogika tõsta eraldi `private` meetodisse:

```java
private List<UserMembership> findUserMemberships(Integer userId) {
    if (userId != null) {
        return membershipService.getUserMemberships(userId);
    }
    return new ArrayList<>();
}

private static void applyMembershipDiscount(StationFuelPrice price, List<UserMembership> memberships) {
    Integer chainId = price.getStationFuel().getStation().getChain().getId();
    for (UserMembership membership : memberships) {
        if (membership.getMembership().getChain().getId().equals(chainId)) {
            price.setPrice(price.getPrice().subtract(membership.getMembership().getDiscount()));
        }
    }
}
```

`private static` — kui meetod ei kasuta `this` (ei vajao instance välju), lisa `static`.

---

## Kokkuvõte

| Olukord | Muster |
|---|---|
| Lihtne list | `repo.findByStatus(ACTIVE)` → `mapper.toDtos(list)` |
| Nullable userId | Kontrolli `if (userId != null)` enne repo kutsumist |
| Kaks meetodit samale andmele | Entiteeti tagastav (teistele servicetele) + DTOd tagastav (controllerile) |
| FK seadmine | `getReferenceById` (ilma SELECT-ita) |
| Kustutamine | `deleteBy` meetod repots — `@Query` pole vaja |
| Mitme allika DTO | Koosta käsitsi `dto.setX()` — mapper ei sobi |
| Korduv loogika | `private` abimeetod |
