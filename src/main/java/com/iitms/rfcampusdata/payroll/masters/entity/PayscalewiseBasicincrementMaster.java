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
@Table(name = "payroll.payscalewise_basicincrement_master")
public class PayscalewiseBasicincrementMaster {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "scale_id")
    private String scale_id;

    @Column(name = "basic_increment_shortcode")
    private String basicIncrementShortcode;

    @Column(name = "basic_amount")
    private int basicAmount;

    @Column(name = "increment_amount")
    private int incrementAmount;

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

    public String getScale_id() {
        return scale_id;
    }

    public void setScale_id(String scale_id) {
        this.scale_id = scale_id;
    }

    public String getBasicIncrementShortcode() {
        return basicIncrementShortcode;
    }

    public void setBasicIncrementShortcode(String basicIncrementShortcode) {
        this.basicIncrementShortcode = basicIncrementShortcode;
    }

    public int getBasicAmount() {
        return basicAmount;
    }

    public void setBasicAmount(int basicAmount) {
        this.basicAmount = basicAmount;
    }

    public int getIncrementAmount() {
        return incrementAmount;
    }

    public void setIncrementAmount(int incrementAmount) {
        this.incrementAmount = incrementAmount;
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
