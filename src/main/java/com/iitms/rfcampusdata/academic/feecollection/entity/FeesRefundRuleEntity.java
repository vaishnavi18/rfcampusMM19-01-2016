package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.io.Serializable;
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
 * @author Sachinmt
 */
@Entity
@Table(name = "master.fees_refund_rule")
public class FeesRefundRuleEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "rule_short_name")
    private String ruleShortName;

    @Column(name = "rule_long_name")
    private String ruleLongName;

    @Column(name = "receipt_type_id")
    private int receiptTypeId;

    @Column(name = "degree_id")
    private int degreeId;

    @Column(name = "payment_type_id")
    private int paymentTypeId;

    @Column(name = "is_active")
    private boolean isActive;

    @Column(name = "active_start_date")
    private Date activeStartDate;

    @Column(name = "active_end_date")
    private Date activeEndDate;

    @Column(name = "remark")
    private String remark;

    @Column(name = "college_id")
    private int collegeId;

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

    @Transient
    private List<FeesRefundruleCalculativeEntity> refundRuleTransaction;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRuleShortName() {
        return ruleShortName;
    }

    public void setRuleShortName(String ruleShortName) {
        this.ruleShortName = ruleShortName;
    }

    public String getRuleLongName() {
        return ruleLongName;
    }

    public void setRuleLongName(String ruleLongName) {
        this.ruleLongName = ruleLongName;
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

    public int getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(int paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getActiveStartDate() {
        return activeStartDate;
    }

    public void setActiveStartDate(Date activeStartDate) {
        this.activeStartDate = activeStartDate;
    }

    public Date getActiveEndDate() {
        return activeEndDate;
    }

    public void setActiveEndDate(Date activeEndDate) {
        this.activeEndDate = activeEndDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
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

    public List<FeesRefundruleCalculativeEntity> getRefundRuleTransaction() {
        return refundRuleTransaction;
    }

    public void setRefundRuleTransaction(List<FeesRefundruleCalculativeEntity> refundRuleTransaction) {
        this.refundRuleTransaction = refundRuleTransaction;
    }

    @Override
    public String toString() {
        return "FeesRefundRuleEntity [ruleLongName=" + ruleLongName + ", receiptTypeId=" + receiptTypeId + ", degreeId="
            + degreeId + ", paymentTypeId=" + paymentTypeId + ", isActive=" + isActive + ", refundRuleTransaction="
            + refundRuleTransaction + "]";
    }

}
