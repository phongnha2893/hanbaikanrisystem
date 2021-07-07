package com.isosoken.phongnha.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "nss_deposit_data")
public class NssDepositData extends AudittingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String importMonth;

    private Date transferDate;

    private String groupName;

    private String storageGroupCode;

    private Long affiliationCode;

    private String groupCode;

    private String status;

    @Column(nullable = false)
    private Long subscriberCode;

    private String subscriberName;

    @Column(nullable = false)
    private Long depositAmount;

    private Long reason;

    private Long numberOfImpossibleTimes;

    private String financialInstitutionCode;

    private String branchCode;

    private String item;

    private String accountNumber;

    private String accountHolder;

    private String branchName;

    private String branchPhoneNumber;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImportMonth() {
        return importMonth;
    }

    public void setImportMonth(String monthImport) {
        this.importMonth = monthImport;
    }

    public Date getTransferDate() {
        return transferDate;
    }

    public void setTransferDate(Date transferDate) {
        this.transferDate = transferDate;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getStorageGroupCode() {
        return storageGroupCode;
    }

    public void setStorageGroupCode(String storageGroupCode) {
        this.storageGroupCode = storageGroupCode;
    }

    public Long getAffiliationCode() {
        return affiliationCode;
    }

    public void setAffiliationCode(Long affiliationCode) {
        this.affiliationCode = affiliationCode;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getSubscriberCode() {
        return subscriberCode;
    }

    public void setSubscriberCode(Long subscriberCode) {
        this.subscriberCode = subscriberCode;
    }

    public String getSubscriberName() {
        return subscriberName;
    }

    public void setSubscriberName(String subscriberName) {
        this.subscriberName = subscriberName;
    }

    public Long getDepositAmount() {
        return depositAmount;
    }

    public void setDepositAmount(Long depositAmount) {
        this.depositAmount = depositAmount;
    }

    public Long getReason() {
        return reason;
    }

    public void setReason(Long reason) {
        this.reason = reason;
    }

    public Long getNumberOfImpossibleTimes() {
        return numberOfImpossibleTimes;
    }

    public void setNumberOfImpossibleTimes(Long numberOfImpossibleTimes) {
        this.numberOfImpossibleTimes = numberOfImpossibleTimes;
    }

    public String getFinancialInstitutionCode() {
        return financialInstitutionCode;
    }

    public void setFinancialInstitutionCode(String financialInstitutionCode) {
        this.financialInstitutionCode = financialInstitutionCode;
    }

    public String getBranchCode() {
        return branchCode;
    }

    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getAccountHolder() {
        return accountHolder;
    }

    public void setAccountHolder(String accountHolder) {
        this.accountHolder = accountHolder;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getBranchPhoneNumber() {
        return branchPhoneNumber;
    }

    public void setBranchPhoneNumber(String branchPhoneNumber) {
        this.branchPhoneNumber = branchPhoneNumber;
    }
}
