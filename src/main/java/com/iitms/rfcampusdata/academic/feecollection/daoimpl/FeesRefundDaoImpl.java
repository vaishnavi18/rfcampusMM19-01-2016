package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.AllDataTypes;
import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.academic.feecollection.dao.FeesRefundDao;
import com.iitms.rfcampusdata.academic.feecollection.dto.FeesReceiptsDTO;
import com.iitms.rfcampusdata.academic.feecollection.dto.ReceiptTypeDTO;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesCounterMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrmainTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesFeeheadEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundFeeheadTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundMainTransaction;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundReferenceTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundRuleEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundruleCalculativeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesSessionCounterReferenceTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesUserCounterMasterEntity;

@Repository
public class FeesRefundDaoImpl implements FeesRefundDao {

    private static final Logger LOG = LoggerFactory.getLogger(FeesRefundDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    /* Fees Refund APIs */

    @SuppressWarnings("unchecked")
    @Override
    public List<ReceiptTypeDTO> getStudentsReceipts(int studentId) throws GenericException {
        Session session = this.sessionFactory.getCurrentSession();
        List<ReceiptTypeDTO> mainReceipts = null;

        try {
            List<Integer> dcrMainIds = session.createCriteria(FeesRefundReferenceTransactionEntity.class)
                .setProjection(Projections.property("dcrMainId")).list();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("Id").as("dcrMainId"));
            projectionList.add(Projections.property("semester.semesterName").as("semester"));
            projectionList.add(Projections.property("paymentType.paymentType").as("paymentType"));
            projectionList.add(Projections.property("receiptNumber").as("receiptNumber"));
            projectionList.add(Projections.property("totalPaidAmount").as("totalPaidAmount"));
            projectionList.add(Projections.property("totalPaidAmount").as("refundableAmount"));

            mainReceipts = session.createCriteria(FeesDcrmainTransactionEntity.class)
                .createAlias("feesReceiptTypeEntity", "receiptType")
                .setProjection(Projections.projectionList()
                    .add(Projections.distinct(Projections.property("receiptId").as("receiptTypeId")))
                    .add(Projections.property("receiptType.receiptTitle").as("receipt")))
                .add(Restrictions.eq("studentSerialNumber", studentId))
                .setResultTransformer(new AliasToBeanResultTransformer(ReceiptTypeDTO.class)).list();

            for (ReceiptTypeDTO receipt : mainReceipts) {

                Criteria criteria = session.createCriteria(FeesDcrmainTransactionEntity.class)
                    .createAlias("semesterMasterEntity", "semester")
                    .createAlias("paymentTypeMasterEntity", "paymentType").setProjection(projectionList)
                    .add(Restrictions.eq("studentSerialNumber", studentId))
                    .add(Restrictions.eq("receiptId", receipt.getReceiptTypeId()));

                if (!dcrMainIds.isEmpty()) {
                    criteria.add(Restrictions.not(Restrictions.in("Id", dcrMainIds)));
                }

                List<FeesReceiptsDTO> allReceipts =
                    criteria.setResultTransformer(new AliasToBeanResultTransformer(FeesReceiptsDTO.class)).list();

                receipt.setFeesReceipts(allReceipts);
            }
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Retrieving Students Receipts...");
        }

        return mainReceipts;
    }

    @Override
    public FeesCounterMasterEntity getCounter(int userId) throws GenericException {
        FeesCounterMasterEntity entity = null;
        try {
            entity = (FeesCounterMasterEntity) this.sessionFactory.getCurrentSession()
                .createCriteria(FeesUserCounterMasterEntity.class)
                .createAlias("feesCounterMasterEntity", "counterMaster")
                .setProjection(Projections.projectionList()
                    .add(Projections.property("counterMaster.counterPrintName").as("counterPrintName"))
                    .add(Projections.property("counterMaster.id").as("id")))
                .add(Restrictions.eq("userId", userId))
                .setResultTransformer(new AliasToBeanResultTransformer(FeesCounterMasterEntity.class)).setMaxResults(1)
                .uniqueResult();
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Retrieving Users Counter...");
        }

        return entity;
    }

    @Override
    public FeesPaymentModeEntity getRefundablePaymentMode() {
        try {
            FeesPaymentModeEntity paymentMode = (FeesPaymentModeEntity) this.sessionFactory.getCurrentSession()
                .createCriteria(FeesPaymentModeEntity.class).add(Restrictions.eq("paymentMode", "Refund"))
                .uniqueResult();
            return paymentMode;
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Retrieving Refundable Payment Mode...");
        }
    }

    @Override
    public int getSerialNumber(int counterId, int paymentModeId, int userId) throws GenericException {
        Session session = this.sessionFactory.getCurrentSession();
        FeesSessionCounterReferenceTransactionEntity sessionUserCounter = null;
        LOG.info("counterId : " + counterId + " - paymentModeId : " + paymentModeId + " - userId : " + userId);
        try {
            FeesUserCounterMasterEntity userCounter =
                (FeesUserCounterMasterEntity) session.createCriteria(FeesUserCounterMasterEntity.class)
                    .add(Restrictions.eq("counterId", counterId)).add(Restrictions.eq("paymentModeId", paymentModeId))
                    .add(Restrictions.eq("userId", userId)).setMaxResults(1).uniqueResult();

            sessionUserCounter = (FeesSessionCounterReferenceTransactionEntity) session
                .createCriteria(FeesSessionCounterReferenceTransactionEntity.class)
                .add(Restrictions.eq("userCounterId", userCounter.getId())).setMaxResults(1).uniqueResult();
            LOG.info("userCounterId : " + userCounter.getId());
            return sessionUserCounter.getReceiptNumber();
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Getting Serial Number...");
        }
    }

    @Override
    public float getRefundableAmount(int studentId, String dcrMainIds) throws GenericException {
        AllDataTypes refundAmount = null;
        try {
            refundAmount = (AllDataTypes) this.sessionFactory.getCurrentSession()
                .createCriteria(FeesDcrmainTransactionEntity.class)
                .setProjection(Projections.projectionList().add(Projections.groupProperty("receiptId").as("intValue"))
                    .add(Projections.sum("totalPaidAmount").as("doubleValue")))
                .add(Restrictions.eq("studentSerialNumber", studentId))
                .add(Restrictions.sqlRestriction("this_.id in (" + dcrMainIds + ")"))
                .setResultTransformer(new AliasToBeanResultTransformer(AllDataTypes.class)).uniqueResult();

            return (float) refundAmount.getDoubleValue();
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Retrieving Refundable Amount...");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<FeesDcrTransactionEntity> getRefundableAmountPerHead(String dcrMainIds) throws GenericException {
        List<FeesDcrTransactionEntity> list = null;
        try {
            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.groupProperty("feeHead.feeheadLongName").as("feeheadName"));
            projectionList.add(Projections.sum("amount").as("amount"));
            projectionList.add(Projections.groupProperty("feeheadId").as("feeheadId"));

            list = this.sessionFactory.getCurrentSession().createCriteria(FeesDcrTransactionEntity.class)
                .createAlias("feesFeeheadEntity", "feeHead").setProjection(projectionList)
                .add(Restrictions.sqlRestriction("this_.dcrmain_id in (" + dcrMainIds + ")"))
                // .addOrder(Order.asc("feeHead.serialNumber"))
                .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Retrieving Per Head Refundable Amount...");
        }
    }

    @Override
    public int saveRefundMainRecord(FeesRefundMainTransaction FeesRefundMainTransaction) throws GenericException {
        try {
            return (Integer) this.sessionFactory.getCurrentSession().save(FeesRefundMainTransaction);
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Saving Refund Main Record...");
        }
    }

    @Override
    public void saveRefundSubRecord(FeesRefundFeeheadTransactionEntity feesRefundFeeheadTransaction)
        throws GenericException {
        try {
            this.sessionFactory.getCurrentSession().save(feesRefundFeeheadTransaction);
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Saving Refund Sub Record...");
        }
    }

    @Override
    public int getUserCounterId(int userId) throws GenericException {
        int counterId = 0;
        try {
            counterId = ((Integer) this.sessionFactory.getCurrentSession()
                .createCriteria(FeesUserCounterMasterEntity.class).setProjection(Projections.property("counterId"))
                .add(Restrictions.eq("userId", userId)).setMaxResults(1).uniqueResult()).intValue();

            return counterId;
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Getting User Counter Id...");
        }
    }

    @Override
    public void saveRefundReference(FeesRefundReferenceTransactionEntity refundReferenceTransactionEntity)
        throws GenericException {
        try {
            this.sessionFactory.getCurrentSession().save(refundReferenceTransactionEntity);
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Saving Refund Reference...");
        }
    }

    /**********************************************/

    /* Fees Refund Rules APIs */
    @Override
    public int saveRefundRule(FeesRefundRuleEntity feesRefundRuleEntity) {
        try {
            int id = (Integer) this.sessionFactory.getCurrentSession().save(feesRefundRuleEntity);
            return id;
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Saving Refund Rule...");
        }
    }

    @Override
    public void saveHeadWiseRefundRule(FeesRefundruleCalculativeEntity refundRuleTransaction) {
        try {
            this.sessionFactory.getCurrentSession().save(refundRuleTransaction);
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Saving Head Wise Refund Rule...");
        }
    }

    /**********************************************/

    @SuppressWarnings("unchecked")
    @Override
    public List<FeesRefundruleCalculativeEntity> getFeeHeads(int degreeId, int paymentTypeId, int receiptTypeId) {
        Session session = this.sessionFactory.getCurrentSession();
        List<FeesRefundruleCalculativeEntity> list = null;

        try {
            Object rules = session.createCriteria(FeesRefundRuleEntity.class).setProjection(Projections.property("id"))
                .add(Restrictions.eq("degreeId", degreeId)).add(Restrictions.eq("paymentTypeId", paymentTypeId))
                .add(Restrictions.eq("receiptTypeId", receiptTypeId)).uniqueResult();

            LOG.info("ruleId : " + rules);

            if (null != rules) {
                ProjectionList projectionList = Projections.projectionList();
                projectionList.add(Projections.property("feeHeadId").as("feeHeadId"));
                projectionList.add(Projections.property("feeheadEntity.feeheadLongName").as("feeheadLongName"));
                projectionList.add(Projections.property("percentageOrAmount").as("percentageOrAmount"));
                projectionList.add(Projections.property("isCalculative").as("isCalculative"));

                list = session.createCriteria(FeesRefundruleCalculativeEntity.class)
                    .createAlias("feeheadEntity", "feeheadEntity").setProjection(projectionList)
                    .add(Restrictions.eq("refundRuleId", ((Integer) rules).intValue()))
                    .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();
            }

            return list;
        } catch (Exception e) {
            throw new GenericException(
                "Error Occoured While Retrieving Fee Heads by (degreeId/paymentTypeId/receiptTypeId)...");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<FeesRefundruleCalculativeEntity> getFeeHeads(int receiptTypeId) {

        try {
            List<FeesRefundruleCalculativeEntity> list =
                this.sessionFactory.getCurrentSession().createCriteria(FeesFeeheadEntity.class)
                    .setProjection(Projections.projectionList().add(Projections.property("Id").as("feeHeadId"))
                        .add(Projections.property("feeheadLongName").as("feeheadLongName")))
                .add(Restrictions.eq("receiptTypeId", receiptTypeId)).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
                .list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Retrieving Fee Heads...");
        }

    }

    @Override
    public int getFeeRefundId(int degreeId, int paymentTypeId, int receiptTypeId) {

        try {
            Object refundRuleId = this.sessionFactory.getCurrentSession().createCriteria(FeesRefundRuleEntity.class)
                .setProjection(Projections.property("id")).add(Restrictions.eq("degreeId", degreeId))
                .add(Restrictions.eq("paymentTypeId", paymentTypeId))
                .add(Restrictions.eq("receiptTypeId", receiptTypeId)).uniqueResult();
            return (null != refundRuleId ? ((Integer) refundRuleId).intValue() : 0);
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Retrieving Refund Rule Id...");
        }

    }

    @Override
    public void deleteFeeRefundRecords(int refundRuleId) {
        try {
            this.sessionFactory.getCurrentSession()
                .createQuery(
                    "Delete From FeesRefundruleCalculativeEntity entity where entity.refundRuleId = :refundRuleId")
                .setParameter("refundRuleId", refundRuleId).executeUpdate();
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Deleting Fee Refund Records...");
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<FeesRefundruleCalculativeEntity> getFeeRefundRule(int refundRuleId) {

        try {
            List<FeesRefundruleCalculativeEntity> list =
                this.sessionFactory.getCurrentSession().createCriteria(FeesRefundruleCalculativeEntity.class)
                    .add(Restrictions.eq("refundRuleId", refundRuleId)).list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Getting Fee Refund Rule by Id...");
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<FeesRefundRuleEntity> getRefundRuleOptions(int paymentTypeId, int receiptTypeId) {

        try {
            List<FeesRefundRuleEntity> list =
                this.sessionFactory.getCurrentSession().createCriteria(FeesRefundRuleEntity.class)
                    .setProjection(Projections.projectionList().add(Projections.property("id").as("id"))
                        .add(Projections.property("ruleLongName").as("name")))
                .add(Restrictions.eq("paymentTypeId", paymentTypeId))
                .add(Restrictions.eq("receiptTypeId", receiptTypeId)).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
                .list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error Occoured While Getting Refund Rule Options...");
        }

    }

}
