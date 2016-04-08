package com.iitms.rfcampuscommon;

import java.util.Date;

/**
 * 
 * @author Sachinmt
 *
 */
public class ExcelModel {
    
    private long AdmissionExcelSerialNo;
    private long rollNumber;
    private long allIndiaRanking;    
    private String candidateName;    
    private String branchName;
    private String candidateCategory;    
    private String allocatedCategory;
    private String stateName;
    private Date reportingDate;    
    private String reportedFrom;
    private String quotaName;    
    private String fatherName;    
    private String motherName;    
    private long mobileNumber;
    private String genderName;
    
    public ExcelModel(long admissionExcelSerialNo, long rollNumber, long allIndiaRanking, String candidateName,
        String branchName, String candidateCategory, String allocatedCategory, String stateName, Date reportingDate,
        String reportedFrom, String quotaName, String fatherName, String motherName, long mobileNumber,
        String genderName) {        
        AdmissionExcelSerialNo = admissionExcelSerialNo;
        this.rollNumber = rollNumber;
        this.allIndiaRanking = allIndiaRanking;
        this.candidateName = candidateName;
        this.branchName = branchName;
        this.candidateCategory = candidateCategory;
        this.allocatedCategory = allocatedCategory;
        this.stateName = stateName;
        this.reportingDate = reportingDate;
        this.reportedFrom = reportedFrom;
        this.quotaName = quotaName;
        this.fatherName = fatherName;
        this.motherName = motherName;
        this.mobileNumber = mobileNumber;
        this.genderName = genderName;
    }

    public long getAdmissionExcelSerialNo() {
        return AdmissionExcelSerialNo;
    }

    public void setAdmissionExcelSerialNo(long admissionExcelSerialNo) {
        AdmissionExcelSerialNo = admissionExcelSerialNo;
    }

    public long getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(long rollNumber) {
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

    public String getQuotaName() {
        return quotaName;
    }

    public void setQuotaName(String quotaName) {
        this.quotaName = quotaName;
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

    public long getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(long mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }
    
}
