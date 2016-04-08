package com.iitms.rfcampusdata.academic.admission.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.academic.admission.dao.StudentInformationDao;
import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentInfoForDCR;
import com.iitms.rfcampusdata.academic.masters.entity.FamilyMemberDetailEntity;
import com.iitms.rfcampusdata.academic.masters.entity.LastQualifyingExamMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.QualifyingExamTypeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentAddressMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.CollegeMasterEntity;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.IDCardInformation;

@Repository
public class StudentInformationDaoImpl implements StudentInformationDao {

    private static final Logger LOG = LoggerFactory.getLogger(StudentInformationDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    /*----------------------------- APIs for Student Information  -------------------- */
    @Override
    public int updateStudent(StudentAdmissionEntity studentRegistrationEntity,
        StudentAddressMasterEntity studentAddressEntity,
        LastQualifyingExamMasterEntity admissionLastQualifyingExamEntity) throws GenericException {

        try {
            int studentId = 0;
            Session session = this.sessionFactory.getCurrentSession();

            StudentAdmissionEntity sessionStudentAdmissionEntity =
                (StudentAdmissionEntity) session.createCriteria(StudentAdmissionEntity.class)
                    .add(Restrictions.eq("registrationNumber", studentRegistrationEntity.getRegistrationNumber()))
                    .uniqueResult();

            sessionStudentAdmissionEntity.setStudentBasicInformation(studentRegistrationEntity);
            sessionStudentAdmissionEntity.setStudentAdmissionInformation(studentRegistrationEntity);
            sessionStudentAdmissionEntity.setImages(studentRegistrationEntity.getStudentPhoto(),
                studentRegistrationEntity.getStudentSignature(), studentRegistrationEntity.getLeftThumb(),
                studentRegistrationEntity.getRightThumb());

            StudentAddressMasterEntity sessionStudentAddressEntity =
                (StudentAddressMasterEntity) session.createCriteria(StudentAddressMasterEntity.class)
                    .add(Restrictions.eq("studentId", sessionStudentAdmissionEntity.getId())).uniqueResult();

            session.update(sessionStudentAdmissionEntity);

            if (studentAddressEntity != null) {
                sessionStudentAddressEntity.setStudentParentsDetails(studentAddressEntity);
                sessionStudentAddressEntity.setStudentAddressDetails(studentAddressEntity);
                session.update(sessionStudentAddressEntity);
            }
            /*
             * if (LastQualifyingExamMasterEntity != null) { session.update(LastQualifyingExamMasterEntity); }
             */
            studentId = sessionStudentAdmissionEntity.getId();

            return studentId;
        } catch (Exception e) {
            throw new GenericException("Error while updating student information...");
        }

    }

    @Override
    public int updateStudentBasicInformation(StudentAdmissionEntity studentAdmissionEntity) throws GenericException {

        try {
            int studentId = 0;
            Session session = this.sessionFactory.getCurrentSession();

            StudentAdmissionEntity sessionEntity =
                (StudentAdmissionEntity) session.createCriteria(StudentAdmissionEntity.class)
                    .add(Restrictions.eq("registrationNumber", studentAdmissionEntity.getRegistrationNumber()))
                    .uniqueResult();

            sessionEntity.setStudentBasicInformation(studentAdmissionEntity);
            session.update(sessionEntity);

            studentId = sessionEntity.getId();

            return studentId;
        } catch (Exception e) {
            throw new GenericException("Error while updating student Basic information...");
        }

    }

    @Override
    public int updateStudentParentsDetails(StudentAddressMasterEntity studentAddressEntity) throws GenericException {
        Session session = this.sessionFactory.getCurrentSession();

        try {
            int flag = 0;
            StudentAddressMasterEntity sessionEntity =
                (StudentAddressMasterEntity) session.createCriteria(StudentAddressMasterEntity.class)
                    .add(Restrictions.eq("studentId", studentAddressEntity.getStudentId())).uniqueResult();

            if (sessionEntity != null) {
                sessionEntity.setStudentParentsDetails(studentAddressEntity);
                session.update(sessionEntity);
                flag = sessionEntity.getId();
            } else {
                session.save(studentAddressEntity);
                flag = studentAddressEntity.getId();
            }

            return flag;
        } catch (Exception e) {
            throw new GenericException("Error while updating student Parents information...");
        }
    }

    @Override
    public int updateStudentAddressDetails(StudentAddressMasterEntity studentAddressEntity) throws GenericException {

        try {
            int flag = 0;
            Session session = this.sessionFactory.getCurrentSession();
            StudentAddressMasterEntity sessionEntity =
                (StudentAddressMasterEntity) session.createCriteria(StudentAddressMasterEntity.class)
                    .add(Restrictions.eq("studentId", studentAddressEntity.getStudentId())).uniqueResult();

            if (sessionEntity != null) {
                sessionEntity.setStudentAddressDetails(studentAddressEntity);
                session.update(sessionEntity);
                flag = sessionEntity.getId();
            } else {
                session.save(studentAddressEntity);
                flag = studentAddressEntity.getId();
            }

            return flag;
        } catch (Exception e) {
            throw new GenericException("Error while updating student Address information...");
        }
    }

    @Override
    public int updateStudentAdmissionDetails(StudentAdmissionEntity studentAdmissionEntity) throws GenericException {

        try {
            int studentId = 0;
            Session session = this.sessionFactory.getCurrentSession();

            StudentAdmissionEntity sessionEntity =
                (StudentAdmissionEntity) session.createCriteria(StudentAdmissionEntity.class)
                    .add(Restrictions.eq("registrationNumber", studentAdmissionEntity.getRegistrationNumber()))
                    .uniqueResult();

            sessionEntity.setStudentAdmissionInformation(studentAdmissionEntity);
            session.update(sessionEntity);

            studentId = sessionEntity.getId();

            return studentId;
        } catch (Exception e) {
            throw new GenericException("Error while updating student Admission information...");
        }
    }

    @Override
    public int updateStudentPersonalDetails(StudentAdmissionEntity studentAdmissionEntity) throws GenericException {

        try {
            int studentId = 0;
            Session session = this.sessionFactory.getCurrentSession();

            StudentAdmissionEntity sessionEntity =
                (StudentAdmissionEntity) session.createCriteria(StudentAdmissionEntity.class)
                    .add(Restrictions.eq("registrationNumber", studentAdmissionEntity.getRegistrationNumber()))
                    .uniqueResult();

            sessionEntity.setStudentPersonalDetails(studentAdmissionEntity);
            session.update(sessionEntity);

            studentId = sessionEntity.getId();

            return studentId;
        } catch (Exception e) {
            throw new GenericException("Error while updating student Personal information...");
        }
    }

    @Override
    public boolean updateStudentDocumentList(String registrationNumber, String documentList) throws GenericException {

        try {
            boolean flag = false;
            Session session = this.sessionFactory.getCurrentSession();

            session
                .createQuery(
                    "Update StudentAdmissionEntity entity set entity.documentList = :documentList where registrationNumber = :registrationNumber")
                .setParameter("documentList", documentList).setParameter("registrationNumber", registrationNumber)
                .executeUpdate();
            flag = true;

            return flag;
        } catch (Exception e) {
            throw new GenericException("Error while updating student DocumentList...");
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public boolean updateStudentLastQualification(String registrationNumber,
        LastQualifyingExamMasterEntity[] lastQualificationArray, LastQualifyingExamMasterEntity sscHsscDetail,
        int studentId) throws GenericException {

        try {
            boolean flag = false;
            Session session = this.sessionFactory.getCurrentSession();

            List<Integer> qualifyingExamIds = session.createCriteria(QualifyingExamTypeMasterEntity.class)
                .setProjection(Projections.property("id")).add(Restrictions.eq("examType", "e")).list();

            session
                .createQuery(
                    "Delete from LastQualifyingExamMasterEntity entity where entity.regNumber = :regNumber and entity.qualifyingExamNumber not in (:qualifyingExamIds)")
                .setParameter("regNumber", registrationNumber).setParameterList("qualifyingExamIds", qualifyingExamIds)
                .executeUpdate();

            LOG.info("lastQualificationArray : " + lastQualificationArray);

            for (LastQualifyingExamMasterEntity lastExam : lastQualificationArray) {
                if (lastExam.getQualifyingExamId() != -1) {
                    lastExam.setRegNumber(registrationNumber);
                    lastExam.setStudentId(studentId);
                    LOG.info("Last Qualif : " + lastExam);
                    session.save(lastExam);
                }
            }

            sscHsscDetail.setStudentId(studentId);
            session.save(sscHsscDetail);
            flag = true;

            return flag;
        } catch (Exception e) {
            throw new GenericException("Error while updating student LastQualification...");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public boolean updateStudentEntranceExam(String registrationNumber, LastQualifyingExamMasterEntity entranceExam,
        int studentId) throws GenericException {

        try {
            boolean flag = false;
            Session session = this.sessionFactory.getCurrentSession();

            List<Integer> entranceExamIds = session.createCriteria(QualifyingExamTypeMasterEntity.class)
                .setProjection(Projections.property("id")).add(Restrictions.eq("examType", "e")).list();

            session
                .createQuery(
                    "Delete from LastQualifyingExamMasterEntity entity where entity.regNumber = :regNumber and entity.qualifyingExamNumber in (:entranceExamIds)")
                .setParameter("regNumber", registrationNumber).setParameterList("entranceExamIds", entranceExamIds)
                .executeUpdate();

            // for (LastQualifyingExamMasterEntity entrance: entranceExam) {
            if (entranceExam.getQualifyingExamId() != 0) {
                entranceExam.setRegNumber(registrationNumber);
                entranceExam.setStudentId(studentId);
                session.save(entranceExam);
                // }
            }

            flag = true;

            return flag;
        } catch (Exception e) {
            throw new GenericException("Error while updating student EntranceExam...");
        }
    }

    @Override
    public boolean updateStudentFamilyMemberDetails(String registrationNumber,
        FamilyMemberDetailEntity[] familyMemberArray, int studentId) throws GenericException {

        try {
            boolean flag = false;
            Session session = this.sessionFactory.getCurrentSession();

            session.createQuery("Delete from FamilyMemberDetailEntity entity where entity.studentId = :studentId")
                .setParameter("studentId", studentId).executeUpdate();

            for (FamilyMemberDetailEntity entranceExam : familyMemberArray) {
                if (entranceExam.getId() != -1) {
                    entranceExam.setStudentId(studentId);
                    session.save(entranceExam);
                }
            }

            flag = true;

            return flag;
        } catch (Exception e) {
            throw new GenericException("Error while updating student FamilyMemberDetails...");
        }
    }

    @Override
    public Map<String, Object> getStudentsByCriteria(String searchText, int srarchCriteria) throws GenericException {
        Session session = this.sessionFactory.getCurrentSession();

        try {
            Map<String, Object> map = new HashMap<String, Object>();
            StudentAdmissionEntity studentAdmissionEntity =
                (StudentAdmissionEntity) session.get(StudentAdmissionEntity.class, Integer.parseInt(searchText));

            StudentAddressMasterEntity studentAddressEntity =
                (StudentAddressMasterEntity) session.createCriteria(StudentAddressMasterEntity.class)
                    .add(Restrictions.eq("studentId", studentAdmissionEntity.getId())).uniqueResult();

            LastQualifyingExamMasterEntity LastQualifyingExamMasterEntity =
                (LastQualifyingExamMasterEntity) session.createCriteria(LastQualifyingExamMasterEntity.class)
                    .add(Restrictions.eq("studentId", studentAdmissionEntity.getId())).uniqueResult();

            map.put("studentAdmissionEntity", studentAdmissionEntity);
            map.put("studentAddressEntity", studentAddressEntity);
            map.put("LastQualifyingExamMasterEntity", LastQualifyingExamMasterEntity);

            return map;
        } catch (Exception e) {
            throw new GenericException("Error while getting student info by criteria...");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public Map<String, Object> getStudentsByRegistrationNUmber(String registrationNUmber) throws GenericException {

        try {
            Map<String, Object> map = new HashMap<String, Object>();
            Session session = this.sessionFactory.getCurrentSession();
            StudentAdmissionEntity studentAdmissionEntity =
                (StudentAdmissionEntity) session.createCriteria(StudentAdmissionEntity.class)
                    .add(Restrictions.eq("registrationNumber", registrationNUmber)).uniqueResult();
            ;

            StudentAddressMasterEntity studentAddressEntity =
                (StudentAddressMasterEntity) session.createCriteria(StudentAddressMasterEntity.class)
                    .add(Restrictions.eq("studentId", studentAdmissionEntity.getId())).uniqueResult();

            List<LastQualifyingExamMasterEntity> LastQualifyingExamList =
                session.createCriteria(LastQualifyingExamMasterEntity.class)
                    .add(Restrictions.eq("studentId", studentAdmissionEntity.getId())).list();

            /*
             * List<FamilyMemberDetailEntity> familyMemberDetailList =
             * session.createCriteria(FamilyMemberDetailEntity.class) .add(Restrictions.eq("studentId",
             * studentAdmissionEntity.getId())).list();
             */

            map.put("studentAdmissionEntity", studentAdmissionEntity);
            map.put("studentAddressEntity", studentAddressEntity);
            map.put("LastQualifyingExamMasterEntity", LastQualifyingExamList);
            // map.put("familyMemberDetailList", familyMemberDetailList);

            return map;
        } catch (Exception e) {
            throw new GenericException("Error while getting StudentsByRegistrationNUmber...");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public String isApplicationIdExist(String applicationId) throws GenericException {

        try {
            String registrationNumber = null;
            Session session = this.sessionFactory.getCurrentSession();

            List<String> registrationNumberList = session.createCriteria(StudentAdmissionEntity.class)
                .setProjection(Projections.property("registrationNumber"))
                .add(Restrictions.eq("registrationNumber", applicationId)).list();

            registrationNumber = (registrationNumberList.size() > 0 ? registrationNumberList.get(0) : null);

            return registrationNumber;
        } catch (Exception e) {
            throw new GenericException("Error while Checking Application ID...");
        }
    }

    @Override
    public int getStudentId(String applicationId) throws GenericException {

        try {
            int studentId = 0;
            Session session = this.sessionFactory.getCurrentSession();
            studentId = ((Integer) session.createCriteria(StudentAdmissionEntity.class)
                .setProjection(Projections.property("id")).add(Restrictions.eq("registrationNumber", applicationId))
                .uniqueResult()).intValue();

            return studentId;
        } catch (Exception e) {
            throw new GenericException("Error while Getting Student Id...");
        }
    }
    /*------------------------------------------------- */

    @Override
    public String getApplicationId(int studentId) {
        Session session = this.sessionFactory.getCurrentSession();

        String applicationId = (String) session.createCriteria(StudentAdmissionEntity.class)
            .setProjection(Projections.property("registrationNumber")).add(Restrictions.eq("id", studentId))
            .uniqueResult();

        return applicationId;
    }

    /*----------------------------- APIs for Student Utility  -------------------- */

    @SuppressWarnings("unchecked")
    @Override
    public List<IDCardInformation> getIDCardDetails(Integer[] studentIds) {
        Session session = this.sessionFactory.getCurrentSession();
        ProjectionList projectionList = getIDCardProperties();

        List<IDCardInformation> list =
            session.createCriteria(StudentAddressMasterEntity.class).createAlias("studentAdmissionEntity", "student")
                .createAlias("student.degreeMasterEntity", "degreeMaster", JoinType.LEFT_OUTER_JOIN)
                .createAlias("student.branchMasterEntity", "branchMaster", JoinType.LEFT_OUTER_JOIN)
                .createAlias("student.bloodGroupMasterEntity", "bloodGroupMaster", JoinType.LEFT_OUTER_JOIN)
                .createAlias("student.genderMasterEntity", "genderMaster", JoinType.LEFT_OUTER_JOIN)
                .setProjection(projectionList).add(Restrictions.in("student.id", studentIds))
                .setResultTransformer(new AliasToBeanResultTransformer(IDCardInformation.class)).list();

        return list;
    }

    private ProjectionList getIDCardProperties() {
        ProjectionList projectionList = Projections.projectionList();

        projectionList.add(Projections.property("student.registrationNumber").as("registrationNumber"));
        projectionList.add(Projections.property("student.studentName").as("studentName"));
        projectionList.add(Projections.property("degreeMaster.degreeName").as("degreeName"));
        projectionList.add(Projections.property("branchMaster.branchShortName").as("branchName"));
        projectionList.add(Projections.property("student.identityMark1").as("identityMark1"));
        // projectionList.add(Projections.property("dateOfValidity").as("dateOfValidity"));
        projectionList.add(Projections.property("student.studentPhoto").as("studentPhoto"));
        projectionList.add(Projections.property("student.studentSignature").as("studentSignature"));
        // projectionList.add(Projections.property("authoritySignature").as("authoritySignature"));
        projectionList.add(Projections.property("student.fatherName").as("fatherName"));
        projectionList.add(Projections.property("student.motherName").as("motherName"));
        projectionList.add(Projections.property("localAddress").as("localAddress"));
        projectionList.add(Projections.property("permenantAddress").as("permenantAddress"));
        // projectionList.add(Projections.property("issueDate").as("issueDate"));
        projectionList.add(Projections.property("fatherMobileNumber").as("fatherMobileNumber"));
        projectionList.add(Projections.property("motherMobileNumber").as("motherMobileNumber"));
        // projectionList.add(Projections.property("student.dateOfBirth").as("dateOfBirth"));
        projectionList.add(Projections.property("student.height").as("height"));
        projectionList.add(Projections.property("bloodGroupMaster.bloodGroup").as("bloodGroup"));
        projectionList.add(Projections.property("genderMaster.genderName").as("genderName"));
        projectionList.add(Projections.property("student.email").as("email"));
        projectionList.add(Projections.property("student.studentMobileNumber").as("studentMobileNumber"));

        return projectionList;
    }

    @Override
    public List<Integer> getStudentIds(int degreeId, int branchId, int semesterId) {
        Session session = this.sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(StudentAdmissionEntity.class)
            .createAlias("branchMasterEntity", "branchMasterEntity", JoinType.LEFT_OUTER_JOIN)
            .createAlias("semesterMasterEntity", "semesterMasterEntity", JoinType.LEFT_OUTER_JOIN)
            .setProjection(Projections.property("id"));

        if (branchId != 0) {
            criteria.add(Restrictions.eq("degreeId", degreeId));
        }
        if (branchId != 0) {
            criteria.add(Restrictions.eq("branchNumber", branchId));
        }
        if (semesterId != 0) {
            criteria.add(Restrictions.eq("semesterId", semesterId));
        }

        List<Integer> studentIds = criteria.list();

        return studentIds;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<IDCardInformation> getAddressList(String name, String address, Integer[] studentIds) {
        Session session = this.sessionFactory.getCurrentSession();
        ProjectionList projectionList = getAddressProperties(name, address);

        List<IDCardInformation> list =
            session.createCriteria(StudentAddressMasterEntity.class).createAlias("studentAdmissionEntity", "student")
                .createAlias("localCityMasterEntity", "localCity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("localDistrictMasterEntity", "localDistrict", JoinType.LEFT_OUTER_JOIN)
                .createAlias("localStateMasterEntity", "localState", JoinType.LEFT_OUTER_JOIN)
                .createAlias("permanentCityMasterEntity", "permanentCity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("permanentStateMasterEntity", "permanentState", JoinType.LEFT_OUTER_JOIN)
                .createAlias("permanentDistrictMasterEntity", "permanentDistrict", JoinType.LEFT_OUTER_JOIN)
                .createAlias("guardianCityMasterEntity", "guardianCity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("guardianDistrictMasterEntity", "guardianDistrict", JoinType.LEFT_OUTER_JOIN)
                .createAlias("guardianStateMasterEntity", "guardianState", JoinType.LEFT_OUTER_JOIN)
                .setProjection(projectionList).add(Restrictions.in("student.id", studentIds))
                .setResultTransformer(new AliasToBeanResultTransformer(IDCardInformation.class)).list();

        return list;
    }

    @SuppressWarnings("unused")
    private ProjectionList getAddressProperties(String name, String address) {
        ProjectionList projectionList = Projections.projectionList();
        Session session = this.sessionFactory.getCurrentSession();
        switch (name) {
            case ConstantUtil.S_NAME:
                projectionList.add(Projections.property("student.studentName").as("name"));
                break;
            case ConstantUtil.F_NAME:
                projectionList.add(Projections.property("fatherName").as("name"));
                break;
            case ConstantUtil.G_NAME:
                projectionList.add(Projections.property("guardianName").as("name"));
                break;
        }

        switch (address) {
            case ConstantUtil.LOCAL_ADDRESS:
                projectionList.add(Projections.property("localAddress").as("address"));
                projectionList.add(Projections.property("localPINCode").as("pincode"));
                projectionList.add(Projections.property("localTelephone").as("phone"));
                projectionList.add(Projections.property("localCity.cityName").as("city"));
                projectionList.add(Projections.property("localDistrict.districtName").as("district"));
                projectionList.add(Projections.property("localState.state").as("state"));
                projectionList.add(Projections.property("localMobileNumber").as("mobile"));

                break;
            case ConstantUtil.PERMANENT_ADDRESS:
                projectionList.add(Projections.property("permenantAddress").as("address"));
                projectionList.add(Projections.property("permanentCity.cityName").as("city"));
                projectionList.add(Projections.property("permanentDistrict.districtName").as("district"));
                projectionList.add(Projections.property("permanentState.state").as("state"));

                projectionList.add(Projections.property("permenantPINCode").as("pincode"));
                projectionList.add(Projections.property("permenantTelephoneNumber").as("phone"));
                projectionList.add(Projections.property("permenantMobileNumber").as("mobile"));
                break;

            case ConstantUtil.GUARDIAN_ADDRESS:
                projectionList.add(Projections.property("guardianAddress").as("address"));
                projectionList.add(Projections.property("guardianName").as("name"));
                projectionList.add(Projections.property("guardianCity.cityName").as("city"));
                projectionList.add(Projections.property("guardianDistrict.districtName").as("district"));
                projectionList.add(Projections.property("guardianState.state").as("state"));

                projectionList.add(Projections.property("guardianPINCode").as("pincode"));
                projectionList.add(Projections.property("guardianTelephone").as("phone"));
                break;

        }

        // projectionList.add(Projections.property("student.studentAddressMasterEntity").as("student"));

        // projectionList.add(Projections.property("student.registrationNumber").as("registrationNumber"));
        return projectionList;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<IDCardInformation> getHorizontalInfo(Integer[] studentIds) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();

        projectionList.add(Projections.property("student.registrationNumber").as("registrationNumber"));
        projectionList.add(Projections.property("student.studentName").as("studentName"));
        projectionList.add(Projections.property("student.identityMark1").as("identityMark1"));
        //
        projectionList.add(Projections.property("student.studentPhoto").as("studentPhoto"));
        projectionList.add(Projections.property("student.studentSignature").as("studentSignature"));
        // projectionList.add(Projections.property("authoritySignature").as("authoritySignature"));
        projectionList.add(Projections.property("student.fatherName").as("fatherName"));
        projectionList.add(Projections.property("student.motherName").as("motherName"));
        projectionList.add(Projections.property("localAddress").as("localAddress"));
        projectionList.add(Projections.property("permenantAddress").as("permenantAddress"));
        // projectionList.add(Projections.property("issueDate").as("issueDate"));
        projectionList.add(Projections.property("fatherMobileNumber").as("fatherMobileNumber"));
        projectionList.add(Projections.property("motherMobileNumber").as("motherMobileNumber"));
        // projectionList.add(Projections.property("student.dateOfBirth").as("dateOfBirth"));
        projectionList.add(Projections.property("student.height").as("height"));
        projectionList.add(Projections.property("bloodGroupMaster.bloodGroup").as("bloodGroup"));
        projectionList.add(Projections.property("genderMaster.genderName").as("genderName"));
        projectionList.add(Projections.property("student.email").as("email"));
        projectionList.add(Projections.property("localPINCode").as("localPINCode"));
        projectionList.add(Projections.property("permenantPINCode").as("permenantPINCode"));

        projectionList.add(Projections.property("guardianName").as("guardianName"));
        projectionList.add(Projections.property("student.studentMobileNumber").as("studentMobileNumber"));
        projectionList.add(Projections.property("branchMaster.branchShortName").as("branchShortName"));

        // for vertical form generation

        // projectionList.add(Projections.property("dateOfValidity").as("dateOfValidity"));
        projectionList.add(Projections.property("degreeMasterEntity.degreeName").as("degreeName"));
        // projectionList.add(Projections.property("branchMaster.branchShortName").as("branchName"));

        // projectionList.add(Projections.property("authoritySignature").as("authoritySignature"));

        projectionList.add(Projections.property("fatherEmailid").as("fatherEmailid"));
        projectionList.add(Projections.property("motherEmailid").as("motherEmailid"));
        projectionList.add(Projections.property("fatherDesignation").as("fatherDesignation"));
        projectionList.add(Projections.property("motherDesignation").as("motherDesignation"));
        // projectionList.add(Projections.property("issueDate").as("issueDate"));
        // projectionList.add(Projections.property("dateOfBirth").as("dateOfBirth"));
        projectionList.add(Projections.property("student.studentLandlineNumber").as("studentLandlineNumber"));
        projectionList.add(Projections.property("mothertongueMasterEntity.mothertongue").as("mothertongue"));

        projectionList.add(Projections.property("student.otherLanguage").as("otherLanguage"));
        projectionList.add(Projections.property("student.weight").as("weight"));
        projectionList.add(Projections.property("casteMasterEntity.caste").as("caste"));

        /****/
        projectionList.add(Projections.property("categoryMasterEntity.categoryName").as("categoryName"));
        projectionList.add(Projections.property("nationalityMasterEntity.nationality").as("nationality"));

        /****/
        projectionList.add(Projections.property("religionMasterEntity.religion").as("religion"));
        projectionList.add(Projections.property("student.admittedToYear").as("admittedToYear"));
        // projectionList.add(Projections.property("student.year").as("year"));
        projectionList.add(Projections.property("student.admissionYear").as("admissionYear"));
        projectionList.add(Projections.property("batchMasterEntity.batchName").as("batchName"));
        projectionList.add(Projections.property("semesterMasterEntity.semesterName").as("semesterName"));
        projectionList.add(Projections.property("semesterMasterEntity.semesterFullName").as("semesterFullName"));
        projectionList.add(Projections.property("student.accountNumber").as("accountNumber"));
        projectionList.add(Projections.property("student.visaNumber").as("visaNumber"));
        projectionList.add(Projections.property("student.passportNumber").as("passportNumber"));
        projectionList.add(Projections.property("student.paymentType").as("paymentType"));

        projectionList.add(Projections.property("student.examPaymentType").as("examPaymentType"));
        projectionList.add(Projections.property("student.admissionCancel").as("admissionCancel"));
        projectionList.add(Projections.property("student.admissionDate").as("admissionDate"));
        projectionList.add(Projections.property("student.admissionBatch").as("admissionBatch"));
        projectionList.add(Projections.property("student.leaveDate").as("leaveDate"));

        projectionList.add(Projections.property("student.stateRank").as("stateRank"));
        projectionList.add(Projections.property("student.percentage").as("percentage"));
        projectionList.add(Projections.property("student.percentile").as("percentile"));
        projectionList.add(Projections.property("student.qualifiedExamRollnumber").as("qualifiedExamRollnumber"));

        projectionList.add(Projections.property("student.remark").as("remark"));
        projectionList.add(Projections.property("student.facultyAdvisorNumber").as("facultyAdvisorNumber"));
        projectionList.add(Projections.property("student.projectName").as("projectName"));
        projectionList.add(Projections.property("student.scholorshipTypeId").as("scholorshipTypeId"));

        projectionList.add(Projections.property("student.generalMeritNumber").as("generalMeritNumber"));
        projectionList.add(Projections.property("student.categoryMeritNumber").as("categoryMeritNumber"));
        projectionList.add(Projections.property("student.registeredNumber").as("registeredNumber"));
        projectionList.add(Projections.property("student.admissionRoundNumber").as("admissionRoundNumber"));
        projectionList.add(Projections.property("student.defenceQuota").as("defenceQuota"));
        projectionList.add(Projections.property("student.physicallyHandicapped").as("physicallyHandicapped"));

        projectionList.add(Projections.property("student.typeOfPhysicallyHandicap").as("typeOfPhysicallyHandicap"));
        projectionList.add(Projections.property("student.personWithDisability").as("personWithDisability"));
        projectionList.add(Projections.property("student.typeOfPhysicalDisability").as("typeOfPhysicalDisability"));
        projectionList.add(Projections.property("student.hscMCVC").as("hscMCVC"));
        projectionList.add(Projections.property("student.annualIncome").as("annualIncome"));

        projectionList.add(Projections.property("student.admissionQuotaNumber").as("admissionQuotaNumber"));
        projectionList.add(Projections.property("student.registrationStatus").as("registrationStatus"));
        projectionList.add(Projections.property("student.otherSchemeNumber").as("otherSchemeNumber"));
        projectionList.add(Projections.property("student.sportsQuota").as("sportsQuota"));

        projectionList
            .add(Projections.property("student.permanentRegistrationAumber").as("permanentRegistrationAumber"));
        projectionList.add(Projections.property("student.schemeType").as("schemeType"));
        projectionList.add(Projections.property("student.capInstitute").as("capInstitute"));
        projectionList.add(Projections.property("student.admissionCategoryNumber").as("admissionCategoryNumber"));

        projectionList.add(Projections.property("student.oldRegistrationNumber").as("oldRegistrationNumber"));
        projectionList.add(Projections.property("student.bankNumber").as("bankNumber"));
        projectionList.add(Projections.property("student.phdSupervisorId").as("phdSupervisorId"));
        projectionList.add(Projections.property("student.typeOfCosupervisor1").as("typeOfCosupervisor1"));

        projectionList.add(Projections.property("student.typeOfCosupervisor2").as("typeOfCosupervisor2"));
        projectionList.add(Projections.property("student.phdStatusCategory").as("phdStatusCategory"));
        projectionList.add(Projections.property("student.reattend").as("reattend"));
        projectionList.add(Projections.property("student.sequenceNumber").as("sequenceNumber"));

        projectionList.add(Projections.property("student.admissionType").as("admissionType"));
        projectionList.add(Projections.property("student.scholership").as("scholership"));
        projectionList.add(Projections.property("student.scholershipDetails").as("scholershipDetails"));
        projectionList.add(Projections.property("student.reserveCategory").as("reserveCategory"));

        projectionList.add(Projections.property("student.ebc").as("ebc"));
        projectionList.add(Projections.property("student.emergencyContactNumber").as("emergencyContactNumber"));
        projectionList.add(Projections.property("student.local").as("local"));
        projectionList.add(Projections.property("student.bankAddress").as("bankAddress"));

        projectionList.add(Projections.property("student.bankIFSCCode").as("bankIFSCCode"));
        projectionList.add(Projections.property("student.panNumber").as("panNumber"));
        projectionList.add(Projections.property("student.voterNumber").as("voterNumber"));
        projectionList.add(Projections.property("student.nprNumber").as("nprNumber"));

        projectionList.add(Projections.property("student.statusOfStudent").as("statusOfStudent"));
        projectionList.add(Projections.property("student.confHostel").as("confHostel"));
        projectionList.add(Projections.property("student.convenerAllotment").as("convenerAllotment"));
        projectionList.add(Projections.property("student.region").as("region"));

        projectionList.add(Projections.property("student.adharCardNumber").as("adharCardNumber"));
        projectionList.add(Projections.property("student.routeNumber").as("routeNumber"));
        projectionList.add(Projections.property("student.routeAmount").as("routeAmount"));
        projectionList.add(Projections.property("student.medicalProblem").as("medicalProblem"));

        projectionList.add(Projections.property("student.medicalDetails").as("medicalDetails"));
        projectionList.add(Projections.property("student.numberOfBrother").as("numberOfBrother"));
        projectionList.add(Projections.property("student.numberOfSister").as("numberOfSister"));
        projectionList.add(Projections.property("student.leftThumb").as("leftThumb"));

        projectionList.add(Projections.property("localTown").as("localTown"));

        projectionList.add(Projections.property("localCityMasterEntity.cityName").as("localCityName"));
        projectionList.add(Projections.property("localDistrictMasterEntity.districtName").as("localDistrictName"));
        projectionList.add(Projections.property("localStateMasterEntity.state").as("localState"));

        projectionList.add(Projections.property("localTelephone").as("localTelephone"));
        projectionList.add(Projections.property("localMobileNumber").as("localMobileNumber"));
        projectionList.add(Projections.property("localEmail").as("localEmail"));
        projectionList.add(Projections.property("localLandmark").as("localLandmark"));

        /*
         * projectionList.add(Projections.property("permanentCityName").as("permanentCityName"));
         * projectionList.add(Projections.property("permenantTown").as("permenantTown"));
         * projectionList.add(Projections.property("permanentDistrictName").as("permanentDistrictName"));
         */

        projectionList.add(Projections.property("permanentCityMasterEntity.cityName").as("permanentCityName"));
        projectionList.add(Projections.property("permenantTown").as("permenantTown"));
        projectionList
            .add(Projections.property("permanentDistrictMasterEntity.districtName").as("permanentDistrictName"));
        projectionList.add(Projections.property("permanentStateMasterEntity.state").as("permanentState"));

        // projectionList.add(Projections.property("permanentState").as("permanentState"));
        projectionList.add(Projections.property("permanentTelephone").as("permanentTelephone"));
        projectionList.add(Projections.property("permenantMobileNumber").as("permanentMobileNumber"));

        projectionList.add(Projections.property("permenantEmail").as("permanentEmail"));
        projectionList.add(Projections.property("permanantLandmark").as("permanantLandmark"));
        projectionList.add(Projections.property("relationWithGuardian").as("relationWithGuardian"));

        projectionList.add(Projections.property("guardianAddress").as("guardianAddress"));
        projectionList.add(Projections.property("guardianOccupationName").as("guardianOccupationName"));
        projectionList.add(Projections.property("guardianStreetName").as("guardianStreetName"));

        projectionList.add(Projections.property("guardianEmail").as("guardianEmail"));
        projectionList.add(Projections.property("guardianFlatNo").as("guardianFlatNo"));
        projectionList.add(Projections.property("guardianLandmark").as("guardianLandmark"));

        projectionList.add(Projections.property("guardianTelephone").as("guardianTelephone"));
        /*
         * projectionList.add(Projections.property("guardianCity").as("guardianCity"));
         * projectionList.add(Projections.property("guardianDistrict").as("guardianDistrict"));
         * projectionList.add(Projections.property("guardianState").as("guardianState"));
         */

        projectionList.add(Projections.property("guardianCityMasterEntity.cityName").as("guardianCity"));
        projectionList.add(Projections.property("guardianDistrictMasterEntity.districtName").as("guardianDistrict"));
        projectionList.add(Projections.property("guardianStateMasterEntity.state").as("guardianState"));

        projectionList.add(Projections.property("guardianPINCode").as("guardianPINCode"));
        projectionList.add(Projections.property("guardianTown").as("guardianTown"));

        // projectionList.add(Projections.property("guardianTown").as("guardianTown"));

        // end

        List<IDCardInformation> list =
            session.createCriteria(StudentAddressMasterEntity.class).createAlias("studentAdmissionEntity", "student")
                .createAlias("student.bloodGroupMasterEntity", "bloodGroupMaster", JoinType.LEFT_OUTER_JOIN)
                .createAlias("student.degreeMasterEntity", "degreeMasterEntity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("student.branchMasterEntity", "branchMaster", JoinType.LEFT_OUTER_JOIN)
                .createAlias("student.genderMasterEntity", "genderMaster", JoinType.LEFT_OUTER_JOIN)
                .createAlias("student.semesterMasterEntity", "semesterMasterEntity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("student.categoryMasterEntity", "categoryMasterEntity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("student.mothertongueMasterEntity", "mothertongueMasterEntity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("student.casteMasterEntity", "casteMasterEntity", JoinType.LEFT_OUTER_JOIN)

                .createAlias("student.religionMasterEntity", "religionMasterEntity", JoinType.LEFT_OUTER_JOIN)

                .createAlias("student.nationalityMasterEntity", "nationalityMasterEntity", JoinType.LEFT_OUTER_JOIN)

                .createAlias("localCityMasterEntity", "localCityMasterEntity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("localStateMasterEntity", "localStateMasterEntity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("localDistrictMasterEntity", "localDistrictMasterEntity", JoinType.LEFT_OUTER_JOIN)

                .createAlias("permanentCityMasterEntity", "permanentCityMasterEntity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("permanentDistrictMasterEntity", "permanentDistrictMasterEntity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("permanentStateMasterEntity", "permanentStateMasterEntity", JoinType.LEFT_OUTER_JOIN)

                .createAlias("guardianCityMasterEntity", "guardianCityMasterEntity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("guardianStateMasterEntity", "guardianStateMasterEntity", JoinType.LEFT_OUTER_JOIN)
                .createAlias("guardianDistrictMasterEntity", "guardianDistrictMasterEntity", JoinType.LEFT_OUTER_JOIN)

                .createAlias("student.batchMasterEntity", "batchMasterEntity", JoinType.LEFT_OUTER_JOIN)

                // .createAlias("student.collegeMasterEntity", "collegeMaster", JoinType.LEFT_OUTER_JOIN)
                .setProjection(projectionList).add(Restrictions.in("student.id", studentIds))
                .setResultTransformer(new AliasToBeanResultTransformer(IDCardInformation.class)).list();
        return list;
    }
    /*
     * @SuppressWarnings("unchecked")
     * @Override public List<IDCardInformation> getHorizontalInfo(Integer[] studentIds) { Session session =
     * this.sessionFactory.getCurrentSession(); ProjectionList projectionList = Projections.projectionList();
     * projectionList.add(Projections.property("student.registrationNumber").as("registrationNumber"));
     * projectionList.add(Projections.property("student.studentName").as("studentName"));
     * projectionList.add(Projections.property("student.identityMark1").as("identityMark1")); //
     * projectionList.add(Projections.property("student.studentPhoto").as("studentPhoto"));
     * projectionList.add(Projections.property("student.studentSignature").as("studentSignature")); //
     * projectionList.add(Projections.property("authoritySignature").as("authoritySignature"));
     * projectionList.add(Projections.property("student.fatherName").as("fatherName"));
     * projectionList.add(Projections.property("student.motherName").as("motherName"));
     * projectionList.add(Projections.property("localAddress").as("localAddress"));
     * projectionList.add(Projections.property("permenantAddress").as("permenantAddress")); //
     * projectionList.add(Projections.property("issueDate").as("issueDate"));
     * projectionList.add(Projections.property("fatherMobileNumber").as("fatherMobileNumber"));
     * projectionList.add(Projections.property("motherMobileNumber").as("motherMobileNumber")); //
     * projectionList.add(Projections.property("student.dateOfBirth").as("dateOfBirth"));
     * projectionList.add(Projections.property("student.height").as("height"));
     * projectionList.add(Projections.property("bloodGroupMaster.bloodGroup").as("bloodGroup"));
     * projectionList.add(Projections.property("genderMaster.genderName").as("genderName"));
     * projectionList.add(Projections.property("student.email").as("email"));
     * projectionList.add(Projections.property("localPINCode").as("localPINCode"));
     * projectionList.add(Projections.property("permenantPINCode").as("permenantPINCode"));
     * projectionList.add(Projections.property("guardianName").as("guardianName"));
     * projectionList.add(Projections.property("student.studentMobileNumber").as("studentMobileNumber"));
     * projectionList.add(Projections.property("branchMaster.branchShortName").as("branchShortName")); // for vertical
     * form generation // projectionList.add(Projections.property("dateOfValidity").as("dateOfValidity"));
     * projectionList.add(Projections.property("degreeMasterEntity.degreeName").as("degreeName")); //
     * projectionList.add(Projections.property("branchMaster.branchShortName").as("branchName")); //
     * projectionList.add(Projections.property("authoritySignature").as("authoritySignature"));
     * projectionList.add(Projections.property("fatherEmailid").as("fatherEmailid"));
     * projectionList.add(Projections.property("motherEmailid").as("motherEmailid"));
     * projectionList.add(Projections.property("fatherDesignation").as("fatherDesignation"));
     * projectionList.add(Projections.property("motherDesignation").as("motherDesignation")); //
     * projectionList.add(Projections.property("issueDate").as("issueDate")); //
     * projectionList.add(Projections.property("dateOfBirth").as("dateOfBirth"));
     * projectionList.add(Projections.property("student.studentLandlineNumber").as("studentLandlineNumber"));
     * projectionList.add(Projections.property("mothertongueMasterEntity.mothertongue").as("mothertongue"));
     * projectionList.add(Projections.property("student.otherLanguage").as("otherLanguage"));
     * projectionList.add(Projections.property("student.weight").as("weight"));
     * projectionList.add(Projections.property("casteMasterEntity.caste").as("caste"));
     *//****/
    /*
     * projectionList.add(Projections.property("categoryMasterEntity.categoryName").as("categoryName"));
     * projectionList.add(Projections.property("nationalityMasterEntity.nationality").as("nationality"));
     *//****/
    /*
     * projectionList.add(Projections.property("religionMasterEntity.religion").as("religion"));
     * projectionList.add(Projections.property("student.admittedToYear").as("admittedToYear")); //
     * projectionList.add(Projections.property("student.year").as("year"));
     * projectionList.add(Projections.property("student.admissionYear").as("admissionYear"));
     * projectionList.add(Projections.property("batchMasterEntity.batchName").as("batchName"));
     * projectionList.add(Projections.property("semesterMasterEntity.semesterName").as("semesterName"));
     * projectionList.add(Projections.property("semesterMasterEntity.semesterFullName").as("semesterFullName"));
     * projectionList.add(Projections.property("student.accountNumber").as("accountNumber"));
     * projectionList.add(Projections.property("student.visaNumber").as("visaNumber"));
     * projectionList.add(Projections.property("student.passportNumber").as("passportNumber"));
     * projectionList.add(Projections.property("student.paymentType").as("paymentType"));
     * projectionList.add(Projections.property("student.examPaymentType").as("examPaymentType"));
     * projectionList.add(Projections.property("student.admissionCancel").as("admissionCancel"));
     * projectionList.add(Projections.property("student.admissionDate").as("admissionDate"));
     * projectionList.add(Projections.property("student.admissionBatch").as("admissionBatch"));
     * projectionList.add(Projections.property("student.leaveDate").as("leaveDate"));
     * projectionList.add(Projections.property("student.stateRank").as("stateRank"));
     * projectionList.add(Projections.property("student.percentage").as("percentage"));
     * projectionList.add(Projections.property("student.percentile").as("percentile"));
     * projectionList.add(Projections.property("student.qualifiedExamRollnumber").as("qualifiedExamRollnumber"));
     * projectionList.add(Projections.property("student.remark").as("remark"));
     * projectionList.add(Projections.property("student.facultyAdvisorNumber").as("facultyAdvisorNumber"));
     * projectionList.add(Projections.property("student.projectName").as("projectName"));
     * projectionList.add(Projections.property("student.scholorshipTypeId").as("scholorshipTypeId"));
     * projectionList.add(Projections.property("student.generalMeritNumber").as("generalMeritNumber"));
     * projectionList.add(Projections.property("student.categoryMeritNumber").as("categoryMeritNumber"));
     * projectionList.add(Projections.property("student.registeredNumber").as("registeredNumber"));
     * projectionList.add(Projections.property("student.admissionRoundNumber").as("admissionRoundNumber"));
     * projectionList.add(Projections.property("student.defenceQuota").as("defenceQuota"));
     * projectionList.add(Projections.property("student.physicallyHandicapped").as("physicallyHandicapped"));
     * projectionList.add(Projections.property("student.typeOfPhysicallyHandicap").as("typeOfPhysicallyHandicap"));
     * projectionList.add(Projections.property("student.personWithDisability").as("personWithDisability"));
     * projectionList.add(Projections.property("student.typeOfPhysicalDisability").as("typeOfPhysicalDisability"));
     * projectionList.add(Projections.property("student.hscMCVC").as("hscMCVC"));
     * projectionList.add(Projections.property("student.annualIncome").as("annualIncome"));
     * projectionList.add(Projections.property("student.admissionQuotaNumber").as("admissionQuotaNumber"));
     * projectionList.add(Projections.property("student.registrationStatus").as("registrationStatus"));
     * projectionList.add(Projections.property("student.otherSchemeNumber").as("otherSchemeNumber"));
     * projectionList.add(Projections.property("student.sportsQuota").as("sportsQuota")); projectionList
     * .add(Projections.property("student.permanentRegistrationAumber").as("permanentRegistrationAumber"));
     * projectionList.add(Projections.property("student.schemeType").as("schemeType"));
     * projectionList.add(Projections.property("student.capInstitute").as("capInstitute"));
     * projectionList.add(Projections.property("student.admissionCategoryNumber").as("admissionCategoryNumber"));
     * projectionList.add(Projections.property("student.oldRegistrationNumber").as("oldRegistrationNumber"));
     * projectionList.add(Projections.property("student.bankNumber").as("bankNumber"));
     * projectionList.add(Projections.property("student.phdSupervisorId").as("phdSupervisorId"));
     * projectionList.add(Projections.property("student.typeOfCosupervisor1").as("typeOfCosupervisor1"));
     * projectionList.add(Projections.property("student.typeOfCosupervisor2").as("typeOfCosupervisor2"));
     * projectionList.add(Projections.property("student.phdStatusCategory").as("phdStatusCategory"));
     * projectionList.add(Projections.property("student.reattend").as("reattend"));
     * projectionList.add(Projections.property("student.sequenceNumber").as("sequenceNumber"));
     * projectionList.add(Projections.property("student.admissionType").as("admissionType"));
     * projectionList.add(Projections.property("student.scholership").as("scholership"));
     * projectionList.add(Projections.property("student.scholershipDetails").as("scholershipDetails"));
     * projectionList.add(Projections.property("student.reserveCategory").as("reserveCategory"));
     * projectionList.add(Projections.property("student.ebc").as("ebc"));
     * projectionList.add(Projections.property("student.emergencyContactNumber").as("emergencyContactNumber"));
     * projectionList.add(Projections.property("student.local").as("local"));
     * projectionList.add(Projections.property("student.bankAddress").as("bankAddress"));
     * projectionList.add(Projections.property("student.bankIFSCCode").as("bankIFSCCode"));
     * projectionList.add(Projections.property("student.panNumber").as("panNumber"));
     * projectionList.add(Projections.property("student.voterNumber").as("voterNumber"));
     * projectionList.add(Projections.property("student.nprNumber").as("nprNumber"));
     * projectionList.add(Projections.property("student.statusOfStudent").as("statusOfStudent"));
     * projectionList.add(Projections.property("student.confHostel").as("confHostel"));
     * projectionList.add(Projections.property("student.convenerAllotment").as("convenerAllotment"));
     * projectionList.add(Projections.property("student.region").as("region"));
     * projectionList.add(Projections.property("student.adharCardNumber").as("adharCardNumber"));
     * projectionList.add(Projections.property("student.routeNumber").as("routeNumber"));
     * projectionList.add(Projections.property("student.routeAmount").as("routeAmount"));
     * projectionList.add(Projections.property("student.medicalProblem").as("medicalProblem"));
     * projectionList.add(Projections.property("student.medicalDetails").as("medicalDetails"));
     * projectionList.add(Projections.property("student.numberOfBrother").as("numberOfBrother"));
     * projectionList.add(Projections.property("student.numberOfSister").as("numberOfSister"));
     * projectionList.add(Projections.property("student.leftThumb").as("leftThumb"));
     * projectionList.add(Projections.property("localTown").as("localTown"));
     * projectionList.add(Projections.property("localCityName").as("localCityName"));
     * projectionList.add(Projections.property("localDistrictName").as("localDistrictName"));
     * projectionList.add(Projections.property("localState").as("localState"));
     * projectionList.add(Projections.property("localCityMasterEntity.cityName").as("localCityName"));
     * projectionList.add(Projections.property("localDistrictMasterEntity.districtName").as("localDistrictName"));
     * projectionList.add(Projections.property("localStateMasterEntity.state").as("localState"));
     * projectionList.add(Projections.property("localTelephone").as("localTelephone"));
     * projectionList.add(Projections.property("localMobileNumber").as("localMobileNumber"));
     * projectionList.add(Projections.property("localEmail").as("localEmail"));
     * projectionList.add(Projections.property("localLandmark").as("localLandmark"));
     * projectionList.add(Projections.property("permanentCityName").as("permanentCityName"));
     * projectionList.add(Projections.property("permenantTown").as("permenantTown"));
     * projectionList.add(Projections.property("permanentDistrictName").as("permanentDistrictName"));
     * projectionList.add(Projections.property("permanentCityMasterEntity.cityName").as("permanentCityName"));
     * projectionList.add(Projections.property("permenantTown").as("permenantTown")); projectionList
     * .add(Projections.property("permanentDistrictMasterEntity.districtName").as("permanentDistrictName"));
     * projectionList.add(Projections.property("permanentStateMasterEntity.state").as("permanentState")); //
     * projectionList.add(Projections.property("permanentState").as("permanentState"));
     * projectionList.add(Projections.property("permanentTelephone").as("permanentTelephone"));
     * projectionList.add(Projections.property("permenantMobileNumber").as("permanentMobileNumber"));
     * projectionList.add(Projections.property("permenantEmail").as("permanentEmail"));
     * projectionList.add(Projections.property("permanantLandmark").as("permanantLandmark"));
     * projectionList.add(Projections.property("relationWithGuardian").as("relationWithGuardian"));
     * projectionList.add(Projections.property("guardianAddress").as("guardianAddress"));
     * projectionList.add(Projections.property("guardianOccupationName").as("guardianOccupationName"));
     * projectionList.add(Projections.property("guardianStreetName").as("guardianStreetName"));
     * projectionList.add(Projections.property("guardianEmail").as("guardianEmail"));
     * projectionList.add(Projections.property("guardianFlatNo").as("guardianFlatNo"));
     * projectionList.add(Projections.property("guardianLandmark").as("guardianLandmark"));
     * projectionList.add(Projections.property("guardianTelephone").as("guardianTelephone")); // for vertical form
     * generation // projectionList.add(Projections.property("dateOfValidity").as("dateOfValidity"));
     * projectionList.add(Projections.property("degreeMasterEntity.degreeName").as("degreeName")); //
     * projectionList.add(Projections.property("branchMaster.branchShortName").as("branchName")); //
     * projectionList.add(Projections.property("authoritySignature").as("authoritySignature"));
     * projectionList.add(Projections.property("fatherEmailid").as("fatherEmailid"));
     * projectionList.add(Projections.property("motherEmailid").as("motherEmailid"));
     * projectionList.add(Projections.property("fatherDesignation").as("fatherDesignation"));
     * projectionList.add(Projections.property("motherDesignation").as("motherDesignation")); //
     * projectionList.add(Projections.property("issueDate").as("issueDate")); //
     * projectionList.add(Projections.property("dateOfBirth").as("dateOfBirth"));
     * projectionList.add(Projections.property("student.studentLandlineNumber").as("studentLandlineNumber"));
     * projectionList.add(Projections.property("mothertongueMasterEntity.mothertongue").as("mothertongue"));
     * projectionList.add(Projections.property("student.otherLanguage").as("otherLanguage"));
     * projectionList.add(Projections.property("student.weight").as("weight"));
     * projectionList.add(Projections.property("casteMasterEntity.caste").as("caste"));
     *//****/

    /*
     * projectionList.add(Projections.property("categoryMasterEntity.categoryName").as("categoryName"));
     * projectionList.add(Projections.property("nationalityMasterEntity.nationality").as("nationality"));
     *//****//*
             * projectionList.add(Projections.property("religionMasterEntity.religion").as("religion"));
             * projectionList.add(Projections.property("student.admittedToYear").as("admittedToYear")); //
             * projectionList.add(Projections.property("student.year").as("year"));
             * projectionList.add(Projections.property("student.admissionYear").as("admissionYear"));
             * projectionList.add(Projections.property("batchMasterEntity.batchName").as("batchName"));
             * projectionList.add(Projections.property("semesterMasterEntity.semesterName").as("semesterName"));
             * projectionList.add(Projections.property("semesterMasterEntity.semesterFullName").as("semesterFullName"));
             * projectionList.add(Projections.property("student.accountNumber").as("accountNumber"));
             * projectionList.add(Projections.property("student.visaNumber").as("visaNumber"));
             * projectionList.add(Projections.property("student.passportNumber").as("passportNumber"));
             * projectionList.add(Projections.property("student.paymentType").as("paymentType"));
             * projectionList.add(Projections.property("student.examPaymentType").as("examPaymentType"));
             * projectionList.add(Projections.property("student.admissionCancel").as("admissionCancel"));
             * projectionList.add(Projections.property("student.admissionDate").as("admissionDate"));
             * projectionList.add(Projections.property("student.admissionBatch").as("admissionBatch"));
             * projectionList.add(Projections.property("student.leaveDate").as("leaveDate"));
             * projectionList.add(Projections.property("student.stateRank").as("stateRank"));
             * projectionList.add(Projections.property("student.percentage").as("percentage"));
             * projectionList.add(Projections.property("student.percentile").as("percentile"));
             * projectionList.add(Projections.property("student.qualifiedExamRollnumber").as("qualifiedExamRollnumber"))
             * ; projectionList.add(Projections.property("student.remark").as("remark"));
             * projectionList.add(Projections.property("student.facultyAdvisorNumber").as("facultyAdvisorNumber"));
             * projectionList.add(Projections.property("student.projectName").as("projectName"));
             * projectionList.add(Projections.property("student.scholorshipTypeId").as("scholorshipTypeId"));
             * projectionList.add(Projections.property("student.generalMeritNumber").as("generalMeritNumber"));
             * projectionList.add(Projections.property("student.categoryMeritNumber").as("categoryMeritNumber"));
             * projectionList.add(Projections.property("student.registeredNumber").as("registeredNumber"));
             * projectionList.add(Projections.property("student.admissionRoundNumber").as("admissionRoundNumber"));
             * projectionList.add(Projections.property("student.defenceQuota").as("defenceQuota"));
             * projectionList.add(Projections.property("student.physicallyHandicapped").as("physicallyHandicapped"));
             * projectionList.add(Projections.property("student.typeOfPhysicallyHandicap").as("typeOfPhysicallyHandicap"
             * )); projectionList.add(Projections.property("student.personWithDisability").as("personWithDisability"));
             * projectionList.add(Projections.property("student.typeOfPhysicalDisability").as("typeOfPhysicalDisability"
             * )); projectionList.add(Projections.property("student.hscMCVC").as("hscMCVC"));
             * projectionList.add(Projections.property("student.annualIncome").as("annualIncome"));
             * projectionList.add(Projections.property("student.admissionQuotaNumber").as("admissionQuotaNumber"));
             * projectionList.add(Projections.property("student.registrationStatus").as("registrationStatus"));
             * projectionList.add(Projections.property("student.otherSchemeNumber").as("otherSchemeNumber"));
             * projectionList.add(Projections.property("student.sportsQuota").as("sportsQuota")); projectionList
             * .add(Projections.property("student.permanentRegistrationAumber").as("permanentRegistrationAumber"));
             * projectionList.add(Projections.property("student.schemeType").as("schemeType"));
             * projectionList.add(Projections.property("student.capInstitute").as("capInstitute"));
             * projectionList.add(Projections.property("student.admissionCategoryNumber").as("admissionCategoryNumber"))
             * ; projectionList.add(Projections.property("student.oldRegistrationNumber").as("oldRegistrationNumber"));
             * projectionList.add(Projections.property("student.bankNumber").as("bankNumber"));
             * projectionList.add(Projections.property("student.phdSupervisorId").as("phdSupervisorId"));
             * projectionList.add(Projections.property("student.typeOfCosupervisor1").as("typeOfCosupervisor1"));
             * projectionList.add(Projections.property("student.typeOfCosupervisor2").as("typeOfCosupervisor2"));
             * projectionList.add(Projections.property("student.phdStatusCategory").as("phdStatusCategory"));
             * projectionList.add(Projections.property("student.reattend").as("reattend"));
             * projectionList.add(Projections.property("student.sequenceNumber").as("sequenceNumber"));
             * projectionList.add(Projections.property("student.admissionType").as("admissionType"));
             * projectionList.add(Projections.property("student.scholership").as("scholership"));
             * projectionList.add(Projections.property("student.scholershipDetails").as("scholershipDetails"));
             * projectionList.add(Projections.property("student.reserveCategory").as("reserveCategory"));
             * projectionList.add(Projections.property("student.ebc").as("ebc"));
             * projectionList.add(Projections.property("student.emergencyContactNumber").as("emergencyContactNumber"));
             * projectionList.add(Projections.property("student.local").as("local"));
             * projectionList.add(Projections.property("student.bankAddress").as("bankAddress"));
             * projectionList.add(Projections.property("student.bankIFSCCode").as("bankIFSCCode"));
             * projectionList.add(Projections.property("student.panNumber").as("panNumber"));
             * projectionList.add(Projections.property("student.voterNumber").as("voterNumber"));
             * projectionList.add(Projections.property("student.nprNumber").as("nprNumber"));
             * projectionList.add(Projections.property("student.statusOfStudent").as("statusOfStudent"));
             * projectionList.add(Projections.property("student.confHostel").as("confHostel"));
             * projectionList.add(Projections.property("student.convenerAllotment").as("convenerAllotment"));
             * projectionList.add(Projections.property("student.region").as("region"));
             * projectionList.add(Projections.property("student.adharCardNumber").as("adharCardNumber"));
             * projectionList.add(Projections.property("student.routeNumber").as("routeNumber"));
             * projectionList.add(Projections.property("student.routeAmount").as("routeAmount"));
             * projectionList.add(Projections.property("student.medicalProblem").as("medicalProblem"));
             * projectionList.add(Projections.property("student.medicalDetails").as("medicalDetails"));
             * projectionList.add(Projections.property("student.numberOfBrother").as("numberOfBrother"));
             * projectionList.add(Projections.property("student.numberOfSister").as("numberOfSister"));
             * projectionList.add(Projections.property("student.leftThumb").as("leftThumb"));
             * projectionList.add(Projections.property("localTown").as("localTown"));
             * projectionList.add(Projections.property("localCityName").as("localCityName"));
             * projectionList.add(Projections.property("localDistrictName").as("localDistrictName"));
             * projectionList.add(Projections.property("localState").as("localState"));
             * projectionList.add(Projections.property("localCityMasterEntity.cityName").as("localCityName"));
             * projectionList.add(Projections.property("localDistrictMasterEntity.districtName").as("localDistrictName")
             * ); projectionList.add(Projections.property("localStateMasterEntity.state").as("localState"));
             * projectionList.add(Projections.property("localTelephone").as("localTelephone"));
             * projectionList.add(Projections.property("localMobileNumber").as("localMobileNumber"));
             * projectionList.add(Projections.property("localEmail").as("localEmail"));
             * projectionList.add(Projections.property("localLandmark").as("localLandmark")); <<<<<<< .mine
             * projectionList.add(Projections.property("guardianCity").as("guardianCity"));
             * projectionList.add(Projections.property("guardianDistrict").as("guardianDistrict"));
             * projectionList.add(Projections.property("guardianState").as("guardianState"));
             * projectionList.add(Projections.property("guardianCity").as("guardianCity"));
             * projectionList.add(Projections.property("guardianDistrict").as("guardianDistrict"));
             * projectionList.add(Projections.property("guardianState").as("guardianState")); =======
             * projectionList.add(Projections.property("permanentCityName").as("permanentCityName"));
             * projectionList.add(Projections.property("permenantTown").as("permenantTown"));
             * projectionList.add(Projections.property("permanentDistrictName").as("permanentDistrictName")); >>>>>>>
             * .r1715 projectionList.add(Projections.property("guardianCityMasterEntity.cityName").as("guardianCity"));
             * projectionList.add(Projections.property("guardianDistrictMasterEntity.districtName").as(
             * "guardianDistrict"));
             * projectionList.add(Projections.property("guardianStateMasterEntity.state").as("guardianState"));
             * projectionList.add(Projections.property("guardianPINCode").as("guardianPINCode"));
             * projectionList.add(Projections.property("guardianTown").as("guardianTown")); //
             * projectionList.add(Projections.property("guardianTown").as("guardianTown")); // end
             * projectionList.add(Projections.property("permanentCityMasterEntity.cityName").as("permanentCityName"));
             * projectionList.add(Projections.property("permenantTown").as("permenantTown")); projectionList
             * .add(Projections.property("permanentDistrictMasterEntity.districtName").as("permanentDistrictName"));
             * projectionList.add(Projections.property("permanentStateMasterEntity.state").as("permanentState")); //
             * projectionList.add(Projections.property("permanentState").as("permanentState"));
             * projectionList.add(Projections.property("permanentTelephone").as("permanentTelephone"));
             * projectionList.add(Projections.property("permenantMobileNumber").as("permanentMobileNumber"));
             * projectionList.add(Projections.property("permenantEmail").as("permanentEmail"));
             * projectionList.add(Projections.property("permanantLandmark").as("permanantLandmark"));
             * projectionList.add(Projections.property("relationWithGuardian").as("relationWithGuardian"));
             * projectionList.add(Projections.property("guardianAddress").as("guardianAddress"));
             * projectionList.add(Projections.property("guardianOccupationName").as("guardianOccupationName"));
             * projectionList.add(Projections.property("guardianStreetName").as("guardianStreetName"));
             * projectionList.add(Projections.property("guardianEmail").as("guardianEmail"));
             * projectionList.add(Projections.property("guardianFlatNo").as("guardianFlatNo"));
             * projectionList.add(Projections.property("guardianLandmark").as("guardianLandmark"));
             * projectionList.add(Projections.property("guardianTelephone").as("guardianTelephone"));
             * projectionList.add(Projections.property("guardianCity").as("guardianCity"));
             * projectionList.add(Projections.property("guardianDistrict").as("guardianDistrict"));
             * projectionList.add(Projections.property("guardianState").as("guardianState"));
             * projectionList.add(Projections.property("guardianCityMasterEntity.cityName").as("guardianCity"));
             * projectionList.add(Projections.property("guardianDistrictMasterEntity.districtName").as(
             * "guardianDistrict"));
             * projectionList.add(Projections.property("guardianStateMasterEntity.state").as("guardianState"));
             * projectionList.add(Projections.property("guardianPINCode").as("guardianPINCode"));
             * projectionList.add(Projections.property("guardianTown").as("guardianTown")); //
             * projectionList.add(Projections.property("guardianTown").as("guardianTown")); // end
             * List<IDCardInformation> list =
             * session.createCriteria(StudentAddressMasterEntity.class).createAlias("studentAdmissionEntity", "student")
             * .createAlias("student.bloodGroupMasterEntity", "bloodGroupMaster", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.degreeMasterEntity", "degreeMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.branchMasterEntity", "branchMaster", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.genderMasterEntity", "genderMaster", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.semesterMasterEntity", "semesterMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.categoryMasterEntity", "categoryMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.mothertongueMasterEntity", "mothertongueMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.casteMasterEntity", "casteMasterEntity", JoinType.LEFT_OUTER_JOIN) //
             * .createAlias("student.collegeMasterEntity", "collegeMaster", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.religionMasterEntity", "religionMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.nationalityMasterEntity", "nationalityMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("localCityMasterEntity", "localCityMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("localStateMasterEntity", "localStateMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("localDistrictMasterEntity", "localDistrictMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("permanentCityMasterEntity", "permanentCityMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("permanentDistrictMasterEntity", "permanentDistrictMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("permanentStateMasterEntity", "permanentStateMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("guardianCityMasterEntity", "guardianCityMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("guardianStateMasterEntity", "guardianStateMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("guardianDistrictMasterEntity", "guardianDistrictMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.batchMasterEntity", "batchMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.semesterMasterEntity", "semesterMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.categoryMasterEntity", "categoryMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.mothertongueMasterEntity", "mothertongueMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.casteMasterEntity", "casteMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.religionMasterEntity", "religionMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.nationalityMasterEntity", "nationalityMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("localCityMasterEntity", "localCityMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("localStateMasterEntity", "localStateMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("localDistrictMasterEntity", "localDistrictMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("permanentCityMasterEntity", "permanentCityMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("permanentDistrictMasterEntity", "permanentDistrictMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("permanentStateMasterEntity", "permanentStateMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("guardianCityMasterEntity", "guardianCityMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("guardianStateMasterEntity", "guardianStateMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("guardianDistrictMasterEntity", "guardianDistrictMasterEntity", JoinType.LEFT_OUTER_JOIN)
             * .createAlias("student.batchMasterEntity", "batchMasterEntity", JoinType.LEFT_OUTER_JOIN) //
             * .createAlias("student.collegeMasterEntity", "collegeMaster", JoinType.LEFT_OUTER_JOIN)
             * .setProjection(projectionList).add(Restrictions.in("student.id", studentIds)) .setResultTransformer(new
             * AliasToBeanResultTransformer(IDCardInformation.class)).list(); return list; }
             */

    @SuppressWarnings("unchecked")
    @Override
    public List<CollegeInformation> getCollegeInfo(Integer[] collegeId) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("collegeId"));
        projectionList.add(Projections.property("collegeName").as("collegeName"));
        projectionList.add(Projections.property("collegeName").as("collegeName"));
        projectionList.add(Projections.property("collegeLogo").as("collegeLogo"));
        projectionList.add(Projections.property("collegeAddress").as("collegeAddress"));

        List<CollegeInformation> list = session.createCriteria(CollegeMasterEntity.class).setProjection(projectionList)
            .add(Restrictions.in("id", collegeId))
            .setResultTransformer(new AliasToBeanResultTransformer(CollegeInformation.class)).list();

        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<StudentAdmissionEntity> getRollList(int branchId, int semesterId, int degreeId) {
        Session session = this.sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();

        projectionList.add(Projections.property("registrationNumber").as("registrationNumber"));
        projectionList.add(Projections.property("enrollmentNumber").as("enrollmentNumber"));
        projectionList.add(Projections.property("rollNumber").as("rollNumber"));
        projectionList.add(Projections.property("studentName").as("studentName"));
        projectionList.add(Projections.property("genderMaster.genderName").as("genderName"));
        // projectionList.add(Projections.property("genderMaster.genderName").as("genderName"));
        projectionList.add(Projections.property("semesterMasterEntity.semesterName").as("semesterName"));
        projectionList.add(Projections.property("branchMaster.branchShortName").as("branchName"));

        List<StudentAdmissionEntity> list = session.createCriteria(StudentAdmissionEntity.class)

            .createAlias("genderMasterEntity", "genderMaster", JoinType.LEFT_OUTER_JOIN)
            .createAlias("semesterMasterEntity", "semesterMasterEntity", JoinType.LEFT_OUTER_JOIN)
            .createAlias("branchMasterEntity", "branchMaster", JoinType.LEFT_OUTER_JOIN).setProjection(projectionList)

            .add(Restrictions.eq("branchNumber", branchId))

            .add(Restrictions.eq("semesterId", semesterId))

            .add(Restrictions.eq("degreeId", degreeId))
            .setResultTransformer(new AliasToBeanResultTransformer(StudentAdmissionEntity.class)).list();

        // .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

        return list;
    }

    @Override
    public int getStudentIdByEnrollmentNumber(String enrollmentNumber) {
        int studentId = ((Integer) this.sessionFactory.getCurrentSession().createCriteria(StudentAdmissionEntity.class)
            .setProjection(Projections.property("id")).add(Restrictions.eq("enrollmentNumber", enrollmentNumber))
            .uniqueResult()).intValue();

        return studentId;
    }
    /*-----------------------------------------------------------------------------------------------------*/

    /*----------------------------- APIs for Fees Collection  -------------------- */

    @SuppressWarnings("unchecked")
    @Override
    public List<StudentInfoForDCR> getStudentByEnrollmentNumber(String enrollmentId) {
        Session session = this.sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("studentId"));
        projectionList.add(Projections.property("enrollmentNumber").as("enrollmentNumber"));
        projectionList.add(Projections.property("degreeMaster.degreeName").as("degreeName"));
        projectionList.add(Projections.property("degreeMaster.id").as("degreeId"));
        projectionList.add(Projections.property("studentName").as("studentName"));
        projectionList.add(Projections.property("branchMaster.branchShortName").as("branchShortName"));
        projectionList.add(Projections.property("branchMaster.id").as("branchId"));
        projectionList.add(Projections.property("genderMaster.genderName").as("genderName"));
        projectionList.add(Projections.property("genderMaster.id").as("genderId"));
        projectionList.add(Projections.property("yearMasterEntity.year").as("year"));
        projectionList.add(Projections.property("yearMasterEntity.id").as("yearId"));
        projectionList.add(Projections.property("admissionDate").as("admissionDate"));
        projectionList.add(Projections.property("semesterMaster.semesterName").as("semesterName"));
        projectionList.add(Projections.property("semesterMaster.id").as("semesterId"));
        projectionList.add(Projections.property("paymentType.paymentType").as("paymentType"));
        projectionList.add(Projections.property("paymentType.id").as("paymentTypeId"));
        projectionList.add(Projections.property("admissionBatchMaster.batchName").as("admissionBatch"));
        projectionList.add(Projections.property("admissionBatchMaster.id").as("admissionBatchId"));
        projectionList.add(Projections.property("hosteler").as("hosteler"));
        projectionList.add(Projections.property("transport").as("transport"));

        List<StudentInfoForDCR> entity = session.createCriteria(StudentAdmissionEntity.class)
            .createAlias("genderMasterEntity", "genderMaster", JoinType.LEFT_OUTER_JOIN)
            .createAlias("semesterMasterEntity", "semesterMaster", JoinType.LEFT_OUTER_JOIN)
            .createAlias("admissionBatchMasterEntity", "admissionBatchMaster", JoinType.LEFT_OUTER_JOIN)
            .createAlias("degreeMasterEntity", "degreeMaster", JoinType.LEFT_OUTER_JOIN)
            .createAlias("paymentTypeMasterEntity", "paymentType", JoinType.LEFT_OUTER_JOIN)
            .createAlias("branchMasterEntity", "branchMaster", JoinType.LEFT_OUTER_JOIN)
            .createAlias("yearMasterEntity", "yearMasterEntity", JoinType.LEFT_OUTER_JOIN).setProjection(projectionList)
            .setResultTransformer(new AliasToBeanResultTransformer(StudentInfoForDCR.class))
            .add(Restrictions.eq("enrollmentNumber", enrollmentId)).list();

        return entity;
    }

    @Override
    public String getStudentAcademicBatch(String enrollmentId) {
        Session session = this.sessionFactory.getCurrentSession();

        String studentAcademicBatch = (String) session.createCriteria(StudentAdmissionEntity.class)
            .setProjection(Projections.property("admissionBatchMaster.batchName").as("admissionBatch"))
            .createAlias("admissionBatchMasterEntity", "admissionBatchMaster", JoinType.LEFT_OUTER_JOIN)
            .add(Restrictions.eq("enrollmentNumber", enrollmentId)).uniqueResult();
        String batch = studentAcademicBatch;
        return batch;
    }

    /*----------------------------------------------------------------------------------------------------*/
    /*-------------------------------Search Function---------------------------------------------*/
    @SuppressWarnings("unchecked")
    @Override
    public List<StudentAdmissionEntity> searchStudentsByCriteria(String searchText, int searchCriteria, int degreeId,
        int branchId, int yearId, int semesterId) {
        LOG.info(" control in searchStudentsByCriteria");
        Session session = this.sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("enrollmentNumber").as("enrollmentNumber"));
        projectionList.add(Projections.property("studentName").as("studentName"));
        projectionList.add(Projections.property("id").as("identityNumber"));
        projectionList.add(Projections.property("degreeMaster.degreeName").as("degreeName"));
        projectionList.add(Projections.property("branchMaster.branchShortName").as("branchShortName"));
        projectionList.add(Projections.property("yearMasterEntity.year").as("year"));
        projectionList.add(Projections.property("semesterMaster.semesterName").as("semesterName"));

        Criteria cr = session.createCriteria(StudentAdmissionEntity.class)
            .createAlias("degreeMasterEntity", "degreeMaster", JoinType.LEFT_OUTER_JOIN)
            .createAlias("branchMasterEntity", "branchMaster", JoinType.LEFT_OUTER_JOIN)
            .createAlias("yearMasterEntity", "yearMasterEntity", JoinType.LEFT_OUTER_JOIN)
            .createAlias("semesterMasterEntity", "semesterMaster", JoinType.LEFT_OUTER_JOIN)
            .setProjection(projectionList);

        switch (searchCriteria) {
            case 1:
                cr.add(Restrictions.ilike("studentName", searchText + "%"));
                break;

            case 2:
                cr.add(Restrictions.eq("enrollmentNumber", searchText));
                break;

            case 3:
                int id = Integer.parseInt(searchText);
                cr.add(Restrictions.eq("id", id));
                break;
        }

        if (degreeId != 0) {
            cr.add(Restrictions.eq("degreeId", degreeId));
        }

        if (branchId != 0) {
            cr.add(Restrictions.eq("branchNumber", branchId));
        }

        if (yearId != 0) {
            cr.add(Restrictions.eq("admittedToYear", yearId));
        }

        if (semesterId != 0) {
            cr.add(Restrictions.eq("semesterId", degreeId));
        }

        List<StudentAdmissionEntity> entityList = cr.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

        LOG.info("studentAdmissionEntity:" + entityList);
        return entityList;
    }
}
