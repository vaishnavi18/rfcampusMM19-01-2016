package com.iitms.rfcampusdata.academic.feecollection.dto;

import java.util.List;

public class ReceiptTypeDTO {

    private int receiptTypeId;

    private String receipt;

    private List<FeesReceiptsDTO> feesReceipts;

    public int getReceiptTypeId() {
        return receiptTypeId;
    }

    public void setReceiptTypeId(int receiptTypeId) {
        this.receiptTypeId = receiptTypeId;
    }

    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }

    public List<FeesReceiptsDTO> getFeesReceipts() {
        return feesReceipts;
    }

    public void setFeesReceipts(List<FeesReceiptsDTO> feesReceipts) {
        this.feesReceipts = feesReceipts;
    }

}
