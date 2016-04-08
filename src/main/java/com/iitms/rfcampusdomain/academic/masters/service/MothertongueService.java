package com.iitms.rfcampusdomain.academic.masters.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;

public interface MothertongueService {
    public boolean addMothertongue(MothertongueMasterEntity entity);

     List<MothertongueMasterEntity> getMothertongue();

    public boolean updateMothertongue(MothertongueMasterEntity entity);

}
