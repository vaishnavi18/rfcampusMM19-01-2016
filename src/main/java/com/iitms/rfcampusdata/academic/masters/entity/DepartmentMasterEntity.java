package com.iitms.rfcampusdata.academic.masters.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "master.admission_department_master")
public class DepartmentMasterEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "department_number", columnDefinition = "serial")
    private int departmetId;

    @Column(name = "department_code")
    private String departmentCode;

    @Column(name = " department_hindi")
    private String departmentHindi;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "department_name")
    private String departmentName;

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public int getDepartmetId() {
        return departmetId;
    }

    public void setDepartmetId(int departmetId) {
        this.departmetId = departmetId;
    }

    public String getDepartmentCode() {
        return departmentCode;
    }

    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode;
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
