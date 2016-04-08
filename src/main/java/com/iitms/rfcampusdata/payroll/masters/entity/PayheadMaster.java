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
@Table(name = "payroll.payhead_master")
public class PayheadMaster {

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

    @Column(name = "payhead_type")
    private String payheadType;

    @Column(name = "calculated_on")
    private String calculatedOn;

    @Column(name = "payhead_rule")
    private String payheadRule;

    @Column(name = "payh")
    private String payh;

    @Column(name = "payd")
    private String payd;

    @Column(name = "calculate_on_amount")
    private String calculateOnAmount;

    @Column(name = "formula_used")
    private String formulaUsed;

    @Column(name = "sequence_number")
    private int sequenceNumber;

    @Column(name = "is_income_tax")
    private boolean isIncomeTax;

    @Column(name = "is_active")
    private boolean isActive;

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

    public String getPayheadType() {
        return payheadType;
    }

    public void setPayheadType(String payheadType) {
        this.payheadType = payheadType;
    }

    public String getCalculatedOn() {
        return calculatedOn;
    }

    public void setCalculatedOn(String calculatedOn) {
        this.calculatedOn = calculatedOn;
    }

    public String getPayheadRule() {
        return payheadRule;
    }

    public void setPayheadRule(String payheadRule) {
        this.payheadRule = payheadRule;
    }

    public String getPayh() {
        return payh;
    }

    public void setPayh(String payh) {
        this.payh = payh;
    }

    public String getPayd() {
        return payd;
    }

    public void setPayd(String payd) {
        this.payd = payd;
    }

    public String getCalculateOnAmount() {
        return calculateOnAmount;
    }

    public void setCalculateOnAmount(String calculateOnAmount) {
        this.calculateOnAmount = calculateOnAmount;
    }

    public String getFormulaUsed() {
        return formulaUsed;
    }

    public void setFormulaUsed(String formulaUsed) {
        this.formulaUsed = formulaUsed;
    }

    public int getSequenceNumber() {
        return sequenceNumber;
    }

    public void setSequenceNumber(int sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }

    public boolean isIncomeTax() {
        return isIncomeTax;
    }

    public void setIncomeTax(boolean isIncomeTax) {
        this.isIncomeTax = isIncomeTax;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
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

}
