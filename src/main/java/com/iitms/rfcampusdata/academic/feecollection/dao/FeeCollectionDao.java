package com.iitms.rfcampusdata.academic.feecollection.dao;

import java.util.Date;
import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrmainTransactionEntity;

public interface FeeCollectionDao {

    public int addToDcrmain(FeesDcrmainTransactionEntity feesDcrmainTransactionEntity);

    public boolean addToDcrTrans(int dcrmainId, List<FeesDcrTransactionEntity> transHeads);

    public boolean addToDcrDD(int dcrmainId, int paymentId, String ddNumber, Date ddDate, float ddAmount, int bankId,
        int locationId, float totalAmount);

    public double getTotalAdjustmentAmount(int studentSerialId);

    public double getTotalExcessAmount(int studentSerialId);

    // public int checkReceiptSerialNoAlreadyExist(int receiptNo);

    public int checkReceiptSerialNoAlreadyExist(String receiptNo);

}
