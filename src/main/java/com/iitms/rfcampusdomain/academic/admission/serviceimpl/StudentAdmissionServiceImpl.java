package com.iitms.rfcampusdomain.academic.admission.serviceimpl;

import java.text.NumberFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.admission.dao.StudentAdmissionDao;
import com.iitms.rfcampusdata.academic.admission.entity.ReferenceFileEntity;
import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.LastQualifyingExamMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentAddressMasterEntity;
import com.iitms.rfcampusdomain.academic.admission.service.ReferenceFileService;
import com.iitms.rfcampusdomain.academic.admission.service.RegistrationNumberGeneratorService;
import com.iitms.rfcampusdomain.academic.admission.service.StudentAdmissionService;
import com.iitms.rfcampusdomain.academic.admission.service.StudentRegistrationService;

@Service
@Transactional
public class StudentAdmissionServiceImpl implements StudentAdmissionService { 

    @Autowired
    private StudentAdmissionDao studentAdmissionDao;

    @Autowired
    StudentRegistrationService studentRegistrationService;

    @Autowired
    private ReferenceFileService referenceFileService;

    @Autowired
    private RegistrationNumberGeneratorService registrationNumberGeneratorService;

    @Override
    public int addStudent(StudentAdmissionEntity studentAdmissionEntity,
        StudentAddressMasterEntity studentAddressEntity, int admissionType) {
        NumberFormat numberFormat = NumberFormat.getInstance();
        LastQualifyingExamMasterEntity[] lastExams = new LastQualifyingExamMasterEntity[2];

        numberFormat.setMinimumIntegerDigits(3);

        studentAdmissionEntity.setStudentName(studentAdmissionEntity.getStudentFirstName() + " "
            + studentAdmissionEntity.getStudentMiddleName() + studentAdmissionEntity.getStudentLastName());
        int studentId = studentAdmissionDao.addStudent(studentAdmissionEntity, studentAddressEntity, admissionType);
        ReferenceFileEntity reference = referenceFileService.getReferenceRecord();
        String serialNumber = numberFormat.format(studentId);

        if (reference.isCreateRegistrationNumber() == true) {
            String registrationNumber = registrationNumberGeneratorService.getRegistrationNumber(
                reference.getRegistrationNumberFormatId(), studentAdmissionEntity.getAdmissionBatch(),
                studentAdmissionEntity.getDegreeId(), studentAdmissionEntity.getBranchNumber());
            studentAdmissionDao.setRegistrationNumber(studentId, registrationNumber + serialNumber);
        } else {
            studentAdmissionDao.setRegistrationNumber(studentId, serialNumber);
        }

        studentRegistrationService.setStudentInactive(studentAdmissionEntity.getRegistrationNumber());
        /*
         * TempStudentRegistrationEntity registrationInformation = studentRegistrationService
         * .getStudentRegistrationInformation(studentAdmissionEntity.getRegistrationNumber(), null);
         * LastQualifyingExamMasterEntity lastExam = new LastQualifyingExamMasterEntity();
         * lastExam.setStudentId(studentId); lastExam.setSSCDetails(registrationInformation);
         * lastExam.setHSSCDetails(registrationInformation); lastExams[0] = lastExam;
         * studentAdmissionDao.setQualificationDetails(lastExams);
         */

        return studentId;
    }

    @Override
    public List<CasteMasterEntity> getCasteList(int categoryId) {
        return studentAdmissionDao.getCasteList(categoryId);
    }

    @Override
    public List<BranchMasterEntity> getBranchList(int degreeId) {
        return studentAdmissionDao.getBranchList(degreeId);
    }

    @Override
    public List<StudentAdmissionEntity> getStudentList(int degreeId, int branchId, int semesterId) {
        return studentAdmissionDao.getStudentList(degreeId, branchId, semesterId);
    }

    @Override
    public void setRegistrationNumber(int studentId, String registrationNumber) {
        studentAdmissionDao.setRegistrationNumber(studentId, registrationNumber);
    }

}
