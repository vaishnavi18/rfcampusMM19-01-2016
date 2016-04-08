package com.iitms.rfcampusdata.academic.admission.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.admission.dao.StudentAdmissionDao;
import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentAddressMasterEntity;

@Repository
public class StudentAdmissionDaoImpl implements StudentAdmissionDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public int addStudent(StudentAdmissionEntity studentRegistrationEntity,
        StudentAddressMasterEntity studentAddressEntity, int admissionType) {
        Session session = this.sessionFactory.getCurrentSession();

        Integer studentId = (Integer) session.save(studentRegistrationEntity);
        if (studentAddressEntity != null) {
            studentAddressEntity.setStudentId(studentId);
            session.save(studentAddressEntity);
        }

        StudentAdmissionEntity entity = (StudentAdmissionEntity) session.get(StudentAdmissionEntity.class, studentId);

        entity.setEnrollmentNumber(String.valueOf(entity.getId()));
        session.update(entity);

        return entity.getId();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<CasteMasterEntity> getCasteList(int categoryId) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("caste").as("caste"));

        List<CasteMasterEntity> list = session.createCriteria(CasteMasterEntity.class).setProjection(projectionList)
            .add(Restrictions.eq("categoryId", categoryId)).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<BranchMasterEntity> getBranchList(int degreeId) {
        Session session = this.sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("branchShortName").as("branchShortName"));
        List<BranchMasterEntity> list = session.createCriteria(BranchMasterEntity.class).setProjection(projectionList)
            .add(Restrictions.eq("branchDegreeNumber", degreeId)).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
            .list();
        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<StudentAdmissionEntity> getStudentList(int degreeId, int branchId, int semesterId) {
        Session session = this.sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("studentFirstName").as("studentFirstName"));
        projectionList.add(Projections.property("studentMiddleName").as("studentMiddleName"));
        projectionList.add(Projections.property("studentLastName").as("studentLastName"));
        projectionList.add(Projections.property("enrollmentNumber").as("enrollmentNumber"));
        projectionList.add(Projections.property("branchMasterEntity.branchShortName").as("branchShortName"));
        projectionList.add(Projections.property("semesterMasterEntity.semesterName").as("semesterName"));
        projectionList.add(Projections.property("gender").as("gender"));
        projectionList.add(Projections.property("genderMasterEntity.genderName").as("genderName"));
        projectionList.add(Projections.property("rollNumber").as("rollNumber"));
        projectionList.add(Projections.property("registrationNumber").as("registrationNumber"));
        List<StudentAdmissionEntity> list = session.createCriteria(StudentAdmissionEntity.class)
            .createAlias("branchMasterEntity", "branchMasterEntity")
            .createAlias("genderMasterEntity", "genderMasterEntity")
            .createAlias("semesterMasterEntity", "semesterMasterEntity").setProjection(projectionList)
            .add(Restrictions.eq("degreeId", degreeId)).add(Restrictions.eq("branchNumber", branchId))
            .add(Restrictions.eq("semesterId", semesterId)).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();
        return list;
    }

    @Override
    public void setRegistrationNumber(int studentId, String registrationNumber) {
        Session session = this.sessionFactory.getCurrentSession();
        session
            .createQuery(
                "Update StudentAdmissionEntity entity set entity.registrationNumber = :registrationNumber where id = :id")
            .setParameter("registrationNumber", registrationNumber).setParameter("id", studentId).executeUpdate();
    }

}
