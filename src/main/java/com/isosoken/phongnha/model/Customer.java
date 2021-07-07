package com.isosoken.phongnha.model;

import javax.persistence.*;
import java.io.Serializable;

import static com.isosoken.phongnha.common.Constants.PAYMENT_METHOD;

@Entity
@Table(name = "customer")
public class Customer extends AudittingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "customer_code", nullable = false, unique = true)
    private Long customerCode;
    @Column(name = "nss_subscriber_code")
    private Long nssSubscriberCode;
    @Column(name = "customer_name")
    private String customerName;
    @Column(name = "total_deposit", nullable = true)
    private Long totalDeposit;
    @Column(name = "total_purchase_amount", nullable = true)
    private Long totalPurchaseAmount;
    @Column(name = "current_balance", nullable = true)
    private Long currentBalance;
    @Column(name = "payment_method", nullable = true)
    @Enumerated(EnumType.STRING)
    private PAYMENT_METHOD payment_method;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(Long customerCode) {
        this.customerCode = customerCode;
    }

    public Long getNssSubscriberCode() {
        return nssSubscriberCode;
    }

    public void setNssSubscriberCode(Long nssSubscriberCode) {
        this.nssSubscriberCode = nssSubscriberCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Long getTotalDeposit() {
        return totalDeposit;
    }

    public void setTotalDeposit(Long totalDeposit) {
        this.totalDeposit = totalDeposit;
    }

    public Long getTotalPurchaseAmount() {
        return totalPurchaseAmount;
    }

    public void setTotalPurchaseAmount(Long totalPurchaseAmount) {
        this.totalPurchaseAmount = totalPurchaseAmount;
    }

    public Long getCurrentBalance() {
        return currentBalance;
    }

    public void setCurrentBalance(Long currentBalance) {
        this.currentBalance = currentBalance;
    }

    public PAYMENT_METHOD getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(PAYMENT_METHOD payment_method) {
        this.payment_method = payment_method;
    }
}