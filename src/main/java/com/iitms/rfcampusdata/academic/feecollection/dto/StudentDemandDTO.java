package com.iitms.rfcampusdata.academic.feecollection.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class StudentDemandDTO {

    @Id
    private int feeheadId;

    private float amount;

    private String feeheadLongName;

    public int getFeeheadId() {
        return feeheadId;
    }

    public void setFeeheadId(int feeheadId) {
        this.feeheadId = feeheadId;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getFeeheadLongName() {
        return feeheadLongName;
    }

    public void setFeeheadLongName(String feeheadLongName) {
        this.feeheadLongName = feeheadLongName;
    }
}
