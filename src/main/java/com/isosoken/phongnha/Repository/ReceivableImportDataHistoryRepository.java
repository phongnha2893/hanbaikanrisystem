package com.isosoken.phongnha.Repository;

import com.isosoken.phongnha.model.ReceivableImportDataHistory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReceivableImportDataHistoryRepository extends JpaRepository<ReceivableImportDataHistory, Long> {

    List<ReceivableImportDataHistory> deleteAllByImportMonth(String importMonth);

    Page<ReceivableImportDataHistory> findAllByImportMonth(String importMonth, Pageable pageable);

    List<ReceivableImportDataHistory> findAllByImportMonthAndMonthBalanceIsLessThan(String importMonth, Long balance);

    List<ReceivableImportDataHistory> findAllByImportMonthAndMonthBalanceGreaterThan(String importMonth, Long balance);
}
