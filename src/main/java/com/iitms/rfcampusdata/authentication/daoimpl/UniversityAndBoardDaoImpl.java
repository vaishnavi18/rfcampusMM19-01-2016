package com.iitms.rfcampusdata.authentication.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.authentication.dao.UniversityAndBoardDao;
import com.iitms.rfcampusdata.authentication.entity.UniversityMaster;

@Repository
public class UniversityAndBoardDaoImpl implements UniversityAndBoardDao {
    private static final Logger logger = LoggerFactory.getLogger(UniversityAndBoardDaoImpl.class);

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean addUniversityAndBoard(UniversityMaster entity) {
        this.sessionFactory.getCurrentSession().save(entity);
        return true;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<UniversityMaster> getUniversityList(boolean onlyActive) {

        Criteria criteria =
            this.sessionFactory.getCurrentSession().createCriteria(UniversityMaster.class).addOrder(Order.asc("id"));

        if (onlyActive == true) {
            criteria.add(Restrictions.eq("active", 1));
        }

        List<UniversityMaster> list = criteria.list();
        logger.info("List of university:" + list);
        return list;
    }

    @Override
    public boolean updateUniversity(UniversityMaster entity) {

        Session session = this.sessionFactory.getCurrentSession();
        UniversityMaster universityEntity = (UniversityMaster) session.get(UniversityMaster.class, entity.getId());
        logger.info("universityEntity : " + universityEntity);
        universityEntity.setUniversityCode(entity.getUniversityCode());
        universityEntity.setUniversityName(entity.getUniversityName());
        universityEntity.setActive(entity.getActive());
        session.update(universityEntity);
        return true;
    }

    @Override
    public boolean getUniversityAlreadyExist(String univCode, String univName) {
        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        UniversityMaster entity = (UniversityMaster) session.createCriteria(UniversityMaster.class)
            .add(Restrictions.eq("universityCode", univCode)).add(Restrictions.eq("universityName", univName))
            .uniqueResult();
        if (entity != null) {
            result = true;
        }
        return result;
    }

}
