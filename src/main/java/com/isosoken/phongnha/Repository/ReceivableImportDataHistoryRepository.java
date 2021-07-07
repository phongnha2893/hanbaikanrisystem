package com.isosoken.phongnha.Repository;

import com.isosoken.phongnha.model.ReceivableImportDataHistory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReceivableImportDataHistoryRepository extends JpaRepository<ReceivableImportDataHistory, Long> {

    void deleteAllByImportMonth(String importMonth);

    long countAllByImportMonthAndMonthBalanceIsLessThan(String importMonth, Long balance);

    long countAllByImportMonthAndMonthBalanceIsGreaterThan(String importMonth, Long balance);

    Page<ReceivableImportDataHistory> findAllByImportMonthAndMonthBalanceIsLessThan(Pageable pageable, String importMonth, Long balance);

    Page<ReceivableImportDataHistory> findAllByImportMonthAndMonthBalanceGreaterThan(Pageable pageable, String importMonth, Long balance);
}
