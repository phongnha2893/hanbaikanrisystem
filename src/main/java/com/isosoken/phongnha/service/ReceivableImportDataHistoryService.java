package com.isosoken.phongnha.service;

import javax.servlet.http.HttpServletResponse;

public interface ReceivableImportDataHistoryService {

    int exportMaeukekinFileLinks(String month, String fileType);

    int exportUrikazandakauchiwakeFileLinks(String month, String fileType);

    void exportMaeukekinFile(HttpServletResponse httpServletResponse, String monthExport, String type, Integer page);

    void exportUrikazandakauchiwakeFile(HttpServletResponse httpServletResponse, String month, String type, Integer page);

}
