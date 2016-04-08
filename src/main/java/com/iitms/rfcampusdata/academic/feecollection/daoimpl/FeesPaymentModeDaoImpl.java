package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.feecollection.dao.FeesPaymentModeDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;

@Repository
public class FeesPaymentModeDaoImpl implements FeesPaymentModeDao {
    private static final Logger LOG = LoggerFactory.getLogger(FeesPaymentModeDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<FeesPaymentModeEntity> getFeesPaymentMode() {

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("paymentMode").as("paymentMode"));
        projectionList.add(Projections.property("paymentModeShortCode").as("paymentModeShortCode"));
        return sessionFactory.getCurrentSession().createCriteria(FeesPaymentModeEntity.class)
            .setProjection(projectionList)
            .setResultTransformer(new AliasToBeanResultTransformer(FeesPaymentModeEntity.class)).list();
    }

    @Override
    public String getPaymentMode(int id) {

        String paymentModeName = (String) sessionFactory.getCurrentSession().createCriteria(FeesPaymentModeEntity.class)
            .setProjection(Projections.property("paymentModeShortCode")).add(Restrictions.eq("id", id)).uniqueResult();
        return paymentModeName;
    }

    @Override
    public List<FeesPaymentModeEntity> getFeesPaymentMode(boolean isRefund) {
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("paymentMode").as("paymentMode"));
        projectionList.add(Projections.property("paymentModeShortCode").as("paymentModeShortCode"));
        List<FeesPaymentModeEntity> paymentModeList =
            sessionFactory.getCurrentSession().createCriteria(FeesPaymentModeEntity.class).setProjection(projectionList)
                .add(Restrictions.eq("isRefund", isRefund))
                .setResultTransformer(new AliasToBeanResultTransformer(FeesPaymentModeEntity.class)).list();
        return paymentModeList;
    }

}
