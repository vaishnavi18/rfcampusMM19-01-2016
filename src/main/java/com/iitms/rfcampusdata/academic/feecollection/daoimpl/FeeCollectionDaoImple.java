package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.feecollection.dao.FeeCollectionDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrDDTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrmainTransactionEntity;

@Repository
public class FeeCollectionDaoImple implements FeeCollectionDao {
    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(FeeCollectionDaoImple.class);

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public int addToDcrmain(FeesDcrmainTransactionEntity feesDcrmainTransactionEntity) {

        Session session = sessionFactory.getCurrentSession();
        Date date = new Date();
        feesDcrmainTransactionEntity.setDcrDate(date);
        int idDcrmain = (Integer) session.save(feesDcrmainTransactionEntity);
        return idDcrmain;
    }

    @Override
    public boolean addToDcrTrans(int dcrmainId, List<FeesDcrTransactionEntity> transHeads) {
        Session session = sessionFactory.getCurrentSession();

        FeesDcrTransactionEntity transEntity;
        for (FeesDcrTransactionEntity transHeadEntity : transHeads) {
            transEntity =
                new FeesDcrTransactionEntity(dcrmainId, transHeadEntity.getFeeheadId(), transHeadEntity.getAmount());
            if (transEntity.getAmount() != 0) {
                session.save(transEntity);
            }
        }
        return true;
    }

    @Override
    public boolean addToDcrDD(int dcrmainId, int paymentId, String ddNumber, Date ddDate, float ddAmount, int bankId,
        int locationId, float totalAmount) {
        Session session = sessionFactory.getCurrentSession();
        FeesDcrDDTransactionEntity ddEntity = new FeesDcrDDTransactionEntity(dcrmainId, paymentId, ddNumber, ddDate,
            ddAmount, bankId, locationId, totalAmount);
        session.save(ddEntity);
        return true;
    }

    @Override
    public double getTotalAdjustmentAmount(int studentSerialId) {
        Session session = sessionFactory.getCurrentSession();

        SQLQuery query =
            session.createSQLQuery("select COALESCE(sum(this_.total_paid_amount),0) as total_adjustment_amount "
                + "from transaction.fees_dcrmain_transaction this_ " + "where this_.receipt_number ilike '%ADJ%' "
                + "and this_.student_serial_number=" + studentSerialId);
        BigDecimal totalAmount = (BigDecimal) query.uniqueResult();

        return totalAmount.doubleValue();
    }

    @Override
    public double getTotalExcessAmount(int studentSerialId) {
        Session session = sessionFactory.getCurrentSession();
        SQLQuery query = session.createSQLQuery("select COALESCE(sum(this_.excess_amount),0) as total_excess_amount "
            + "from transaction.fees_dcrmain_transaction this_ " + "where this_.receipt_number not ilike '%ADJ%'"
            + " and this_.student_serial_number=" + studentSerialId);
        BigDecimal totalExcessAmount = (BigDecimal) query.uniqueResult();

        return totalExcessAmount.doubleValue();
    }

    /*
     * @Override public int checkReceiptSerialNoAlreadyExist(int receiptNo) { LOG.info(
     * "control in checkReceiptSerialNoAlreadyExist method"); Session session = sessionFactory.getCurrentSession();
     * Object object = session.createCriteria(FeesDcrmainTransactionEntity.class)
     * .add(Restrictions.ilike("receiptNumber", "%" + receiptNo))
     * .setProjection(Projections.property("id").as("id")).uniqueResult(); LOG.info("receiptNo:" + receiptNo +
     * " object:" + object); if (object != null) { receiptNo = receiptNo + 1; LOG.info("receiptNo test:" + receiptNo);
     * checkReceiptSerialNoAlreadyExist(receiptNo); } return receiptNo; }
     */

    @Override
    public int checkReceiptSerialNoAlreadyExist(String receiptNo) {
        Session session = sessionFactory.getCurrentSession();
        SQLQuery query =
            session.createSQLQuery("select COALESCE(max(replace(receipt_number,'" + receiptNo + "','')),'0') "
                + "from transaction.fees_dcrmain_transaction " + "where receipt_number like '" + receiptNo + "%'");
        String val = (String) query.uniqueResult();
        int receipt = Integer.parseInt(val);
        LOG.info("Result : " + receipt);
        return receipt;
    }

}
