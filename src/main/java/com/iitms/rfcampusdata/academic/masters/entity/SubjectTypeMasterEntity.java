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
@Table(name = "master.academic_subject_type_master")
public class SubjectTypeMasterEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    public SubjectTypeMasterEntity() {
        super();
    }

    public SubjectTypeMasterEntity(Integer id, String subjectType) {
        super();
        if (id != 0) {
            this.id = id;
        }
        this.subjectType = subjectType;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "subject_type_code")
    private String subjectTypeCode;

    @Column(name = "subject_type")
    private String subjectType;

    @Column(name = "is_internal_exam")
    private boolean isInternalExam;

    @Column(name = "is_external_exam")
    private boolean isExternalExam;

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

    public String getSubjectTypeCode() {
        return subjectTypeCode;
    }

    public void setSubjectTypeCode(String subjectTypeCode) {
        this.subjectTypeCode = subjectTypeCode;
    }

    public String getSubjectType() {
        return subjectType;
    }

    public void setSubjectType(String subjectType) {
        this.subjectType = subjectType;
    }

    public boolean isInternalExam() {
        return isInternalExam;
    }

    public void setInternalExam(boolean isInternalExam) {
        this.isInternalExam = isInternalExam;
    }

    public boolean isExternalExam() {
        return isExternalExam;
    }

    public void setExternalExam(boolean isExternalExam) {
        this.isExternalExam = isExternalExam;
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
