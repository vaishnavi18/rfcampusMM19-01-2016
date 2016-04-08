package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.masters.dao.SemesterDao;
import com.iitms.rfcampusdata.academic.masters.entity.SemesterMasterEntity;

@Repository
public class SemesterDaoImpl implements SemesterDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean addSemester(final SemesterMasterEntity entity) {
        Session session = sessionFactory.getCurrentSession();
        session.save(entity);
        return true;
    }

    @Override
    public List<SemesterMasterEntity> getAllSemester() {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
        List<SemesterMasterEntity> semesterList = session.createCriteria(SemesterMasterEntity.class).list();
        return semesterList;
    }

    @Override
    public boolean updateSemester(final SemesterMasterEntity entity) {
        Session session = sessionFactory.getCurrentSession();
        SemesterMasterEntity semesterEntity =
            (SemesterMasterEntity) session.get(SemesterMasterEntity.class, entity.getId());
        // semesterEntity.setSemesterName(entity.getSemesterName());
        // semesterEntity.setSemesterFullName(entity.getSemesterFullName());
        semesterEntity.setSemesterOddEven(entity.getSemesterOddEven());
        session.update(semesterEntity);
        return true;
    }

    @Override
    public boolean getSemesterAlreadyExist(final String semesterName, final String semesterFullName) {
        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        SemesterMasterEntity entity = (SemesterMasterEntity) session.createCriteria(SemesterMasterEntity.class)
            .add(Restrictions.eq("semesterName", semesterName))
            .add(Restrictions.eq("semesterFullName", semesterFullName)).uniqueResult();

        if (entity != null) {
            result = true;
        }
        return result;

    }

}
