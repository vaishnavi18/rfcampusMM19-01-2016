package com.iitms.rfcampusdata.academic.masters.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;

public interface MothertongueDao {
    public boolean addMothertongue(MothertongueMasterEntity entity);

    public List<MothertongueMasterEntity> getMothertongue();

    public boolean updateMothertongue(MothertongueMasterEntity entity);

}
