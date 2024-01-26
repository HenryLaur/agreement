package agreement.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import lombok.Data;

/**
 * A Agreement.
 */
@Data
@Entity
@Table(name = "agreement")
public class Agreement implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    @Column(name = "id")
    private Long id;

    @NotNull
    @NotBlank
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @AssertTrue
    @Column(name = "is_agreed", nullable = false)
    private Boolean isAgreed;

    @NotNull
    @Size(min = 1)
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "rel_agreement__sector",
        joinColumns = @JoinColumn(name = "agreement_id"),
        inverseJoinColumns = @JoinColumn(name = "sector_id")
    )
    @JsonIgnoreProperties(value = { "children", "parent", "agreements" }, allowSetters = true)
    private Set<Sector> sectors = new HashSet<>();

    @Override
    public int hashCode() {
        // see https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
        return getClass().hashCode();
    }
}
