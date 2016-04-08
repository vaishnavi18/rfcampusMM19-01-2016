package com.iitms.rfcampusdata.academic.masters.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "transaction.admission_branch_prefrence")
public class BranchPrefrenceMasterEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "branch_pref_id", columnDefinition = "serial")
    int id;
    @Column(name="stu_regi_id")
    int studRegiId;

    @Column(name = "branch_pref_no")
    int branchPrefNo;

    @Column(name = "branch_code")
    String branchCode;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudRegiId() {
        return studRegiId;
    }

    public void setStudRegiId(int studRegiId) {
        this.studRegiId = studRegiId;
    }

    public int getBranchPrefNo() {
        return branchPrefNo;
    }

    public void setBranchPrefNo(int branchPrefNo) {
        this.branchPrefNo = branchPrefNo;
    }

    public String getBranchCode() {
        return branchCode;
    }

    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }
}
