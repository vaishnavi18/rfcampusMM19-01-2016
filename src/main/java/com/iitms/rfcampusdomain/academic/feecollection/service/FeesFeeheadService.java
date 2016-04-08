package com.iitms.rfcampusdomain.academic.feecollection.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeeHeadList;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesFeeheadEntity;

public interface FeesFeeheadService
{
    public List<FeesFeeheadEntity> getFeeHeadsList(final int id);
    public boolean addFeeHeads(final FeeHeadList FeeHeadList);
}

