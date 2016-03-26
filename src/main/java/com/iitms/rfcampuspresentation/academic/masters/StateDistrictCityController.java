package com.iitms.rfcampuspresentation.academic.masters;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdomain.academic.masters.service.StateDistrictCityService;

@Controller
public class StateDistrictCityController {

    private static final Logger LOG = LoggerFactory.getLogger(StateDistrictCityController.class);
    
    @Autowired
    private StateDistrictCityService stateDistrictCityService;
    
    @RequestMapping(value = "/master/district", method = RequestMethod.GET)
    public @ResponseBody List<MasterModel> getDistricts(@RequestParam("stateId") String stateId){
        LOG.info("State : " + stateId);
        return stateDistrictCityService.getDistricts(Integer.parseInt(stateId));
    }
    
    @RequestMapping(value = "/master/city")
    public @ResponseBody List<MasterModel> getCities(@RequestParam("districtId") String districtId){
        LOG.info("District : " + districtId);
        return stateDistrictCityService.getCities(Integer.parseInt(districtId));
    }
}
