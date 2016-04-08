package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.feecollection.dao.FeesCurrencyDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesCurrencyEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesCurrencyService;

@Service
@Transactional
public class FeesCurrencyServiceImpl implements FeesCurrencyService {
    
    @Autowired
    FeesCurrencyDao feesCurrencyDao;

    @Override
    public List<FeesCurrencyEntity> getFeesCurrency() {
        return feesCurrencyDao.getFeesCurrency();
    }
}
