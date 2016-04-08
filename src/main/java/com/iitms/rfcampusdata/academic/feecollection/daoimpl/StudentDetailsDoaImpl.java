package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.feecollection.dao.StudentDetailsDoa;
import com.iitms.rfcampusdata.academic.feecollection.entity.StudentDetails;

@Repository
public class StudentDetailsDoaImpl implements StudentDetailsDoa {
    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(StudentDetailsDoaImpl.class);

    @Autowired
    SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<StudentDetails> searchUserByCriteria(String searchBy, String searchText) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("studentName").as("studentName"));
        projectionList.add(Projections.property("enrollmentNumber").as("enrollmentNumber"));
        projectionList.add(Projections.property("batchName").as("batchName"));
        projectionList.add(Projections.property("semesterFullName").as("semesterFullName"));
        projectionList.add(Projections.property("branchLongName").as("branchLongName"));

        Criteria criteria = session.createCriteria(StudentDetails.class).setProjection(projectionList)
            .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        criteria.setMaxResults(5);

        switch (searchBy) {
            case "ByName": {
                criteria.add(Restrictions.ilike("studentName", searchText + "%"));
            }
                break;
            case "EnrollmentNumber": {
                criteria.add(Restrictions.ilike("enrollmentNumber", (searchText) + "%"));
            }
                break;

        }

        List<StudentDetails> list = criteria.list();
        LOG.info("Result : " + list);
        return list;
    }

}
