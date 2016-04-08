package com.iitms.rfcampusdata.authentication.daoimpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.authentication.dao.ForgetPasswordByEmailDao;
import com.iitms.rfcampusdata.authentication.entity.UserMasterEntity;

@Repository

public class ForgetPasswordByEmailDaoImpl implements ForgetPasswordByEmailDao {
    private static final Logger logger = LoggerFactory.getLogger(ForgetPasswordByEmailDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public UserMasterEntity checkEmail(String email) {
        Session session = this.sessionFactory.getCurrentSession();
        /*
         * ProjectionList projectionList= Projections.projectionList();
         * projectionList.add(Projections.property("userId").as("userId"));
         * projectionList.add(Projections.property("").as(""));
         */

        UserMasterEntity user = (UserMasterEntity) session.createCriteria(UserMasterEntity.class)
            .add(Restrictions.eq("emailid", email)).uniqueResult();

        // logger.info("Size :"+user.getUserId());
        return user;
    }

    @Override
    public Boolean updatePassword(int id, String password) {
        Session session = this.sessionFactory.getCurrentSession();
        UserMasterEntity user = (UserMasterEntity) session.get(UserMasterEntity.class, id);
        user.setPassword(password);
        session.update(user);
        return true;
    }

}
