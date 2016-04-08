package com.iitms.rfcampusdomain.academic.feecollection.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterList;

public interface StandardFeeMasterService {
    public boolean addStandardFee(StandardFeeMasterList standardList);

    public List<StandardFeeMasterEntity> getStandardFeeList(int receiptId, int degreeId, int batchId, int paymentTypeId,
        int semesterId);

    public int isStandardFeeDefined(int receiptId, int degreeId, int batchId, int paymentTypeId, int semesterId);
    
    public int copyStandardFee(int receiptId, int degreeId, int batchId, int paymentTypeId,
        int semesterId,int receiptId_To, int degreeId_To, int batchId_To, int paymentTypeId_To,
        int semesterId_To,String feeDiscription,boolean overwriteDemand);
   
    public List<String> getDescription();
    
    public List<StandardFeeMasterEntity> getStandardFeeListByDesecriptionService(String feeDesecription);
}
