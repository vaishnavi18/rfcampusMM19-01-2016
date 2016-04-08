package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.util.List;

/**
 * @author Sachinmt
 */
public class StandardFeeMasterList {

    private List<StandardFeeMasterEntity> standardFee;

    private int receiptTypeId;

    private int degreeId;

    private int batchId;

    private int paymentTypeId;

    private int standardId;

    private int semesterId;

    private String feeDescription;

    public String getFeeDescription() {
        return feeDescription;
    }

    public void setFeeDescription(String feeDescription) {
        this.feeDescription = feeDescription;
    }

    public int getSemesterId() {
        return semesterId;
    }

    public void setSemesterId(int semesterId) {
        this.semesterId = semesterId;
    }

    public int getStandardId() {
        return standardId;
    }

    public void setStandardId(int standardId) {
        this.standardId = standardId;
    }

    public List<StandardFeeMasterEntity> getStandardFee() {
        return standardFee;
    }

    public void setStandardFee(List<StandardFeeMasterEntity> standardFee) {
        this.standardFee = standardFee;
    }

    public int getReceiptTypeId() {
        return receiptTypeId;
    }

    public void setReceiptTypeId(int receiptTypeId) {
        this.receiptTypeId = receiptTypeId;
    }

    public int getDegreeId() {
        return degreeId;
    }

    public void setDegreeId(int degreeId) {
        this.degreeId = degreeId;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    public int getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(int paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

}
