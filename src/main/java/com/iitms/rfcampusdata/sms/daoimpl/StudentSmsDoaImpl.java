package com.iitms.rfcampusdata.sms.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.sms.dao.StudentSmsDoa;

@Repository
public class StudentSmsDoaImpl implements StudentSmsDoa {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @SuppressWarnings("unchecked")
    public List<StudentAdmissionEntity> getStudentByQuery(String query) {
        Session session = this.sessionFactory.getCurrentSession();
        Criteria criteria = null;
        criteria = session.createCriteria(StudentAdmissionEntity.class);

        List<StudentAdmissionEntity> student_list = criteria.add(Restrictions.sqlRestriction(query)).list();

        return student_list;
    }

}
