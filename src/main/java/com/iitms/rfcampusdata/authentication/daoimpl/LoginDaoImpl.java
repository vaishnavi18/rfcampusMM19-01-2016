package com.iitms.rfcampusdata.authentication.daoimpl;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.authentication.dao.LoginDao;
import com.iitms.rfcampusdata.authentication.entity.UserAttemptsEntity;

@Repository
public class LoginDaoImpl implements LoginDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void changePassword(String username, String password) {
        this.sessionFactory.getCurrentSession()
            .createQuery(
                "Update UserMasterEntity entity set entity.password = :password,  entity.active = 1 where entity.username = :username")
            .setParameter("password", password).setParameter("username", username).executeUpdate();
    }

    @Override
    public void updateFailAttempts(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        int attempt = 0;
        final int maxAttempt = 4;
        UserAttemptsEntity user = getUserAttempts(session, username);
        if (user == null) {
            // if the username not exist in userAttempt table
            UserAttemptsEntity newUser = new UserAttemptsEntity();
            newUser.setUsername(username);
            newUser.setAttempt(1);
            newUser.setLastModifiedDate(new Date());
            session.save(newUser);
        } else {
            // if the username already exist in table
            attempt = user.getAttempt();
            if (attempt + 1 <= maxAttempt) {
                user.setAttempt(attempt + 1);
                user.setLastModifiedDate(new Date());
                session.update(user);
            } else {
                session
                    .createQuery(
                        "Update UserMasterEntity entity set entity.accountNonLocked = false where entity.username = :username")
                    .setParameter("username", username).executeUpdate();
            }
        }
    }

    @Override
    public void resetFailAttempts(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        UserAttemptsEntity user = getUserAttempts(session, username);
        if (user != null) {
            user.setAttempt(0);
            user.setLastModifiedDate(new Date());
            session.update(user);
        }

    }

    private UserAttemptsEntity getUserAttempts(Session session, String username) {
        UserAttemptsEntity user = (UserAttemptsEntity) session.createCriteria(UserAttemptsEntity.class)
            .add(Restrictions.eq("username", username)).uniqueResult();
        return user;
    }
}
