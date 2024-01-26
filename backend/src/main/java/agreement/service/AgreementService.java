package agreement.service;

import agreement.domain.Agreement;
import agreement.repository.AgreementRepository;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link Agreement}.
 */
@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class AgreementService {

    private final AgreementRepository agreementRepository;

    /**
     * Save a agreement.
     *
     * @param agreement the entity to save.
     * @return the persisted entity.
     */
    public Agreement save(Agreement agreement) {
        log.info("Request to save Agreement : {}", agreement);
        return agreementRepository.save(agreement);
    }

    /**
     * Get all the agreements.
     *
     * @return the list of entities.
     */
    @Transactional(readOnly = true)
    public List<Agreement> findAll() {
        log.info("Request to get all Agreements");
        return agreementRepository.findAll();
    }

    /**
     * Get one agreement by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Optional<Agreement> findOne(Long id) {
        log.info("Request to get Agreement : {}", id);
        return agreementRepository.findById(id);
    }

    /**
     * Delete the agreement by id.
     *
     * @param id the id of the entity.
     */
    public void delete(Long id) {
        log.info("Request to delete Agreement : {}", id);
        agreementRepository.deleteById(id);
    }
}
