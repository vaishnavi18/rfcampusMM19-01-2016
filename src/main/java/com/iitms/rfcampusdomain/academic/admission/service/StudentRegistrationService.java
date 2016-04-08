package com.iitms.rfcampusdomain.academic.admission.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.admission.entity.ListTempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.admission.reportModel.StudentEducationDetailModel;
import com.iitms.rfcampusdata.academic.admission.reportModel.StudentPersonalInformationReportModel;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.IDCardInformation;

public interface StudentRegistrationService {
    public String addStudentRegistrationInfo(TempStudentRegistrationEntity student);

    public TempStudentRegistrationEntity getStudentRegistrationInformation(String applicationId, String password);

    public List<Integer> getStudentBranchPrefrence(int id);

    public TempStudentRegistrationEntity updateStudentRegistrationInfo(TempStudentRegistrationEntity student);
    
    public TempStudentRegistrationEntity getStudentById(int id);
    
    public List<StudentPersonalInformationReportModel> getReport( String applicationId, String password); 
    
    public List<StudentEducationDetailModel>getEducationDetails(String applicationId, String password);
    
    public List<ListTempStudentRegistrationEntity> getMultipleRegistardStudentsReports(String applicationId);
    
    public void setStudentInactive(String applicationId);
}
