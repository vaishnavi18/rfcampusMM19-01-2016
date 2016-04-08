package com.iitms.rfcampusdata.academic.feecollection.daoimpl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.feecollection.dao.FeesFeeheadDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeeHeadList;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesFeeheadEntity;

@Repository
public class FeesFeeheadDaoImpl implements FeesFeeheadDao {
    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(ReceiptTypeDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<FeesFeeheadEntity> getFeeHeadsList(final int id) {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
        List<FeesFeeheadEntity> headsList = session.createCriteria(FeesFeeheadEntity.class)
            .add(Restrictions.eq("receiptTypeId", id)).addOrder(Order.asc("serialNumber")).list();
        LOG.info("headsList:" + headsList);
        return headsList;
    }

    @Override
    public boolean addFeeHeads(final FeeHeadList feeHeadList) {
        Session session = sessionFactory.getCurrentSession();
        List<FeesFeeheadEntity> hlist = feeHeadList.getFeeHeads();
        int receiptId = feeHeadList.getReceiptTypeId();
        String delQuery = "delete from FeesFeeheadEntity f where f.receiptTypeId=" + receiptId;
        Query query = session.createQuery(delQuery);
        query.executeUpdate();
        @SuppressWarnings("rawtypes")
        Iterator itr = hlist.iterator();
        while (itr.hasNext()) {
            Object object = itr.next();

            FeesFeeheadEntity head = (FeesFeeheadEntity) object;

            if (head.getFeeheadShortName() != null && head.getFeeheadLongName() != null
                && head.getSerialNumber() != 0) {
                head.setReceiptTypeId(receiptId);
                /*
                 * if (head.getSerialNumber() != 0) { head.setFeeheadCode("F" + head.getSerialNumber()); }
                 */ @SuppressWarnings("unused")
                int id = (Integer) session.save(head);
                LOG.info("Recipt type :" + head.getReceiptTypeId());
                LOG.info("Head Short Name :" + head.getFeeheadLongName());
                LOG.info("Head Long Name :" + head.getFeeheadShortName());
                LOG.info("serial no" + head.getSerialNumber());
            }

        }
        return true;
    }
}
