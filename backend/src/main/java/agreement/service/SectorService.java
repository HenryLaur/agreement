package agreement.service;

import agreement.domain.Sector;
import agreement.repository.SectorRepository;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link Sector}.
 */
@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class SectorService {

    private final SectorRepository sectorRepository;

    /**
     * Save a sector.
     *
     * @param sector the entity to save.
     * @return the persisted entity.
     */
    public Sector save(Sector sector) {
        log.info("Request to save Sector : {}", sector);
        return sectorRepository.save(sector);
    }

    /**
     * Get all the sectors.
     *
     * @return the list of entities.
     */
    @Transactional(readOnly = true)
    public List<Sector> getAllBaseSectors() {
        log.info("Request to get all Sectors");
        return sectorRepository.getAllWithParent();
    }

    /**
     * Get one sector by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Optional<Sector> findOne(Long id) {
        log.info("Request to get Sector : {}", id);
        return sectorRepository.findById(id);
    }

    /**
     * Delete the sector by id.
     *
     * @param id the id of the entity.
     */
    public void delete(Long id) {
        log.info("Request to delete Sector : {}", id);
        sectorRepository.deleteById(id);
    }
}
