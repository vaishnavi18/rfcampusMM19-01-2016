package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.hibernate.type.StandardBasicTypes;
import org.hibernate.type.Type;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.academic.feecollection.dao.FeesCounterCreationDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesCounterMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesSessionCounterReferenceTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesUserCounterMasterEntity;

@Repository
public class FeesCounterCreationDaoImpl implements FeesCounterCreationDao {

    private static final Logger LOG = LoggerFactory.getLogger(FeesCounterCreationDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public int addCounter(String counterName, String printName) {
        Session session = sessionFactory.getCurrentSession();
        FeesCounterMasterEntity counter = new FeesCounterMasterEntity();
        counter.setCounterName(counterName);
        counter.setCounterPrintName(printName);
        return (Integer) session.save(counter);
    }

    @Override
    public boolean addCounterUser(int counterId, int counterUserId, String receipt_type,
        List<FeesPaymentModeEntity> paymentModeList) {
        boolean isActive = true;
        Session session = sessionFactory.getCurrentSession();
        FeesUserCounterMasterEntity userCounter = null;
        for (String receiptId : receipt_type.split(",")) {
            int receiptTypeId = Integer.parseInt(receiptId);
            for (FeesPaymentModeEntity paymentMode : paymentModeList) {
                userCounter = new FeesUserCounterMasterEntity(counterUserId, counterId, receiptTypeId,
                    paymentMode.getId(), isActive);
                @SuppressWarnings("unused")
                int id = (Integer) session.save(userCounter);
            }
        }
        return true;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<FeesUserCounterMasterEntity> getCounterList() {
        Session session = sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("counterMaster.id").as("id"));
        projectionList.add(Projections.property("counterMaster.counterName").as("counterName"));
        projectionList.add(Projections.property("counterMaster.counterPrintName").as("counterPrintName"));
        projectionList.add(Projections.property("userId").as("counterUserId"));
        projectionList.add(Projections.property("userMaster.name").as("counterUserName"));
        projectionList.add(
            Projections.sqlGroupProjection("string_agg(distinct to_char(receipttyp2_.id, '99'), ',') as receiptIds",
                "this_.user_id", new String[] {"receiptIds"}, new Type[] {StandardBasicTypes.STRING}));
        projectionList
            .add(Projections.sqlGroupProjection("string_agg(distinct receipttyp2_.receipt_code, ',') as receiptCodes",
                "this_.user_id", new String[] {"receiptCodes"}, new Type[] {StandardBasicTypes.STRING}));
        projectionList.add(Projections.groupProperty("counterMaster.id"));
        projectionList.add(Projections.groupProperty("userMaster.name"));
        List<FeesUserCounterMasterEntity> counterList = session.createCriteria(FeesUserCounterMasterEntity.class)
            .createAlias("feesCounterMasterEntity", "counterMaster").createAlias("feesReceiptTypeEntity", "receiptType")
            .createAlias("userMasterEntity", "userMaster").setProjection(projectionList)
            .add(Restrictions.eq("isActive", true)).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();
        return counterList;
    }

    @Override
    public boolean updateCounter(int id, String counterName, String printName) {
        Session session = sessionFactory.getCurrentSession();
        FeesCounterMasterEntity counter = (FeesCounterMasterEntity) session.get(FeesCounterMasterEntity.class, id);
        counter.setCounterName(counterName);
        counter.setCounterPrintName(printName);
        session.update(counter);
        return true;
    }

    @Override
    public boolean updateCounterUser(int counterId, int counterUserId, String receipt_type,
        List<FeesPaymentModeEntity> paymentModeList, String receiptPrevList) {
        Session session = sessionFactory.getCurrentSession();
        FeesUserCounterMasterEntity userCounter = null;
        /*
         * List<FeesUserCounterMasterEntity> counterUserList = session.createCriteria(FeesUserCounterMasterEntity.class)
         * .setProjection(Projections.property("isActive").as("isActive")) .add(Restrictions.eq("userId",
         * counterUserId)).list();
         */
        receiptPrevList = "," + receiptPrevList + ",";
        receiptPrevList = receiptPrevList.replaceAll("\\s", "");
        receipt_type = "," + receipt_type;

        LOG.info("receiptPrevList : " + receiptPrevList + " - receipt_type : " + receipt_type);

        for (String receiptId : receipt_type.split(",")) {
            // System.out.println(r);

            if (!"".equals(receiptId) && receiptPrevList.contains(',' + receiptId + ',')) {
                receiptPrevList = receiptPrevList.replaceAll(',' + receiptId + ',', ",");
            } else {
                if (!receiptId.isEmpty()) {
                    for (FeesPaymentModeEntity paymentMode : paymentModeList) {
                        userCounter = new FeesUserCounterMasterEntity(counterUserId, counterId,
                            Integer.parseInt(receiptId), paymentMode.getId(), true);
                        session.save(userCounter);
                    }
                }
            }
        }
        for (String receiptId : receiptPrevList.split(",")) {
            if (!"".equals(receiptId)) {
                System.out.println("Update : " + receiptId);
                session
                    .createQuery(
                        "Update FeesUserCounterMasterEntity entity set entity.isActive = false where entity.userId = :userId and entity.receiptTypeId = :receiptTypeId")
                    .setParameter("userId", counterUserId)
                    .setParameter("receiptTypeId", Integer.parseInt(receiptId.trim())).executeUpdate();
            }
        }
        return true;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<MasterModel> getCounterAllocatedUsers() {
        Session session = sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.distinct(Projections.property("userId").as("id")));
        projectionList.add(Projections.property("userMaster.name").as("name"));
        List<MasterModel> usersList = session.createCriteria(FeesUserCounterMasterEntity.class)
            .createAlias("userMasterEntity", "userMaster").setProjection(projectionList)
            .setResultTransformer(new AliasToBeanResultTransformer(MasterModel.class)).list();
        return usersList;
    }

    @Override
    public List<FeesReceiptTypeEntity> getRecipt(int userId) {
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.distinct(Projections.property("receiptTypeId").as("Id")));
        projectionList.add(Projections.property("receiptType.receiptTitle").as("receiptTitle"));

        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
        List<FeesReceiptTypeEntity> list = session.createCriteria(FeesUserCounterMasterEntity.class)
            .createAlias("feesReceiptTypeEntity", "receiptType").setProjection(projectionList)
            .add(Restrictions.eq("userId", userId))
            .setResultTransformer(new AliasToBeanResultTransformer(FeesReceiptTypeEntity.class)).list();
        return list;
    }

    @Override
    public FeesUserCounterMasterEntity getUserCounter(int userId, int receiptTypeId, int paymentModeId) {
        Session session = sessionFactory.getCurrentSession();
        FeesUserCounterMasterEntity entity =
            (FeesUserCounterMasterEntity) session.createCriteria(FeesUserCounterMasterEntity.class)
                .add(Restrictions.eq("userId", userId)).add(Restrictions.eq("receiptTypeId", receiptTypeId))
                .add(Restrictions.eq("paymentModeId", paymentModeId)).uniqueResult();
        return entity;
    }

    @Override
    public FeesCounterMasterEntity getCounterName(int userId) {
        Session session = sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("feesCounterMaster.counterPrintName").as("counterPrintName"));
        projectionList.add(Projections.property("feesCounterMaster.id").as("id"));

        FeesCounterMasterEntity counter =
            (FeesCounterMasterEntity) session.createCriteria(FeesUserCounterMasterEntity.class)
                .createAlias("feesCounterMasterEntity", "feesCounterMaster").setProjection(projectionList)
                .add(Restrictions.eq("userId", userId))
                .setResultTransformer(new AliasToBeanResultTransformer(FeesCounterMasterEntity.class)).setMaxResults(1)
                .uniqueResult();
        return counter;
    }

    @SuppressWarnings("unchecked")
    @Override
    public int getReceiptNumber(int userId, int counterId, int receiptTypeId, int paymentModeId) {
        Session session = sessionFactory.getCurrentSession();

        int receiptNumbers =
            (int) session.createCriteria(FeesSessionCounterReferenceTransactionEntity.class, "sessionCounter")
                .createAlias("sessionCounter.feesUserCounterMasterEntity", "UserCounter")
                .setProjection(Projections.property("receiptNumber").as("receiptNumber"))
                .add(Restrictions.eq("UserCounter.counterId", counterId))
                .add(Restrictions.eq("UserCounter.receiptTypeId", receiptTypeId))
                .add(Restrictions.eq("UserCounter.paymentModeId", paymentModeId))
                .add(Restrictions.eq("UserCounter.userId", userId)).uniqueResult();

        LOG.info("receiptNumber : " + receiptNumbers);

        return receiptNumbers;

    }

    @SuppressWarnings("unchecked")
    @Override
    // Check record already exist or not
    public boolean checkCounterExist(int userId) {
        Session session = sessionFactory.getCurrentSession();
        List<FeesUserCounterMasterEntity> user =
            session.createCriteria(FeesUserCounterMasterEntity.class).add(Restrictions.eq("userId", userId)).list();
        if (user.isEmpty()) {
            return true;
        } else {
            return false;
        }
    }
}
