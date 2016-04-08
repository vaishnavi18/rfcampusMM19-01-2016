package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.feecollection.dao.StandardFeeMasterDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterList;
import com.iitms.rfcampusdomain.academic.feecollection.service.StandardFeeMasterService;

@Service
@Transactional
public class StandardFeeMasterServiceImpl implements StandardFeeMasterService {
    @Autowired
    private StandardFeeMasterDao standardFeeMasterDao;

    @Override
    public boolean addStandardFee(StandardFeeMasterList standardList) {
        // TODO Auto-generated method stub
        return standardFeeMasterDao.addStandardFee(standardList);
    }

    @Override
    public List<StandardFeeMasterEntity> getStandardFeeList(int receiptId, int degreeId, int batchId, int paymentTypeId,
        int semesterId) {
        return standardFeeMasterDao.getStandardFeeList(receiptId, degreeId, batchId, paymentTypeId, semesterId);
    }

    @Override
    public int isStandardFeeDefined(int receiptId, int degreeId, int batchId, int paymentTypeId, int semesterId) {
        return standardFeeMasterDao.isStandardFeeDefined(receiptId, degreeId, batchId, paymentTypeId, semesterId);
    }

    @Override
    public int copyStandardFee(int receiptId, int degreeId, int batchId, int paymentTypeId, int semesterId,
        int receiptId_To, int degreeId_To, int batchId_To, int paymentTypeId_To, int semesterId_To,String feeDescription,boolean overwriteDemand) {
        //get Standard fee 
        List<StandardFeeMasterEntity>standardFee=standardFeeMasterDao.getStandardFeeList2(receiptId, degreeId, batchId, paymentTypeId, semesterId);
       
        StandardFeeMasterList standardFeeMasterList = new StandardFeeMasterList();
        standardFeeMasterList.setStandardFee(standardFee);
        standardFeeMasterList.setReceiptTypeId(receiptId_To);
        standardFeeMasterList.setDegreeId(degreeId_To);
        standardFeeMasterList.setPaymentTypeId(paymentTypeId_To);
        standardFeeMasterList.setSemesterId(semesterId_To);
        standardFeeMasterList.setBatchId(batchId_To);
        standardFeeMasterList.setFeeDescription(feeDescription);
        int result=standardFeeMasterDao.copyStandardFee(standardFeeMasterList,overwriteDemand);
        return result;
    }

    @Override
    public List<String> getDescription() {
         
        return standardFeeMasterDao.getDescription();
    }

    @Override
    public List<StandardFeeMasterEntity> getStandardFeeListByDesecriptionService(String feeDesecription) {
        
        StandardFeeMasterEntity entity=standardFeeMasterDao.getStandardFeeListByDesecriptionService(feeDesecription);
        return standardFeeMasterDao.getStandardFeeList(entity.getReceiptTypeId(), entity.getDegreeId(),entity.getBatchId(), entity.getPaymentTypeId(), entity.getSemesterId());
    }

}
