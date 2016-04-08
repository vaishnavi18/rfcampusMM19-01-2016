package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.dao.PaymentTypeDao;
import com.iitms.rfcampusdata.academic.masters.entity.PaymentTypeMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.PaymentTypeService;
@Service
@Transactional
public class PaymentTypeServiceImpl implements PaymentTypeService
{
    @Autowired
     private PaymentTypeDao admissionPaymentTypeMasterDao; 
    @Override
    public boolean addPaymentType(final PaymentTypeMasterEntity entity) {
        return admissionPaymentTypeMasterDao.addPaymentType(entity);
    }
    @Override
    public List<PaymentTypeMasterEntity> getAllPaymentType() {
        return admissionPaymentTypeMasterDao.getAllPaymentType();
    }
    @Override
    public boolean updatePaymentType(final PaymentTypeMasterEntity entity) {      
        return admissionPaymentTypeMasterDao.updatePaymentType(entity);
    }
    @Override
    public boolean getPaymentTypeAlreadyExist(final String paymentType) { 
        return admissionPaymentTypeMasterDao.getPaymentTypeAlreadyExist(paymentType);
    }
}
