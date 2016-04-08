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

@Entity
@Table(name = "transaction.admission_familydetails_transaction")
public class FamilyMemberDetailEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "student_id")
    private int studentId;

    @Column(name = "family_member_name")
    private String familyMemberName;

    @Column(name = "family_relation")
    private int familyRelation;

    @Column(name = "family_address")
    private String familyMemberAddress;

    @Column(name = "family_mobile")
    private String familyMobile;

    @Column(name = "family_email")
    private String familyEmail;

    @Column(name = "education_id")
    private int educationId;

    @Column(name = "family_designation")
    private String familyDesignation;

    @Column(name = "family_details_status")
    private boolean familyDetailsStatus;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "macaddress")
    private String macAddress;

    @Column(name = "created_by")
    private int createBy;

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

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getFamilyMemberName() {
        return familyMemberName;
    }

    public void setFamilyMemberName(String familyMemberName) {
        this.familyMemberName = familyMemberName;
    }

    public int getFamilyRelation() {
        return familyRelation;
    }

    public void setFamilyRelation(int familyRelation) {
        this.familyRelation = familyRelation;
    }

    public String getFamilyMemberAddress() {
        return familyMemberAddress;
    }

    public void setFamilyMemberAddress(String familyMemberAddress) {
        this.familyMemberAddress = familyMemberAddress;
    }

    public String getFamilyMobile() {
        return familyMobile;
    }

    public void setFamilyMobile(String familyMobile) {
        this.familyMobile = familyMobile;
    }

    public String getFamilyEmail() {
        return familyEmail;
    }

    public void setFamilyEmail(String familyEmail) {
        this.familyEmail = familyEmail;
    }

    public int getEducationId() {
        return educationId;
    }

    public void setEducationId(int educationId) {
        this.educationId = educationId;
    }

    public String getFamilyDesignation() {
        return familyDesignation;
    }

    public void setFamilyDesignation(String familyDesignation) {
        this.familyDesignation = familyDesignation;
    }

    public boolean isFamilyDetailsStatus() {
        return familyDetailsStatus;
    }

    public void setFamilyDetailsStatus(boolean familyDetailsStatus) {
        this.familyDetailsStatus = familyDetailsStatus;
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

    public int getCreateBy() {
        return createBy;
    }

    public void setCreateBy(int createBy) {
        this.createBy = createBy;
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
