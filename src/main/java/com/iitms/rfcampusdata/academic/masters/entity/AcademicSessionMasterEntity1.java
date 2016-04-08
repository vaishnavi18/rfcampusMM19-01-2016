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
@Table(name = "master.exam_session_master ")
public class AcademicSessionMasterEntity1 implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "session_name")
    private String sessionName;

    @Column(name = "session_start_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date sessionStartDate;

    @Column(name = "session_end_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date sessionEndDate;

    @Column(name = "odd_even_session")
    private int oddEvenSession;

    @Column(name = "session_lock")
    private boolean sessionLock;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "exam_type_id")
    private int examTypeId;

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

    public String getSessionName() {
        return sessionName;
    }

    public void setSessionName(String sessionName) {
        this.sessionName = sessionName;
    }

    public Date getSessionStartDate() {
        return sessionStartDate;
    }

    public void setSessionStartDate(Date sessionStartDate) {
        this.sessionStartDate = sessionStartDate;
    }

    public Date getSessionEndDate() {
        return sessionEndDate;
    }

    public void setSessionEndDate(Date sessionEndDate) {
        this.sessionEndDate = sessionEndDate;
    }

    public int getOddEvenSession() {
        return oddEvenSession;
    }

    public void setOddEvenSession(int oddEvenSession) {
        this.oddEvenSession = oddEvenSession;
    }

    public boolean isSessionLock() {
        return sessionLock;
    }

    public void setSessionLock(boolean sessionLock) {
        this.sessionLock = sessionLock;
    }

    public String getCollegeCode() {
        return collegeCode;
    }

    public void setCollegeCode(String collegeCode) {
        this.collegeCode = collegeCode;
    }

    public int getExamTypeId() {
        return examTypeId;
    }

    public void setExamTypeId(int examTypeId) {
        this.examTypeId = examTypeId;
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
