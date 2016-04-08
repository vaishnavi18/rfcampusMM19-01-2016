package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.masters.dao.DepartmentDao;
import com.iitms.rfcampusdata.academic.masters.entity.DepartmentMasterEntity;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {
    @Autowired
    SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<DepartmentMasterEntity> getAllDepartment() {
        Session session = sessionFactory.getCurrentSession();
        List<DepartmentMasterEntity> departmentList = session.createCriteria(DepartmentMasterEntity.class).list();
        return departmentList;
    }
}
