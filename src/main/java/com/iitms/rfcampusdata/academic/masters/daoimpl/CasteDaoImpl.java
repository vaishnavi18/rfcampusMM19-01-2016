package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.masters.dao.CasteDao;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;

@Repository
public class CasteDaoImpl implements CasteDao {
    private static final Logger LOG = LoggerFactory.getLogger(CasteMasterEntity.class);

    @Autowired
    SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<CasteMasterEntity> getCastList() {
        Session session = sessionFactory.getCurrentSession();
        List<CasteMasterEntity> castList = session.createCriteria(CasteMasterEntity.class).list();
        LOG.info(" stateList:" + castList);
        return castList;

    }

    @SuppressWarnings("unchecked")
    @Override
    public String getCastName(int castId) {
        Session session = sessionFactory.getCurrentSession();
        String cast = "";
        if (castId != 0) {
            LOG.info("Get Cast Id  :", castId);
            // Values passed to SQL commands should be sanitized
            String getQuery = "from CasteMasterEntity where id = :id";
            Query query = session.createQuery(getQuery).setParameter("id", castId);
            List<CasteMasterEntity> list = query.list();
            cast = list.get(0).getCaste();
            System.out.println("Caste Name ==>:" + cast);

        }
        return cast;
    }

}
