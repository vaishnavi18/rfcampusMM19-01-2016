package com.iitms.rfcampusdata.payroll.dto;

import java.util.Date;

public class PayscaleDTO {

    private int id;

    private String basicName;

    private String B1;

    private String B2;

    private String B3;

    private String B4;

    private String B5;

    public String getB5() {
        return B5;
    }

    public void setB5(String b5) {
        B5 = b5;
    }

    public String getI1() {
        return I1;
    }

    public void setI1(String i1) {
        I1 = i1;
    }

    public String getI2() {
        return I2;
    }

    public void setI2(String i2) {
        I2 = i2;
    }

    public String getI3() {
        return I3;
    }

    public void setI3(String i3) {
        I3 = i3;
    }

    public String getI4() {
        return I4;
    }

    public void setI4(String i4) {
        I4 = i4;
    }

    public String getI5() {
        return I5;
    }

    public void setI5(String i5) {
        I5 = i5;
    }

    private String I1;

    private String I2;

    private String I3;

    private String I4;

    private String I5;

    public String getB1() {
        return B1;
    }

    public void setB1(String b1) {
        B1 = b1;
    }

    public String getB2() {
        return B2;
    }

    public void setB2(String b2) {
        B2 = b2;
    }

    public String getB3() {
        return B3;
    }

    public void setB3(String b3) {
        B3 = b3;
    }

    public String getB4() {
        return B4;
    }

    public void setB4(String b4) {
        B4 = b4;
    }

    private int basicAmount;

    private String incrementName;

    private int incrementAmount;

    private String scale;

    private float scaleRange;

    private float gradePay;

    private int ruleNumber;

    private String collegeCode;

    private String ipAddress;

    private String macAddress;

    private int createdBy;

    private Date createdDate;

    private int modifiedBy;

    private Date modifiedDate;

    private int scaleNumber;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBasicName() {
        return basicName;
    }

    public void setBasicName(String basicName) {
        this.basicName = basicName;
    }

    public int getBasicAmount() {
        return basicAmount;
    }

    public void setBasicAmount(int basicAmount) {
        this.basicAmount = basicAmount;
    }

    public String getIncrementName() {
        return incrementName;
    }

    public void setIncrementName(String incrementName) {
        this.incrementName = incrementName;
    }

    public int getIncrementAmount() {
        return incrementAmount;
    }

    public void setIncrementAmount(int incrementAmount) {
        this.incrementAmount = incrementAmount;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public float getScaleRange() {
        return scaleRange;
    }

    public void setScaleRange(float scaleRange) {
        this.scaleRange = scaleRange;
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

    public int getScaleNumber() {
        return scaleNumber;
    }

    public void setScaleNumber(int scaleNumber) {
        this.scaleNumber = scaleNumber;
    }

}
