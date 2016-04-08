package com.iitms.rfcampusdata.academic.masters.dao;

import java.util.List;

import com.iitms.rfcampuscommon.MasterModel;

public interface StateDistrictCityDao {

    public List<MasterModel> getAllStates();

    public List<MasterModel> getDistricts(int stateId);

    public List<MasterModel> getCities(int districtId);
}
