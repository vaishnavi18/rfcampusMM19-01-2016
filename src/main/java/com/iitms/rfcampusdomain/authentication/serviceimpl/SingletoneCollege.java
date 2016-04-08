package com.iitms.rfcampusdomain.authentication.serviceimpl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.iitms.rfcampusdomain.authentication.service.CollegeCreationService;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;

@Component
@Scope("singleton")
public class SingletoneCollege {

    private Map<Integer, CollegeInformation> map = new HashMap<Integer, CollegeInformation>();
    
    @Autowired
    private CollegeCreationService collegeCreationService;

    public CollegeInformation getColllegeInformation(int collegeId) {

        CollegeInformation college = map.get(collegeId);
        
        if(null == college){
            college = collegeCreationService.getCollegeInfo(collegeId);
        }
        
        return college;
    }

}
