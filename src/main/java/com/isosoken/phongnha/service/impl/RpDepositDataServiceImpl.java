package com.isosoken.phongnha.service.impl;

import com.isosoken.phongnha.Repository.CustomerRepository;
import com.isosoken.phongnha.Repository.ReceivableBalanceImportDataStatusRepository;
import com.isosoken.phongnha.Repository.RpDepositDataRepository;
import com.isosoken.phongnha.common.Constants;
import com.isosoken.phongnha.model.Customer;
import com.isosoken.phongnha.model.ReceivableBalanceImportDataStatus;
import com.isosoken.phongnha.model.RpDepositData;
import com.isosoken.phongnha.service.CommonFileService;
import com.isosoken.phongnha.service.RpDepositDataService;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Service
@Scope(proxyMode = ScopedProxyMode.DEFAULT)
@Transactional
public class RpDepositDataServiceImpl implements RpDepositDataService, CommonFileService {
    private static final Logger LOGGER = LoggerFactory.getLogger(RpDepositDataServiceImpl.class);
    private static final int BATCH_SIZE = 100;
    @Autowired
    private RpDepositDataRepository rpDepositDataRepository;
    @Autowired
    private ReceivableBalanceImportDataStatusRepository receivableBalanceImportDataStatusRepository;
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void readExcelFile(File file, String fileType) throws Exception {
        if (file == null || !file.exists()) throw new Exception("File not found!");
        XSSFWorkbook workbook = new XSSFWorkbook(file);
        Sheet urikakezandakaSheet = workbook.getSheet("売掛金残高一覧表");
        String importMonthCell = urikakezandakaSheet.getRow(1).getCell(0).getStringCellValue();

        String importMonth = getImportMonthFromCell(importMonthCell);
        if (StringUtils.isEmpty(importMonth)) throw new Exception("Import month must not be null!");

        List<ReceivableBalanceImportDataStatus> importDataStatusList = receivableBalanceImportDataStatusRepository.findAllByImportMonthAndType(importMonth, Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.RP);
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
                    rpDepositDataRepository.deleteAllByImportMonth(importMonth);
                    importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.RP);
                    importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.IN_PROGRESS);
                    receivableBalanceImportDataStatusRepository.save(importDataStatus);
            }
        } else {
            importDataStatus = receivableBalanceImportDataStatusRepository.save(
                    new ReceivableBalanceImportDataStatus(importMonth,
                            Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.RP,
                            Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.IN_PROGRESS));

        }

        Sheet rpSheet = workbook.getSheet("RP入金データ");
        Iterator<Row> rowIterator = rpSheet.rowIterator();
        List<RpDepositData> batchSaveToDb = new ArrayList<>();

        CellStyle errorStyle = creatErrorCellStyle(rpSheet);

        try {
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                if (row.getCell(0) == null || row.getCell(0).getCellType() == CellType._NONE || row.getCell(0).getCellType() == CellType.BLANK) {
                    rpDepositDataRepository.saveAll(batchSaveToDb);
                    importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.RP);
                    importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.DONE);
                    receivableBalanceImportDataStatusRepository.save(importDataStatus);
                    workbook.close();
                    return;
                }
                if (row.getCell(0).getCellType() == CellType.STRING || row.getCell(0).getCellType() == CellType.BLANK)
                    continue;
                if (batchSaveToDb.size() == BATCH_SIZE) {
                    rpDepositDataRepository.saveAll(batchSaveToDb);
                    batchSaveToDb.clear();
                }

                Cell applicationResultId = row.getCell(0);
                Cell applicationProcessingDate = row.getCell(1);
                Cell applicationRecordingDate = row.getCell(2);
                Cell applicationMethod = row.getCell(3);
                Cell applicationAmount = row.getCell(4);
                // required
                Cell invoiceNumber = row.getCell(5);
                Cell saleId = row.getCell(6);
                // required
                Cell saleAmount = row.getCell(7);
                Cell paymentId = row.getCell(8);
                Cell paymentDate = row.getCell(9);
                Cell transferName = row.getCell(10);
                // required
                Cell paymentAmount = row.getCell(11);
                Cell cancellationFlag = row.getCell(12);
                Cell cancellationRecordingDate = row.getCell(13);

                if (invoiceNumber == null || saleAmount == null || paymentAmount == null) {
                    Cell cell0 = applicationResultId != null ? applicationResultId : row.createCell(0);
                    cell0.setCellStyle(errorStyle);
                    importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.RP);
                    importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.ERROR);
                    receivableBalanceImportDataStatusRepository.save(importDataStatus);
                    throw new Exception(new StringBuilder("Error in sheet RP入金データ on line " + (row.getRowNum() + 1))
                            .append("<a href=\"/download/" + fileType + "/" + file.getName() + "\">" + file.getName() + "</a>").toString());
                }

                Long customerCode = getCustomerCodeFromRpInvoiceNumber(invoiceNumber.getStringCellValue());
                updateCustomerPaymentMethod(customerCode);

                String applicationResultIdValue = applicationResultId != null ? String.valueOf(applicationResultId.getNumericCellValue()) : "";
                Date applicationProcessingDateValue = applicationProcessingDate != null ? applicationProcessingDate.getDateCellValue() : null;
                Date applicationRecordingDateValue = applicationRecordingDate != null ? applicationRecordingDate.getDateCellValue() : null;
                String applicationMethodValue = applicationMethod != null ? applicationMethod.getStringCellValue() : "";
                Long applicationAmountValue = applicationAmount != null ? (long) applicationAmount.getNumericCellValue() : 0l;
                Long customerCodeValue = customerCode;
                String saleIdValue = saleId != null ? String.valueOf(saleId.getNumericCellValue()) : "";
                Long saleAmountValue = saleAmount != null ? (long) saleAmount.getNumericCellValue() : 0l;
                String paymentIdValue = paymentId != null ? String.valueOf(paymentId.getNumericCellValue()) : "";
                Date paymentDateValue = paymentDate != null ? paymentDate.getDateCellValue() : null;
                String transferNameValue = transferName != null ? transferName.getCellType() == CellType.NUMERIC ? String.valueOf(transferName.getNumericCellValue()) : transferName.getStringCellValue() : "";
                Long paymentAmountValue = paymentAmount != null ? paymentAmount.getCellType() == CellType.STRING ? Long.parseLong(paymentAmount.getStringCellValue()) : (long) paymentAmount.getNumericCellValue() : 0l;
                Integer cancellationFlagValue = cancellationFlag != null ? (int) cancellationFlag.getNumericCellValue() : 0;
                Date cancellationRecordingDateValue = cancellationRecordingDate != null ? cancellationRecordingDate.getDateCellValue() : null;

                RpDepositData rpDepositData = new RpDepositData();
                rpDepositData.setImportMonth(importMonth);
                rpDepositData.setApplicationResultId(applicationResultIdValue);
                rpDepositData.setApplicationProcessingDate(applicationProcessingDateValue);
                rpDepositData.setApplicationRecordingDate(applicationRecordingDateValue);
                rpDepositData.setApplicationMethod(applicationMethodValue);
                rpDepositData.setApplicationAmount(applicationAmountValue);
                rpDepositData.setCustomerCode(customerCodeValue);
                rpDepositData.setSaleId(saleIdValue);
                rpDepositData.setSaleAmount(saleAmountValue);
                rpDepositData.setPaymentId(paymentIdValue);
                rpDepositData.setPaymentDate(paymentDateValue);
                rpDepositData.setTransferName(transferNameValue);
                rpDepositData.setPaymentAmount(paymentAmountValue);
                rpDepositData.setCancellationFlag(cancellationFlagValue);
                rpDepositData.setCancellationRecordingDate(cancellationRecordingDateValue);
                batchSaveToDb.add(rpDepositData);
            }

            rpDepositDataRepository.saveAll(batchSaveToDb);
            importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.RP);
            importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.DONE);
            receivableBalanceImportDataStatusRepository.save(importDataStatus);
            workbook.close();

        } catch (Exception e) {
            importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.RP);
            importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.ERROR);
            receivableBalanceImportDataStatusRepository.save(importDataStatus);
            throw new Exception("Error in sheet RP入金データ :" + e.getMessage());
        }


    }

    @Override
    public void excuteWhenReadSuccess(File file) {

    }

    @Override
    public void excuteWhenReadFailed(File file) {

    }

    private void updateCustomerPaymentMethod(Long customerCode) {
        Customer customer = customerRepository.findFirstByCustomerCode(customerCode);
        if (customer == null) {
            customer = new Customer();
        }
        customer.setCustomerCode(customerCode);
        customer.setPayment_method(Constants.PAYMENT_METHOD.RP);
        customerRepository.save(customer);
    }


    private CellStyle creatErrorCellStyle(Sheet sheet) {
        CellStyle errorStyle = sheet.getWorkbook().createCellStyle();
        errorStyle.setFillBackgroundColor(IndexedColors.RED.index);
        errorStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        return errorStyle;
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

    private Long getCustomerCodeFromRpInvoiceNumber(String invoiceNumber) {
        if (StringUtils.isEmpty(invoiceNumber)) return null;
        if (!invoiceNumber.contains("-")) return Long.parseLong(invoiceNumber);
        String[] splited = invoiceNumber.split("-");
        return Long.parseLong(splited[1]);
    }
}
