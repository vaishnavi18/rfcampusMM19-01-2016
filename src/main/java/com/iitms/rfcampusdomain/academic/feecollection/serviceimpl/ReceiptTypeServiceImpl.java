package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.feecollection.dao.ReceiptTypeDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.ReceiptTypeService;

@Service
@Transactional
public class ReceiptTypeServiceImpl implements ReceiptTypeService {
    @Autowired
    private ReceiptTypeDao receiptTypeDao;

    @Override
    public boolean addReceiptTypeService(final FeesReceiptTypeEntity feesReceiptTypeEntity) {
       
        boolean flag = receiptTypeDao.addReceiptType(feesReceiptTypeEntity);
        return flag;
    }

    @Override
    public boolean updateReceiptTypeService(final FeesReceiptTypeEntity entity) {
        boolean flag = receiptTypeDao.updateReceiptType(entity);
        return flag;
    }

    @Override
    public boolean deleteReceiptTypeService(final int id) {
        boolean flag = receiptTypeDao.deleteReceiptType(id);
        return flag;
    }

    @Override
    public FeesReceiptTypeEntity getReceiptTypeService(final int id) {

        return receiptTypeDao.getReceiptType(id);
    }

    @Override
    public List<FeesReceiptTypeEntity> listAllReceiptTypeService() {

        return receiptTypeDao.listAllReceiptType();
    }

    @Override
    public boolean getReceiptTypeForAlreadyExists(final String receiptCode, final String receiptTitle) {
        return receiptTypeDao.getReceiptTypeForAlreadyExists(receiptCode, receiptTitle);
    }

    @Override
    public String getReceiptCode(int receiptId) {
        return receiptTypeDao.getReceiptCode(receiptId);
    }

    @Override
    public List<FeesReceiptTypeEntity> getMiscellaneousReceipt() {
     
        return receiptTypeDao.getMiscellaneousReceipt();
    }
    
    

}
