package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * TABLE: transaction.fees_sessioncounter_reference_transaction, Fields:12
 * 
 * @author Preeti
 */

@Entity
@Table(name = "transaction.fees_sessioncounter_reference_transaction")
public class FeesSessionCounterReferenceTransactionEntity {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    @Id
    private int id;

    @Column(name = "user_counter_id")
    private int userCounterId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_counter_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private FeesUserCounterMasterEntity feesUserCounterMasterEntity;

    @Column(name = "session_id")
    private int sessionId;

    @Column(name = "receipt_number")
    private int receiptNumber;

    @Column(name = "is_active")
    private boolean isActive;

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

    public int getUserCounterId() {
        return userCounterId;
    }

    public void setUserCounterId(int userCounterId) {
        this.userCounterId = userCounterId;
    }

    public FeesUserCounterMasterEntity getFeesUserCounterMasterEntity() {
        return feesUserCounterMasterEntity;
    }

    public void setFeesUserCounterMasterEntity(FeesUserCounterMasterEntity feesUserCounterMasterEntity) {
        this.feesUserCounterMasterEntity = feesUserCounterMasterEntity;
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

}
