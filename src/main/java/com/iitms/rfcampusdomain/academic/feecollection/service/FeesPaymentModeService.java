package com.iitms.rfcampusdomain.academic.feecollection.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;

public interface FeesPaymentModeService
{
    public List<FeesPaymentModeEntity> getFeesPaymentMode();
    public String getPaymentMode(int id);
    public List<FeesPaymentModeEntity> getFeesPaymentMode2(boolean isRefund);
}
