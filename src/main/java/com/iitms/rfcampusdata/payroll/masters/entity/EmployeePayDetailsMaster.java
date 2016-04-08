package com.iitms.rfcampusdata.payroll.masters.entity;

import java.io.Serializable;
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
@Table(name = "payroll.payroll_payment_master")
public class EmployeePayDetailsMaster implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "employee_id")
    private int employeeId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "employee_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private EmployeeMasterEntity employeeMasterEntity;

    @Column(name = "is_payment_status")
    private boolean isPaymentStatus;

    @Column(name = "sub_department_id")
    private int subDepartmentId;

    @Column(name = "status")
    private String status;

    @Column(name = "payrule_id")
    private int payruleId;

    @Column(name = "appointment_payhead_allocation_id")
    private int appointmentPayheadAllocationId;

    @Column(name = "bank_id")
    private int bankId;

    @Column(name = "payscale_id")
    private int payscaleId;

    @Column(name = "supplementary_bill_numeber")
    private int supplementaryBillNumeber;

    @Column(name = "subdesignation_id")
    private int subdesignationId;

    @Column(name = "sequence_number")
    private float sequenceNumber;

    @Column(name = "designation_id")
    private int designationId;

    @Column(name = "previous_date_of_increment")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date previousDateOfIncrement;

    @Column(name = "date_of_joining")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date dateOfJoining;

    @Column(name = "previous_basic_amount")
    private int previousBasicAmount;

    @Column(name = "currentBasicAmount")
    private int currentBasicAmount;

    @Column(name = "pay_amount")
    private int payAmount;

    @Column(name = "payhead_code")
    private String payheadCode;

    @Column(name = "payhead_amount")
    private float payheadAmount;

    @Column(name = "gross_pay")
    private float grossPay;

    @Column(name = "gross_pay_without_relief")
    private float grossPayWithoutRelief;

    @Column(name = "total_deduction")
    private float totalDeduction;

    @Column(name = "net_pay")
    private float netPay;

    @Column(name = "is_handicapped")
    private boolean isHandicapped;

    @Column(name = "absent_days")
    private float absentDays;

    @Column(name = "submit_date")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date submitDate;

    @Column(name = "is_ta_applicable")
    private boolean isTaApplicable;

    @Column(name = "is_increment_applicable")
    private boolean isIncrementApplicable;

    @Column(name = "log_status")
    private String logStatus;

    @Column(name = "dpcal")
    private int dpcal;

    @Column(name = "da_amount")
    private float daAmount;

    @Column(name = "is_it_applicable")
    private boolean isItApplicable;

    @Column(name = "grade_pay_amount")
    private float gradePayAmount;

    @Column(name = "remark")
    private String remark;

    @Column(name = "common_remark")
    private String commonRemark;

    @Column(name = "monthly_remark")
    private String monthlyRemark;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "macaddress")
    private String macAddress;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "created_date")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date createdDate;

    @Column(name = "modified_by")
    private int modifiedBy;

    @Column(name = "modified_date")
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @Temporal(TemporalType.DATE)
    private Date modifiedDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public boolean isPaymentStatus() {
        return isPaymentStatus;
    }

    public void setPaymentStatus(boolean isPaymentStatus) {
        this.isPaymentStatus = isPaymentStatus;
    }

    public int getSubDepartmentId() {
        return subDepartmentId;
    }

    public void setSubDepartmentId(int subDepartmentId) {
        this.subDepartmentId = subDepartmentId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPayruleId() {
        return payruleId;
    }

    public void setPayruleId(int payruleId) {
        this.payruleId = payruleId;
    }

    public int getAppointmentPayheadAllocationId() {
        return appointmentPayheadAllocationId;
    }

    public void setAppointmentPayheadAllocationId(int appointmentPayheadAllocationId) {
        this.appointmentPayheadAllocationId = appointmentPayheadAllocationId;
    }

    public int getBankId() {
        return bankId;
    }

    public void setBankId(int bankId) {
        this.bankId = bankId;
    }

    public int getPayscaleId() {
        return payscaleId;
    }

    public void setPayscaleId(int payscaleId) {
        this.payscaleId = payscaleId;
    }

    public int getSupplementaryBillNumeber() {
        return supplementaryBillNumeber;
    }

    public void setSupplementaryBillNumeber(int supplementaryBillNumeber) {
        this.supplementaryBillNumeber = supplementaryBillNumeber;
    }

    public int getSubdesignationId() {
        return subdesignationId;
    }

    public void setSubdesignationId(int subdesignationId) {
        this.subdesignationId = subdesignationId;
    }

    public float getSequenceNumber() {
        return sequenceNumber;
    }

    public void setSequenceNumber(float sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }

    public int getDesignationId() {
        return designationId;
    }

    public void setDesignationId(int designationId) {
        this.designationId = designationId;
    }

    public Date getPreviousDateOfIncrement() {
        return previousDateOfIncrement;
    }

    public void setPreviousDateOfIncrement(Date previousDateOfIncrement) {
        this.previousDateOfIncrement = previousDateOfIncrement;
    }

    public Date getDateOfJoining() {
        return dateOfJoining;
    }

    public void setDateOfJoining(Date dateOfJoining) {
        this.dateOfJoining = dateOfJoining;
    }

    public int getPreviousBasicAmount() {
        return previousBasicAmount;
    }

    public void setPreviousBasicAmount(int previousBasicAmount) {
        this.previousBasicAmount = previousBasicAmount;
    }

    public int getCurrentBasicAmount() {
        return currentBasicAmount;
    }

    public void setCurrentBasicAmount(int currentBasicAmount) {
        this.currentBasicAmount = currentBasicAmount;
    }

    public int getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(int payAmount) {
        this.payAmount = payAmount;
    }

    public String getPayheadCode() {
        return payheadCode;
    }

    public void setPayheadCode(String payheadCode) {
        this.payheadCode = payheadCode;
    }

    public float getPayheadAmount() {
        return payheadAmount;
    }

    public void setPayheadAmount(float payheadAmount) {
        this.payheadAmount = payheadAmount;
    }

    public float getGrossPay() {
        return grossPay;
    }

    public void setGrossPay(float grossPay) {
        this.grossPay = grossPay;
    }

    public float getGrossPayWithoutRelief() {
        return grossPayWithoutRelief;
    }

    public void setGrossPayWithoutRelief(float grossPayWithoutRelief) {
        this.grossPayWithoutRelief = grossPayWithoutRelief;
    }

    public float getTotalDeduction() {
        return totalDeduction;
    }

    public void setTotalDeduction(float totalDeduction) {
        this.totalDeduction = totalDeduction;
    }

    public float getNetPay() {
        return netPay;
    }

    public void setNetPay(float netPay) {
        this.netPay = netPay;
    }

    public boolean isHandicapped() {
        return isHandicapped;
    }

    public void setHandicapped(boolean isHandicapped) {
        this.isHandicapped = isHandicapped;
    }

    public float getAbsentDays() {
        return absentDays;
    }

    public void setAbsentDays(float absentDays) {
        this.absentDays = absentDays;
    }

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

    public boolean isTaApplicable() {
        return isTaApplicable;
    }

    public void setTaApplicable(boolean isTaApplicable) {
        this.isTaApplicable = isTaApplicable;
    }

    public boolean isIncrementApplicable() {
        return isIncrementApplicable;
    }

    public void setIncrementApplicable(boolean isIncrementApplicable) {
        this.isIncrementApplicable = isIncrementApplicable;
    }

    public String getLogStatus() {
        return logStatus;
    }

    public void setLogStatus(String logStatus) {
        this.logStatus = logStatus;
    }

    public int getDpcal() {
        return dpcal;
    }

    public void setDpcal(int dpcal) {
        this.dpcal = dpcal;
    }

    public float getDaAmount() {
        return daAmount;
    }

    public void setDaAmount(float daAmount) {
        this.daAmount = daAmount;
    }

    public boolean isItApplicable() {
        return isItApplicable;
    }

    public void setItApplicable(boolean isItApplicable) {
        this.isItApplicable = isItApplicable;
    }

    public float getGradePayAmount() {
        return gradePayAmount;
    }

    public void setGradePayAmount(float gradePayAmount) {
        this.gradePayAmount = gradePayAmount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCommonRemark() {
        return commonRemark;
    }

    public void setCommonRemark(String commonRemark) {
        this.commonRemark = commonRemark;
    }

    public String getMonthlyRemark() {
        return monthlyRemark;
    }

    public void setMonthlyRemark(String monthlyRemark) {
        this.monthlyRemark = monthlyRemark;
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
