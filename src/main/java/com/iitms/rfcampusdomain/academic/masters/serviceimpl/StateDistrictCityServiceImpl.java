package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.academic.masters.dao.StateDistrictCityDao;
import com.iitms.rfcampusdomain.academic.masters.service.StateDistrictCityService;

@Service
@Transactional
public class StateDistrictCityServiceImpl implements StateDistrictCityService{

    @Autowired
    private StateDistrictCityDao stateDistrictCityDao;
    
    @Override
    public List<MasterModel> getAllStates() {
        return stateDistrictCityDao.getAllStates();
    }

    @Override
    public List<MasterModel> getDistricts(int stateId) {
        return stateDistrictCityDao.getDistricts(stateId);
    }

    @Override
    public List<MasterModel> getCities(int districtId) {
        return stateDistrictCityDao.getCities(districtId);
    }

    
}
