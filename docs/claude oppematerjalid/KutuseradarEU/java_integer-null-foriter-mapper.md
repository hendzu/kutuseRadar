# Java: Integer vs int, for-tsükkel listi filtreerimisel, MapStruct

## 1. `int` vs `Integer` — miks see loeb

Java-s on kahte tüüpi "arv":

| | `int` | `Integer` |
|---|---|---|
| Tüüp | primitiiv | objekt |
| Saab olla `null`? | ❌ | ✅ |
| Vaikeväärtus | `0` | `null` |

**Probleem praktikas:**

Spring'i `@RequestParam(required = false)` tähendab, et parameeter võib puududa — ehk väärtus on `null`. Kui meetodi signatuuris on `int`, ei saa Spring sinna `null` panna ja viskab vea:

```
Optional int parameter 'userId' is present but cannot be translated into a null value
```

**Lahendus:** kasuta `Integer` (suure tähega) kõikjal, kus väärtus võib olla `null`:

```java
// ❌ vale — int ei saa olla null
public List<BestPriceDto> getBestPrices(@RequestParam(required = false) int userId)

// ✅ õige — Integer saab olla null
public List<BestPriceDto> getBestPrices(@RequestParam(required = false) Integer userId)
```

Sama kehtib service meetodis — tüübid peavad kattuma:

```java
public List<BestPriceDto> getBestPrices(Integer userId) {
    if (userId != null) {
        // tee midagi ainult siis kui userId on olemas
    }
}
```

---

## 2. For-tsükkel listi filtreerimisel

Tänases ülesandes tuli märkida kasutaja lemmikjaamad `favorite = true`. Loogika: käi kõik jaamad läbi ja vaata, kas see jaam on lemmikute listis.

```java
List<StationOptionDto> result = stationMapper.toStationOptionDtos(stations);

if (userId != null) {
    List<FavoriteStation> favorites = favoriteStationRepository.findFavoriteStationBy(userId);

    for (StationOptionDto dto : result) {           // iga jaama kohta...
        for (FavoriteStation favorite : favorites) { // ...vaata kõiki lemmikuid
            if (favorite.getStation().getId().equals(dto.getStationId())) {
                dto.setFavorite(true);               // kattub → märgi lemmikuks
            }
        }
    }
}
```

**Visuaalselt:**
```
jaamad:    [Alexela(1), CircleK(2), Olerex(3)]
lemmikud:  [CircleK(2), Olerex(3)]

Alexela(1) vs CircleK(2) → ei kattu
Alexela(1) vs Olerex(3)  → ei kattu  → favorite = false

CircleK(2) vs CircleK(2) → kattub!   → favorite = true
Olerex(3)  vs Olerex(3)  → kattub!   → favorite = true
```

**Miks `.equals()` ja mitte `==`?**  
`==` võrdleb objekti mäluaadressi, `.equals()` võrdleb väärtust. `Integer` objektide puhul kasuta alati `.equals()`.

---

## 3. MapStruct — Entity → DTO teisendus

MapStruct genereerib automaatselt koodi, mis kopeerib väljad ühest objektist teise. Sa kirjutad ainult interface'i:

```java
@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE,
        componentModel = MappingConstants.ComponentModel.SPRING)
public interface StationMapper {

    @Mapping(source = "id", target = "stationId")       // id → stationId (nimed erinevad)
    @Mapping(source = "name", target = "stationName")   // name → stationName
    @Mapping(target = "favorite", constant = "false")   // alati false vaikimisi
    StationOptionDto toStationOptionDto(Station station);

    List<StationOptionDto> toStationOptionDtos(List<Station> stations); // list → list
}
```

**Miks `@Mapping` ainult mõnedel väljadel?**  
Kui lähte- ja sihtvälja nimi on sama, MapStruct teeb selle automaatselt. `@Mapping` läheb vaja ainult siis, kui:
- nimed erinevad (`id` → `stationId`)
- tahad panna vaikeväärtuse (`constant = "false"`)

**`constant = "false"`** tähendab, et sõltumata sellest mis Entity-s on, pannakse DTO-sse alati `false`. Lemmiku lipp seatakse hiljem service kihis, mitte mapperis.

---

## Kokkuvõte

| Teema | Põhireegel |
|---|---|
| `int` vs `Integer` | Kui väärtus võib olla `null`, kasuta `Integer` |
| `null` kontroll | Enne `null`-võimaliku väärtuse kasutamist kontrolli `if (x != null)` |
| Kahekordne for | Kasulik kahe listi võrdlemisel — välimine käib läbi kõik, sisemine otsib vastavust |
| `.equals()` | Objektide võrdlemisel alati `.equals()`, mitte `==` |
| MapStruct | `@Mapping` ainult erinevate nimede või vaikeväärtuste jaoks |
