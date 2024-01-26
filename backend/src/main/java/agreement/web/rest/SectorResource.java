package agreement.web.rest;

import agreement.domain.Sector;
import agreement.service.SectorService;
import jakarta.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * REST controller for managing {@link Sector}.
 */
@Slf4j
@RestController
@RequestMapping("/api/sectors")
@RequiredArgsConstructor
public class SectorResource {

    private final SectorService sectorService;

    /**
     * {@code POST  /sectors} : Create a new sector.
     *
     * @param sector the sector to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new sector, or with status {@code 400 (Bad Request)} if the sector has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping
    public ResponseEntity<Sector> createSector(@Valid @RequestBody Sector sector) throws URISyntaxException {
        log.info("REST request to save Sector : {}", sector);
        Sector result = sectorService.save(sector);
        return ResponseEntity.created(new URI("/api/sectors/" + result.getId())).body(result);
    }

    /**
     * {@code PUT  /sectors/:id} : Updates an existing sector.
     *
     * @param id the id of the sector to save.
     * @param sector the sector to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated sector,
     * or with status {@code 400 (Bad Request)} if the sector is not valid,
     * or with status {@code 500 (Internal Server Error)} if the sector couldn't be updated.
     */
    @PutMapping("/{id}")
    public ResponseEntity<Sector> updateSector(
        @PathVariable(value = "id", required = false) final Long id,
        @Valid @RequestBody Sector sector
    ) {
        log.info("REST request to update Sector : {}, {}", id, sector);
        Sector result = sectorService.save(sector);
        return ResponseEntity.ok().body(result);
    }

    /**
     * {@code GET  /sectors} : get all the sectors.
     *
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of sectors in body.
     */
    @GetMapping
    public List<Sector> getAllBaseSectors() {
        log.info("REST request to get all Sectors");
        return sectorService.getAllBaseSectors();
    }

    /**
     * {@code GET  /sectors/:id} : get the "id" sector.
     *
     * @param id the id of the sector to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the sector, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public ResponseEntity<Sector> getSector(@PathVariable("id") Long id) {
        log.info("REST request to get Sector : {}", id);
        Optional<Sector> sector = sectorService.findOne(id);
        return ResponseEntity.ok(sector.get());
    }

    /**
     * {@code DELETE  /sectors/:id} : delete the "id" sector.
     *
     * @param id the id of the sector to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSector(@PathVariable("id") Long id) {
        log.info("REST request to delete Sector : {}", id);
        sectorService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
