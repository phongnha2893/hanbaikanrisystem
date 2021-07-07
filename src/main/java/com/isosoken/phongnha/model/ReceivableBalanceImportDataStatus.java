package com.isosoken.phongnha.model;

import com.isosoken.phongnha.common.Constants;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "receivable_balance_import_data_status")
public class ReceivableBalanceImportDataStatus extends AudittingEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "import_month", nullable = false)
    private String importMonth;

    @Column(name = "type", nullable = false)
    @Enumerated(EnumType.STRING)
    private Constants.RECEIVABLE_BALANCE_IMPORT_TYPE type;


    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.STRING)
    private Constants.RECEIVABLE_BALANCE_IMPORT_STATUS status;

    public ReceivableBalanceImportDataStatus() {
    }

    public ReceivableBalanceImportDataStatus(String importMonth,
                                             Constants.RECEIVABLE_BALANCE_IMPORT_TYPE type,
                                             Constants.RECEIVABLE_BALANCE_IMPORT_STATUS status) {
        this.importMonth = importMonth;
        this.type = type;
        this.status = status;
    }

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

    public Constants.RECEIVABLE_BALANCE_IMPORT_TYPE getType() {
        return type;
    }

    public void setType(Constants.RECEIVABLE_BALANCE_IMPORT_TYPE type) {
        this.type = type;
    }

    public Constants.RECEIVABLE_BALANCE_IMPORT_STATUS getStatus() {
        return status;
    }

    public void setStatus(Constants.RECEIVABLE_BALANCE_IMPORT_STATUS status) {
        this.status = status;
    }
}
