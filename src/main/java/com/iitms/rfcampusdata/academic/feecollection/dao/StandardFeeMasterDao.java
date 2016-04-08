package com.iitms.rfcampusdata.academic.feecollection.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterList;

/**
 * @author Sachinmt
 */
public interface StandardFeeMasterDao {
    public boolean addStandardFee(StandardFeeMasterList standardList);

    public int copyStandardFee(StandardFeeMasterList standardList, boolean overwriteDemand);

    public List<StandardFeeMasterEntity> getStandardFeeList(int receiptId, int degreeId, int batchId, int paymentTypeId,
        int semesterId);

    public int isStandardFeeDefined(int receiptId, int degreeId, int batchId, int paymentTypeId, int semesterId);

    public List<String> getDescription();

    public StandardFeeMasterEntity getStandardFeeListByDesecriptionService(String feefeeDesecription);

    public List<StandardFeeMasterEntity> getStandardFeeList2(int receiptId, int degreeId, int batchId,
        int paymentTypeId, int semesterId);

}
