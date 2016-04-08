package com.iitms.rfcampusdomain.academic.masters.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.PaymentTypeMasterEntity;

public interface PaymentTypeService {
    public boolean addPaymentType(final PaymentTypeMasterEntity entity);

    public List<PaymentTypeMasterEntity> getAllPaymentType();

    public boolean updatePaymentType(final PaymentTypeMasterEntity entity);
    
    public boolean getPaymentTypeAlreadyExist(final String paymentType);
}
