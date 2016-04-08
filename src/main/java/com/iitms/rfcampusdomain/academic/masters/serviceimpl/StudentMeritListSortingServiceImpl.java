/*package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListSortingEntity;
import com.iitms.rfcampusdomain.academic.masters.service.StudentMeritListSortingService;


@Service
@Transactional
public class StudentMeritListSortingServiceImpl implements StudentMeritListSortingService {

    
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public Session currentSession() {
        Session session = sessionFactory.getCurrentSession();
        return null;
    }

    @Override
    public StudentMeritListMasterEntity getId(int id) {
        Session session = sessionFactory.getCurrentSession();
        return null;
    }

    @Override
    public StudentMeritListSortingEntity getColumnName(String columnName) {
        Session session = sessionFactory.getCurrentSession();
        return null;
    }

    @Override
    public StudentMeritListSortingEntity getDisplayName(String displayName) {
       Session session = sessionFactory.getCurrentSession();
        return null;
    }
    
    
    

}
*/