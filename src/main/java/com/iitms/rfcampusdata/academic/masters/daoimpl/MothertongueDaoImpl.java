package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.masters.dao.MothertongueDao;
import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;

@Repository
public class MothertongueDaoImpl implements MothertongueDao {

    private static final Logger logger = LoggerFactory.getLogger(MothertongueDaoImpl.class);

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean addMothertongue(MothertongueMasterEntity entity) {
        this.sessionFactory.getCurrentSession().save(entity);
        return true;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<MothertongueMasterEntity> getMothertongue() {
        List<MothertongueMasterEntity> list = this.sessionFactory.getCurrentSession()
            .createCriteria(MothertongueMasterEntity.class).addOrder(Order.asc("id")).list();
        logger.info("ptu:" + list);
        return list;
    }

    @Override
    public boolean updateMothertongue(MothertongueMasterEntity entity) {
        Session session = this.sessionFactory.getCurrentSession();
        MothertongueMasterEntity mothertongueEntity =
            (MothertongueMasterEntity) session.get(MothertongueMasterEntity.class, entity.getId());
        logger.info("ptu update:" + mothertongueEntity);
        mothertongueEntity.setMothertongue(entity.getMothertongue());
        session.update(mothertongueEntity);
        return true;
    }

}
