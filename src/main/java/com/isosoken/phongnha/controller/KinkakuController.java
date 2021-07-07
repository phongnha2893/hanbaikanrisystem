package com.isosoken.phongnha.controller;

import com.isosoken.phongnha.common.storage.FileStorage;
import com.isosoken.phongnha.model.ReceivableBalanceImportDataStatus;
import com.isosoken.phongnha.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class KinkakuController {
    private static final Logger LOGGER = LoggerFactory.getLogger(KinkakuController.class);

    private static final String MAEUKEKIN_UPLOAD_DIR = "upload/maeukekin";
    private static final String URIKAKEZANDAKA_UCHIWAKE_UPLOAD_DIR = "upload/urikakezandakauchiwake";


    private FileStorage maeukekinStorage;
    private FileStorage urikakezandakauchiwakeStorage;
    private ReceivableImportDataHistoryService receivableImportDataHistoryService;
    private RpDepositDataService rpDepositDataService;
    private NssDepositDataService nssDepositDataService;
    private ReceivableBalanceImportDataStatusService receivableBalanceImportDataStatusService;

    @Autowired
    public KinkakuController(Environment env, ReceivableImportDataHistoryService receivableImportDataHistoryService,
                             RpDepositDataService rpDepositDataService, NssDepositDataService nssDepositDataService,
                             ReceivableBalanceImportDataStatusService receivableBalanceImportDataStatusService) {
        this.maeukekinStorage = new FileStorage(env, FileStorage.StorageType.LOCAL, MAEUKEKIN_UPLOAD_DIR);
        this.urikakezandakauchiwakeStorage = new FileStorage(env, FileStorage.StorageType.LOCAL, URIKAKEZANDAKA_UCHIWAKE_UPLOAD_DIR);
        this.receivableImportDataHistoryService = receivableImportDataHistoryService;
        this.rpDepositDataService = rpDepositDataService;
        this.nssDepositDataService = nssDepositDataService;
        this.receivableBalanceImportDataStatusService = receivableBalanceImportDataStatusService;
    }


    @GetMapping("/import-file/{fileType}")
    public String importFile(Model model, @PathVariable String fileType,
                             @ModelAttribute("success") String success, @ModelAttribute("error") String error) {
        model.addAttribute("success", success);
        model.addAttribute("error", error);
        switch (fileType) {
            case "maeukekin":
                return "maeukekin-import";
            case "urikakezandakauchiwake":
                return "urikakekin-uchiwake-import";
        }
        return "maeukekin-import";
    }

    @PostMapping(path = "/upload/{fileType}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public String uploadMaeukekinFile(@PathVariable String fileType, MultipartFile file, Model model) {
        if (file == null || file.isEmpty()) return importFile(model, fileType, null, "No file!");
        try {
            String fileName = file.getOriginalFilename();
            switch (fileType) {
                case "maeukekin":
                    maeukekinStorage.saveFile(fileName, file.getBytes());
                    break;
                case "urikakezandakauchiwake":
                    urikakezandakauchiwakeStorage.saveFile(fileName, file.getBytes());
                    break;
            }
            return importFile(model, fileType, uploadSuccessMessageBuilder(fileName, fileType), null);
        } catch (IOException e) {
            return importFile(model, fileType, null, e.getMessage());
        }
    }

    @GetMapping(path = "download/{fileType}/{fileName}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public void downloadUploadedFile(@PathVariable String fileType, @PathVariable String fileName, HttpServletResponse response) {
        File uploadDir = null;
        switch (fileType) {
            case "maeukekin":
                uploadDir = maeukekinStorage.getDir();
                break;
            case "urikakezandakauchiwake":
                uploadDir = urikakezandakauchiwakeStorage.getDir();
                break;
        }
        Path path = new File(uploadDir, fileName).toPath();
        if (path.toFile().exists()) {
            response.setContentType("plain/text");
            response.addHeader("Content-Disposition", "attachment; filename=" + fileName);
            try {
                Files.copy(path, response.getOutputStream());
                response.getOutputStream().flush();
            } catch (IOException ex) {
                LOGGER.error(ex.toString(), ex);
            }
        }
        return;
    }

    @GetMapping(path = "delete/{fileType}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public String deleteFile(@PathVariable String fileType, @PathVariable String fileName, Model model) {
        FileStorage fileStorage = null;
        switch (fileType) {
            case "maeukekin":
                fileStorage = maeukekinStorage;
                break;
            case "urikakezandakauchiwake":
                fileStorage = urikakezandakauchiwakeStorage;
                break;
        }
        boolean deleted = fileStorage.deleteFile(fileName);
        String success = deleted ? "Delete file success!" : null;
        String error = deleted ? null : "Delete file error!";

        return importFile(model, fileType, success, error);
    }

    @GetMapping(path = "process/{fileType}/{fileName}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public String processFile(@PathVariable String fileType, @PathVariable String fileName, Model model) throws Exception {
        FileStorage fileStorage = null;
        CommonFileService[] fileServices = null;
        switch (fileType) {
            case "maeukekin":
                fileStorage = maeukekinStorage;
                fileServices = new CommonFileService[]{(CommonFileService) receivableImportDataHistoryService};
                break;
            case "urikakezandakauchiwake":
                fileStorage = urikakezandakauchiwakeStorage;
                fileServices = new CommonFileService[]{(CommonFileService) receivableImportDataHistoryService,
                        (CommonFileService) rpDepositDataService, (CommonFileService) nssDepositDataService};
                break;
        }

        File excelUploadedFile = new File(fileStorage.getDir(), fileName);
        if (!excelUploadedFile.exists()) return importFile(model, fileType, null, "File not found!");

        try {
            for (CommonFileService fileService : fileServices) {
                fileService.readExcelFile(excelUploadedFile, fileType);
                fileService.excuteWhenReadSuccess(excelUploadedFile);
            }
            return importFile(model, fileType, "Process file success!", null);
        } catch (Exception e) {
            for (CommonFileService fileService : fileServices) {
                fileService.excuteWhenReadFailed(excelUploadedFile);
            }
            return importFile(model, fileType, null, e.getMessage());
        }
    }

    @GetMapping("/export-file/maeukekin")
    public String exportMaeukekin(Model model) {
        List<ReceivableBalanceImportDataStatus> importDataDoneList = receivableBalanceImportDataStatusService.getAllMaeukekinImportStatusDone();
        List<String> listMonths = importDataDoneList.stream().map(status -> status.getImportMonth()).collect(Collectors.toList());
        model.addAttribute("listMonths", listMonths);
        return "maeukekin-export";
    }

    @PostMapping(path = "/export/maeukekin")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public void downloadMaeukekin(@ModelAttribute("month") String month, @ModelAttribute("type") String type, HttpServletResponse response) {
        receivableImportDataHistoryService.exportMaeukekinFile(response, month, type);
    }


    @GetMapping("/export-file/urikakezandakauchiwake")
    public String exportUrikakekinUchiwake(Model model) {
        List<String> importDataDoneList = receivableBalanceImportDataStatusService.getAllUrikakezandakauchiwakeImportStatusDone();
        model.addAttribute("listMonths", importDataDoneList);
        return "urikakekin-uchiwake-export";
    }

    @PostMapping(path = "/export/urikakezandakauchiwake")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public void downloadUrikakezandakauchiwake(@ModelAttribute("month") String month, @ModelAttribute("type") String type, HttpServletResponse response) {
        receivableImportDataHistoryService.exportUrikazandakauchiwakeFile(response, month, type);
    }


    private String uploadSuccessMessageBuilder(String fileName, String fileType) {
        StringBuilder stringBuilder = new StringBuilder();

        stringBuilder.append("Uploaded file: ");
        stringBuilder.append("<a href=\"/download/" + fileType + "/" + fileName + "\">" + fileName + "</a> <span>&emsp;</span>");
        stringBuilder.append("<br/>");
        stringBuilder.append("<br/>");
        stringBuilder.append("<br/>");


        stringBuilder.append("<div class=\"button-style-four btn-mg-b-10 btn-mg-r\">");
        stringBuilder.append("<button type=\"button\" class=\"btn btn-custon-rounded-four btn-success\">");
        stringBuilder.append("<a href=\"/process/" + fileType + "/" + fileName + "\">" + "Process file</a>").append("</button>");
        stringBuilder.append("<button type=\"button\" class=\"btn btn-custon-rounded-four btn-danger\">");
        stringBuilder.append("<a href=\"/delete/" + fileType + "/" + fileName + "\">" + "Delete file</a>").append("</button>");
        stringBuilder.append("<button type=\"button\" class=\"btn btn-custon-rounded-four btn-warning\">");
        stringBuilder.append("<a href=\"/import-file/" + fileType + "\">" + "Cancel</a>").append("</button>");
        stringBuilder.append("</div>");

        return stringBuilder.toString();
    }

}
