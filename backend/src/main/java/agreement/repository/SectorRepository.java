package agreement.repository;

import agreement.domain.Sector;
import java.util.List;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the Sector entity.
 */
@SuppressWarnings("unused")
@Repository
public interface SectorRepository extends JpaRepository<Sector, Long> {
    @Query("SELECT s FROM Sector s WHERE s.parent IS NULL")
    List<Sector> getAllWithParent();
}
