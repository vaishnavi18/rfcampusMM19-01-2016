package com.iitms.rfcampusdata.academic.feecollection.dto;

public class FeesReceiptsDTO {

    private int dcrMainId;

    private String branch;

    private String semester;

    private String paymentType;

    private String receiptNumber;

    private float totalPaidAmount;

    private float refundableAmount;

    public int getDcrMainId() {
        return dcrMainId;
    }

    public void setDcrMainId(int dcrMainId) {
        this.dcrMainId = dcrMainId;
    }

    public String getReceiptNumber() {
        return receiptNumber;
    }

    public void setReceiptNumber(String receiptNumber) {
        this.receiptNumber = receiptNumber;
    }

    public float getTotalPaidAmount() {
        return totalPaidAmount;
    }

    public void setTotalPaidAmount(float totalPaidAmount) {
        this.totalPaidAmount = totalPaidAmount;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public float getRefundableAmount() {
        return refundableAmount;
    }

    public void setRefundableAmount(float refundableAmount) {
        this.refundableAmount = refundableAmount;
    }

}
