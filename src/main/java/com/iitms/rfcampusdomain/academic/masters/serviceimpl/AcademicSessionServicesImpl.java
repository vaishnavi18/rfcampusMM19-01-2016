package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.dao.AcademicSessionMasterDao;
import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.AcademicSessionServices;
@Service
@Transactional
public class AcademicSessionServicesImpl implements AcademicSessionServices
{

    @Autowired
    AcademicSessionMasterDao academicSessionMasterDao;
    @Override
    public List<AcademicSessionMasterEntity> getAcademicSession() {
       
        return academicSessionMasterDao.getAcademicSession();
    }
    
}
