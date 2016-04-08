package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.feecollection.dao.FeesCurrencyDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesCurrencyEntity;

@Repository
public class FeesCurrencyDaoImpl implements FeesCurrencyDao {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<FeesCurrencyEntity> getFeesCurrency() {
        Session session = sessionFactory.getCurrentSession();
        List<FeesCurrencyEntity> feesCurrencyList = session.createCriteria(FeesCurrencyEntity.class).list();
        return feesCurrencyList;
    }

}
