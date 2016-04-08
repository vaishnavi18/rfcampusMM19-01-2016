package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.iitms.rfcampusdata.academic.masters.entity.CollegeHeaderMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.CollegeHeaderMasterService;
/**
 * 
 * @author Sachinmt
 *
 */
@Service
public class CollegeHeaderMasterServiceImpl implements CollegeHeaderMasterService{

    @Override
    public List<CollegeHeaderMasterEntity> getCollegeHeader() {
        CollegeHeaderMasterEntity collegeHeaderMasterEntity = new CollegeHeaderMasterEntity();
        collegeHeaderMasterEntity.setCollegeName("Name Of College");
        collegeHeaderMasterEntity.setNameOfSociety("Name Of Society");
        collegeHeaderMasterEntity.setCollegeAddress("Address And City");        
        return Arrays.asList(collegeHeaderMasterEntity);
    }
}
