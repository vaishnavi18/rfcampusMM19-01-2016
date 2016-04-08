package com.iitms.rfcampusdata.academic.feecollection.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class StudentFeeDetailsDTO {

    @Id
    private int semesterId;

    private float balanceAmt;

    private float totalAppliedAmount;

    private float totalExcessAmt;

    private float totalAmtPaid;

    private float totadjustedamt;

    public float getTotadjustedamt() {
        return totadjustedamt;
    }

    public void setTotadjustedamt(float totadjustedamt) {
        this.totadjustedamt = totadjustedamt;
    }

    public float getBalanceAmt() {
        return balanceAmt;
    }

    public void setBalanceAmt(float balanceAmt) {
        this.balanceAmt = balanceAmt;
    }

    public float getTotalAppliedAmount() {
        return totalAppliedAmount;
    }

    public void setTotalAppliedAmount(float totalAppliedAmount) {
        this.totalAppliedAmount = totalAppliedAmount;
    }

    public float getTotalExcessAmt() {
        return totalExcessAmt;
    }

    public void setTotalExcessAmt(float totalExcessAmt) {
        this.totalExcessAmt = totalExcessAmt;
    }

    public float getTotalAmtPaid() {
        return totalAmtPaid;
    }

    public void setTotalAmtPaid(float totalAmtPaid) {
        this.totalAmtPaid = totalAmtPaid;
    }

    public int getSemesterId() {
        return semesterId;
    }

    public void setSemesterId(int semesterId) {
        this.semesterId = semesterId;
    }

}
