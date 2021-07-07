package com.isosoken.phongnha.service;

import javax.servlet.http.HttpServletResponse;

public interface ReceivableImportDataHistoryService {

    void exportMaeukekinFile(HttpServletResponse httpServletResponse, String... args);

    void exportUrikazandakauchiwakeFile(HttpServletResponse httpServletResponse, String... args);

}
