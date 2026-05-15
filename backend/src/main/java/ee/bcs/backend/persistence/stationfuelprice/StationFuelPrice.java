package ee.bcs.backend.persistence.stationfuelprice;

import ee.bcs.backend.persistence.stationfuel.StationFuel;
import ee.bcs.backend.persistence.user.User;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "station_fuel_price", schema = "kutus")
public class StationFuelPrice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "station_fuel_id", nullable = false)
    private StationFuel stationFuel;

    @NotNull
    @Column(name = "price", nullable = false, precision = 4, scale = 3)
    private BigDecimal price;

    @NotNull
    @Column(name = "\"time\"", nullable = false)
    private Instant time;


}