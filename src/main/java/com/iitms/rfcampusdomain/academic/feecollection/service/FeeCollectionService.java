package com.iitms.rfcampusdomain.academic.feecollection.service;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrmainTransactionEntity;

public interface FeeCollectionService {
    
    public String getReceiptNo(int receiptId, int paymentModeId, int userId, String academicBatch,String counterName);
    
    public boolean addStudentFeeDetails(FeesDcrmainTransactionEntity dcrMainEntity, int paymentModeId);
    
    public double getExcessAmount(int studentSerialId);
    
    public int getReceiptSerialNo(int userId, int counterId, int receiptTypeId, int paymentModeId,
        String receiptNumber);
}
