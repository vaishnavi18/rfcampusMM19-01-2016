package com.iitms.rfcampusdomain.academic.masters.service;

import java.util.List;

import com.iitms.rfcampuscommon.MasterModel;

public interface StateDistrictCityService {

    public List<MasterModel> getAllStates();
    
    public List<MasterModel> getDistricts(int stateId);
    
    public List<MasterModel> getCities(int districtId);
}
