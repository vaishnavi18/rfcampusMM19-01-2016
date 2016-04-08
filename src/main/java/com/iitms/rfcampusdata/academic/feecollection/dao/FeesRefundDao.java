package com.iitms.rfcampusdata.academic.feecollection.dao;

import java.util.List;

import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.academic.feecollection.dto.ReceiptTypeDTO;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesCounterMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundFeeheadTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundMainTransaction;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundReferenceTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundRuleEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundruleCalculativeEntity;

public interface FeesRefundDao {

    /* Fees Refund APIs */
    public List<ReceiptTypeDTO> getStudentsReceipts(int studentId) throws GenericException;

    public float getRefundableAmount(int studentId, String dcrMainIds) throws GenericException;

    public List<FeesDcrTransactionEntity> getRefundableAmountPerHead(String dcrMainIds) throws GenericException;

    public FeesCounterMasterEntity getCounter(int counterId) throws GenericException;

    public FeesPaymentModeEntity getRefundablePaymentMode() throws GenericException;

    public int getSerialNumber(int counterId, int paymentModeId, int userId) throws GenericException;

    public int getUserCounterId(int userId) throws GenericException;

    public int saveRefundMainRecord(FeesRefundMainTransaction FeesRefundMainTransaction) throws GenericException;

    public void saveRefundSubRecord(FeesRefundFeeheadTransactionEntity feesRefundFeeheadTransaction)
        throws GenericException;

    public void saveRefundReference(FeesRefundReferenceTransactionEntity refundReferenceTransactionEntity)
        throws GenericException;

    /**********************************************/

    /* Fees Refund Rules APIs */
    public int saveRefundRule(FeesRefundRuleEntity feesRefundRuleEntity) throws GenericException;

    public void saveHeadWiseRefundRule(FeesRefundruleCalculativeEntity refundRuleTransaction) throws GenericException;

    public List<FeesRefundruleCalculativeEntity> getFeeHeads(int degreeId, int paymentTypeId, int receiptTypeId)
        throws GenericException;

    public List<FeesRefundruleCalculativeEntity> getFeeHeads(int receiptTypeId) throws GenericException;

    public int getFeeRefundId(int degreeId, int paymentTypeId, int receiptTypeId) throws GenericException;

    public void deleteFeeRefundRecords(int refundRuleId) throws GenericException;

    public List<FeesRefundruleCalculativeEntity> getFeeRefundRule(int refundRuleId) throws GenericException;

    public List<FeesRefundRuleEntity> getRefundRuleOptions(int paymentTypeId, int receiptTypeId)
        throws GenericException;
    /***********************/
}
