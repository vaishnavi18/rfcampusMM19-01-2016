package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.academic.feecollection.dao.FeesRefundDao;
import com.iitms.rfcampusdata.academic.feecollection.dto.ReceiptTypeDTO;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentInfoForDCR;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesCounterMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundFeeheadTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundMainTransaction;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundReferenceTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundRuleEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundruleCalculativeEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.admission.service.StudentInformationService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesRefundService;

@Service
@Transactional
public class FeesRefundServiceImpl implements FeesRefundService {

    @Autowired
    private FeesRefundDao feesRefundDao;

    @Autowired
    private StudentInformationService studentInformationService;

    @Autowired
    private SessionUser sessionUser;

    /* Fees Refund APIs */
    @Override
    public List<ReceiptTypeDTO> getStudentsReceipts(int studentId) throws GenericException {
        try {
            return feesRefundDao.getStudentsReceipts(studentId);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public float getRefundableAmount(String enrollmentNumber, String dcrMainIds) throws GenericException {
        try {
            return feesRefundDao.getRefundableAmount(
                studentInformationService.getStudentIdByEnrollmentNumber(enrollmentNumber), dcrMainIds);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Map<String, Object> getFeesInformation(int studentId, String enrollmentNumber, int receiptTypeId,
        String dcrMainIds) throws GenericException {
        Map<String, Object> map = new HashMap<String, Object>();

        try {
            List<StudentInfoForDCR> studentInfo =
                studentInformationService.getStudentByEnrollmentNumber(enrollmentNumber);
            float refundableAmount = feesRefundDao.getRefundableAmount(studentId, dcrMainIds);

            List<FeesDcrTransactionEntity> refundableAmountHeads = feesRefundDao.getRefundableAmountPerHead(dcrMainIds);

            FeesCounterMasterEntity counter = feesRefundDao.getCounter(sessionUser.getCustomLoginUser().getUserId());
            FeesPaymentModeEntity refundablePaymentMode = feesRefundDao.getRefundablePaymentMode();
            int serialNumber = feesRefundDao.getSerialNumber(counter.getId(), refundablePaymentMode.getId(),
                sessionUser.getCustomLoginUser().getUserId());

            map.put("studentInfo", studentInfo.get(0));
            map.put("refundableAmount", refundableAmount);
            map.put("refundableAmountHeads", refundableAmountHeads);
            map.put("voucherNumber", counter.getCounterPrintName() + "/"
                + refundablePaymentMode.getPaymentModeShortCode() + "/" + (serialNumber + 1));
            map.put("dcrMainIds", dcrMainIds);
            // map.put("allReceipts", feeReceipts);

            return map;
        } catch (Exception e) {
            throw e;
        }

    }

    @Override
    public void saveRefundMainRecord(FeesRefundMainTransaction feesRefundMainTransaction) throws GenericException {
        try {
            feesRefundMainTransaction.setUserId(sessionUser.getCustomLoginUser().getUserId());
            feesRefundMainTransaction
                .setCounterId(feesRefundDao.getUserCounterId(sessionUser.getCustomLoginUser().getUserId()));
            feesRefundMainTransaction.setVoucherDate(feesRefundMainTransaction.getVoucherDateString());
            int feesRefundId = feesRefundDao.saveRefundMainRecord(feesRefundMainTransaction);

            for (FeesRefundFeeheadTransactionEntity refundFeeHead : feesRefundMainTransaction.getRefundFeeHeads()) {
                refundFeeHead.setFeesRefundId(feesRefundId);
                feesRefundDao.saveRefundSubRecord(refundFeeHead);
            }

            for (String dcrMainId : feesRefundMainTransaction.getDcrMainIds().split(",")) {
                feesRefundDao.saveRefundReference(
                    new FeesRefundReferenceTransactionEntity(feesRefundId, Integer.parseInt(dcrMainId)));
            }
        } catch (Exception e) {
            throw e;
        }

    }

    /**********************************************/

    /* Fees Refund Rules APIs */
    @Override
    public void saveRefundRule(FeesRefundRuleEntity feesRefundRuleEntity) {
        Log.info("Refund Rule Id : " + feesRefundRuleEntity.getId());
        int refundRuleId = 0;

        try {
            if (feesRefundRuleEntity.getId() != 0) {
                feesRefundDao.deleteFeeRefundRecords(feesRefundRuleEntity.getId());
                refundRuleId = feesRefundRuleEntity.getId();
            } else {
                refundRuleId = feesRefundDao.saveRefundRule(feesRefundRuleEntity);
            }

            for (FeesRefundruleCalculativeEntity refundRuleTransaction : feesRefundRuleEntity.getRefundRuleTransaction()) {
                refundRuleTransaction.setRefundRuleId(refundRuleId);
                feesRefundDao.saveHeadWiseRefundRule(refundRuleTransaction);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<FeesRefundruleCalculativeEntity> getFeeHeads(int degreeId, int paymentTypeId, int receiptTypeId) {
        
        try {
            List<FeesRefundruleCalculativeEntity> list = feesRefundDao.getFeeHeads(degreeId, paymentTypeId, receiptTypeId);
            Log.info("LIST : " + list);
            if (null == list)
                list = feesRefundDao.getFeeHeads(receiptTypeId);

            return list;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public int getFeeRefundId(int degreeId, int paymentTypeId, int receiptTypeId) {
        try {
            return feesRefundDao.getFeeRefundId(degreeId, paymentTypeId, receiptTypeId);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<FeesRefundruleCalculativeEntity> getFeeRefundRule(int refundRuleId) {
        try {
            return feesRefundDao.getFeeRefundRule(refundRuleId);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<FeesRefundRuleEntity> getRefundRuleOptions(int paymentTypeId, int receiptTypeId) {
        try {
            return feesRefundDao.getRefundRuleOptions(paymentTypeId, receiptTypeId);
        } catch (Exception e) {
            throw e;
        }
    }

    /**********************************************/
}
