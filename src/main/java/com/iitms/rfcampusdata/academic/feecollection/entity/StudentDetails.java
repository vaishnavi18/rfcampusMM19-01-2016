package com.iitms.rfcampusdata.academic.feecollection.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "master.student_details")
public class StudentDetails {

    @Id
    @GeneratedValue
    @Column(name = "vid")
    private int vid;

    @Column(name = "student_name")
    private String studentName;

    @Column(name = "enrollment_number")
    private String enrollmentNumber;

    @Column(name = "batch_name")
    private String batchName;

    @Column(name = "semester_full_name")
    private String semesterFullName;

    @Column(name = "branch_long_name")
    private String branchLongName;

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getEnrollmentNumber() {
        return enrollmentNumber;
    }

    public void setEnrollmentNumber(String enrollmentNumber) {
        this.enrollmentNumber = enrollmentNumber;
    }

    public String getBatchName() {
        return batchName;
    }

    public void setBatchName(String batchName) {
        this.batchName = batchName;
    }

    public String getSemesterFullName() {
        return semesterFullName;
    }

    public void setSemesterFullName(String semesterFullName) {
        this.semesterFullName = semesterFullName;
    }

    public String getBranchLongName() {
        return branchLongName;
    }

    public void setBranchLongName(String branchLongName) {
        this.branchLongName = branchLongName;
    }

    @Override
    public String toString() {
        return "StudentDetails [studentName=" + studentName + ", enrollmentNumber=" + enrollmentNumber + ", batchName="
            + batchName + ", semesterFullName=" + semesterFullName + ", branchLongName=" + branchLongName + "]";
    }

}
