package com.iitms.rfcampusdomain.academic.masters.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;

public interface BranchService {
    public boolean addBranch(final BranchMasterEntity entity);

    public List<BranchMasterEntity> getAllBranch();

    public boolean updateBranch(BranchMasterEntity entity);
    public boolean getBranchAlreadyExist(final String branchShortName,final  String branchLongName);
    public List<BranchMasterEntity> getBranchByDegree(final int degreeId);
}
