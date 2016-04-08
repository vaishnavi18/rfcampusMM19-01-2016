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

/**
 * @author Sachinmt
 */
@Entity
@Table(name = "transaction.fees_refundrule_calculative")
public class FeesRefundruleCalculativeEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "refund_rule_id")
    private int refundRuleId;

    @Column(name = "feehead_id")
    private int feeHeadId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "feehead_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private FeesFeeheadEntity feeheadEntity;

    @Column(name = "is_calculative")
    private boolean isCalculative;

    @Column(name = "percentage_or_amount")
    private float percentageOrAmount;

    @Column(name = "minimum_amount")
    private float minimumAmount;

    @Column(name = "maximum_amount")
    private float maximumAmount;

    @Column(name = "fix_amount")
    private float fixAmount;

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRefundRuleId() {
        return refundRuleId;
    }

    public void setRefundRuleId(int refundRuleId) {
        this.refundRuleId = refundRuleId;
    }

    public int getFeeHeadId() {
        return feeHeadId;
    }

    public void setFeeHeadId(int feeHeadId) {
        this.feeHeadId = feeHeadId;
    }

    public boolean isCalculative() {
        return isCalculative;
    }

    public void setCalculative(boolean isCalculative) {
        this.isCalculative = isCalculative;
    }

    public float getPercentageOrAmount() {
        return percentageOrAmount;
    }

    public void setPercentageOrAmount(float percentageOrAmount) {
        this.percentageOrAmount = percentageOrAmount;
    }

    public float getMinimumAmount() {
        return minimumAmount;
    }

    public void setMinimumAmount(float minimumAmount) {
        this.minimumAmount = minimumAmount;
    }

    public float getMaximumAmount() {
        return maximumAmount;
    }

    public void setMaximumAmount(float maximumAmount) {
        this.maximumAmount = maximumAmount;
    }

    public float getFixAmount() {
        return fixAmount;
    }

    public void setFixAmount(float fixAmount) {
        this.fixAmount = fixAmount;
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

    @Override
    public String toString() {
        return "FeesRefundruleCalculativeEntity [refundRuleId=" + refundRuleId + ", feeHeadId=" + feeHeadId
            + ", isCalculative=" + isCalculative + ", percentageOrAmount=" + percentageOrAmount + "]";
    }

    public FeesFeeheadEntity getFeeheadEntity() {
        return feeheadEntity;
    }

    public void setFeeheadEntity(FeesFeeheadEntity feeheadEntity) {
        this.feeheadEntity = feeheadEntity;
    }

}
