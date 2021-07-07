package com.isosoken.phongnha.Repository;

import com.isosoken.phongnha.model.NssDepositData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NssDepositDataRepository extends JpaRepository<NssDepositData, Long> {

    void deleteAllByImportMonth(String importMonth);

    NssDepositData findFirstBySubscriberCodeAndImportMonth(Long subscriberCode, String importMonth);
}
