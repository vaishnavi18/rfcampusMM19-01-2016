package com.iitms.rfcampusdata.academic.admission.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;

public interface AdmissionCasteMasterDao {
    public List<CasteMasterEntity> getCastList();

    public String getCastName(int castId);
}
