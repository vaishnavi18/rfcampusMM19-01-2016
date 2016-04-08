package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.masters.dao.DegreeDao;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;

@Repository
public class DegreeDaoImpl implements DegreeDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean addDegree(final DegreeMasterEntity entity) {
        Session session = sessionFactory.getCurrentSession();
        session.save(entity);
        return true;
    }

    @Override
    public List<DegreeMasterEntity> getAllDegree() {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
        List<DegreeMasterEntity> degreeList = session.createCriteria(DegreeMasterEntity.class).list();
        return degreeList;
    }

    @Override
    public boolean updateDegree(final DegreeMasterEntity entity) {
        Session session = sessionFactory.getCurrentSession();
        DegreeMasterEntity degreeEntity = (DegreeMasterEntity) session.get(DegreeMasterEntity.class, entity.getId());
        degreeEntity.setDegreeName(entity.getDegreeName());
        degreeEntity.setDegreeCode(entity.getDegreeCode());
        session.update(degreeEntity);
        return true;
    }

    @Override
    public boolean getDegreeAlreadyExist(final String degreeName, final String degreeCode) {
        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        DegreeMasterEntity entity = (DegreeMasterEntity) session.createCriteria(DegreeMasterEntity.class)
            /* .add(Restrictions.eq("degreeName", degreeName)) */.add(Restrictions.eq("degreeCode", degreeCode))
            .uniqueResult();

        if (entity != null) {
            result = true;
        }
        return result;
    }

    @Override
    public boolean getDegreeAlreadyExist(final String degreeName, final String degreeCode, final int id) {
        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        DegreeMasterEntity entity = (DegreeMasterEntity) session.createCriteria(DegreeMasterEntity.class)
            .add(Restrictions.ne("id", id)).add(Restrictions.eq("degreeCode", degreeCode)).uniqueResult();

        if (entity != null) {
            result = true;
        }
        return result;
    }

}
