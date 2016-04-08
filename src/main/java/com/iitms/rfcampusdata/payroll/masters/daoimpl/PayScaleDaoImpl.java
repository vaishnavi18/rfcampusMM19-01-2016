package com.iitms.rfcampusdata.payroll.masters.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.payroll.masters.dao.PayScaleDao;
import com.iitms.rfcampusdata.payroll.masters.entity.PayscaleMasterEntity;

@Repository
public class PayScaleDaoImpl implements PayScaleDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public int addPayScale(PayscaleMasterEntity payscaleMaster) {
        return 0;
    }

    // @SuppressWarnings("unchecked")
    @Override
    public boolean getPayScaleDetail(PayscaleMasterEntity payscaleMaster) {

        Session session = this.sessionFactory.getCurrentSession();
        session.save(payscaleMaster);
        return true;

    }

    @SuppressWarnings({"unchecked"})
    @Override
    public List<PayscaleMasterEntity> getAllPayScale() {
        Session session = this.sessionFactory.getCurrentSession();
        List<PayscaleMasterEntity> list =
            session.createCriteria(PayscaleMasterEntity.class).addOrder(Order.asc("id")).list();

        return list;
    }

    @Override
    public boolean updatePayscaleRecord(PayscaleMasterEntity payscaleMasterEntity) {
        Session session = this.sessionFactory.getCurrentSession();

        PayscaleMasterEntity payscale =
            (PayscaleMasterEntity) session.get(PayscaleMasterEntity.class, payscaleMasterEntity.getId());
        payscale.setBasic1(payscaleMasterEntity.getBasic1());
        payscale.setBasic2(payscaleMasterEntity.getBasic2());
        payscale.setScale(payscaleMasterEntity.getScale());
        payscale.setScaleNumber(payscaleMasterEntity.getScaleNumber());

        payscale.setRuleNumber(payscaleMasterEntity.getRuleNumber());

        payscale.setGradePay(payscaleMasterEntity.getGradePay());
        session.update(payscale);
        return true;

    }

    @Override
    public boolean getScaleAlreadyExist(final String scale) {
        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        PayscaleMasterEntity entity = (PayscaleMasterEntity) session.createCriteria(PayscaleMasterEntity.class)
            .add(Restrictions.eq("scale", scale)).uniqueResult();

        if (entity != null) {
            result = true;
        }
        return result;
    }
}
