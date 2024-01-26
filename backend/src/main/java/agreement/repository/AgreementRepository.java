package agreement.repository;

import agreement.domain.Agreement;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the Agreement entity.
 */
@Repository
public interface AgreementRepository extends JpaRepository<Agreement, Long> {}
