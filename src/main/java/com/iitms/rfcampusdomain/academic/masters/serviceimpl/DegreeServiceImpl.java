package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.dao.DegreeDao;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.DegreeService;
@Service
@Transactional
public class DegreeServiceImpl implements DegreeService {
    @Autowired 
   private DegreeDao admissionDegreeMasterDao;
    @Override
    public boolean addDegree(final DegreeMasterEntity entity) {
        return admissionDegreeMasterDao.addDegree(entity);
    }
    @Override
    public List<DegreeMasterEntity> getAllDegree() {
        return admissionDegreeMasterDao.getAllDegree();
    }
    @Override
    public boolean updateDegree(final DegreeMasterEntity entity) {       
        return  admissionDegreeMasterDao.updateDegree(entity);
    }
    @Override
    public boolean getDegreeAlreadyExist(final String degreeName,final String degreeCode) {
        return admissionDegreeMasterDao.getDegreeAlreadyExist(degreeName, degreeCode);
    }
    @Override
    public boolean getDegreeAlreadyExist(final String degreeName,final String degreeCode,final int id) {
        return admissionDegreeMasterDao.getDegreeAlreadyExist(degreeName, degreeCode,id);
    }

}
