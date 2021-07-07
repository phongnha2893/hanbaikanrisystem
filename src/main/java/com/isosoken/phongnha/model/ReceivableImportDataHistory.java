package com.isosoken.phongnha.model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "receivable_import_data_history")
public class ReceivableImportDataHistory extends AudittingEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "customer_code", nullable = false)
    private Long customerCode;

    @Column(name = "import_month", nullable = false)
    private String importMonth;

    @Column(name = "previous_month_balance")
    private Long previousMonthBalance;

    @Column(name = "total_deposit_month")
    private Long totalDepositMonth;

    @Column(name = "balance_carried_forward")
    private Long balanceCarriedForward;

    @Column(name = "sale_amount_not_include_tax")
    private Long saleAmountNotIncludeTax;

    @Column(name = "tax")
    private Long tax;

    @Column(name = "sale_amount_tax_included")
    private Long saleAmountTaxIncluded;

    @Column(name = "month_balance")
    private Long monthBalance;

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

    public String getImportMonth() {
        return importMonth;
    }

    public void setImportMonth(String importMonth) {
        this.importMonth = importMonth;
    }

    public Long getPreviousMonthBalance() {
        return previousMonthBalance;
    }

    public void setPreviousMonthBalance(Long previousMonthBalance) {
        this.previousMonthBalance = previousMonthBalance;
    }

    public Long getTotalDepositMonth() {
        return totalDepositMonth;
    }

    public void setTotalDepositMonth(Long totalDepositMonth) {
        this.totalDepositMonth = totalDepositMonth;
    }

    public Long getBalanceCarriedForward() {
        return balanceCarriedForward;
    }

    public void setBalanceCarriedForward(Long balanceCarriedForward) {
        this.balanceCarriedForward = balanceCarriedForward;
    }

    public Long getSaleAmountNotIncludeTax() {
        return saleAmountNotIncludeTax;
    }

    public void setSaleAmountNotIncludeTax(Long saleAmountNotIncludeTax) {
        this.saleAmountNotIncludeTax = saleAmountNotIncludeTax;
    }

    public Long getTax() {
        return tax;
    }

    public void setTax(Long tax) {
        this.tax = tax;
    }

    public Long getSaleAmountTaxIncluded() {
        return saleAmountTaxIncluded;
    }

    public void setSaleAmountTaxIncluded(Long saleAmountTaxIncluded) {
        this.saleAmountTaxIncluded = saleAmountTaxIncluded;
    }

    public Long getMonthBalance() {
        return monthBalance;
    }

    public void setMonthBalance(Long monthBalance) {
        this.monthBalance = monthBalance;
    }
}
