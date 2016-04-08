package com.iitms.rfcampuspresentation.academic.studentsection.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.SelectedPropertiesMasterEntity;

public interface StudentSelectedFiledsService { 

    public List<SelectedPropertiesMasterEntity> getAllAcademicProperties();
    
    public List<SelectedPropertiesMasterEntity> getSelectedProperties(String selectedFields, String orderBy, String filters);
}
