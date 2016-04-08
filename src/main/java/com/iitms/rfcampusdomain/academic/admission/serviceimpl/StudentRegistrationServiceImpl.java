package com.iitms.rfcampusdomain.academic.admission.serviceimpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.admission.dao.StudentRegistrationDao;
import com.iitms.rfcampusdata.academic.admission.entity.ListTempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.admission.reportModel.StudentEducationDetailModel;
import com.iitms.rfcampusdata.academic.admission.reportModel.StudentPersonalInformationReportModel;
import com.iitms.rfcampusdata.academic.masters.dao.CasteDao;
import com.iitms.rfcampusdata.authentication.entity.UserMasterEntity;
import com.iitms.rfcampusdomain.academic.admission.service.StudentRegistrationService;
import com.iitms.rfcampusdomain.authentication.service.UserCreationService;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.IDCardInformation;
@Service
@Transactional
public class StudentRegistrationServiceImpl implements StudentRegistrationService
{
    private static final Logger logger = LoggerFactory.getLogger(StudentRegistrationServiceImpl.class);
    @Autowired
    StudentRegistrationDao studentRegistrationDao;  
    @Autowired
    UserCreationService userCreationService;
    @Autowired
    CasteDao admissionCasteMasterDao;
    @Override
    public String addStudentRegistrationInfo(TempStudentRegistrationEntity student){
        logger.info("Student:"+student);
        student.setActive(true);
        String credential = studentRegistrationDao.addStudentRegistrationInfo(student);
            addTemporaryUser(credential); 
             return credential;
    }
    @Override
    public TempStudentRegistrationEntity getStudentRegistrationInformation(String applicationId, String password) {
        return studentRegistrationDao.getStudentRegistrationInformation(applicationId, password);
    }
    @Override
    public TempStudentRegistrationEntity updateStudentRegistrationInfo(TempStudentRegistrationEntity student) {
        return studentRegistrationDao.updateStudentRegistrationInfo(student);
    }
    @Override
    public List<Integer> getStudentBranchPrefrence(int id) {
        return studentRegistrationDao.getStudentBranchPrefrence(id);
    }
    @Override
    public TempStudentRegistrationEntity getStudentById(int id) {
        return studentRegistrationDao.getStudentById(id);
    }
    
    private void addTemporaryUser(String credential){
        String[] appId = credential.split("#");
        UserMasterEntity userMasterEntity = new UserMasterEntity();
        userMasterEntity.setUsername(appId[0]);
        userMasterEntity.setPassword(appId[1]);
        userMasterEntity.setStudentSerialNumber(Integer.parseInt(appId[2]));
        userMasterEntity.setActive(1);
        userCreationService.addTemporaryUser(userMasterEntity);
    }
    
    @Override
    public List<StudentPersonalInformationReportModel> getReport(String applicationId, String password) {
        TempStudentRegistrationEntity tempStudentRegistrationEntity =
            studentRegistrationDao.getStudentRegistrationInformation(applicationId, password);
        /** Student Personal Information **/
        String motherTongue = studentRegistrationDao.getMothertongue(tempStudentRegistrationEntity.getMotherTongueId());
        String caste = admissionCasteMasterDao.getCastName(tempStudentRegistrationEntity.getCasteId());
        String category = studentRegistrationDao.getCategory(tempStudentRegistrationEntity.getCategoryId());
        String nationality = studentRegistrationDao.getNationality(tempStudentRegistrationEntity.getNationalityId());

        String country = studentRegistrationDao.getCountry(tempStudentRegistrationEntity.getCountryId());
        
        String state = studentRegistrationDao.getState(tempStudentRegistrationEntity.getStateId());
        
        String district = studentRegistrationDao.getDistrict(tempStudentRegistrationEntity.getDistrictId());
        
        String city = studentRegistrationDao.getCity(tempStudentRegistrationEntity.getCityId());
        

        System.out.println("Student Infor category caste nationality mother toungue" + motherTongue + "" + caste + ""
            + category + "" + nationality);
        System.out.println(
            "Student address city state country district :" + country + "" + state + "" + district + "" + city);
        System.out.println("Id:" + tempStudentRegistrationEntity.getId());
        System.out.println("application Id:" + tempStudentRegistrationEntity.getApplicationId());
        System.out.println("Student Name:" + tempStudentRegistrationEntity.getStudentName());
        System.out.println("Father Name:" + tempStudentRegistrationEntity.getFatherName());
        /**
         * Personal Information
         */
        StudentPersonalInformationReportModel studentPersonalInformationReportModel =
            new StudentPersonalInformationReportModel();
        studentPersonalInformationReportModel.setId(tempStudentRegistrationEntity.getId());
        studentPersonalInformationReportModel.setApplicationId(tempStudentRegistrationEntity.getApplicationId());
        studentPersonalInformationReportModel.setStudentName(tempStudentRegistrationEntity.getStudentName());
        studentPersonalInformationReportModel.setFatherName(tempStudentRegistrationEntity.getFatherName());
        studentPersonalInformationReportModel.setLastName(tempStudentRegistrationEntity.getLastName());
        studentPersonalInformationReportModel.setMotherName(tempStudentRegistrationEntity.getMotherName());
        studentPersonalInformationReportModel.setMotherName(motherTongue);
        studentPersonalInformationReportModel.setDateOfBirth(tempStudentRegistrationEntity.getDateOfBirth());
        studentPersonalInformationReportModel.setGender(tempStudentRegistrationEntity.getGender());
        studentPersonalInformationReportModel.setPhotoLink(tempStudentRegistrationEntity.getPhotoLink());
        studentPersonalInformationReportModel.setSignatureLink(tempStudentRegistrationEntity.getSignatureLink());
        studentPersonalInformationReportModel.setCaste(caste);
        studentPersonalInformationReportModel.setCategory(category);
        studentPersonalInformationReportModel.setNationality(nationality);

        /**
         * Address
         */
        studentPersonalInformationReportModel.setCountry(country);
        studentPersonalInformationReportModel.setState(state);
        studentPersonalInformationReportModel.setDistrict(district);
        studentPersonalInformationReportModel.setCity(city);
        studentPersonalInformationReportModel.setPincode(tempStudentRegistrationEntity.getPincode());
        studentPersonalInformationReportModel.setAddress(tempStudentRegistrationEntity.getAddress());
        /**
         * Contact
         */
        studentPersonalInformationReportModel
            .setPermanentTelephone(tempStudentRegistrationEntity.getPermanentTelephone());
        studentPersonalInformationReportModel
            .setPermanentTelephoneStd(tempStudentRegistrationEntity.getPermanentTelephoneStd());
        studentPersonalInformationReportModel.setMobileNumber(tempStudentRegistrationEntity.getMobileNumber());
        studentPersonalInformationReportModel.setEmailId(tempStudentRegistrationEntity.getEmailId());

        return Arrays.asList(studentPersonalInformationReportModel);
    }

    @Override
    public List<StudentEducationDetailModel> getEducationDetails(String applicationId, String password) {

        TempStudentRegistrationEntity tempStudentRegistrationEntity =
            studentRegistrationDao.getStudentRegistrationInformation(applicationId, password);
        /**
         * 10th Details
         */
        StudentEducationDetailModel studentEducationDetailModel = new StudentEducationDetailModel();
        studentEducationDetailModel.setSscMaths(tempStudentRegistrationEntity.getSscMaths());
        studentEducationDetailModel.setSscMathsMaximum(tempStudentRegistrationEntity.getSscMathsMaximum());
        studentEducationDetailModel.setSscTotal(tempStudentRegistrationEntity.getSscTotal());
        studentEducationDetailModel.setSscOutof(tempStudentRegistrationEntity.getSscOutof());
        studentEducationDetailModel.setSscPassingYear(tempStudentRegistrationEntity.getSscPassingYear());
        studentEducationDetailModel.setSscPerentage(tempStudentRegistrationEntity.getSscPerentage());
        /**
         * 12th Details
         */
        studentEducationDetailModel.setHscMaths(tempStudentRegistrationEntity.getHscMaths());
        studentEducationDetailModel.setHscMathsMax(tempStudentRegistrationEntity.getHscMathsMax());
        studentEducationDetailModel.setHscChemestry(tempStudentRegistrationEntity.getHscChemestry());
        studentEducationDetailModel.setHscChemestryMax(tempStudentRegistrationEntity.getHscChemestryMax());
        studentEducationDetailModel.setHscPhysics(tempStudentRegistrationEntity.getHscPhysics());
        studentEducationDetailModel.setHscPhysicsMax(tempStudentRegistrationEntity.getHscPhysicsMax());
        studentEducationDetailModel.setHscPcm(tempStudentRegistrationEntity.getHscPcm());
        studentEducationDetailModel.setHscPcmMax(tempStudentRegistrationEntity.getHscPcmMax());
        studentEducationDetailModel.setHscTotal(tempStudentRegistrationEntity.getHscTotal());
        studentEducationDetailModel.setHscOutOf(tempStudentRegistrationEntity.getHscOutOf());
        studentEducationDetailModel.setHscPassingYear(tempStudentRegistrationEntity.getHscPassingYear());
        studentEducationDetailModel.setHscPercentage(tempStudentRegistrationEntity.getHscPercentage());
        /**
         * Entrance Details
         */
        studentEducationDetailModel.setEntranceExamId(tempStudentRegistrationEntity.getEntranceExamId());
        studentEducationDetailModel.setEntranceExamRank(tempStudentRegistrationEntity.getEntranceExamRank());
        studentEducationDetailModel
            .setEntranceExamRollNumber(tempStudentRegistrationEntity.getEntranceExamRollNumber());
        studentEducationDetailModel.setEntranceExamScore(tempStudentRegistrationEntity.getEntranceExamScore());
        studentEducationDetailModel.setEntranceExamYear(tempStudentRegistrationEntity.getEntranceExamYear());

        /**
         * Admission Status
         */
        studentEducationDetailModel.setAdmissionStatus(tempStudentRegistrationEntity.getAdmissionStatus());
        return Arrays.asList(studentEducationDetailModel);
    }

    @Override
    public List<ListTempStudentRegistrationEntity> getMultipleRegistardStudentsReports(String applicationId) {

        ListTempStudentRegistrationEntity listObj = new ListTempStudentRegistrationEntity();

        listObj.setRegistardStudentList(studentRegistrationDao.getMultipleRegistardStudentsReports(applicationId));
        /* return studentRegistrationDao.getMultipleRegistardStudentsReports(); */
        return Arrays.asList(listObj);
    }

   /* @Override
    public List<TempStudentRegistrationEntity> getMultipleRegistardStudentsReports1() {
        return studentRegistrationDao.getMultipleRegistardStudentsReports();
    }*/

    @Override
    public void setStudentInactive(String applicationId) {
        studentRegistrationDao.setStudentInactive(applicationId);
    }
}
