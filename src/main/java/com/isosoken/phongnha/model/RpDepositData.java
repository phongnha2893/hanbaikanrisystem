package com.isosoken.phongnha.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "rp_deposit_data")
public class RpDepositData extends AudittingEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String importMonth;

    private String applicationResultId;

    private Date applicationProcessingDate;

    private Date applicationRecordingDate;

    private String applicationMethod;

    private Long applicationAmount;

    @Column(nullable = false)
    private Long customerCode;

    private String saleId;

    @Column(nullable = false)
    private Long saleAmount;

    private String paymentId;

    private Date paymentDate;

    private String transferName;

    @Column(nullable = false)
    private Long paymentAmount;

    private Integer cancellationFlag;

    private Date cancellationRecordingDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImportMonth() {
        return importMonth;
    }

    public void setImportMonth(String importMonth) {
        this.importMonth = importMonth;
    }

    public String getApplicationResultId() {
        return applicationResultId;
    }

    public void setApplicationResultId(String applicationResultId) {
        this.applicationResultId = applicationResultId;
    }

    public Date getApplicationProcessingDate() {
        return applicationProcessingDate;
    }

    public void setApplicationProcessingDate(Date applicationProcessingDate) {
        this.applicationProcessingDate = applicationProcessingDate;
    }

    public Date getApplicationRecordingDate() {
        return applicationRecordingDate;
    }

    public void setApplicationRecordingDate(Date applicationRecordingDate) {
        this.applicationRecordingDate = applicationRecordingDate;
    }

    public String getApplicationMethod() {
        return applicationMethod;
    }

    public void setApplicationMethod(String applicationMethod) {
        this.applicationMethod = applicationMethod;
    }

    public Long getApplicationAmount() {
        return applicationAmount;
    }

    public void setApplicationAmount(Long applicationAmount) {
        this.applicationAmount = applicationAmount;
    }

    public Long getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(Long customerCode) {
        this.customerCode = customerCode;
    }

    public String getSaleId() {
        return saleId;
    }

    public void setSaleId(String saleId) {
        this.saleId = saleId;
    }

    public Long getSaleAmount() {
        return saleAmount;
    }

    public void setSaleAmount(Long saleAmount) {
        this.saleAmount = saleAmount;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getTransferName() {
        return transferName;
    }

    public void setTransferName(String transferName) {
        this.transferName = transferName;
    }

    public Long getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(Long paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public Integer getCancellationFlag() {
        return cancellationFlag;
    }

    public void setCancellationFlag(Integer cancellationFlag) {
        this.cancellationFlag = cancellationFlag;
    }

    public Date getCancellationRecordingDate() {
        return cancellationRecordingDate;
    }

    public void setCancellationRecordingDate(Date cancellationRecordingDate) {
        this.cancellationRecordingDate = cancellationRecordingDate;
    }
}
