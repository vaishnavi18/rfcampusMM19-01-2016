package com.iitms.rfcampusdata.academic.feecollection.dao;

import java.util.List;

import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesCounterMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesUserCounterMasterEntity;

public interface FeesCounterCreationDao {

    public int addCounter(final String counterName, final String printName);

    public boolean addCounterUser(int counterId, int counterUserId, String receipt_type,
        List<FeesPaymentModeEntity> paymentModeList);

    public List<FeesUserCounterMasterEntity> getCounterList();

    public boolean updateCounter(final int id, final String counterName, final String printName);

    public boolean updateCounterUser(int counterId, int counterUserId, String receipt_type,
        List<FeesPaymentModeEntity> paymentModeList, String receiptPrevList);

    public List<MasterModel> getCounterAllocatedUsers();

    public List<FeesReceiptTypeEntity> getRecipt(int userId);

    public FeesUserCounterMasterEntity getUserCounter(int userId, int receiptTypeId, int paymentModeId);

    public FeesCounterMasterEntity getCounterName(int userId);

    public int getReceiptNumber(int userId, int counterId, int receiptTypeId, int paymentModeId);

    public boolean checkCounterExist(int userId);

}
