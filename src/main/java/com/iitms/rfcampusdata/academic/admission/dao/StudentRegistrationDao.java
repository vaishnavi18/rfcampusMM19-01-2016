package com.iitms.rfcampusdata.academic.admission.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;

public interface StudentRegistrationDao {
    public String addStudentRegistrationInfo(TempStudentRegistrationEntity student);

    public TempStudentRegistrationEntity getStudentRegistrationInformation(String applicationId, String password);

    public TempStudentRegistrationEntity updateStudentRegistrationInfo(TempStudentRegistrationEntity student);

    public List<Integer> getStudentBranchPrefrence(int id);

    public TempStudentRegistrationEntity getStudentById(int id);

    public void setStudentInactive(String applicationId);

    /** By SachinMt **/
    public String getMothertongue(int motherTongueId);

    public String getCategory(int categoryId);

    public String getNationality(int nationalityId);

    public String getCountry(int countryId);

    public String getState(int stateId);

    public String getDistrict(int districtId);

    public String getCity(int cityId);

    public List<TempStudentRegistrationEntity> getMultipleRegistardStudentsReports(String applicationId);

}
