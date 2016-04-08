package com.iitms.rfcampusdata.academic.admission.dao;

import com.iitms.rfcampusdata.academic.masters.entity.BatchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;

public interface RegistrationNumberGeneratorDao {

    public BatchMasterEntity getBatch(int sessionId);

    public DegreeMasterEntity getDegree(int degreeId);

    public BranchMasterEntity getBranch(int branchId);
}
