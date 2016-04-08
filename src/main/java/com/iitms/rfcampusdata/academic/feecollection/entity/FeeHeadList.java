package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.util.List;

public class FeeHeadList {
    private List<FeesFeeheadEntity> feeHeads;

    private int receiptTypeId;

    public List<FeesFeeheadEntity> getFeeHeads() {
        return feeHeads;
    }

    public void setFeeHeads(List<FeesFeeheadEntity> feeHeads) {
        this.feeHeads = feeHeads;
    }

    public int getReceiptTypeId() {
        return receiptTypeId;
    }

    public void setReceiptTypeId(int receiptTypeId) {
        this.receiptTypeId = receiptTypeId;
    }

    @Override
    public String toString() {
        return "FeeHeadList [feeHeads=" + feeHeads + "]";
    }

}
