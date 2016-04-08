package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.feecollection.dao.FeesFeeheadDao;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeeHeadList;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesFeeheadEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesFeeheadService;

@Service
@Transactional
public class FeesFeeheadServiceImpl implements FeesFeeheadService
{
    @Autowired
    private FeesFeeheadDao feesFeeheadDao;
    @Override
    public List<FeesFeeheadEntity> getFeeHeadsList(final int id)
    {
        return feesFeeheadDao.getFeeHeadsList(id);
    }
    @Override
    public boolean addFeeHeads(final FeeHeadList FeeHeadList)
    {  
        return feesFeeheadDao.addFeeHeads(FeeHeadList);
    }
}
