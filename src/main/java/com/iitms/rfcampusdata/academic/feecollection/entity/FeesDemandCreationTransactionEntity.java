package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "transaction.fees_demandcreation_transaction")
public class FeesDemandCreationTransactionEntity {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    @Id
    private int id;

    @Column(name = "student_enrollment_number")
    private String studentEnrollmentNumber;

    @Column(name = "admission_date")
    private Date admissionDate;

    @Column(name = "session_id")
    private int sessionId;

    @Column(name = "degree_id")
    private int degreeId;

    @Column(name = "branch_id")
    private int branchId;

    @Column(name = "current_semester_id")
    private int currentSemesterId;

    @Column(name = "demand_created_semester_id")
    private int demandCreatedSemesterId;

    @Column(name = "student_type_id")
    private int studentTypeId;

    @Column(name = "payment_Type_id")
    private int paymentTypeid;

    @Column(name = "feehead_id")
    private int feeheadId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "feehead_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    FeesFeeheadEntity feesFeeheadMaster;

    public FeesFeeheadEntity getFeesFeeheadMaster() {
        return feesFeeheadMaster;
    }

    public void setFeesFeeheadMaster(FeesFeeheadEntity feesFeeheadMaster) {
        this.feesFeeheadMaster = feesFeeheadMaster;
    }

    @Column(name = "amount")
    private float amount;

    @Column(name = "is_active")
    private boolean isActive;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "start_time")
    private Date startTime;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "end_time")
    private Date endTime;

    @Column(name = "remark")
    private String remark;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "ipaddress")
    private String ipaddress;

    @Column(name = "macaddress")
    private String macaddress;

    @Column(name = "created_by")
    private int createdBy;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date")
    private Date createdDate;

    @Column(name = "modified_by")
    private int modifiedBy;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "modified_date")
    private Date modifiedDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentEnrollmentNumber() {
        return studentEnrollmentNumber;
    }

    public void setStudentEnrollmentNumber(String studentEnrollmentNumber) {
        this.studentEnrollmentNumber = studentEnrollmentNumber;
    }

    public Date getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public int getDegreeId() {
        return degreeId;
    }

    public void setDegreeId(int degreeId) {
        this.degreeId = degreeId;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public int getCurrentSemesterId() {
        return currentSemesterId;
    }

    public void setCurrentSemesterId(int currentSemesterId) {
        this.currentSemesterId = currentSemesterId;
    }

    public int getDemandCreatedSemesterId() {
        return demandCreatedSemesterId;
    }

    public void setDemandCreatedSemesterId(int demandCreatedSemesterId) {
        this.demandCreatedSemesterId = demandCreatedSemesterId;
    }

    public int getStudentTypeId() {
        return studentTypeId;
    }

    public void setStudentTypeId(int studentTypeId) {
        this.studentTypeId = studentTypeId;
    }

    public int getPaymentTypeid() {
        return paymentTypeid;
    }

    public void setPaymentTypeid(int paymentTypeid) {
        this.paymentTypeid = paymentTypeid;
    }

    public int getFeeheadId() {
        return feeheadId;
    }

    public void setFeeheadId(int feeheadId) {
        this.feeheadId = feeheadId;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
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

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public String getMacaddress() {
        return macaddress;
    }

    public void setMacaddress(String macaddress) {
        this.macaddress = macaddress;
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

    public FeesDemandCreationTransactionEntity(String studentEnrollmentNumber, int sessionId, int degreeId,
        int branchId, int currentSemesterId, int demandCreatedSemesterId, int paymentTypeid, int feeheadId,
        float amount) {
        super();
        this.studentEnrollmentNumber = studentEnrollmentNumber;
        this.sessionId = sessionId;
        this.degreeId = degreeId;
        this.branchId = branchId;
        this.currentSemesterId = currentSemesterId;
        this.demandCreatedSemesterId = demandCreatedSemesterId;
        this.paymentTypeid = paymentTypeid;
        this.feeheadId = feeheadId;
        this.amount = amount;
    }

    public FeesDemandCreationTransactionEntity() {
        super();
    }

}
