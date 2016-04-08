package com.iitms.rfcampusdata.academic.masters.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.iitms.rfcampuscommon.MasterModel;

@Entity
@Table(name = "master.selected_properties_master")
public class SelectedPropertiesMasterEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "display_property_name")
    private String displayPropertyName;

    @Column(name = "property_name")
    private String propertyName;

    @Column(name = "alias_name")
    private String aliasName;

    @Column(name = "order_by")
    private String orderBy;

    @Column(name = "module")
    private String module;

    @Column(name = "restriction")
    private String restriction;

    @Column(name = "master_entity")
    private String masterEntity;
    // {"displayPropertyName" : displayPropertyName, "propertyName" : propertyName, "aliasName" : aliasName, "orderBy" :
    // orderBy}

    @Transient
    private int degreeId;

    @Transient
    private int branchNumber;

    @Transient
    private int casteId;

    @Transient
    private int categoryId;

    @Transient
    private int religionId;

    @Transient
    private int nationalityId;

    @Transient
    private int admittedToYear;

    @Transient
    private int semesterId;

    @Transient
    private int batchId;

    @Transient
    private int paymentType;

    @Transient
    private int bloodGroupId;

    @Transient
    private int motherTongueId;

    @Transient
    private List<MasterModel> masterData;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDisplayPropertyName() {
        return displayPropertyName;
    }

    public void setDisplayPropertyName(String displayPropertyName) {
        this.displayPropertyName = displayPropertyName;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public String getAliasName() {
        return aliasName;
    }

    public void setAliasName(String aliasName) {
        this.aliasName = aliasName;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    @Override
    public String toString() {
        return "{\"displayPropertyName\" : " + displayPropertyName + ", \"propertyName\" : " + propertyName
            + ", \"aliasName\" :" + aliasName + ", \"orderBy\" :" + orderBy + "}";
    }

    public int getDegreeId() {
        return degreeId;
    }

    public void setDegreeId(int degreeId) {
        this.degreeId = degreeId;
    }

    public int getBranchNumber() {
        return branchNumber;
    }

    public void setBranchNumber(int branchNumber) {
        this.branchNumber = branchNumber;
    }

    public int getCasteId() {
        return casteId;
    }

    public void setCasteId(int casteId) {
        this.casteId = casteId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getReligionId() {
        return religionId;
    }

    public void setReligionId(int religionId) {
        this.religionId = religionId;
    }

    public int getNationalityId() {
        return nationalityId;
    }

    public void setNationalityId(int nationalityId) {
        this.nationalityId = nationalityId;
    }

    public int getAdmittedToYear() {
        return admittedToYear;
    }

    public void setAdmittedToYear(int admittedToYear) {
        this.admittedToYear = admittedToYear;
    }

    public int getSemesterId() {
        return semesterId;
    }

    public void setSemesterId(int semesterId) {
        this.semesterId = semesterId;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    public int getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(int paymentType) {
        this.paymentType = paymentType;
    }

    public int getBloodGroupId() {
        return bloodGroupId;
    }

    public void setBloodGroupId(int bloodGroupId) {
        this.bloodGroupId = bloodGroupId;
    }

    public int getMotherTongueId() {
        return motherTongueId;
    }

    public void setMotherTongueId(int motherTongueId) {
        this.motherTongueId = motherTongueId;
    }

    public List<MasterModel> getMasterData() {
        return masterData;
    }

    public void setMasterData(List<MasterModel> masterData) {
        this.masterData = masterData;
    }

    public String getRestriction() {
        return restriction;
    }

    public void setRestriction(String restriction) {
        this.restriction = restriction;
    }

    public String getMasterEntity() {
        return masterEntity;
    }

    public void setMasterEntity(String masterEntity) {
        this.masterEntity = masterEntity;
    }

}
