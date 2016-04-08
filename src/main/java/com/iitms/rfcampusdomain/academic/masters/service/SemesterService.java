package com.iitms.rfcampusdomain.academic.masters.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.SemesterMasterEntity;

public interface SemesterService {
    public boolean addSemester(final SemesterMasterEntity entity);

    public List<SemesterMasterEntity> getAllSemester();

    public boolean updateSemester(final SemesterMasterEntity entity);
    
    public boolean getSemesterAlreadyExist(final String semesterName,final String semesterFullName);
}
