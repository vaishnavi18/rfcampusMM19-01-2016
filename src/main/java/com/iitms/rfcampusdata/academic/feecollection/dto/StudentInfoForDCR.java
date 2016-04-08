package com.iitms.rfcampusdata.academic.feecollection.dto;

import java.util.Date;

public class StudentInfoForDCR {
    private int studentId;

    private String enrollmentNumber;

    private String degreeName;

    private int degreeId;

    private String studentName;

    private String branchShortName;

    private int branchId;

    private String genderName;

    private int genderId;

    private String year;

    private int yearId;

    private Date admissionDate;

    private String semesterName;

    private int semesterId;

    private String paymentType;

    private int paymentTypeId;

    private String admissionBatch;

    private int admissionBatchId;

    private boolean hosteler;

    private boolean transport;

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
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

    public int getGenderId() {
        return genderId;
    }

    public void setGenderId(int genderId) {
        this.genderId = genderId;
    }

    public int getYearId() {
        return yearId;
    }

    public void setYearId(int yearId) {
        this.yearId = yearId;
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

    public int getAdmissionBatchId() {
        return admissionBatchId;
    }

    public void setAdmissionBatchId(int admissionBatchId) {
        this.admissionBatchId = admissionBatchId;
    }

    public String getEnrollmentNumber() {
        return enrollmentNumber;
    }

    public void setEnrollmentNumber(String enrollmentNumber) {
        this.enrollmentNumber = enrollmentNumber;
    }

    public String getDegreeName() {
        return degreeName;
    }

    public void setDegreeName(String degreeName) {
        this.degreeName = degreeName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getBranchShortName() {
        return branchShortName;
    }

    public void setBranchShortName(String branchShortName) {
        this.branchShortName = branchShortName;
    }

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Date getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }

    public String getSemesterName() {
        return semesterName;
    }

    public void setSemesterName(String semesterName) {
        this.semesterName = semesterName;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getAdmissionBatch() {
        return admissionBatch;
    }

    public void setAdmissionBatch(String admissionBatch) {
        this.admissionBatch = admissionBatch;
    }

    public boolean isHosteler() {
        return hosteler;
    }

    public void setHosteler(boolean hosteler) {
        this.hosteler = hosteler;
    }

    public boolean isTransport() {
        return transport;
    }

    public void setTransport(boolean transport) {
        this.transport = transport;
    }

}
