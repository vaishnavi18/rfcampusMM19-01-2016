package com.iitms.rfcampusdata.academic.masters.entity;

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
 * TABLE:master.admission_semester_master, Fields:12
 * 
 * @author Sachinmt
 */
@Entity
@Table(name = "master.admission_semester_master")
public class SemesterMasterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "semester_name")
    private String semesterName;

    @Column(name = "semester_full_name")
    private String semesterFullName;

    @Column(name = "semester_odd_even")
    private int semesterOddEven;

    @Column(name = "year_id")
    private int yearId;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "macaddress")
    private String macAddress;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "created_date")
    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:s")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;

    @Column(name = "modified_by")
    private int modifiedBy;

    @Column(name = "modified_date")
    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:s")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSemesterName() {
        return semesterName;
    }

    public void setSemesterName(String semesterName) {
        this.semesterName = semesterName;
    }

    public String getSemesterFullName() {
        return semesterFullName;
    }

    public void setSemesterFullName(String semesterFullName) {
        this.semesterFullName = semesterFullName;
    }

    public int getSemesterOddEven() {
        return semesterOddEven;
    }

    public void setSemesterOddEven(int semesterOddEven) {
        this.semesterOddEven = semesterOddEven;
    }

    public int getYearId() {
        return yearId;
    }

    public void setYearId(int yearId) {
        this.yearId = yearId;
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
