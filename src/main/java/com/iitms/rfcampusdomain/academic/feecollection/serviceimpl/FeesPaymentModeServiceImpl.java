package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.feecollection.dao.FeesPaymentModeDao;
//import com.iitms.rfcampusdata.academic.feecollection.dao.FeesPaymentModeDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesPaymentModeService;

@Transactional
@Service
public class FeesPaymentModeServiceImpl implements FeesPaymentModeService {
    @Autowired
    private FeesPaymentModeDao feesPaymentModeDao;

    @Override
    public List<FeesPaymentModeEntity> getFeesPaymentMode() {
        return feesPaymentModeDao.getFeesPaymentMode();
    }

    @Override
    public String getPaymentMode(int id) {
        return feesPaymentModeDao.getPaymentMode(id);
    }

    @Override
    public List<FeesPaymentModeEntity> getFeesPaymentMode2(boolean isRefund) {
        return feesPaymentModeDao.getFeesPaymentMode(isRefund);
    }
}
