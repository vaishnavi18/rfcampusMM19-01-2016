package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.util.Date;
import java.util.List;

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
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;

@Entity
@Table(name = "transaction.fees_dcrmain_transaction")
public class FeesDcrmainTransactionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int Id;

    @Column(name = "dcr_date")
    private Date dcrDate;

    @Column(name = "dcr_type")
    private String dcrType;

    @Column(name = "student_serial_number")
    private int studentSerialNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "studentSerialNumber", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    StudentAdmissionEntity studentAdmissionEntity;

    @Column(name = "counter_id")
    private int counterId;

    @Column(name = "receipt_number")
    private String receiptNumber;

    @Column(name = "receipt_date")
    private Date receiptDate;

    @Column(name = "receipt_id")
    private int receiptId;

    @Column(name = "batch_id")
    private int batchId;

    @Column(name = "degree_id")
    private int degreeId;

    @Column(name = "semester_id")
    private int semesterId;

    @Column(name = "payment_type_id")
    private int paymentTypeId;

    @Column(name = "payment_mode")
    private String paymentMode;

    @Column(name = "total_paid_amount")
    private float totalPaidAmount;

    @Column(name = "cancel_date")
    private Date cancelDate;

    @Column(name = "is_lock")
    private boolean isLock;

    @Column(name = "is_re_addmision")
    private boolean isReAddmision;

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
    private String ipAddress;

    @Column(name = "macaddress")
    private String macAddress;

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

    @Column(name = "excess_amount")
    private float excessAmount;

    public float getExcessAmount() {
        return excessAmount;
    }

    public void setExcessAmount(float excessAmount) {
        this.excessAmount = excessAmount;
    }

    @Transient
    private List<FeesDcrTransactionEntity> dcrTransaction;

    @Transient
    private List<FeesDcrDDTransactionEntity> dcrDDTransaction;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public Date getDcrDate() {
        return dcrDate;
    }

    public void setDcrDate(Date dcrDate) {
        this.dcrDate = dcrDate;
    }

    public String getDcrType() {
        return dcrType;
    }

    public void setDcrType(String dcrType) {
        this.dcrType = dcrType;
    }

    public int getStudentSerialNumber() {
        return studentSerialNumber;
    }

    public void setStudentSerialNumber(int studentSerialNumber) {
        this.studentSerialNumber = studentSerialNumber;
    }

    public int getCounterId() {
        return counterId;
    }

    public void setCounterId(int counterId) {
        this.counterId = counterId;
    }

    public String getReceiptNumber() {
        return receiptNumber;
    }

    public void setReceiptNumber(String receiptNumber) {
        this.receiptNumber = receiptNumber;
    }

    public Date getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(Date receiptDate) {
        this.receiptDate = receiptDate;
    }

    public int getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(int receiptId) {
        this.receiptId = receiptId;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    public int getDegreeId() {
        return degreeId;
    }

    public void setDegreeId(int degreeId) {
        this.degreeId = degreeId;
    }

    public int getSemesterId() {
        return semesterId;
    }

    public void setSemesterId(int semesterId) {
        this.semesterId = semesterId;
    }

    public int getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(int paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    public float getTotalPaidAmount() {
        return totalPaidAmount;
    }

    public void setTotalPaidAmount(float totalPaidAmount) {
        this.totalPaidAmount = totalPaidAmount;
    }

    public Date getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(Date cancelDate) {
        this.cancelDate = cancelDate;
    }

    public boolean isLock() {
        return isLock;
    }

    public void setLock(boolean isLock) {
        this.isLock = isLock;
    }

    public boolean isReAddmision() {
        return isReAddmision;
    }

    public void setReAddmision(boolean isReAddmision) {
        this.isReAddmision = isReAddmision;
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

    public List<FeesDcrTransactionEntity> getDcrTransaction() {
        return dcrTransaction;
    }

    public void setDcrTransaction(List<FeesDcrTransactionEntity> dcrTransaction) {
        this.dcrTransaction = dcrTransaction;
    }

    public List<FeesDcrDDTransactionEntity> getDcrDDTransaction() {
        return dcrDDTransaction;
    }

    public void setDcrDDTransaction(List<FeesDcrDDTransactionEntity> dcrDDTransaction) {
        this.dcrDDTransaction = dcrDDTransaction;
    }

}
