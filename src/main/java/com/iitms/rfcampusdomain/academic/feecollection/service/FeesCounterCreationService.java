package com.iitms.rfcampusdomain.academic.feecollection.service;

import java.util.List;

import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesCounterMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesUserCounterMasterEntity;

public interface FeesCounterCreationService {
    public boolean addCounter(final String counterName, final String printName, final int counterUser,
        final String receipt_type);

    public List<FeesUserCounterMasterEntity> getCounterList();
    

    public boolean updateCounter(final int id, final String counterName, final String printName, final int counterUser,
        final String receipt_type, final String receiptPrevList);

    public List<MasterModel> getCounterAllocatedUsers();

    public List<FeesReceiptTypeEntity> getRecipt(int userId);
    
    public FeesCounterMasterEntity getCounter(int userId);
    
    public int getReceiptNumber(int userId, int counterId, int receiptTypeId, int paymentModeId);
    
    public boolean checkCounterExist(int userId);
    
    
}
