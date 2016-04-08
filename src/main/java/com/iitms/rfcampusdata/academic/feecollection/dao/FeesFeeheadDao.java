package com.iitms.rfcampusdata.academic.feecollection.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeeHeadList;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesFeeheadEntity;

public interface FeesFeeheadDao {
    public List<FeesFeeheadEntity> getFeeHeadsList(final int id);

    public boolean addFeeHeads(final FeeHeadList FeeHeadList);
}
