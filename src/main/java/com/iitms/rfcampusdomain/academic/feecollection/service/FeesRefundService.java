package com.iitms.rfcampusdomain.academic.feecollection.service;

import java.util.List;
import java.util.Map;

import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.academic.feecollection.dto.ReceiptTypeDTO;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundMainTransaction;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundRuleEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundruleCalculativeEntity;

public interface FeesRefundService {

    /* Fees Refund APIs */
    public Map<String, Object> getFeesInformation(int studentId, String enrollmentNumber, int receiptTypeId,
        String dcrMainId) throws GenericException;

    public List<ReceiptTypeDTO> getStudentsReceipts(int studentId) throws GenericException;

    public void saveRefundMainRecord(FeesRefundMainTransaction FeesRefundMainTransaction) throws GenericException;

    public float getRefundableAmount(String enrollmentNumber, String dcrMainIds) throws GenericException;

    /***********************/

    /* Fees Refund Rules APIs */
    public void saveRefundRule(FeesRefundRuleEntity feesRefundRuleEntity) throws GenericException;

    public List<FeesRefundruleCalculativeEntity> getFeeHeads(int degreeId, int paymentTypeId, int receiptTypeId)
        throws GenericException;

    public int getFeeRefundId(int degreeId, int paymentTypeId, int receiptTypeId) throws GenericException;

    public List<FeesRefundruleCalculativeEntity> getFeeRefundRule(int refundRuleId) throws GenericException;

    public List<FeesRefundRuleEntity> getRefundRuleOptions(int paymentTypeId, int receiptTypeId)
        throws GenericException;

    /***********************/
}
