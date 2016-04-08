package com.iitms.rfcampusdata.academic.admission.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentAddressMasterEntity;

public interface StudentAdmissionDao {

    public int addStudent(StudentAdmissionEntity studentRegistrationEntity,
        StudentAddressMasterEntity studentAddressEntity, int admissionType);

    public void setRegistrationNumber(int studentId, String registrationNumber);

    public List<CasteMasterEntity> getCasteList(int categoryId);

    public List<BranchMasterEntity> getBranchList(int degreeId);

    public List<StudentAdmissionEntity> getStudentList(int degreeId, int branchId, int semesterId);
}
