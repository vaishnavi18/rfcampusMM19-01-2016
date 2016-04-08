/**
 * 
 */
package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.feecollection.dao.FeeCollectionDao;
import com.iitms.rfcampusdata.academic.feecollection.dao.FeeSessionCounterDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrDDTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrmainTransactionEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesSessionCounterReferenceTransactionEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeeCollectionService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeeSessionCounterService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesCounterCreationService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesPaymentModeService;
import com.iitms.rfcampusdomain.academic.feecollection.service.ReceiptTypeService;

/**
 * @author girish
 */
@Service
@Transactional
public class FeeCollectionServiceImpl implements FeeCollectionService {
    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(FeeCollectionServiceImpl.class);

    @Autowired
    private ReceiptTypeService receiptTypeService;

    @Autowired
    FeeSessionCounterDao feeSessionCounterDao;

    @Autowired
    private FeesPaymentModeService feesPaymentModeService;

    @Autowired
    private FeeCollectionDao feeCollectionDao;

    @Autowired
    private FeeSessionCounterService feeSessionCounterService;

    @Autowired
    private FeesCounterCreationService feesCounterCreationService;

    @Override
    public String getReceiptNo(int receiptId, int paymentModeId, int userId, String academicBatch, String counterName) {
        LOG.info("control in getReceiptNo");
        String paymentMode = feesPaymentModeService.getPaymentMode(paymentModeId);
        String receiptCode = receiptTypeService.getReceiptCode(receiptId);

        return counterName + "/" + paymentMode + "/" + receiptCode + "/" + academicBatch + "/";
    }

    @Override
    public boolean addStudentFeeDetails(FeesDcrmainTransactionEntity dcrMainEntity, int paymentModeId) {
        LOG.info("control in addStudentFeeDetails");
        FeesDcrmainTransactionEntity mainEntity = new FeesDcrmainTransactionEntity();
        mainEntity.setStudentSerialNumber(dcrMainEntity.getStudentSerialNumber());
        mainEntity.setCounterId(dcrMainEntity.getCounterId());
        mainEntity.setDegreeId(dcrMainEntity.getDegreeId());
        mainEntity.setSemesterId(dcrMainEntity.getSemesterId());
        mainEntity.setPaymentTypeId(dcrMainEntity.getPaymentTypeId());
        mainEntity.setBatchId(dcrMainEntity.getBatchId());
        mainEntity.setReceiptNumber(dcrMainEntity.getReceiptNumber());
        mainEntity.setReceiptDate(dcrMainEntity.getReceiptDate());
        mainEntity.setReceiptId(dcrMainEntity.getReceiptId());
        mainEntity.setPaymentMode(dcrMainEntity.getPaymentMode());
        mainEntity.setTotalPaidAmount(dcrMainEntity.getTotalPaidAmount());
        mainEntity.setExcessAmount(dcrMainEntity.getExcessAmount());
        int mainId = feeCollectionDao.addToDcrmain(mainEntity);

        feeCollectionDao.addToDcrTrans(mainId, dcrMainEntity.getDcrTransaction());

        if (dcrMainEntity.getDcrDDTransaction() != null) {
            List<FeesDcrDDTransactionEntity> list = dcrMainEntity.getDcrDDTransaction();
            float totalAmount = dcrMainEntity.getTotalPaidAmount();
            int paymentId = dcrMainEntity.getPaymentTypeId();
            for (FeesDcrDDTransactionEntity ddHeadEntity : list) {
                if (ddHeadEntity.getDemandDraftNumber() != null) {
                    // LOG.info("DD Number :" + ddHeadEntity.getDemandDraftNumber());
                    feeCollectionDao.addToDcrDD(mainId, paymentId, ddHeadEntity.getDemandDraftNumber(),
                        ddHeadEntity.getDemandDraftDate(), ddHeadEntity.getDemandDraftAmount(),
                        ddHeadEntity.getBankId(), ddHeadEntity.getLocationId(), totalAmount);
                }
            }
        }
        int counterId = dcrMainEntity.getCounterId();
        int receiptId = dcrMainEntity.getReceiptId();

        FeesSessionCounterReferenceTransactionEntity entity =
            feeSessionCounterService.getReceiptNo(counterId, paymentModeId, receiptId);

        String receipt = dcrMainEntity.getReceiptNumber().substring(
            dcrMainEntity.getReceiptNumber().lastIndexOf("/") + 1, dcrMainEntity.getReceiptNumber().length());
        LOG.info("receiptxxxxxxxx:" + receipt);
        int rptNo = Integer.parseInt(receipt);
        entity.setReceiptNumber(rptNo);
        boolean result = feeSessionCounterDao.updateReceiptNo(entity);
        return result;
    }

    @Override
    public double getExcessAmount(int studentSerialId) {
        LOG.info("control in getExcessAmount");
        double totalAdjustmentAmount = feeCollectionDao.getTotalAdjustmentAmount(studentSerialId);
        double totalExcessAmount = feeCollectionDao.getTotalExcessAmount(studentSerialId);
        LOG.info("totalAdjustmentAmount" + totalAdjustmentAmount);
        LOG.info("totalExcessAmount" + totalExcessAmount);
        double excessAmount = totalExcessAmount - totalAdjustmentAmount;
        LOG.info("excessAmount" + excessAmount);
        return excessAmount;
    }

    @Override
    public int getReceiptSerialNo(int userId, int counterId, int receiptTypeId, int paymentModeId,
        String receiptNumber) {
        LOG.info("control in getReceiptSerialNo");
        int receiptNo = feesCounterCreationService.getReceiptNumber(userId, counterId, receiptTypeId, paymentModeId);
        LOG.info("receiptNo:" + receiptNo);

        int value = feeCollectionDao.checkReceiptSerialNoAlreadyExist(receiptNumber);
        if (receiptNo >= value) {
            return receiptNo;
        } else {
            return value;
        }

    }
}
