package com.iitms.rfcampusdata.payroll.dto;

import java.util.Date;

/**
 * @author Sachinmt
 */
public class EmployeeMasterDTO {

    private int id;

    private int sequenceNumber;

    private String pfileNumber;

    private String uniqueId;

    private String title;

    private String firstName;

    private String middleName;

    private String lastName;

    private boolean gender;

    private String fatherName;

    private String motherName;

    private String dateOfBirthString;

    private Date dateOfBirth;

    private String subdesignationLongName;

    private int subDesignationNumber;

    private float absentDays;

    private int employeeId;

    public float getAbsentDays() {
        return absentDays;
    }

    public void setAbsentDays(float absentDays) {
        this.absentDays = absentDays;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSequenceNumber() {
        return sequenceNumber;
    }

    public void setSequenceNumber(int sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }

    public String getPfileNumber() {
        return pfileNumber;
    }

    public void setPfileNumber(String pfileNumber) {
        this.pfileNumber = pfileNumber;
    }

    public String getUniqueId() {
        return uniqueId;
    }

    public void setUniqueId(String uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
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

    public String getDateOfBirthString() {
        return dateOfBirthString;
    }

    public void setDateOfBirthString(String dateOfBirthString) {
        this.dateOfBirthString = dateOfBirthString;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getSubdesignationLongName() {
        return subdesignationLongName;
    }

    public void setSubdesignationLongName(String subdesignationLongName) {
        this.subdesignationLongName = subdesignationLongName;
    }

    public int getSubDesignationNumber() {
        return subDesignationNumber;
    }

    public void setSubDesignationNumber(int subDesignationNumber) {
        this.subDesignationNumber = subDesignationNumber;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

}
