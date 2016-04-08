package com.iitms.rfcampusdata.academic.masters.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;

public interface CasteDao {
    public List<CasteMasterEntity> getCastList();

    public String getCastName(int castId);
}
