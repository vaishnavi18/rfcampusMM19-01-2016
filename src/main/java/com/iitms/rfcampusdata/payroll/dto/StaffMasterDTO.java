package com.iitms.rfcampusdata.payroll.dto;

import java.util.Date;

import com.iitms.rfcampusdata.payroll.masters.entity.StaffTypeMaster;

/**
 * @author Sachinmt
 */
public class StaffMasterDTO {

    private int id;

    private StaffTypeMaster staffTypeMaster;

    private int staffTypeId;

    private String staffCategory;

    private int retirementAge;

    private String remark;

    private String collegeCode;

    private String ipAddress;

    private String macAddress;

    private int createdBy;

    private Date createdDate;

    private int modifiedBy;

    private Date modifiedDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public StaffTypeMaster getStaffTypeMaster() {
        return staffTypeMaster;
    }

    public void setStaffTypeMaster(StaffTypeMaster staffTypeMaster) {
        this.staffTypeMaster = staffTypeMaster;
    }

    public int getStaffTypeId() {
        return staffTypeId;
    }

    public void setStaffTypeId(int staffTypeId) {
        this.staffTypeId = staffTypeId;
    }

    public String getStaffCategory() {
        return staffCategory;
    }

    public void setStaffCategory(String staffCategory) {
        this.staffCategory = staffCategory;
    }

    public int getRetirementAge() {
        return retirementAge;
    }

    public void setRetirementAge(int retirementAge) {
        this.retirementAge = retirementAge;
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
