package com.iitms.rfcampusdata.academic.masters.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * TABLE:master.admission_branch__master, Field:22
 * 
 * @author Sachinmt
 */
@Entity
@Table(name = "master.admission_branch_master")
public class BranchMasterEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "branch_short_name")
    private String branchShortName;

    @Column(name = "branch_long_name")
    private String branchLongName;

    @Column(name = "branch_name_hindi")
    private String branchNameHindi;

    @Column(name = "branch_total_intake")
    private int branchTotalIntake;

    @Column(name = "branch_intake_round1")
    private int branchIntakeRound1;

    @Column(name = "branch_intake_round2")
    private int branchIntakeRound2;

    @Column(name = "branch_intake_round3")
    private int branchIntakeRound3;

    @Column(name = "branch_intake_round4")
    private int branchIntakeRound4;

    @Column(name = "branch_intake_round5")
    private int branchIntakeRound5;

    @Column(name = "branch_duration")
    private int branchDuration;

    @Column(name = "branch_code")
    private String branchCode;

    @Column(name = "branch_degree_type")
    private String branchDegreeType;

    @Column(name = "branch_degree_number")
    private int branchDegreeNumber;

    @Column(name = "deptno")
    private int deptNo;

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

    // Many to one
    @Transient
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "branch_degree_number", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private DegreeMasterEntity admissionDegreeMasterEntity;

    public DegreeMasterEntity getAdmissionDegreeMasterEntity() {
        return admissionDegreeMasterEntity;
    }

    public void setAdmissionDegreeMasterEntity(DegreeMasterEntity admissionDegreeMasterEntity) {
        this.admissionDegreeMasterEntity = admissionDegreeMasterEntity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBranchShortName() {
        return branchShortName;
    }

    public void setBranchShortName(String branchShortName) {
        this.branchShortName = branchShortName;
    }

    public String getBranchLongName() {
        return branchLongName;
    }

    public void setBranchLongName(String branchLongName) {
        this.branchLongName = branchLongName;
    }

    public String getBranchNameHindi() {
        return branchNameHindi;
    }

    public void setBranchNameHindi(String branchNameHindi) {
        this.branchNameHindi = branchNameHindi;
    }

    public int getBranchTotalIntake() {
        return branchTotalIntake;
    }

    public void setBranchTotalIntake(int branchTotalIntake) {
        this.branchTotalIntake = branchTotalIntake;
    }

    public int getBranchIntakeRound1() {
        return branchIntakeRound1;
    }

    public void setBranchIntakeRound1(int branchIntakeRound1) {
        this.branchIntakeRound1 = branchIntakeRound1;
    }

    public int getBranchIntakeRound2() {
        return branchIntakeRound2;
    }

    public void setBranchIntakeRound2(int branchIntakeRound2) {
        this.branchIntakeRound2 = branchIntakeRound2;
    }

    public int getBranchIntakeRound3() {
        return branchIntakeRound3;
    }

    public void setBranchIntakeRound3(int branchIntakeRound3) {
        this.branchIntakeRound3 = branchIntakeRound3;
    }

    public int getBranchIntakeRound4() {
        return branchIntakeRound4;
    }

    public void setBranchIntakeRound4(int branchIntakeRound4) {
        this.branchIntakeRound4 = branchIntakeRound4;
    }

    public int getBranchIntakeRound5() {
        return branchIntakeRound5;
    }

    public void setBranchIntakeRound5(int branchIntakeRound5) {
        this.branchIntakeRound5 = branchIntakeRound5;
    }

    public int getBranchDuration() {
        return branchDuration;
    }

    public void setBranchDuration(int branchDuration) {
        this.branchDuration = branchDuration;
    }

    public String getBranchCode() {
        return branchCode;
    }

    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }

    public String getBranchDegreeType() {
        return branchDegreeType;
    }

    public void setBranchDegreeType(String branchDegreeType) {
        this.branchDegreeType = branchDegreeType;
    }

    public int getBranchDegreeNumber() {
        return branchDegreeNumber;
    }

    public void setBranchDegreeNumber(int branchDegreeNumber) {
        this.branchDegreeNumber = branchDegreeNumber;
    }

    public int getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(int deptNo) {
        this.deptNo = deptNo;
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
