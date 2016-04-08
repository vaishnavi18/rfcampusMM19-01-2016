package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.academic.feecollection.dao.FeesCounterCreationDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesCounterMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesUserCounterMasterEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesCounterCreationService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesPaymentModeService;
@Service
@Transactional
public class FeesCounterCreationServiceImpl implements FeesCounterCreationService {
    @Autowired
    private FeesCounterCreationDao feesCounterCreationDao;
    @Autowired
    private FeesPaymentModeService feesPaymentModeService;   
    
    @Override
    public boolean addCounter(final String counterName,final String printName,final int counterUser,final String receipt_type) {
        int id=feesCounterCreationDao.addCounter(counterName, printName);
        List<FeesPaymentModeEntity> paymentModeList=feesPaymentModeService.getFeesPaymentMode();
        boolean result=feesCounterCreationDao.addCounterUser(id, counterUser, receipt_type,paymentModeList);
        return result;
    }
    @Override
    public List<FeesUserCounterMasterEntity> getCounterList()
    {   
        return feesCounterCreationDao.getCounterList();
    }
    @Override 
    public boolean updateCounter(int id, String counterName, String printName, int counterUser, String receipt_type,String receiptPrevList)
    {
        List<FeesPaymentModeEntity> paymentModeList=feesPaymentModeService.getFeesPaymentMode();
        boolean result=feesCounterCreationDao.updateCounter(id, counterName, printName);
        boolean result1=feesCounterCreationDao.updateCounterUser(id, counterUser,receipt_type, paymentModeList,receiptPrevList);
            if(result & result1) 
            {
                return true;        
            }
            else {
                return false;
            }
    }
    @Override
    
    public List<MasterModel> getCounterAllocatedUsers() {
        return feesCounterCreationDao.getCounterAllocatedUsers();
    }
    
    @Override
    public List<FeesReceiptTypeEntity> getRecipt(int userId) {
        return feesCounterCreationDao.getRecipt(userId);
    }
    @Override
    public FeesCounterMasterEntity getCounter(int userId) {
        return feesCounterCreationDao.getCounterName(userId);
    }
    @Override
    public int getReceiptNumber(int userId, int counterId, int receiptTypeId, int paymentModeId) {
        return feesCounterCreationDao.getReceiptNumber(userId, counterId, receiptTypeId, paymentModeId);
    }
    @Override
    public boolean checkCounterExist(int userId) {
        
        return feesCounterCreationDao.checkCounterExist(userId);
    }
    
    
    

    
}
