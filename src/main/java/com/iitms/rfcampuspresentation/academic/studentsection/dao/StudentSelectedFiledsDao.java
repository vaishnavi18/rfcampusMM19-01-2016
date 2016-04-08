package com.iitms.rfcampuspresentation.academic.studentsection.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.SelectedPropertiesMasterEntity;

public interface StudentSelectedFiledsDao {

    public List<SelectedPropertiesMasterEntity> getAllAcademicProperties();

    public List<SelectedPropertiesMasterEntity> getSelectedProperties(
        SelectedPropertiesMasterEntity[] selectedFieldsArray, SelectedPropertiesMasterEntity[] orderByArray,
        SelectedPropertiesMasterEntity restrictions);
}
