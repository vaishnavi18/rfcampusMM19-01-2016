package com.iitms.rfcampusdata.payroll.masters.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Sachinmt
 */
@Entity
@Table(name = "payroll.payroll_department_master")
public class PayrollDepartmentMasterEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "department_number", columnDefinition = "integer")
    private int departmentNumber;

    @Column(name = "department_code")
    private String departmentCode;

    @Column(name = "department_name")
    private String departmentName;

    @Column(name = "department_hindi")
    private String departmentHindi;

    @Column(name = "college_code")
    private String collegeCode;

    public int getDepartmentNumber() {
        return departmentNumber;
    }

    public void setDepartmentNumber(int departmentNumber) {
        this.departmentNumber = departmentNumber;
    }

    public String getDepartmentCode() {
        return departmentCode;
    }

    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDepartmentHindi() {
        return departmentHindi;
    }

    public void setDepartmentHindi(String departmentHindi) {
        this.departmentHindi = departmentHindi;
    }

    public String getCollegeCode() {
        return collegeCode;
    }

    public void setCollegeCode(String collegeCode) {
        this.collegeCode = collegeCode;
    }

}
