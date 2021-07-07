package com.isosoken.phongnha.service.impl;

import com.isosoken.phongnha.Repository.ReceivableBalanceImportDataStatusRepository;
import com.isosoken.phongnha.common.Constants;
import com.isosoken.phongnha.model.ReceivableBalanceImportDataStatus;
import com.isosoken.phongnha.service.ReceivableBalanceImportDataStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Scope(proxyMode = ScopedProxyMode.DEFAULT)
@Transactional
public class ReceivableBalanceImportDataStatusServiceImpl implements ReceivableBalanceImportDataStatusService {
    @Autowired
    private ReceivableBalanceImportDataStatusRepository receivableBalanceImportDataStatusRepository;

    @Override
    public List<ReceivableBalanceImportDataStatus> getAllMaeukekinImportStatusDone() {
        return receivableBalanceImportDataStatusRepository.findAllByTypeAndStatus(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.URIKAKEZANDAKA,
                Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.DONE);
    }

    @Override
    public List<String> getAllUrikakezandakauchiwakeImportStatusDone() {
        List<String> urikakezandakaDoneMonth = receivableBalanceImportDataStatusRepository
                .findAllByTypeAndStatus(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.URIKAKEZANDAKA,
                        Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.DONE).stream().map(ReceivableBalanceImportDataStatus::getImportMonth)
                .collect(Collectors.toList());
        List<String> rpDoneMonth = receivableBalanceImportDataStatusRepository
                .findAllByTypeAndStatus(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.RP,
                        Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.DONE).stream().map(ReceivableBalanceImportDataStatus::getImportMonth)
                .collect(Collectors.toList());
        List<String> nssDoneMonth = receivableBalanceImportDataStatusRepository
                .findAllByTypeAndStatus(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.NSS,
                        Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.DONE).stream().map(ReceivableBalanceImportDataStatus::getImportMonth)
                .collect(Collectors.toList());

        List<String> commonMonth = new ArrayList<>(urikakezandakaDoneMonth);
        commonMonth.retainAll(rpDoneMonth);
        commonMonth.retainAll(nssDoneMonth);
        return commonMonth;
    }
}
