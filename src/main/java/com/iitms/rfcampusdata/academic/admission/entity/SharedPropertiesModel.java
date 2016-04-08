package com.iitms.rfcampusdata.academic.admission.entity;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BankMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BatchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BloodGroupMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeTypeEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DocumentListMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.EducationMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.NationalityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.OccupationMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.PaymentTypeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.PhysicallyHandicappedMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.QualifyingExamTypeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.ReligionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.SemesterMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentStatusMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.YearMasterEntity;

@Component
public class SharedPropertiesModel implements Serializable {

    private static final long serialVersionUID = 1L;

    List<BloodGroupMasterEntity> bloodGroupList;

    List<NationalityMasterEntity> nationalityList;

    List<ReligionMasterEntity> religionList;

    List<CategoryMasterEntity> categoryList;

    List<BranchMasterEntity> branchList;

    List<BatchMasterEntity> batchList;

    List<SemesterMasterEntity> semesterList;

    List<DegreeMasterEntity> degreeList;

    List<PaymentTypeMasterEntity> paymentTypeList;

    List<YearMasterEntity> yearList;

    List<StudentStatusMasterEntity> studentStatusList;

    List<MothertongueMasterEntity> mothertongueList;

    List<BankMasterEntity> bankList;

    List<PhysicallyHandicappedMasterEntity> physicallyHandicappedList;

    List<DocumentListMasterEntity> documentList;

    List<OccupationMasterEntity> occupationList;

    List<EducationMasterEntity> educationList;

    List<QualifyingExamTypeMasterEntity> qualifyingExamList;

    List<AcademicSessionMasterEntity> academicSessionList;

    List<DegreeTypeEntity> DegreeTypeList;

    List<CasteMasterEntity> casteList;

    public void setCasteList(List<CasteMasterEntity> casteList) {
        this.casteList = casteList;
    }

    public List<CasteMasterEntity> getCasteList() {
        return casteList;
    }

    public List<BloodGroupMasterEntity> getBloodGroupList() {
        return bloodGroupList;
    }

    public void setBloodGroupList(List<BloodGroupMasterEntity> bloodGroupList) {
        this.bloodGroupList = bloodGroupList;
    }

    public List<NationalityMasterEntity> getNationalityList() {
        return nationalityList;
    }

    public void setNationalityList(List<NationalityMasterEntity> nationalityList) {
        this.nationalityList = nationalityList;
    }

    public List<ReligionMasterEntity> getReligionList() {
        return religionList;
    }

    public void setReligionList(List<ReligionMasterEntity> religionList) {
        this.religionList = religionList;
    }

    public List<CategoryMasterEntity> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<CategoryMasterEntity> categoryList) {
        this.categoryList = categoryList;
    }

    public List<BranchMasterEntity> getBranchList() {
        return branchList;
    }

    public void setBranchList(List<BranchMasterEntity> branchList) {
        this.branchList = branchList;
    }

    public List<BatchMasterEntity> getBatchList() {
        return batchList;
    }

    public void setBatchList(List<BatchMasterEntity> batchList) {
        this.batchList = batchList;
    }

    public List<SemesterMasterEntity> getSemesterList() {
        return semesterList;
    }

    public void setSemesterList(List<SemesterMasterEntity> semesterList) {
        this.semesterList = semesterList;
    }

    public List<DegreeMasterEntity> getDegreeList() {
        return degreeList;
    }

    public void setDegreeList(List<DegreeMasterEntity> degreeList) {
        this.degreeList = degreeList;
    }

    public List<PaymentTypeMasterEntity> getPaymentTypeList() {
        return paymentTypeList;
    }

    public void setPaymentTypeList(List<PaymentTypeMasterEntity> paymentTypeList) {
        this.paymentTypeList = paymentTypeList;
    }

    public List<YearMasterEntity> getYearList() {
        return yearList;
    }

    public void setYearList(List<YearMasterEntity> yearList) {
        this.yearList = yearList;
    }

    public List<StudentStatusMasterEntity> getStudentStatusList() {
        return studentStatusList;
    }

    public void setStudentStatusList(List<StudentStatusMasterEntity> studentStatusList) {
        this.studentStatusList = studentStatusList;
    }

    public List<MothertongueMasterEntity> getMothertongueList() {
        return mothertongueList;
    }

    public void setMothertongueList(List<MothertongueMasterEntity> mothertongueList) {
        this.mothertongueList = mothertongueList;
    }

    public List<BankMasterEntity> getBankList() {
        return bankList;
    }

    public void setBankList(List<BankMasterEntity> bankList) {
        this.bankList = bankList;
    }

    public List<PhysicallyHandicappedMasterEntity> getPhysicallyHandicappedList() {
        return physicallyHandicappedList;
    }

    public void setPhysicallyHandicappedList(List<PhysicallyHandicappedMasterEntity> physicallyHandicappedList) {
        this.physicallyHandicappedList = physicallyHandicappedList;
    }

    public List<DocumentListMasterEntity> getDocumentList() {
        return documentList;
    }

    public void setDocumentList(List<DocumentListMasterEntity> documentList) {
        this.documentList = documentList;
    }

    public List<OccupationMasterEntity> getOccupationList() {
        return occupationList;
    }

    public void setOccupationList(List<OccupationMasterEntity> occupationList) {
        this.occupationList = occupationList;
    }

    public List<EducationMasterEntity> getEducationList() {
        return educationList;
    }

    public void setEducationList(List<EducationMasterEntity> educationList) {
        this.educationList = educationList;
    }

    public List<QualifyingExamTypeMasterEntity> getQualifyingExamList() {
        return qualifyingExamList;
    }

    public void setQualifyingExamList(List<QualifyingExamTypeMasterEntity> qualifyingExamList) {
        this.qualifyingExamList = qualifyingExamList;
    }

    public List<AcademicSessionMasterEntity> getAcademicSessionList() {
        return academicSessionList;
    }

    public void setAcademicSessionList(List<AcademicSessionMasterEntity> academicSessionList) {
        this.academicSessionList = academicSessionList;
    }

    public List<DegreeTypeEntity> getDegreeTypeList() {
        return DegreeTypeList;
    }

    public void setDegreeTypeList(List<DegreeTypeEntity> degreeTypeList) {
        DegreeTypeList = degreeTypeList;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
