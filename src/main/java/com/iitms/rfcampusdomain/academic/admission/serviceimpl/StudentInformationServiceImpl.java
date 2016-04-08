package com.iitms.rfcampusdomain.academic.admission.serviceimpl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.academic.admission.dao.StudentInformationDao;
import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentInfoForDCR;
import com.iitms.rfcampusdata.academic.masters.entity.FamilyMemberDetailEntity;
import com.iitms.rfcampusdata.academic.masters.entity.LastQualifyingExamMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentAddressMasterEntity;
import com.iitms.rfcampusdomain.academic.admission.service.StudentInformationService;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.IDCardInformation;

@Service
@Transactional
public class StudentInformationServiceImpl implements StudentInformationService {

    @Autowired
    private StudentInformationDao studentInformationDao;

    private static final Logger LOG = LoggerFactory.getLogger(StudentInformationServiceImpl.class);

    /*----------------------------- APIs for Student Information  -------------------- */
    @Override
    public int addStudentAjax(StudentAdmissionEntity studentAdmissionEntity,
        StudentAddressMasterEntity studentAddressEntity, String sscHsscDetails, String lastQualifyingJsonStr,
        String entranceExamJsonStr, String familyMemberJsonStr) throws GenericException {

        try {
            int studentId = 0;
            LastQualifyingExamMasterEntity[] lastQualifyingExamArray =
                new Gson().fromJson("[" + lastQualifyingJsonStr + "]", LastQualifyingExamMasterEntity[].class);
            LastQualifyingExamMasterEntity entranceExam =
                new Gson().fromJson(entranceExamJsonStr, LastQualifyingExamMasterEntity.class);
            LastQualifyingExamMasterEntity sscHsscDetail =
                new Gson().fromJson(sscHsscDetails, LastQualifyingExamMasterEntity.class);

            String applicationId =
                studentInformationDao.isApplicationIdExist(studentAdmissionEntity.getRegistrationNumber());

            studentId = studentInformationDao.updateStudent(studentAdmissionEntity, studentAddressEntity, null);

            studentInformationDao.updateStudentLastQualification(applicationId, lastQualifyingExamArray, sscHsscDetail,
                studentId);
            studentInformationDao.updateStudentEntranceExam(applicationId, entranceExam, studentId);

            return studentId;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public int updateStudentBasicInformation(StudentAdmissionEntity studentAdmissionEntity) throws GenericException {
        try {
            return studentInformationDao.updateStudentBasicInformation(studentAdmissionEntity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public int updateStudentParentsDetails(StudentAddressMasterEntity studentAddressEntity) throws GenericException {
        try {
            int studentId = studentInformationDao.getStudentId(studentAddressEntity.getRegistrationNumber());
            studentAddressEntity.setStudentId(studentId);
            return studentInformationDao.updateStudentParentsDetails(studentAddressEntity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public int updateStudentAddressDetails(StudentAddressMasterEntity studentAddressEntity) throws GenericException {
        try {
            int studentId = studentInformationDao.getStudentId(studentAddressEntity.getRegistrationNumber());
            studentAddressEntity.setStudentId(studentId);
            return studentInformationDao.updateStudentAddressDetails(studentAddressEntity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public int updateStudentAdmissionDetails(StudentAdmissionEntity studentAdmissionEntity) throws GenericException {
        try {
            return studentInformationDao.updateStudentAdmissionDetails(studentAdmissionEntity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public int updateStudentPersonalDetails(StudentAdmissionEntity studentAdmissionEntity) throws GenericException {
        try {
            return studentInformationDao.updateStudentPersonalDetails(studentAdmissionEntity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean updateStudentDocumentList(String registrationNumber, String documentList) throws GenericException {
        try {
            return studentInformationDao.updateStudentDocumentList(registrationNumber, documentList);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean updateStudentLastQualification(String registrationNumber,
        LastQualifyingExamMasterEntity[] lastQualifyingExamArray, LastQualifyingExamMasterEntity sscHsscDetail,
        int studentId) throws GenericException {
        try {
            if (studentId == 0)
                studentId = studentInformationDao.getStudentId(registrationNumber);
            return studentInformationDao.updateStudentLastQualification(registrationNumber, lastQualifyingExamArray,
                sscHsscDetail, studentId);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean updateStudentEntranceExam(String registrationNumber, LastQualifyingExamMasterEntity entranceExam,
        int studentId) throws GenericException {
        try {
            if (studentId == 0)
                studentId = studentInformationDao.getStudentId(registrationNumber);
            return studentInformationDao.updateStudentEntranceExam(registrationNumber, entranceExam, studentId);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean updateStudentFamilyMemberDetails(String registrationNumber,
        FamilyMemberDetailEntity[] familyMemberArray, int studentId) throws GenericException {
        try {
            if (studentId == 0)
                studentId = studentInformationDao.getStudentId(registrationNumber);
            return studentInformationDao.updateStudentFamilyMemberDetails(registrationNumber, familyMemberArray,
                studentId);
        } catch (Exception e) {
            throw e;
        }

    }

    @Override
    public Map<String, Object> getStudentsByCriteria(String searchText, int srarchCriteria) throws GenericException {
        try {
            return studentInformationDao.getStudentsByCriteria(searchText, srarchCriteria);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Map<String, Object> getStudentsByRegistrationNUmber(String registrationNUmber) throws GenericException {
        try {
            return studentInformationDao.getStudentsByRegistrationNUmber(registrationNUmber);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public String isApplicationIdExist(String applicationId) throws GenericException {
        try {
            return studentInformationDao.isApplicationIdExist(applicationId);
        } catch (Exception e) {
            throw e;
        }
    }
    /*------------------------------------------------- */

    /*----------------------------- APIs for Fees Collection  -------------------- */
    @Override
    public List<StudentInfoForDCR> getStudentByEnrollmentNumber(String enrollmentId) {
        return studentInformationDao.getStudentByEnrollmentNumber(enrollmentId);
    }

    @Override
    public String getStudentAcademicBatch(String enrollmentId) {
        // return studentInformationDao.getStudentAcademicBatch(enrollmentId);
        return null;
    }

    /*------------------------------------------------- */

    /*----------------------------- APIs for Student Utility  -------------------- */
    @Override
    public List<IDCardInformation> getIDCardDetails(Integer[] studentIds) {
        return studentInformationDao.getIDCardDetails(studentIds);
    }

    @Override
    public List<Integer> getStudentIds(int degreeId, int branchId, int semesterId) {
        return studentInformationDao.getStudentIds(degreeId, branchId, semesterId);
    }

    @Override
    public List<IDCardInformation> getAddressList(String name, String address, Integer[] studentIds) {
        return studentInformationDao.getAddressList(name, address, studentIds);
    }

    @Override
    public List<IDCardInformation> getHorizontalInfo(Integer[] studentIds) {
        return studentInformationDao.getHorizontalInfo(studentIds);
    }

    @Override
    public List<CollegeInformation> getCollegeInfo(Integer[] collegeId) {
        return studentInformationDao.getCollegeInfo(collegeId);
    }

    @Override
    public List<StudentAdmissionEntity> getRollList(int branchId, int semesterId, int degreeId) {
        return studentInformationDao.getRollList(branchId, semesterId, degreeId);
    }
    /*------------------------------------------------- */

    @Override
    public String getApplicationId(int studentId) {
        return studentInformationDao.getApplicationId(studentId);
    }

    @Override
    public int getStudentIdByEnrollmentNumber(String enrollmentNumber) {
        return studentInformationDao.getStudentIdByEnrollmentNumber(enrollmentNumber);
    }
    
    /*-------------------------------Search Function---------------------------------------------*/
    @Override
    public List<StudentAdmissionEntity> searchStudentsByCriteria(String searchText, int searchCriteria, int degreeId,
        int branchId, int yearId, int semesterId) {
       LOG.info("control searchStudentsByCriteria");
        return studentInformationDao.searchStudentsByCriteria(searchText, searchCriteria, degreeId, branchId, yearId, semesterId);
    }

}
