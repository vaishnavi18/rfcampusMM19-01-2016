package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.feecollection.dao.StandardFeeMasterDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterList;

/**
 * @author Sachinmt
 */
@Repository
public class StandardFeeMasterDaoImpl implements StandardFeeMasterDao {

    private static final Logger logger = org.slf4j.LoggerFactory.getLogger(StandardFeeMasterDaoImpl.class);

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean addStandardFee(StandardFeeMasterList standardList) {
        Session session = sessionFactory.getCurrentSession();
        List<StandardFeeMasterEntity> sList = standardList.getStandardFee();
        int receiptId = standardList.getReceiptTypeId();
        int degreeId = standardList.getDegreeId();
        int batchId = standardList.getBatchId();
        int paymentTypeId = standardList.getPaymentTypeId();
        int semesterId = standardList.getSemesterId();
        String feeDescription = standardList.getFeeDescription();
        Query query = session.createQuery("delete from StandardFeeMasterEntity f where f.receiptTypeId=" + receiptId
            + "and f.degreeId=" + degreeId + "and f.batchId=" + batchId + "and f.paymentTypeId=" + paymentTypeId
            + "and f.semesterId=" + semesterId);
        query.executeUpdate();
        Iterator<StandardFeeMasterEntity> itr = sList.iterator();
        while (itr.hasNext()) {
            Object object = itr.next();
            StandardFeeMasterEntity standardFee = (StandardFeeMasterEntity) object;

            if (standardFee.getFeeHeadId() != 0) {
                standardFee.setReceiptTypeId(receiptId);
                standardFee.setDegreeId(degreeId);
                standardFee.setBatchId(batchId);
                standardFee.setPaymentTypeId(paymentTypeId);
                standardFee.setSemesterId(semesterId);
                standardFee.setFeeDescription(feeDescription);
                @SuppressWarnings("unused")
                int id = (Integer) session.save(standardFee);
            }

        }
        return true;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<StandardFeeMasterEntity> getStandardFeeList(int receiptId, int degreeId, int batchId, int paymentTypeId,
        int semesterId) {
        Session session = sessionFactory.getCurrentSession();
        List<StandardFeeMasterEntity> standardFeeList = session.createCriteria(StandardFeeMasterEntity.class)
            .add(Restrictions.eq("receiptTypeId", receiptId)).add(Restrictions.eq("degreeId", degreeId))
            .add(Restrictions.eq("batchId", batchId)).add(Restrictions.eq("paymentTypeId", paymentTypeId))
            .add(Restrictions.eq("semesterId", semesterId)).list();
        logger.info("standardFeeList:" + standardFeeList);
        return standardFeeList;
    }

    @Override
    public int isStandardFeeDefined(int receiptId, int degreeId, int batchId, int paymentTypeId, int semesterId) {
        Session session = sessionFactory.getCurrentSession();
        Object count = session.createCriteria(StandardFeeMasterEntity.class).setProjection(Projections.rowCount())
            .add(Restrictions.eq("receiptTypeId", receiptId)).add(Restrictions.eq("degreeId", degreeId))
            .add(Restrictions.eq("batchId", batchId)).add(Restrictions.eq("paymentTypeId", paymentTypeId))
            .add(Restrictions.eq("semesterId", semesterId)).uniqueResult();

        return ((Long) count).intValue();
    }

    @Override
    public int copyStandardFee(StandardFeeMasterList standardList, boolean overwriteDemand) {
        int result = 0;
        Session session = sessionFactory.getCurrentSession();
        List<StandardFeeMasterEntity> sList = standardList.getStandardFee();
        int receiptId = standardList.getReceiptTypeId();
        int degreeId = standardList.getDegreeId();
        int batchId = standardList.getBatchId();
        int paymentTypeId = standardList.getPaymentTypeId();
        int semesterId = standardList.getSemesterId();
        String feeDescription = standardList.getFeeDescription();
        if (overwriteDemand) {
            Query query = session.createQuery("delete from StandardFeeMasterEntity f where f.receiptTypeId=" + receiptId
                + "and f.degreeId=" + degreeId + "and f.batchId=" + batchId + "and f.paymentTypeId=" + paymentTypeId
                + "and f.semesterId=" + semesterId);
            query.executeUpdate();
        }
        StandardFeeMasterEntity model;
        Iterator<StandardFeeMasterEntity> itr = sList.iterator();
        while (itr.hasNext()) {
            model = new StandardFeeMasterEntity();
            Object object = itr.next();
            StandardFeeMasterEntity standardFee = (StandardFeeMasterEntity) object;
            model.setFeeHeadId(standardFee.getFeeHeadId());
            model.setAmount(standardFee.getAmount());
            model.setReceiptTypeId(receiptId);
            model.setDegreeId(degreeId);
            model.setBatchId(batchId);
            model.setPaymentTypeId(paymentTypeId);
            model.setSemesterId(semesterId);
            model.setFeeDescription(feeDescription);
            result = (Integer) session.save(model);
        }
        return result;
    }

    @Override
    public List<String> getDescription() {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
        List<String> standardFeeList = session.createCriteria(StandardFeeMasterEntity.class)
            .setProjection(Projections.distinct(Projections.property("feeDescription"))).list();
        logger.info("standardFeeList:" + standardFeeList);
        return standardFeeList;
    }

    @Override
    public StandardFeeMasterEntity getStandardFeeListByDesecriptionService(String feefeeDesecription) {
        Session session = sessionFactory.getCurrentSession();

        StandardFeeMasterEntity standardFeeMasterEntity =
            (StandardFeeMasterEntity) session.createCriteria(StandardFeeMasterEntity.class)
                .add(Restrictions.eq("feeDescription", feefeeDesecription)).setMaxResults(1).uniqueResult();
        return standardFeeMasterEntity;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<StandardFeeMasterEntity> getStandardFeeList2(int receiptId, int degreeId, int batchId,
        int paymentTypeId, int semesterId) {
        Session session = sessionFactory.getCurrentSession();
        List<StandardFeeMasterEntity> standardFeeList = session.createCriteria(StandardFeeMasterEntity.class)
            .add(Restrictions.eq("receiptTypeId", receiptId)).add(Restrictions.eq("degreeId", degreeId))
            .add(Restrictions.eq("batchId", batchId)).add(Restrictions.eq("paymentTypeId", paymentTypeId))
            .add(Restrictions.eq("semesterId", semesterId)).list();
        logger.info("standardFeeList:" + standardFeeList);
        return standardFeeList;
    }

}
