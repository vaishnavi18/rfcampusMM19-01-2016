package com.iitms.rfcampusdata.academic.masters.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.PaymentTypeMasterEntity;

public interface PaymentTypeDao {
    public boolean addPaymentType(final PaymentTypeMasterEntity entity);

    public List<PaymentTypeMasterEntity> getAllPaymentType();

    public boolean updatePaymentType(final PaymentTypeMasterEntity entity);

    public boolean getPaymentTypeAlreadyExist(final String paymentType);
}
