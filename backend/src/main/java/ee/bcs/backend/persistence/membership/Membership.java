package ee.bcs.backend.persistence.membership;

import ee.bcs.backend.persistence.chain.Chain;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "membership", schema = "kutus")
public class Membership {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "chain_id", nullable = false)
    private Chain chain;

    @NotNull
    @Column(name = "discount", nullable = false, precision = 4, scale = 3)
    private BigDecimal discount;

    @Size(max = 225)
    @NotNull
    @Column(name = "name", nullable = false, length = 225)
    private String name;
    @Size(max = 1)
    @NotNull
    @Column(name = "status", nullable = false, length = 1)
    private String status;


}