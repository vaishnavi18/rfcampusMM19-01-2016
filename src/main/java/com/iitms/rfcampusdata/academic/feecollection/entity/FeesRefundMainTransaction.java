package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author iitmsnew2
 */
@Entity
@Table(name = "transaction.fees_refund_main_transaction")
public class FeesRefundMainTransaction implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "student_serial_number")
    private int studentSerialNumber;

    @Column(name = "voucher_no")
    private String voucherNo;

    @Column(name = "voucher_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date voucherDate;

    @Transient
    private String voucherDateString;

    @Column(name = "pay_type")
    private String payType;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "counter_id")
    private int counterId;

    @Column(name = "total_refund_amount")
    private float totalRefundAmount;

    @Column(name = "cash_amount")
    private float cashAmount;

    @Column(name = "cheque_or_dd_amount")
    private float chequeOrDDAmount;

    @Column(name = "is_cancel")
    private boolean isCancel;

    @Column(name = "print_date")
    private Date printDate;

    @Column(name = "remark")
    private String remark;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "macaddress")
    private String macAddress;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "created_date")
    private Date createdDate;

    @Column(name = "modified_by")
    private int modifiedBy;

    @Column(name = "modified_date")
    private Date modifiedDate;

    @Transient
    private List<FeesRefundFeeheadTransactionEntity> refundFeeHeads;

    @Transient
    private String dcrMainIds;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentSerialNumber() {
        return studentSerialNumber;
    }

    public void setStudentSerialNumber(int studentSerialNumber) {
        this.studentSerialNumber = studentSerialNumber;
    }

    public String getVoucherNo() {
        return voucherNo;
    }

    public void setVoucherNo(String voucherNo) {
        this.voucherNo = voucherNo;
    }

    public Date getVoucherDate() {
        return voucherDate;
    }

    public void setVoucherDate(Date voucherDate) {
        this.voucherDate = voucherDate;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

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

    public float getTotalRefundAmount() {
        return totalRefundAmount;
    }

    public void setTotalRefundAmount(float totalRefundAmount) {
        this.totalRefundAmount = totalRefundAmount;
    }

    public float getCashAmount() {
        return cashAmount;
    }

    public void setCashAmount(float cashAmount) {
        this.cashAmount = cashAmount;
    }

    public float getChequeOrDDAmount() {
        return chequeOrDDAmount;
    }

    public void setChequeOrDDAmount(float chequeOrDDAmount) {
        this.chequeOrDDAmount = chequeOrDDAmount;
    }

    public boolean isCancel() {
        return isCancel;
    }

    public void setCancel(boolean isCancel) {
        this.isCancel = isCancel;
    }

    public Date getPrintDate() {
        return printDate;
    }

    public void setPrintDate(Date printDate) {
        this.printDate = printDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCollegeCode() {
        return collegeCode;
    }

    public void setCollegeCode(String collegeCode) {
        this.collegeCode = collegeCode;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getMacAddress() {
        return macAddress;
    }

    public void setMacAddress(String macAddress) {
        this.macAddress = macAddress;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(int modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public List<FeesRefundFeeheadTransactionEntity> getRefundFeeHeads() {
        return refundFeeHeads;
    }

    public void setRefundFeeHeads(List<FeesRefundFeeheadTransactionEntity> refundFeeHeads) {
        this.refundFeeHeads = refundFeeHeads;
    }

    @Override
    public String toString() {
        return "FeesRefundMainTransaction [studentSerialNumber=" + studentSerialNumber + ", voucherNo=" + voucherNo
            + ", voucherDate=" + voucherDate + ", payType=" + payType + ", totalRefundAmount=" + totalRefundAmount
            + ", cashAmount=" + cashAmount + ", chequeOrDDAmount=" + chequeOrDDAmount + ", refundFeeHeads="
            + refundFeeHeads + "]";
    }

    public Date getVoucherDateString() {
        try {
            return new SimpleDateFormat("dd-MM-yyyy").parse(this.voucherDateString);
        } catch (Exception e) {
        }
        return null;
    }

    public void setVoucherDateString(String voucherDateString) {
        this.voucherDateString = voucherDateString;
    }

    public String getDcrMainIds() {
        return dcrMainIds;
    }

    public void setDcrMainIds(String dcrMainIds) {
        this.dcrMainIds = dcrMainIds;
    }

}
