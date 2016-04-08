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
@Table(name = "master.fees_feehead_master")
public class FeesFeeheadEntity {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int Id;

    @Column(name = "receipt_type_id")
    private int receiptTypeId;

    @Column(name = "feehead_short_name")
    private String feeheadShortName;

    @Column(name = "feehead_long_name")
    private String feeheadLongName;

    @Column(name = "serial_number")
    private int serialNumber;

    public int getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(int serialNumber) {
        this.serialNumber = serialNumber;
    }

    @Column(name = "is_active")
    private boolean isActive;

    @Column(name = "active_start_time")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date activeStartTime;

    @Column(name = " active_end_time")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date activeEndTime;

    @Column(name = "remark")
    private String remark;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "ipaddress")
    private String ipaddress;

    @Column(name = "macaddress")
    private String macaddress;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "created_date")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date createdDate;

    @Column(name = "modified_by")
    private int modifiedBy;

    @Column(name = "modified_date")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date modifiedDate;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getReceiptTypeId() {
        return receiptTypeId;
    }

    public void setReceiptTypeId(int receiptTypeId) {
        this.receiptTypeId = receiptTypeId;
    }

    public String getFeeheadShortName() {
        return feeheadShortName;
    }

    public void setFeeheadShortName(String feeheadShortName) {
        this.feeheadShortName = feeheadShortName;
    }

    public String getFeeheadLongName() {
        return feeheadLongName;
    }

    public void setFeeheadLongName(String feeheadLongName) {
        this.feeheadLongName = feeheadLongName;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getActiveStartTime() {
        return activeStartTime;
    }

    public void setActiveStartTime(Date activeStartTime) {
        this.activeStartTime = activeStartTime;
    }

    public Date getActiveEndTime() {
        return activeEndTime;
    }

    public void setActiveEndTime(Date activeEndTime) {
        this.activeEndTime = activeEndTime;
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

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public String getMacaddress() {
        return macaddress;
    }

    public void setMacaddress(String macaddress) {
        this.macaddress = macaddress;
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

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "FeesFeeheadEntity [Id=" + Id + ", receiptTypeId=" + receiptTypeId + ", feeheadShortName="
            + feeheadShortName + ", feeheadLongName=" + feeheadLongName + ", serialNumber=" + serialNumber + "]";
    }

}
