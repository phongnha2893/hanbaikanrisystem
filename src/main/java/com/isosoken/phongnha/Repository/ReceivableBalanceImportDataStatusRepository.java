package com.isosoken.phongnha.Repository;

import com.isosoken.phongnha.common.Constants;
import com.isosoken.phongnha.model.ReceivableBalanceImportDataStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReceivableBalanceImportDataStatusRepository extends JpaRepository<ReceivableBalanceImportDataStatus, Long> {

    List<ReceivableBalanceImportDataStatus> findAllByImportMonthAndType(String importMonth, Constants.RECEIVABLE_BALANCE_IMPORT_TYPE type);

    List<ReceivableBalanceImportDataStatus> findAllByTypeAndStatus(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE type, Constants.RECEIVABLE_BALANCE_IMPORT_STATUS status);

}
