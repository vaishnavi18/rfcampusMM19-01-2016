package com.iitms.rfcampusdomain.academic.admission.service;

import com.iitms.rfcampusdata.academic.masters.entity.BatchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;

public interface RegistrationNumberGeneratorService {

    public BatchMasterEntity getBatch(int sessionId);

    public DegreeMasterEntity getDegree(int degreeId);

    public BranchMasterEntity getBranch(int branchId);
    
    public String getRegistrationNumber(int formatId, int sessionId, int degreeId, int branchId);
}
