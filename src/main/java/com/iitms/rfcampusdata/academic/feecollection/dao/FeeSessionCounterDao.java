package com.iitms.rfcampusdata.academic.feecollection.dao;

import java.util.List;

import com.iitms.rfcampuscommon.feescollection.CounterReceiptNumbersDTO;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesSessionCounterReferenceTransactionEntity;

public interface FeeSessionCounterDao {
    List<CounterReceiptNumbersDTO> getCounterSeqNo(int userId, int sessionId);

    boolean updateCounterSeqNo(int counterSessionId, int intValue);

    boolean addCounterSeqNo(int userCounterId, int sessionId, int receiptNumber, boolean isActive);

    public FeesSessionCounterReferenceTransactionEntity getReceiptNo(int counterId, int paymentModeId, int receiptId);

    public boolean updateReceiptNo(FeesSessionCounterReferenceTransactionEntity entity);
}
