package com.isosoken.phongnha.service.impl;

import com.isosoken.phongnha.Repository.*;
import com.isosoken.phongnha.common.Constants;
import com.isosoken.phongnha.common.tool.Excel2pdf;
import com.isosoken.phongnha.model.*;
import com.isosoken.phongnha.service.CommonFileService;
import com.isosoken.phongnha.service.ReceivableImportDataHistoryService;
import com.spire.xls.PaperSizeType;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class ReceivableImportDataHistoryServiceImpl implements ReceivableImportDataHistoryService, CommonFileService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ReceivableImportDataHistoryServiceImpl.class);
    private static final int BATCH_SIZE = 100;
    @Autowired
    private ReceivableImportDataHistoryRepository receivableImportDataHistoryRepository;
    @Autowired
    private ReceivableBalanceImportDataStatusRepository receivableBalanceImportDataStatusRepository;
    @Autowired
    private NssDepositDataRepository nssDepositDataRepository;
    @Autowired
    private RpDepositDataRepository rpDepositDataRepository;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private Excel2pdf excel2pdf;

    @Override
    public void readExcelFile(File file, String fileType) throws Exception {
        if (file == null || !file.exists()) throw new Exception("File not found!");
        XSSFWorkbook workbook = new XSSFWorkbook(file);
        Sheet sheet = workbook.getSheet("売掛金残高一覧表");
        String importMonthCell = sheet.getRow(1).getCell(0).getStringCellValue();

        String importMonth = getImportMonthFromCell(importMonthCell);
        if (StringUtils.isEmpty(importMonth)) throw new Exception("Import month must not be null!");

        List<ReceivableBalanceImportDataStatus> importDataStatusList = receivableBalanceImportDataStatusRepository.findAllByImportMonthAndType(importMonth, Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.URIKAKEZANDAKA);

        ReceivableBalanceImportDataStatus importDataStatus = null;
        if (!CollectionUtils.isEmpty(importDataStatusList)) {
            importDataStatus = importDataStatusList.get(0);
            switch (importDataStatus.getStatus()) {
                case IN_PROGRESS:
                    throw new Exception("File is being processed!");
                case DONE:
//                    throw new Exception("File has been imported before!");
                    return;
                case ERROR:
                    receivableImportDataHistoryRepository.deleteAllByImportMonth(importMonth);
                    importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.IN_PROGRESS);
                    receivableBalanceImportDataStatusRepository.save(importDataStatus);
            }
        } else {
            importDataStatus = receivableBalanceImportDataStatusRepository.save(
                    new ReceivableBalanceImportDataStatus(importMonth,
                            Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.URIKAKEZANDAKA,
                            Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.IN_PROGRESS));
        }

        Iterator<Row> rowIterator = sheet.rowIterator();
        List<ReceivableImportDataHistory> batchSaveToDb = new ArrayList<>();

        boolean arrived = false;
        CellStyle errorStyle = creatErrorCellStyle(sheet);

        try {
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();

                if (row.getCell(0) == null) {
                    if (row.getCell(1) == null) continue;
                    if ("【総 合 計】".equals(row.getCell(1).getStringCellValue())) {
                        receivableImportDataHistoryRepository.saveAll(batchSaveToDb);
                        importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.DONE);
                        receivableBalanceImportDataStatusRepository.save(importDataStatus);
                        workbook.close();
                        return;
                    }
                }

                if (!arrived) {
                    if ("コード".equals(row.getCell(0).getStringCellValue())) {
                        arrived = true;
                        continue;
                    }
                }

                if (arrived) {
                    if (batchSaveToDb.size() == BATCH_SIZE) {
                        receivableImportDataHistoryRepository.saveAll(batchSaveToDb);
                        batchSaveToDb.clear();
                    }
                    Cell customerCode = row.getCell(0);
                    Cell customerName = row.getCell(1);
                    Cell previousMonthBalance = row.getCell(2);
                    Cell totalDepositMonth = row.getCell(3);
                    Cell balanceCarriedForward = row.getCell(4);
                    Cell saleAmountNotIncludeTax = row.getCell(5);
                    Cell tax = row.getCell(6);
                    Cell saleAmountTaxIncluded = row.getCell(7);
                    Cell monthBalance = row.getCell(8);

                    if (customerCode == null || customerName == null || previousMonthBalance == null
                            || totalDepositMonth == null || balanceCarriedForward == null || saleAmountNotIncludeTax == null
                            || tax == null || saleAmountTaxIncluded == null || monthBalance == null) {
                        row.createCell(0).setCellStyle(errorStyle);
                        importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.ERROR);
                        receivableBalanceImportDataStatusRepository.save(importDataStatus);
                        throw new Exception(new StringBuilder("Error in sheet 売掛金残高一覧表 on line " + (row.getRowNum() + 1))
                                .append("<a href=\"/download/" + fileType + "/" + file.getName() + "\">" + file.getName() + "</a>").toString());
                    }

                    Long customerCodeValue = (long) customerCode.getNumericCellValue();
                    String customerNameValue = customerName.getStringCellValue();
                    Long previousMonthBalanceValue = (long) previousMonthBalance.getNumericCellValue();
                    Long totalDepositMonthValue = (long) totalDepositMonth.getNumericCellValue();
                    Long balanceCarriedForwardValue = (long) balanceCarriedForward.getNumericCellValue();
                    Long saleAmountNotIncludeTaxValue = (long) saleAmountNotIncludeTax.getNumericCellValue();
                    Long taxValue = (long) tax.getNumericCellValue();
                    Long saleAmountTaxIncludedValue = (long) saleAmountTaxIncluded.getNumericCellValue();
                    Long monthBalanceValue = (long) monthBalance.getNumericCellValue();

                    Customer customer = customerRepository.findFirstByCustomerCode(customerCodeValue);
                    if (customer == null) {
                        customer = new Customer();
                        customer.setCustomerCode(customerCodeValue);
                        customer.setCustomerName(customerNameValue);
                        customerRepository.save(customer);
                    }

                    ReceivableImportDataHistory receivableImportDataHistory = new ReceivableImportDataHistory();
                    receivableImportDataHistory.setCustomerCode(customerCodeValue);
                    receivableImportDataHistory.setImportMonth(importMonth);
                    receivableImportDataHistory.setPreviousMonthBalance(previousMonthBalanceValue);
                    receivableImportDataHistory.setTotalDepositMonth(totalDepositMonthValue);
                    receivableImportDataHistory.setBalanceCarriedForward(balanceCarriedForwardValue);
                    receivableImportDataHistory.setSaleAmountNotIncludeTax(saleAmountNotIncludeTaxValue);
                    receivableImportDataHistory.setTax(taxValue);
                    receivableImportDataHistory.setSaleAmountTaxIncluded(saleAmountTaxIncludedValue);
                    receivableImportDataHistory.setMonthBalance(monthBalanceValue);
                    batchSaveToDb.add(receivableImportDataHistory);
                }
            }
        } catch (Exception e) {
            importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.URIKAKEZANDAKA);
            importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.ERROR);
            receivableBalanceImportDataStatusRepository.save(importDataStatus);
            throw new Exception("Error in sheet 売掛金残高一覧表 :" + e.getMessage());
        }
    }

    @Override
    public void excuteWhenReadSuccess(File file) {

    }

    @Override
    public void excuteWhenReadFailed(File file) {
//        FileInputStream fileInputStream = null;
//        Workbook workbook = null;
//        String importMonth = "";
//        try {
//            if (file != null && file.exists()) {
//                fileInputStream = new FileInputStream(file);
//                workbook = new XSSFWorkbook(file);
//                Sheet sheet = workbook.getSheetAt(0);
//                String importMonthCell = sheet.getRow(1).getCell(0).getStringCellValue();
//                importMonth = getImportMonthFromCell(importMonthCell);
//            }
//            List<ReceivableBalanceImportDataStatus> importDataStatusList = receivableBalanceImportDataStatusRepository.findAllByImportMonth(importMonth);
//            if (!CollectionUtils.isEmpty(importDataStatusList)) {
//                ReceivableBalanceImportDataStatus importDataStatus = importDataStatusList.get(0);
//                importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.ERROR);
//                receivableBalanceImportDataStatusRepository.save(importDataStatus);
//            }
//
//
//        } catch (Exception e) {
//            LOGGER.error(e.getMessage());
//        } finally {
//            try {
//                if (workbook != null) workbook.close();
//                if (fileInputStream != null) fileInputStream.close();
//            } catch (IOException e) {
//                LOGGER.error(e.getMessage());
//            }
//
//        }
    }

    @Override
    public void exportMaeukekinFile(HttpServletResponse httpServletResponse, String... args) {
        if (args == null || args.length == 0) return;
        String monthExport = args[0];
        String fileType = args[1];
        String[] times = monthExport.split("-");
        String year = times[0];
        String month = times[1];

        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("前受金一覧表");
        CellStyle numberStyle = createNumberWithCommaSeparatorCellStyle(sheet);

        Row firstRow = sheet.createRow(0);
        firstRow.createCell(0).setCellValue("前受金一覧表");
        Row secondRow = sheet.createRow(1);
        secondRow.createCell(0).setCellValue("対象期間:".concat(year).concat("年").concat(month).concat("月度"));
        Row thirdRow = sheet.createRow(2);
        thirdRow.createCell(0).setCellValue("（単位：　円）");
        Row fourthRow = sheet.createRow(3);
        fourthRow.createCell(3).setCellValue("当月入金");
        fourthRow.createCell(5).setCellValue("当月売上");

        Row fifthRow = sheet.createRow(4);
        fifthRow.createCell(0).setCellValue("コード");
        fifthRow.createCell(1).setCellValue("得意先名");
        fifthRow.createCell(2).setCellValue("前月前受金残高");
        fifthRow.createCell(3).setCellValue("入金合計");
        fifthRow.createCell(4).setCellValue("繰越残高");
        fifthRow.createCell(5).setCellValue("税抜売上額");
        fifthRow.createCell(6).setCellValue("消費税等");
        fifthRow.createCell(7).setCellValue("税込売上額");
        fifthRow.createCell(8).setCellValue("当月前受金残高");

        int rowIndex = 5;

        List<ReceivableImportDataHistory> receivableImportDataHistories = receivableImportDataHistoryRepository.findAllByImportMonthAndMonthBalanceIsLessThan(monthExport, 0l);
        if (CollectionUtils.isEmpty(receivableImportDataHistories)) return;
        Long sumPreviousMonthBalance = 0l;
        Long sumTotalDepositMonth = 0l;
        Long sumBalanceCarriedForward = 0l;
        Long sumSaleAmountNotIncludeTax = 0l;
        Long sumTax = 0l;
        Long sumSaleAmountTaxIncluded = 0l;
        Long sumMonthBalance = 0l;

        Cell cell;
        for (ReceivableImportDataHistory receivableImportDataHistory : receivableImportDataHistories) {
            Row row = sheet.createRow(rowIndex);
            row.createCell(0).setCellValue(receivableImportDataHistory.getCustomerCode());
            Customer customer = customerRepository.findFirstByCustomerCode(receivableImportDataHistory.getCustomerCode());
            row.createCell(1).setCellValue(customer != null ? customer.getCustomerName() : "");

            cell = row.createCell(2, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(-receivableImportDataHistory.getPreviousMonthBalance());
            sumPreviousMonthBalance = sumPreviousMonthBalance - receivableImportDataHistory.getPreviousMonthBalance();

            cell = row.createCell(3, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getTotalDepositMonth());
            sumTotalDepositMonth = sumTotalDepositMonth + receivableImportDataHistory.getTotalDepositMonth();

            cell = row.createCell(4, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(-receivableImportDataHistory.getBalanceCarriedForward());
            sumBalanceCarriedForward = sumBalanceCarriedForward - receivableImportDataHistory.getBalanceCarriedForward();

            cell = row.createCell(5, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getSaleAmountNotIncludeTax());
            sumSaleAmountNotIncludeTax = sumSaleAmountNotIncludeTax + receivableImportDataHistory.getSaleAmountNotIncludeTax();

            cell = row.createCell(6, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getTax());
            sumTax = sumTax + receivableImportDataHistory.getTax();

            cell = row.createCell(7, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getSaleAmountTaxIncluded());
            sumSaleAmountTaxIncluded = sumSaleAmountTaxIncluded + receivableImportDataHistory.getSaleAmountTaxIncluded();

            cell = row.createCell(8, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(-receivableImportDataHistory.getMonthBalance());
            sumMonthBalance = sumMonthBalance - receivableImportDataHistory.getMonthBalance();
            rowIndex++;
        }
        Row lastRow = sheet.createRow(rowIndex);
        lastRow.createCell(1).setCellValue("【総 合 計】");

        cell = lastRow.createCell(2, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumPreviousMonthBalance);

        cell = lastRow.createCell(3, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumTotalDepositMonth);

        cell = lastRow.createCell(4, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumBalanceCarriedForward);

        cell = lastRow.createCell(5, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumSaleAmountNotIncludeTax);

        cell = lastRow.createCell(6, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumTax);

        cell = lastRow.createCell(7, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumSaleAmountTaxIncluded);

        cell = lastRow.createCell(8, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumMonthBalance);

        writeWorkbookToHttpResponse(workbook, httpServletResponse, "Maeukekin-".concat(monthExport), fileType,
                13.8, 13.8 * 2.1, 13.8 * 1.1, 13.8 * 1.1, 13.8 * 1.1, 13.8 * 1.1, 13.8 * 1.1, 13.8 * 1.1, 13.8 * 1.1);
    }

    @Override
    public void exportUrikazandakauchiwakeFile(HttpServletResponse httpServletResponse, String... args) {
        if (args == null || args.length == 0) return;
        String monthExport = args[0];
        String fileType = args[1];
        String[] times = monthExport.split("-");
        String year = times[0];
        String month = times[1];

        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("売掛金残高一覧表内訳表");
        CellStyle numberStyle = createNumberWithCommaSeparatorCellStyle(sheet);

        Row firstRow = sheet.createRow(0);
        firstRow.createCell(0).setCellValue("売掛金残高一覧表内訳表");
        Row secondRow = sheet.createRow(1);
        secondRow.createCell(0).setCellValue("対象期間:".concat(year).concat("年").concat(month).concat("月度"));
        Row thirdRow = sheet.createRow(2);
        thirdRow.createCell(0).setCellValue("（単位：　円）");
        Row fourthRow = sheet.createRow(3);
        fourthRow.createCell(3).setCellValue("当月入金");
        fourthRow.createCell(5).setCellValue("当月売上");
        fourthRow.createCell(9).setCellValue("内訳");

        Row fifthRow = sheet.createRow(4);
        fifthRow.createCell(0).setCellValue("コード");
        fifthRow.createCell(1).setCellValue("得意先名");
        fifthRow.createCell(2).setCellValue("前月前受金残高");
        fifthRow.createCell(3).setCellValue("入金合計");
        fifthRow.createCell(4).setCellValue("繰越残高");
        fifthRow.createCell(5).setCellValue("税抜売上額");
        fifthRow.createCell(6).setCellValue("消費税等");
        fifthRow.createCell(7).setCellValue("税込売上額");
        fifthRow.createCell(8).setCellValue("当月前受金残高");
        fifthRow.createCell(9).setCellValue("NSS入金残高");
        fifthRow.createCell(10).setCellValue("RP入金残高");
        fifthRow.createCell(11).setCellValue("入金なし");

        int rowIndex = 5;

        List<ReceivableImportDataHistory> receivableImportDataHistories = receivableImportDataHistoryRepository.findAllByImportMonthAndMonthBalanceGreaterThan(monthExport, 0l);
        if (CollectionUtils.isEmpty(receivableImportDataHistories)) return;
        Long sumPreviousMonthBalance = 0l;
        Long sumTotalDepositMonth = 0l;
        Long sumBalanceCarriedForward = 0l;
        Long sumSaleAmountNotIncludeTax = 0l;
        Long sumTax = 0l;
        Long sumSaleAmountTaxIncluded = 0l;
        Long sumMonthBalance = 0l;

        Cell cell;
        for (ReceivableImportDataHistory receivableImportDataHistory : receivableImportDataHistories) {
            Row row = sheet.createRow(rowIndex);
            row.createCell(0).setCellValue(receivableImportDataHistory.getCustomerCode());
            Customer customer = customerRepository.findFirstByCustomerCode(receivableImportDataHistory.getCustomerCode());
            Constants.PAYMENT_METHOD payment_method = customer.getPayment_method();
            row.createCell(1).setCellValue(customer != null ? customer.getCustomerName() : "");

            cell = row.createCell(2, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getPreviousMonthBalance());
            sumPreviousMonthBalance = sumPreviousMonthBalance + receivableImportDataHistory.getPreviousMonthBalance();

            cell = row.createCell(3, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getTotalDepositMonth());
            sumTotalDepositMonth = sumTotalDepositMonth + receivableImportDataHistory.getTotalDepositMonth();

            cell = row.createCell(4, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getBalanceCarriedForward());
            sumBalanceCarriedForward = sumBalanceCarriedForward + receivableImportDataHistory.getBalanceCarriedForward();

            cell = row.createCell(5, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getSaleAmountNotIncludeTax());
            sumSaleAmountNotIncludeTax = sumSaleAmountNotIncludeTax + receivableImportDataHistory.getSaleAmountNotIncludeTax();

            cell = row.createCell(6, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getTax());
            sumTax = sumTax + receivableImportDataHistory.getTax();

            cell = row.createCell(7, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getSaleAmountTaxIncluded());
            sumSaleAmountTaxIncluded = sumSaleAmountTaxIncluded + receivableImportDataHistory.getSaleAmountTaxIncluded();

            cell = row.createCell(8, CellType.NUMERIC);
            cell.setCellStyle(numberStyle);
            cell.setCellValue(receivableImportDataHistory.getMonthBalance());
            sumMonthBalance = sumMonthBalance + receivableImportDataHistory.getMonthBalance();
            if (payment_method != null) {
                switch (payment_method) {
                    case RP:
                        RpDepositData rpDepositData = rpDepositDataRepository.findFirstByCustomerCodeAndImportMonth(customer.getCustomerCode(), monthExport);
                        if (rpDepositData != null) {
                            cell = row.createCell(10, CellType.NUMERIC);
                            cell.setCellStyle(numberStyle);
                            cell.setCellValue(rpDepositData.getPaymentAmount());
                        }
                        break;
                    case NSS:
                        NssDepositData nssDepositData = nssDepositDataRepository.findFirstBySubscriberCodeAndImportMonth(customer.getNssSubscriberCode(), monthExport);
                        if (nssDepositData != null) {
                            cell = row.createCell(9, CellType.NUMERIC);
                            cell.setCellStyle(numberStyle);
                            cell.setCellValue(nssDepositData.getDepositAmount());
                        }
                        break;
                }
            }
            if (row.getCell(9) == null && row.getCell(10) == null) {
                cell = row.createCell(11, CellType.NUMERIC);
                cell.setCellStyle(numberStyle);
                cell.setCellValue(receivableImportDataHistory.getMonthBalance());
            }

            rowIndex++;
        }
        Row lastRow = sheet.createRow(rowIndex);
        lastRow.createCell(1).setCellValue("【総 合 計】");

        cell = lastRow.createCell(2, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumPreviousMonthBalance);

        cell = lastRow.createCell(3, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumTotalDepositMonth);


        cell = lastRow.createCell(4, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumBalanceCarriedForward);


        cell = lastRow.createCell(5, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumSaleAmountNotIncludeTax);


        cell = lastRow.createCell(6, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumTax);


        cell = lastRow.createCell(7, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumSaleAmountTaxIncluded);

        cell = lastRow.createCell(8, CellType.NUMERIC);
        cell.setCellStyle(numberStyle);
        cell.setCellValue(sumMonthBalance);

        writeWorkbookToHttpResponse(workbook, httpServletResponse, "Urikazandakauchiwake-".concat(monthExport), fileType,
                13.8, 13.8 * 2, 13.8 * 0.8, 13.8 * 0.8, 13.8 * 0.8, 13.8 * 0.8, 13.8 * 0.8, 13.8 * 0.8, 13.8 * 0.8, 13.8 * 0.8, 13.8 * 0.8, 13.8 * 0.8);
    }

    private void writeWorkbookToHttpResponse(Workbook workbook, HttpServletResponse response, String exportFileName, String exportFileType, double... columnsWidth) {
        OutputStream outputStream = null;
        try {
            response.setContentType("plain/text");
            String extension = "";
            switch (exportFileType) {
                case "excel":
                    extension = ".xlsx";
                    break;
                case "pdf":
                    extension = ".pdf";
                    break;
            }
            response.addHeader("Content-Disposition", "attachment; filename=" + exportFileName.concat(extension));

            outputStream = response.getOutputStream();
            switch (exportFileType) {
                case "excel":
                    workbook.write(outputStream);
                    break;
                case "pdf":
                    excel2pdf.convert(workbook, outputStream, PaperSizeType.A2Paper, columnsWidth);
                    break;
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage());
        } finally {
            try {
                workbook.close();
                outputStream.flush();
            } catch (IOException e) {
                LOGGER.error(e.getMessage());
            }
        }
    }

    private CellStyle creatErrorCellStyle(Sheet sheet) {
        CellStyle errorStyle = sheet.getWorkbook().createCellStyle();
        errorStyle.setFillBackgroundColor(IndexedColors.RED.index);
        errorStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        return errorStyle;
    }

    private XSSFCellStyle createNumberWithCommaSeparatorCellStyle(XSSFSheet sheet) {
        XSSFCellStyle cellStyle = sheet.getWorkbook().createCellStyle();
        XSSFDataFormat dataFormat = sheet.getWorkbook().createDataFormat();
        cellStyle.setDataFormat(dataFormat.getFormat("#,###"));
        return cellStyle;
    }

    private String getImportMonthFromCell(String cellValue) {
        if (StringUtils.isEmpty(cellValue)) return null;
        cellValue = cellValue.replaceAll("(?<=[A-Z])(?=[A-Z])|(?<=[a-z])(?=[A-Z])|(?<=\\D)$", "1");
        String regex = "(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)";
        String[] atoms = cellValue.split(regex);
        int[] n = new int[atoms.length / 2];
        for (int i = 0; i < n.length; i++) {
            n[i] = Integer.parseInt(atoms[i * 2 + 1]);
        }
        int year = n[0], month = n[1];
        return year + "-" + month;
    }
}
