package com.iitms.rfcampusdomain.academic.masters.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;

public interface DegreeService
{
    public boolean addDegree(final DegreeMasterEntity entity);

    public List<DegreeMasterEntity> getAllDegree();

    public boolean updateDegree(final DegreeMasterEntity entity);
    public boolean getDegreeAlreadyExist(final String degreeName,final String degreeCode);
    public boolean getDegreeAlreadyExist(final String degreeName,final String degreeCode,final int id);

}
