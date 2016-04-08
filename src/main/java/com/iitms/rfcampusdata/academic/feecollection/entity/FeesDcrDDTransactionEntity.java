package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "transaction.fees_dcr_dd_transaction")
public class FeesDcrDDTransactionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "dcrmain_id")
    private int dcrmainId;

    @Column(name = "payment_type_id")
    private int paymentTypeId;

    @Column(name = "demand_draft_number")
    private String demandDraftNumber;

    @Column(name = "demand_draft_date")
    private Date demandDraftDate;

    @Column(name = "demand_draft_amount")
    private float demandDraftAmount;

    @Column(name = "bank_id")
    private int bankId;

    @Column(name = "location_id")
    private int locationId;

    @Column(name = "total_amount")
    private float totalAmount;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "start_time")
    private Date startTime;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "end_time")
    private Date endTime;

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

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date")
    private Date createdDate;

    @Column(name = "modified_by")
    private int modifiedBy;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "modified_date")
    private Date modifiedDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDcrmainId() {
        return dcrmainId;
    }

    public void setDcrmainId(int dcrmainId) {
        this.dcrmainId = dcrmainId;
    }

    public int getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(int paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public String getDemandDraftNumber() {
        return demandDraftNumber;
    }

    public void setDemandDraftNumber(String demandDraftNumber) {
        this.demandDraftNumber = demandDraftNumber;
    }

    public Date getDemandDraftDate() {
        return demandDraftDate;
    }

    public void setDemandDraftDate(Date demandDraftDate) {
        this.demandDraftDate = demandDraftDate;
    }

    public float getDemandDraftAmount() {
        return demandDraftAmount;
    }

    public void setDemandDraftAmount(float demandDraftAmount) {
        this.demandDraftAmount = demandDraftAmount;
    }

    public int getBankId() {
        return bankId;
    }

    public void setBankId(int bankId) {
        this.bankId = bankId;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
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

    public FeesDcrDDTransactionEntity() {
        super();
    }

    public FeesDcrDDTransactionEntity(int dcrmainId, int paymentTypeId, String demandDraftNumber, Date demandDraftDate,
        float demandDraftAmount, int bankId, int locationId, float totalAmount) {
        super();
        this.dcrmainId = dcrmainId;
        this.paymentTypeId = paymentTypeId;
        this.demandDraftNumber = demandDraftNumber;
        this.demandDraftDate = demandDraftDate;
        this.demandDraftAmount = demandDraftAmount;
        this.bankId = bankId;
        this.locationId = locationId;
        this.totalAmount = totalAmount;
    }

}
