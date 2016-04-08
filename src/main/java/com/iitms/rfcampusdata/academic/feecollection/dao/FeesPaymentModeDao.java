package com.iitms.rfcampusdata.academic.feecollection.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;

public interface FeesPaymentModeDao {
    public List<FeesPaymentModeEntity> getFeesPaymentMode();

    public String getPaymentMode(int id);

    public List<FeesPaymentModeEntity> getFeesPaymentMode(boolean isRefund);
}
