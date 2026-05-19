package ee.bcs.backend.persistence.chainimage;

import ee.bcs.backend.persistence.chain.Chain;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "chain_image", schema = "kutus")
public class ChainImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "chain_id", nullable = false)
    private Chain chain;

    @NotNull
    @Column(name = "logo", nullable = false)
    private byte[] logo;


}