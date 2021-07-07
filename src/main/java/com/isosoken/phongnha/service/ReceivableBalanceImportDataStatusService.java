package com.isosoken.phongnha.service;

import com.isosoken.phongnha.model.ReceivableBalanceImportDataStatus;

import java.util.List;

public interface ReceivableBalanceImportDataStatusService {

    List<ReceivableBalanceImportDataStatus> getAllMaeukekinImportStatusDone();

    List<String> getAllUrikakezandakauchiwakeImportStatusDone();
}
