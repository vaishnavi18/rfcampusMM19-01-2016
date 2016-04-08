package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.masters.dao.AcademicSessionMasterDao;
import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;

@Repository
public class AcademicSessionMasterDaoImpl implements AcademicSessionMasterDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<AcademicSessionMasterEntity> getAcademicSession() {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
        List<AcademicSessionMasterEntity> academicSessionList =
            session.createCriteria(AcademicSessionMasterEntity.class).list();
        return academicSessionList;
    }

}
