package com.iitms.rfcampuspresentation.academic.studentsection.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.masters.entity.LastQualifyingExamMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.SelectedPropertiesMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;
import com.iitms.rfcampuspresentation.academic.studentsection.dao.StudentSelectedFiledsDao;
import com.iitms.rfcampuspresentation.academic.studentsection.service.StudentSelectedFiledsService;

@Service
@Transactional
public class StudentSelectedFiledsServiceImpl implements StudentSelectedFiledsService {

    @Autowired
    private StudentSelectedFiledsDao studentSelectedFiledsDao;

    @Autowired
    private MasterService masterService;

    @Override
    public List<SelectedPropertiesMasterEntity> getAllAcademicProperties() {
        List<SelectedPropertiesMasterEntity> selectedProperties = studentSelectedFiledsDao.getAllAcademicProperties();

        for(SelectedPropertiesMasterEntity property : selectedProperties){
            if(! property.getRestriction().equals("N")){
                property.setMasterData(masterService.getMasterData(property.getMasterEntity()));
            }
        }
        
        return selectedProperties;
    }

    @Override
    public List<SelectedPropertiesMasterEntity> getSelectedProperties(String selectedFields, String orderBy,
        String filters) {

        SelectedPropertiesMasterEntity[] selectedFieldsArray =
            new Gson().fromJson("[" + selectedFields + "]", SelectedPropertiesMasterEntity[].class);

        SelectedPropertiesMasterEntity[] orderByArray =
            new Gson().fromJson("[" + orderBy + "]", SelectedPropertiesMasterEntity[].class);

        SelectedPropertiesMasterEntity restrictions =
            new Gson().fromJson(filters, SelectedPropertiesMasterEntity.class);

        return studentSelectedFiledsDao.getSelectedProperties(selectedFieldsArray, orderByArray, restrictions);
    }

}
