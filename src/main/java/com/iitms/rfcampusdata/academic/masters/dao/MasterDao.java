package com.iitms.rfcampusdata.academic.masters.dao;

import java.io.Serializable;
import java.util.List;

import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.academic.masters.entity.MasterData;
import com.iitms.rfcampusdata.academic.masters.entity.MasterFields;

public interface MasterDao {

    public List<MasterData> loadMasterFields(Class runtimeClass, String[] propertyName);

    public int addmaster(Serializable model);

    public int updateMaster(Serializable entity, MasterFields masterFields);

    public boolean isRecordExist(MasterFields masterFields);

    public List<MasterModel> getMasterData(Class masterClass);

    public MasterFields getStaticFields(String masterType);

    public List<?> getAllRecords(Class criteriaClass);
}
