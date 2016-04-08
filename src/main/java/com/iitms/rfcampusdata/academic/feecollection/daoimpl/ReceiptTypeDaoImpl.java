package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.feecollection.dao.ReceiptTypeDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;

@Repository
public class ReceiptTypeDaoImpl implements ReceiptTypeDao {

    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(ReceiptTypeDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean addReceiptType(final FeesReceiptTypeEntity feesReceiptTypeEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.save(feesReceiptTypeEntity);
        return true;
    }

    @Override
    public boolean updateReceiptType(final FeesReceiptTypeEntity entity) {
        LOG.info("Receipt no:" + entity.getId());
        Session session = sessionFactory.getCurrentSession();
        FeesReceiptTypeEntity receiptType =
            (FeesReceiptTypeEntity) session.get(FeesReceiptTypeEntity.class, entity.getId());
        receiptType.setReceiptCode(entity.getReceiptCode());
        receiptType.setReceiptTitle(entity.getReceiptTitle());
        receiptType.setReceiptFor(entity.getReceiptFor());
        receiptType.setLinked(entity.isLinked());
        receiptType.setAccountNumber(entity.getAccountNumber());
        session.update(receiptType);
        return true;
    }

    @Override
    public boolean deleteReceiptType(final int id) {
        Session session = sessionFactory.getCurrentSession();
        FeesReceiptTypeEntity reciptType = (FeesReceiptTypeEntity) session.get(FeesReceiptTypeEntity.class, id);
        session.delete(reciptType);
        return true;
    }

    @Override
    public FeesReceiptTypeEntity getReceiptType(final int id) {
        Session session = sessionFactory.getCurrentSession();
        FeesReceiptTypeEntity receiptType = (FeesReceiptTypeEntity) session.createCriteria(FeesReceiptTypeEntity.class)
            .add(Restrictions.eq("id", id)).uniqueResult();
        return receiptType;
    }

    @Override
    public List<FeesReceiptTypeEntity> listAllReceiptType() {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
        List<FeesReceiptTypeEntity> receiptTypeList = session.createCriteria(FeesReceiptTypeEntity.class).list();
        return receiptTypeList;
    }

    // Method is used to check,receipt is already already exists or not
    @Override
    public boolean getReceiptTypeForAlreadyExists(final String receiptCode, final String receiptTitle) {
        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        FeesReceiptTypeEntity receiptType = (FeesReceiptTypeEntity) session.createCriteria(FeesReceiptTypeEntity.class)
            .add(Restrictions.eq("receiptCode", receiptCode)).add(Restrictions.eq("receiptTitle", receiptTitle))
            .uniqueResult();

        if (receiptType != null) {
            result = true;
        }
        return result;
    }

    @Override
    public String getReceiptCode(int receiptId) {
        String receiptCode = (String) this.sessionFactory.getCurrentSession()
            .createCriteria(FeesReceiptTypeEntity.class).setProjection(Projections.property("receiptCode"))
            .add(Restrictions.eq("Id", receiptId)).uniqueResult();

        return receiptCode;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<FeesReceiptTypeEntity> getMiscellaneousReceipt() {
        Session session = sessionFactory.getCurrentSession();
        List<FeesReceiptTypeEntity> receiptTypeList = session.createCriteria(FeesReceiptTypeEntity.class)
            .add(Restrictions.eq("receiptFor", "Miscellaneous")).list();
        return receiptTypeList;
    }
}
