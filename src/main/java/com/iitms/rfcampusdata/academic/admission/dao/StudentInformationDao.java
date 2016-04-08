package com.iitms.rfcampusdata.academic.admission.dao;

import java.util.List;
import java.util.Map;

import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentInfoForDCR;
import com.iitms.rfcampusdata.academic.masters.entity.FamilyMemberDetailEntity;
import com.iitms.rfcampusdata.academic.masters.entity.LastQualifyingExamMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentAddressMasterEntity;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.IDCardInformation;

public interface StudentInformationDao {

    /*----------------------------- APIs for Student Information  -------------------- */
    public int updateStudent(StudentAdmissionEntity studentRegistrationEntity,
        StudentAddressMasterEntity studentAddressEntity,
        LastQualifyingExamMasterEntity admissionLastQualifyingExamEntity) throws GenericException;

    public int updateStudentBasicInformation(StudentAdmissionEntity studentAdmissionEntity) throws GenericException;

    public int updateStudentParentsDetails(StudentAddressMasterEntity studentAddressEntity) throws GenericException;

    public int updateStudentAddressDetails(StudentAddressMasterEntity studentAddressEntity) throws GenericException;

    public int updateStudentAdmissionDetails(StudentAdmissionEntity studentAdmissionEntity) throws GenericException;

    public int updateStudentPersonalDetails(StudentAdmissionEntity studentAdmissionEntity) throws GenericException;

    public boolean updateStudentDocumentList(String registrationNumber, String documentList) throws GenericException;

    public boolean updateStudentLastQualification(String registrationNumber,
        LastQualifyingExamMasterEntity[] lastQualificationArray, LastQualifyingExamMasterEntity sscHsscDetail,
        int studentId) throws GenericException;

    public boolean updateStudentEntranceExam(String registrationNumber, LastQualifyingExamMasterEntity entranceExam,
        int studentId) throws GenericException;

    public boolean updateStudentFamilyMemberDetails(String registrationNumber,
        FamilyMemberDetailEntity[] familyMemberArray, int studentId) throws GenericException;

    public Map<String, Object> getStudentsByCriteria(String searchText, int srarchCriteria) throws GenericException;

    public Map<String, Object> getStudentsByRegistrationNUmber(String registrationNUmber) throws GenericException;

    public String isApplicationIdExist(String applicationId) throws GenericException;

    public int getStudentId(String applicationId) throws GenericException;
    /*------------------------------------------------- */

    /*----------------------------- APIs for Fees Collection  -------------------- */
    public List<StudentInfoForDCR> getStudentByEnrollmentNumber(String enrollmentId);

    public String getStudentAcademicBatch(String enrollmentId);
    /*------------------------------------------------- */

    /*----------------------------- APIs for Student Utility  -------------------- */
    public List<IDCardInformation> getIDCardDetails(Integer[] studentIds);

    public List<Integer> getStudentIds(int degreeId, int branchId, int semesterId);

    public List<IDCardInformation> getAddressList(String name, String address, Integer[] studentIds);

    public List<IDCardInformation> getHorizontalInfo(Integer[] studentIds);

    public List<CollegeInformation> getCollegeInfo(Integer[] collegeId);

    public List<StudentAdmissionEntity> getRollList(int branchId, int semesterId, int degreeId);

    /*------------------------------------------------- */
    /** upd88 **/
    public int getStudentIdByEnrollmentNumber(String enrollmentNumber);

    public String getApplicationId(int studentId);

    /*-------------- Search Functionality -------------------*/
    public List<StudentAdmissionEntity> searchStudentsByCriteria(String searchText, int searchCriteria, int degreeId,
        int branchId, int yearId, int semesterId);
}
