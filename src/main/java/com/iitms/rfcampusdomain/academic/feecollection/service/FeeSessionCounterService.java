package com.iitms.rfcampusdomain.academic.feecollection.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.iitms.rfcampuscommon.feescollection.CounterReceiptNumbersDTO;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesSessionCounterReferenceTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesUserCounterMasterEntity;


public  interface FeeSessionCounterService {
    List<CounterReceiptNumbersDTO> getCounterSeqNo(int userId, int sessionId);
    public boolean updateCounterSeqNo(HttpServletRequest request,String[][] receiptsMatrix, List<FeesPaymentModeEntity> paymentModes, List<FeesUserCounterMasterEntity> reciptList);
    public String[][] showRecords(int acadamicSessionId,int userId, List<FeesPaymentModeEntity> paymentModes, List<FeesReceiptTypeEntity> reciptListList);
    public FeesSessionCounterReferenceTransactionEntity getReceiptNo(int counterId, int paymentModeId, int receiptId);
    
    
     
}
