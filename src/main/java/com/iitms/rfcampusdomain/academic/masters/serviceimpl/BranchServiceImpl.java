package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.dao.BranchDao;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.BranchService;
@Service
@Transactional
public class BranchServiceImpl implements BranchService
{
    @Autowired
    private BranchDao admissionBranchMasterDao;
    
    @Override
    public boolean addBranch(final BranchMasterEntity entity) {    
        return admissionBranchMasterDao.addBranch(entity);
    }
    @Override
    public List<BranchMasterEntity> getAllBranch() {
        return admissionBranchMasterDao.getAllBranch();
    }
    @Override
    public boolean updateBranch(BranchMasterEntity entity) 
    { 
        return admissionBranchMasterDao.updateBranch(entity);
    }
    @Override
    public boolean getBranchAlreadyExist(final String branchShortName,final  String branchLongName) {
        return admissionBranchMasterDao.getBranchAlreadyExist(branchShortName, branchLongName);
    }
    @Override
    public List<BranchMasterEntity> getBranchByDegree(final int degreeId) {
        return admissionBranchMasterDao.getBranchByDegree(degreeId);
    }
}
