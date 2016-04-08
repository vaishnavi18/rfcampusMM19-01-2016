package com.iitms.rfcampusdata.academic.masters.entity;

import java.io.Serializable;
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

/**
 * @author Sachinmt
 */

@Entity
@Table(name = "master.academic_holiday_master")
public class AcademicHolidayMasterEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "holiday_type_id")
    private int holidayTypeId;

    @Column(name = "holiday_short_name")
    private String holidayShortName;

    @Column(name = "holiday_details")
    private String holidayDetails;

    @Column(name = "academic_session_id")
    private int academicSessionId;

    @Column(name = "holiday_start_date")
    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date holidayStartDate;

    @Column(name = "holiday_end_date")
    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date holidayEndDate;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "macaddress")
    private String macAddress;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "created_date")
    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;

    @Column(name = "modified_by")
    private int modifiedBy;

    @Column(name = "modified_date")
    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHolidayTypeId() {
        return holidayTypeId;
    }

    public void setHolidayTypeId(int holidayTypeId) {
        this.holidayTypeId = holidayTypeId;
    }

    public String getHolidayShortName() {
        return holidayShortName;
    }

    public void setHolidayShortName(String holidayShortName) {
        this.holidayShortName = holidayShortName;
    }

    public String getHolidayDetails() {
        return holidayDetails;
    }

    public void setHolidayDetails(String holidayDetails) {
        this.holidayDetails = holidayDetails;
    }

    public int getAcademicSessionId() {
        return academicSessionId;
    }

    public void setAcademicSessionId(int academicSessionId) {
        this.academicSessionId = academicSessionId;
    }

    public Date getHolidayStartDate() {
        return holidayStartDate;
    }

    public void setHolidayStartDate(Date holidayStartDate) {
        this.holidayStartDate = holidayStartDate;
    }

    public Date getHolidayEndDate() {
        return holidayEndDate;
    }

    public void setHolidayEndDate(Date holidayEndDate) {
        this.holidayEndDate = holidayEndDate;
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
