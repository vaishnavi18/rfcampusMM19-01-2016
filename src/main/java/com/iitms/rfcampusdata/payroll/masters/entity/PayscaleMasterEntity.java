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
@Table(name = "payroll.payroll_payscale")
public class PayscaleMasterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "basic1")
    private int basic1;

    @Column(name = "basic2")
    private int basic2;

    @Column(name = "basic3")
    private int basic3;

    @Column(name = "basic4")
    private int basic4;

    @Column(name = "basic5")
    private int basic5;

    @Column(name = "increment_basic1")
    private int incrementBasic1;

    @Column(name = "increment_basic2")
    private int incrementBasic2;

    @Column(name = "increment_basic3")
    private int incrementBasic3;

    @Column(name = "increment_basic4")
    private int incrementBasic4;

    @Column(name = "increment_basic5")
    private int incrementBasic5;

    @Column(name = "scale")
    private String scale;

    @Column(name = "scale_number")
    private float scaleNumber;

    @Column(name = "grade_pay")
    private float gradePay;

    @Column(name = "rule_id")
    private int ruleNumber;

    @Column(name = "college_id")
    private int collegeId;

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

    @Column(name = "is_active")
    private boolean isActive;

    @Column(name = "start_time")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date startTime;

    @Column(name = "end_time")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date end_time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBasic1() {
        return basic1;
    }

    public void setBasic1(int basic1) {
        this.basic1 = basic1;
    }

    public int getBasic2() {
        return basic2;
    }

    public void setBasic2(int basic2) {
        this.basic2 = basic2;
    }

    public int getBasic3() {
        return basic3;
    }

    public void setBasic3(int basic3) {
        this.basic3 = basic3;
    }

    public int getBasic4() {
        return basic4;
    }

    public void setBasic4(int basic4) {
        this.basic4 = basic4;
    }

    public int getBasic5() {
        return basic5;
    }

    public void setBasic5(int basic5) {
        this.basic5 = basic5;
    }

    public int getIncrementBasic1() {
        return incrementBasic1;
    }

    public void setIncrementBasic1(int incrementBasic1) {
        this.incrementBasic1 = incrementBasic1;
    }

    public int getIncrementBasic2() {
        return incrementBasic2;
    }

    public void setIncrementBasic2(int incrementBasic2) {
        this.incrementBasic2 = incrementBasic2;
    }

    public int getIncrementBasic3() {
        return incrementBasic3;
    }

    public void setIncrementBasic3(int incrementBasic3) {
        this.incrementBasic3 = incrementBasic3;
    }

    public int getIncrementBasic4() {
        return incrementBasic4;
    }

    public void setIncrementBasic4(int incrementBasic4) {
        this.incrementBasic4 = incrementBasic4;
    }

    public int getIncrementBasic5() {
        return incrementBasic5;
    }

    public void setIncrementBasic5(int incrementBasic5) {
        this.incrementBasic5 = incrementBasic5;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public float getScaleNumber() {
        return scaleNumber;
    }

    public void setScaleNumber(float scaleNumber) {
        this.scaleNumber = scaleNumber;
    }

    public float getGradePay() {
        return gradePay;
    }

    public void setGradePay(float gradePay) {
        this.gradePay = gradePay;
    }

    public int getRuleNumber() {
        return ruleNumber;
    }

    public void setRuleNumber(int ruleNumber) {
        this.ruleNumber = ruleNumber;
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

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }
}
