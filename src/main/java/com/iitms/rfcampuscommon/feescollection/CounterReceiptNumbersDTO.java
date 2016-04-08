package com.iitms.rfcampuscommon.feescollection;



public class CounterReceiptNumbersDTO {
    private int userId;
    private int counterId;
    private int receiptTypeId;
    private String receiptTitle;
    private int paymentModeId;
    private int sessionId;
    private int receiptNumber;
    private int receiptNumberId;
    boolean isActive;
    /***/
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getCounterId() {
        return counterId;
    }
    public void setCounterId(int counterId) {
        this.counterId = counterId;
    }
    public int getReceiptTypeId() {
        return receiptTypeId;
    }
    public void setReceiptTypeId(int receiptTypeId) {
        this.receiptTypeId = receiptTypeId;
    }
    public int getPaymentModeId() {
        return paymentModeId;
    }
    public void setPaymentModeId(int paymentModeId) {
        this.paymentModeId = paymentModeId;
    }
    public int getSessionId() {
        return sessionId;
    }
    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }
    public int getReceiptNumber() {
        return receiptNumber;
    }
    public void setReceiptNumber(int receiptNumber) {
        this.receiptNumber = receiptNumber;
    }
    public boolean isActive() {
        return isActive;
    }
    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }
    public String getReceiptTitle() {
        return receiptTitle;
    }
    public void setReceiptTitle(String receiptTitle) {
        this.receiptTitle = receiptTitle;
    }
    public int getReceiptNumberId() {
        return receiptNumberId;
    }
    public void setReceiptNumberId(int receiptNumberId) {
        this.receiptNumberId = receiptNumberId;
    }
}
