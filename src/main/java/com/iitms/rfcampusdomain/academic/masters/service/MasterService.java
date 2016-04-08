package com.iitms.rfcampusdomain.academic.masters.service;

import java.util.List;

import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.academic.masters.entity.MasterData;
import com.iitms.rfcampusdata.academic.masters.entity.MasterFields;

public interface MasterService {

    public MasterFields getStaticFields(String masterType);
    
    public List<MasterData> loadMasterFields(Class<?> runtimeClass, String propertyName);
    
    public int addmaster(MasterFields masterFields);
    
    public boolean isRecordExist(MasterFields masterFields);
    
    public List<MasterModel> getMasterData(String master);
    
    public List<?> getAllRecords(Class<?> criteriaClass);
}
