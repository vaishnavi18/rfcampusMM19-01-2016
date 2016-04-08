package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.dao.SemesterDao;
import com.iitms.rfcampusdata.academic.masters.entity.SemesterMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.SemesterService;
@Service
@Transactional
public class SemesterServiceImpl implements SemesterService {
    @Autowired
    private SemesterDao  admissionSemesterMasterDao ;
    @Override
    public boolean addSemester(final SemesterMasterEntity entity) {
        return admissionSemesterMasterDao.addSemester(entity);
    }
    @Override
    public List<SemesterMasterEntity> getAllSemester() {
        return admissionSemesterMasterDao.getAllSemester();
    }
    @Override
    public boolean updateSemester(final SemesterMasterEntity entity) {
        return admissionSemesterMasterDao.updateSemester(entity);
    }
    @Override
    public boolean getSemesterAlreadyExist(final String semesterName,final String semesterFullName) {
        return admissionSemesterMasterDao.getSemesterAlreadyExist(semesterName, semesterFullName);
    }
}
