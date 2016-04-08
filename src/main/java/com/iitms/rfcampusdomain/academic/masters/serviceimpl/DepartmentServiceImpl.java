package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.dao.DepartmentDao;
import com.iitms.rfcampusdata.academic.masters.entity.DepartmentMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.DepartmentService;
@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    DepartmentDao departmentDao; 
    @Override
    public List<DepartmentMasterEntity> getAllDepartment() {
        return departmentDao.getAllDepartment();
    }

}
