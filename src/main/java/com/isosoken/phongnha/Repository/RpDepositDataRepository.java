package com.isosoken.phongnha.Repository;

import com.isosoken.phongnha.model.RpDepositData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RpDepositDataRepository extends JpaRepository<RpDepositData, Long> {

    void deleteAllByImportMonth(String importMonth);

    RpDepositData findFirstByCustomerCodeAndImportMonth(Long customerCode, String importMonth);
}