package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.io.Serializable;
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

import com.iitms.rfcampusdata.authentication.entity.UserMasterEntity;

/**
 * TABLE: master.fees_user_counter_master, Fields:13
 * 
 * @author Preeti
 */

@Entity
@Table(name = "master.fees_user_counter_master")
public class FeesUserCounterMasterEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    @Id
    private int id;

    @Column(name = "user_id")
    private int userId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private UserMasterEntity userMasterEntity;

    @Column(name = "counter_id")
    private int counterId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "counter_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private FeesCounterMasterEntity feesCounterMasterEntity;

    @Column(name = "receipt_type_id")
    private int receiptTypeId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receipt_type_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private FeesReceiptTypeEntity feesReceiptTypeEntity;

    @Column(name = "payment_mode_id")
    private int paymentModeId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_mode_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private FeesPaymentModeEntity feesPaymentModeEntity;

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

    public FeesCounterMasterEntity getFeesCounterMasterEntity() {
        return feesCounterMasterEntity;
    }

    public void setFeesCounterMasterEntity(FeesCounterMasterEntity feesCounterMasterEntity) {
        this.feesCounterMasterEntity = feesCounterMasterEntity;
    }

    public FeesReceiptTypeEntity getFeesReceiptTypeEntity() {
        return feesReceiptTypeEntity;
    }

    public void setFeesReceiptTypeEntity(FeesReceiptTypeEntity feesReceiptTypeEntity) {
        this.feesReceiptTypeEntity = feesReceiptTypeEntity;
    }

    public FeesPaymentModeEntity getFeesPaymentModeEntity() {
        return feesPaymentModeEntity;
    }

    public void setFeesPaymentModeEntity(FeesPaymentModeEntity feesPaymentModeEntity) {
        this.feesPaymentModeEntity = feesPaymentModeEntity;
    }

    public FeesUserCounterMasterEntity(int userId, int counterId, int receiptTypeId, int paymentModeId,
        boolean isActive) {
        super();
        this.userId = userId;
        this.counterId = counterId;
        this.receiptTypeId = receiptTypeId;
        this.paymentModeId = paymentModeId;
        this.isActive = isActive;
    }

    public FeesUserCounterMasterEntity() {
        super();
    }

}
