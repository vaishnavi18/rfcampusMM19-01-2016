package com.iitms.rfcampusdata.payroll.masters.entity;

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
@Table(name = "payroll.calculative_payment_monthwise_master")
public class CalculativePaymentMonthwiseMaster {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "payhead_code")
    private String payheadCode;

    @Column(name = "payhead_short_name")
    private String payheadShortName;

    @Column(name = "payhead_long_name")
    private String payheadLongName;

    @Column(name = "sequence_number")
    private float sequenceNumber;

    @Column(name = "minimum_start_limit")
    private float minimumStartLimit;

    @Column(name = "maximum_end_limit")
    private float maximum_end_limit;

    @Column(name = "percentage")
    private float percentage;

    @Column(name = "minimum_amount")
    private float minimumAmount;

    @Column(name = "maximum_amount")
    private float maximumAmount;

    @Column(name = "fix_amount")
    private float fixAmount;

    @Column(name = "payhead_rule")
    private String payheadRule;

    @Column(name = "active_start_time")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date activeStartTime;

    @Column(name = "active_end_time")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date activeEndTime;

    @Column(name = "month_year")
    private String monthYear;

    @Column(name = "formula_used")
    private String formulaUsed;

    @Column(name = "remark")
    private String remark;

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
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPayheadCode() {
        return payheadCode;
    }

    public void setPayheadCode(String payheadCode) {
        this.payheadCode = payheadCode;
    }

    public String getPayheadShortName() {
        return payheadShortName;
    }

    public void setPayheadShortName(String payheadShortName) {
        this.payheadShortName = payheadShortName;
    }

    public String getPayheadLongName() {
        return payheadLongName;
    }

    public void setPayheadLongName(String payheadLongName) {
        this.payheadLongName = payheadLongName;
    }

    public float getSequenceNumber() {
        return sequenceNumber;
    }

    public void setSequenceNumber(float sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }

    public float getMinimumStartLimit() {
        return minimumStartLimit;
    }

    public void setMinimumStartLimit(float minimumStartLimit) {
        this.minimumStartLimit = minimumStartLimit;
    }

    public float getMaximum_end_limit() {
        return maximum_end_limit;
    }

    public void setMaximum_end_limit(float maximum_end_limit) {
        this.maximum_end_limit = maximum_end_limit;
    }

    public float getPercentage() {
        return percentage;
    }

    public void setPercentage(float percentage) {
        this.percentage = percentage;
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

    public String getPayheadRule() {
        return payheadRule;
    }

    public void setPayheadRule(String payheadRule) {
        this.payheadRule = payheadRule;
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

    public String getMonthYear() {
        return monthYear;
    }

    public void setMonthYear(String monthYear) {
        this.monthYear = monthYear;
    }

    public String getFormulaUsed() {
        return formulaUsed;
    }

    public void setFormulaUsed(String formulaUsed) {
        this.formulaUsed = formulaUsed;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
