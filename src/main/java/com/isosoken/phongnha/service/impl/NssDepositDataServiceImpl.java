package com.isosoken.phongnha.service.impl;

import com.isosoken.phongnha.Repository.CustomerRepository;
import com.isosoken.phongnha.Repository.NssDepositDataRepository;
import com.isosoken.phongnha.Repository.ReceivableBalanceImportDataStatusRepository;
import com.isosoken.phongnha.common.Constants;
import com.isosoken.phongnha.model.Customer;
import com.isosoken.phongnha.model.NssDepositData;
import com.isosoken.phongnha.model.ReceivableBalanceImportDataStatus;
import com.isosoken.phongnha.service.CommonFileService;
import com.isosoken.phongnha.service.NssDepositDataService;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Service
public class NssDepositDataServiceImpl implements NssDepositDataService, CommonFileService {
    private static final Logger LOGGER = LoggerFactory.getLogger(NssDepositDataServiceImpl.class);
    private static final int BATCH_SIZE = 100;
    @Autowired
    private NssDepositDataRepository nssDepositDataRepository;
    @Autowired
    private ReceivableBalanceImportDataStatusRepository receivableBalanceImportDataStatusRepository;
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void readExcelFile(File file, String fileType) throws Exception {
        if (file == null || !file.exists()) throw new Exception("File not found!");
        FileInputStream fileInputStream = new FileInputStream(file);
        XSSFWorkbook workbook = new XSSFWorkbook(file);
        Sheet urikakezandakaSheet = workbook.getSheet("売掛金残高一覧表");
        String importMonthCell = urikakezandakaSheet.getRow(1).getCell(0).getStringCellValue();

        String importMonth = getImportMonthFromCell(importMonthCell);
        if (StringUtils.isEmpty(importMonth)) throw new Exception("Import month must not be null!");

        List<ReceivableBalanceImportDataStatus> importDataStatusList = receivableBalanceImportDataStatusRepository.findAllByImportMonthAndType(importMonth, Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.NSS);
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
                    nssDepositDataRepository.deleteAllByImportMonth(importMonth);
                    importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.NSS);
                    importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.IN_PROGRESS);
                    receivableBalanceImportDataStatusRepository.save(importDataStatus);
            }
        } else {
            importDataStatus = receivableBalanceImportDataStatusRepository.save(
                    new ReceivableBalanceImportDataStatus(importMonth,
                            Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.NSS,
                            Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.IN_PROGRESS));

        }
        readCustomerConvertSubscriberCodeSheet(workbook);
        Sheet nssSheet = workbook.getSheet("NSS入金データ");
        Iterator<Row> rowIterator = nssSheet.rowIterator();
        List<NssDepositData> batchSaveToDb = new ArrayList<>();

        CellStyle errorStyle = creatErrorCellStyle(nssSheet);
        try {
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                if (row.getCell(0) == null || row.getCell(0).getCellType() == CellType._NONE || row.getCell(0).getCellType() == CellType.BLANK) {
                    nssDepositDataRepository.saveAll(batchSaveToDb);
                    importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.NSS);
                    importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.DONE);
                    receivableBalanceImportDataStatusRepository.save(importDataStatus);
                    workbook.close();
                    return;
                }
                if (row.getCell(0).getCellType() == CellType.STRING)
                    continue;
                if (batchSaveToDb.size() == BATCH_SIZE) {
                    nssDepositDataRepository.saveAll(batchSaveToDb);
                    batchSaveToDb.clear();
                }
                Cell transferDate = row.getCell(0);
                Cell groupName = row.getCell(1);
                Cell storageGroupCode = row.getCell(2);
                Cell affiliationCode = row.getCell(3);
                Cell groupCode = row.getCell(4);
                Cell status = row.getCell(5);
                // required
                Cell subscriberCode = row.getCell(6);
                Cell subscriberName = row.getCell(7);
                // required
                Cell depositAmount = row.getCell(8);
                Cell reason = row.getCell(9);
                Cell numberOfImpossibleTimes = row.getCell(10);
                Cell financialInstitutionCode = row.getCell(11);
                Cell branchCode = row.getCell(12);
                Cell item = row.getCell(13);
                Cell accountNumber = row.getCell(14);
                Cell accountHolder = row.getCell(15);
                Cell branchName = row.getCell(16);
                Cell branchPhoneNumber = row.getCell(17);

                if (subscriberCode == null || depositAmount == null) {
                    Cell cell0 = transferDate != null ? transferDate : row.createCell(0);
                    cell0.setCellStyle(errorStyle);
                    importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.NSS);
                    importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.ERROR);
                    receivableBalanceImportDataStatusRepository.save(importDataStatus);
                    throw new Exception(new StringBuilder("Error in sheet NSS入金データ on line " + (row.getRowNum() + 1))
                            .append("<a href=\"/download/" + fileType + "/" + file.getName() + "\">" + file.getName() + "</a>").toString());
                }

                Date transferDateValue = transferDate != null ? transferDate.getDateCellValue() : null;
                String groupNameValue = groupName != null ? groupName.getStringCellValue() : "";
                String storageGroupCodeValue = storageGroupCode != null ? String.valueOf(storageGroupCode.getNumericCellValue()) : "";
                Long affiliationCodeValue = affiliationCode != null ? (long) affiliationCode.getNumericCellValue() : 0l;
                String groupCodeValue = groupCode != null ? String.valueOf(groupCode.getNumericCellValue()) : "";
                String statusValue = status != null ? status.getStringCellValue() : "";
                Long subscriberCodeValue = subscriberCode != null ? (long) subscriberCode.getNumericCellValue() : 0;
                String subscriberNameValue = subscriberName != null ? subscriberName.getStringCellValue() : "";
                Long depositAmountValue = (long) depositAmount.getNumericCellValue();
                Long reasonValue = reason != null ? (long) reason.getNumericCellValue() : 0l;
                Long numberOfImpossibleTimesValue = numberOfImpossibleTimes != null ? (long) numberOfImpossibleTimes.getNumericCellValue() : 0l;
                String financialInstitutionCodeValue = financialInstitutionCode != null ? String.valueOf(financialInstitutionCode.getNumericCellValue()) : "";
                String branchCodeValue = branchCode != null ? String.valueOf(branchCode.getNumericCellValue()) : "";
                String itemValue = item != null ? item.getStringCellValue() : "";
                String accountNumberValue = accountNumber != null ? String.valueOf(accountNumber.getNumericCellValue()) : "";
                String accountHolderValue = accountHolder != null ? accountHolder.getStringCellValue() : "";
                String branchNameValue = branchName != null ? branchName.getStringCellValue() : "";
                String branchPhoneNumberValue = branchPhoneNumber != null ? String.valueOf(branchPhoneNumber.getNumericCellValue()) : "";


                NssDepositData nssDepositData = new NssDepositData();
                nssDepositData.setImportMonth(importMonth);
                nssDepositData.setTransferDate(transferDateValue);
                nssDepositData.setGroupName(groupNameValue);
                nssDepositData.setStorageGroupCode(storageGroupCodeValue);
                nssDepositData.setAffiliationCode(affiliationCodeValue);
                nssDepositData.setGroupCode(groupCodeValue);
                nssDepositData.setStatus(statusValue);
                nssDepositData.setSubscriberCode(subscriberCodeValue);
                nssDepositData.setSubscriberName(subscriberNameValue);
                nssDepositData.setDepositAmount(depositAmountValue);
                nssDepositData.setReason(reasonValue);
                nssDepositData.setNumberOfImpossibleTimes(numberOfImpossibleTimesValue);
                nssDepositData.setFinancialInstitutionCode(financialInstitutionCodeValue);
                nssDepositData.setBranchCode(branchCodeValue);
                nssDepositData.setItem(itemValue);
                nssDepositData.setAccountNumber(accountNumberValue);
                nssDepositData.setAccountHolder(accountHolderValue);
                nssDepositData.setBranchName(branchNameValue);
                nssDepositData.setBranchPhoneNumber(branchPhoneNumberValue);
                batchSaveToDb.add(nssDepositData);

            }
            nssDepositDataRepository.saveAll(batchSaveToDb);
            importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.NSS);
            importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.DONE);
            receivableBalanceImportDataStatusRepository.save(importDataStatus);
            workbook.close();
        } catch (Exception e) {
            importDataStatus.setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE.NSS);
            importDataStatus.setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS.ERROR);
            receivableBalanceImportDataStatusRepository.save(importDataStatus);
            throw new Exception("Error in sheet NSS入金データ :" + e.getMessage());
        }
    }

    @Override
    public void excuteWhenReadSuccess(File file) {

    }

    @Override
    public void excuteWhenReadFailed(File file) {

    }

    private void readCustomerConvertSubscriberCodeSheet(Workbook workbook) {
        Sheet convertSubscriberCodeSheet = workbook.getSheet("変換テーブル");
        Iterator<Row> rowIterator = convertSubscriberCodeSheet.rowIterator();
        List<Customer> batchSaveCustomerInfoToDb = new ArrayList<>();

        while (rowIterator.hasNext()) {
            Row row = rowIterator.next();
            if (row.getCell(0) == null || row.getCell(0).getCellType() == CellType._NONE || row.getCell(0).getCellType() == CellType.BLANK) {
                customerRepository.saveAll(batchSaveCustomerInfoToDb);
                LOGGER.info("====DONE READ NSS CUSTOMER CODE");
                return;
            }
            if (row.getCell(0).getCellType() == CellType.STRING || row.getCell(0).getCellType() == CellType.BLANK)
                continue;
            if (batchSaveCustomerInfoToDb.size() == BATCH_SIZE) {
                customerRepository.saveAll(batchSaveCustomerInfoToDb);
                batchSaveCustomerInfoToDb.clear();
            }
            Cell nssSubscriberCodeCell = row.getCell(0);
            Cell customerNameCell = row.getCell(1);
            Cell customerCodeCell = row.getCell(2);

            if (nssSubscriberCodeCell == null || customerCodeCell == null) continue;

            Long nssSubscriberCode = (long) nssSubscriberCodeCell.getNumericCellValue();
            String customerName = customerNameCell != null ? customerNameCell.getStringCellValue() : "";
            Long customerCode = (long) customerCodeCell.getNumericCellValue();
            LOGGER.info("====CUSTOMER CODE {}", customerCode);

            Customer customer = customerRepository.findFirstByCustomerCode(customerCode);
            if (customer != null) {
                customer.setPayment_method(Constants.PAYMENT_METHOD.NSS);
                customer.setNssSubscriberCode(nssSubscriberCode);
            } else {
                customer = new Customer();
                customer.setCustomerCode(customerCode);
                customer.setCustomerName(customerName);
                customer.setNssSubscriberCode(nssSubscriberCode);
                customer.setPayment_method(Constants.PAYMENT_METHOD.NSS);
            }
            batchSaveCustomerInfoToDb.add(customer);
        }
        customerRepository.saveAll(batchSaveCustomerInfoToDb);
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
}
