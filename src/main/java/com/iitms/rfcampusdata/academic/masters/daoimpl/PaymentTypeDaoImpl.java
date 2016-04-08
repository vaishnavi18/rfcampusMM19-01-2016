package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.masters.dao.PaymentTypeDao;
import com.iitms.rfcampusdata.academic.masters.entity.PaymentTypeMasterEntity;

@Repository
public class PaymentTypeDaoImpl implements PaymentTypeDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean addPaymentType(final PaymentTypeMasterEntity entity) {
        Session session = sessionFactory.getCurrentSession();
        session.save(entity);
        return true;
    }

    @Override
    public List<PaymentTypeMasterEntity> getAllPaymentType() {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
        List<PaymentTypeMasterEntity> paymentTypeList = session.createCriteria(PaymentTypeMasterEntity.class).list();
        return paymentTypeList;
    }

    @Override
    public boolean updatePaymentType(final PaymentTypeMasterEntity entity) {
        Session session = sessionFactory.getCurrentSession();
        PaymentTypeMasterEntity paymentEntity =
            (PaymentTypeMasterEntity) session.get(PaymentTypeMasterEntity.class, entity.getId());
        paymentEntity.setPaymentType(entity.getPaymentType());
        paymentEntity.setRemark(entity.getRemark());
        session.update(paymentEntity);
        return true;
    }

    // check payment type alread exist or not
    @Override
    public boolean getPaymentTypeAlreadyExist(final String paymentType) {

        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        PaymentTypeMasterEntity entity = (PaymentTypeMasterEntity) session.createCriteria(PaymentTypeMasterEntity.class)
            .add(Restrictions.eq("paymentType", paymentType)).uniqueResult();

        if (entity != null) {
            result = true;
        }
        return result;
    }

}
