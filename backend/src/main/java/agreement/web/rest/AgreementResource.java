package agreement.web.rest;

import agreement.domain.Agreement;
import agreement.service.AgreementService;
import jakarta.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * REST controller for managing {@link Agreement}.
 */
@Slf4j
@RestController
@RequestMapping("/api/agreements")
@RequiredArgsConstructor
public class AgreementResource {

    private final AgreementService agreementService;

    /**
     * {@code POST  /agreements} : Create a new agreement.
     *
     * @param agreement the agreement to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new agreement, or with status {@code 400 (Bad Request)} if the agreement has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping
    public ResponseEntity<Agreement> createAgreement(@Valid @RequestBody Agreement agreement)
        throws URISyntaxException {
        log.info("REST request to save Agreement : {}", agreement);
        Agreement result = agreementService.save(agreement);
        return ResponseEntity.created(new URI("/api/agreements/" + result.getId())).body(result);
    }

    /**
     * {@code PUT  /agreements/:id} : Updates an existing agreement.
     *
     * @param id the id of the agreement to save.
     * @param agreement the agreement to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated agreement,
     * or with status {@code 400 (Bad Request)} if the agreement is not valid,
     * or with status {@code 500 (Internal Server Error)} if the agreement couldn't be updated.
     */
    @PutMapping("/{id}")
    public ResponseEntity<Agreement> updateAgreement(
        @PathVariable(value = "id", required = false) final Long id,
        @Valid @RequestBody Agreement agreement
    ) {
        log.info("REST request to update Agreement : {}, {}", id, agreement);
        Agreement result = agreementService.save(agreement);
        return ResponseEntity.ok().body(result);
    }

    /**
     * {@code GET  /agreements} : get all the agreements.
     *
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of agreements in body.
     */
    @GetMapping
    public List<Agreement> getAllAgreements() {
        log.info("REST request to get all Agreements");
        return agreementService.findAll();
    }

    /**
     * {@code GET  /agreements/:id} : get the "id" agreement.
     *
     * @param id the id of the agreement to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the agreement, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public ResponseEntity<Agreement> getAgreement(@PathVariable("id") Long id) {
        log.info("REST request to get Agreement : {}", id);
        Optional<Agreement> agreement = agreementService.findOne(id);
        return ResponseEntity.ok(agreement.get());
    }

    /**
     * {@code DELETE  /agreements/:id} : delete the "id" agreement.
     *
     * @param id the id of the agreement to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAgreement(@PathVariable("id") Long id) {
        log.info("REST request to delete Agreement : {}", id);
        agreementService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
