package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.feescollection.CounterReceiptNumbersDTO;
import com.iitms.rfcampusdata.academic.feecollection.dao.FeeSessionCounterDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesSessionCounterReferenceTransactionEntity;

@Repository
public class FeeSessionCounterDaoImpl implements FeeSessionCounterDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<CounterReceiptNumbersDTO> getCounterSeqNo(int userId, int sessionId) {
        Session session = sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("userCounter.userId").as("userId"));
        projectionList.add(Projections.property("userCounter.counterId").as("counterId"));
        projectionList.add(Projections.property("userCounter.receiptTypeId").as("receiptTypeId"));
        projectionList.add(Projections.property("receiptType.receiptTitle").as("receiptTitle"));
        projectionList.add(Projections.property("userCounter.paymentModeId").as("paymentModeId"));
        projectionList.add(Projections.property("sessionId").as("sessionId"));
        projectionList.add(Projections.property("receiptNumber").as("receiptNumber"));
        projectionList.add(Projections.property("isActive").as("isActive"));
        projectionList.add(Projections.property("id").as("receiptNumberId"));

        @SuppressWarnings("unchecked")
        List<CounterReceiptNumbersDTO> counterReceiptNo =
            session.createCriteria(FeesSessionCounterReferenceTransactionEntity.class)
                .createAlias("feesUserCounterMasterEntity", "userCounter")
                .createAlias("userCounter.feesReceiptTypeEntity", "receiptType").setProjection(projectionList)
                .add(Restrictions.eq("sessionId", sessionId)).add(Restrictions.eq("userCounter.userId", userId))
                .addOrder(Order.asc("userCounter.receiptTypeId")).addOrder(Order.asc("userCounter.paymentModeId"))
                .setResultTransformer(new AliasToBeanResultTransformer(CounterReceiptNumbersDTO.class)).list();
        return counterReceiptNo;
    }

    @Override
    public boolean updateCounterSeqNo(int counterSessionId, int intValue) {
        Session session = sessionFactory.getCurrentSession();
        FeesSessionCounterReferenceTransactionEntity sessionCounter;
        sessionCounter = (FeesSessionCounterReferenceTransactionEntity) session
            .get(FeesSessionCounterReferenceTransactionEntity.class, counterSessionId);
        sessionCounter.setReceiptNumber(intValue);
        session.update(sessionCounter);
        return true;
    }

    @Override
    public boolean addCounterSeqNo(int userCounterId, int sessionId, int receiptNumber, boolean isActive) {
        Session session = sessionFactory.getCurrentSession();
        FeesSessionCounterReferenceTransactionEntity counterSession =
            new FeesSessionCounterReferenceTransactionEntity();
        counterSession.setUserCounterId(userCounterId);
        counterSession.setSessionId(sessionId);
        counterSession.setReceiptNumber(receiptNumber);
        counterSession.setActive(isActive);
        session.save(counterSession);
        return true;
    }

    /* Method is define for getting receiptNo(sequenceNo) for feeCollection(DCR) */
    @Override
    public FeesSessionCounterReferenceTransactionEntity getReceiptNo(int counterId, int paymentModeId, int receiptId) {
        Session session = sessionFactory.getCurrentSession();
        FeesSessionCounterReferenceTransactionEntity entity = (FeesSessionCounterReferenceTransactionEntity) session
            .createCriteria(FeesSessionCounterReferenceTransactionEntity.class)
            .createAlias("feesUserCounterMasterEntity", "userCounter") // .setProjection(projectionList)
            .add(Restrictions.eq("userCounter.counterId", counterId))
            .add(Restrictions.eq("userCounter.receiptTypeId", receiptId))
            .add(Restrictions.eq("userCounter.paymentModeId", paymentModeId)).uniqueResult();
        return entity;
    }

    @Override
    public boolean updateReceiptNo(FeesSessionCounterReferenceTransactionEntity entity) {
        Session session = sessionFactory.getCurrentSession();
        /*
         * int recepitNo = entity.getReceiptNumber(); recepitNo++; entity.setReceiptNumber(recepitNo);
         */
        session.update(entity);
        return true;
    }

}
