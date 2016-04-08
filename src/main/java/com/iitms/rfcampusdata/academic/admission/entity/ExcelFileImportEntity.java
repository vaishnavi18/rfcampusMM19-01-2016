package com.iitms.rfcampusdata.academic.admission.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Table:master.admission_excel, Fields:15
 * 
 * @author ANANDP
 */
@Entity
@Table(name = "master.admission_excel")
public class ExcelFileImportEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "serial_number", columnDefinition = "serial")
    private long AdmissionExcelSerialNo;

    @Column(name = "roll_number")
    private String rollNumber;

    @Column(name = "all_india_ranking")
    private long allIndiaRanking;

    @Column(name = "candidate_name")
    private String candidateName;

    @Column(name = "branch_name_id")
    private int branchNameId;

    @Column(name = "alloted_category_id")
    private int allotedCategoryId;

    @Column(name = "candidate_category_id")
    private int candidateCategoryId;

    @Column(name = "home_state_id")
    private int homeStateId;

    @Column(name = "reporting_date")
    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date reportingDate;

    @Column(name = "reported_from")
    private String reportedFrom;

    @Column(name = "quota_id")
    private int quotaId;

    @Column(name = "father_name")
    private String fatherName;

    @Column(name = "mother_name")
    private String motherName;

    @Column(name = "mobile_number")
    private String mobileNumber;

    @Column(name = "gender_id")
    private int genderId;

    @Transient
    private String branchName;

    @Transient
    private String candidateCategory;

    @Transient
    private String allocatedCategory;

    @Transient
    private String stateName;

    @Transient
    private String quotaName;

    public long getAdmissionExcelSerialNo() {
        return AdmissionExcelSerialNo;
    }

    public void setAdmissionExcelSerialNo(long admissionExcelSerialNo) {
        AdmissionExcelSerialNo = admissionExcelSerialNo;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public long getAllIndiaRanking() {
        return allIndiaRanking;
    }

    public void setAllIndiaRanking(long allIndiaRanking) {
        this.allIndiaRanking = allIndiaRanking;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public int getBranchNameId() {
        return branchNameId;
    }

    public void setBranchNameId(int branchNameId) {
        this.branchNameId = branchNameId;
    }

    public int getAllotedCategoryId() {
        return allotedCategoryId;
    }

    public void setAllotedCategoryId(int allotedCategoryId) {
        this.allotedCategoryId = allotedCategoryId;
    }

    public int getHomeStateId() {
        return homeStateId;
    }

    public void setHomeStateId(int homeStateId) {
        this.homeStateId = homeStateId;
    }

    public Date getReportingDate() {
        return reportingDate;
    }

    public void setReportingDate(Date reportingDate) {
        this.reportingDate = reportingDate;
    }

    public String getReportedFrom() {
        return reportedFrom;
    }

    public void setReportedFrom(String reportedFrom) {
        this.reportedFrom = reportedFrom;
    }

    public int getQuotaId() {
        return quotaId;
    }

    public void setQuotaId(int quotaId) {
        this.quotaId = quotaId;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public int getGenderId() {
        return genderId;
    }

    public void setGenderId(int genderId) {
        this.genderId = genderId;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getCandidateCategory() {
        return candidateCategory;
    }

    public void setCandidateCategory(String candidateCategory) {
        this.candidateCategory = candidateCategory;
    }

    public String getAllocatedCategory() {
        return allocatedCategory;
    }

    public void setAllocatedCategory(String allocatedCategory) {
        this.allocatedCategory = allocatedCategory;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getQuotaName() {
        return quotaName;
    }

    public void setQuotaName(String quotaName) {
        this.quotaName = quotaName;
    }

    public int getCandidateCategoryId() {
        return candidateCategoryId;
    }

    public void setCandidateCategoryId(int candidateCategoryId) {
        this.candidateCategoryId = candidateCategoryId;
    }

}
