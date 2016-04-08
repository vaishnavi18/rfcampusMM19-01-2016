package com.iitms.rfcampusdomain.academic.admission.serviceimpl;

import java.text.NumberFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.admission.dao.RegistrationNumberGeneratorDao;
import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BatchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;
import com.iitms.rfcampusdomain.academic.admission.service.RegistrationNumberGeneratorService;

@Service
@Transactional
public class RegistrationNumberGeneratorServiceImpl implements RegistrationNumberGeneratorService {

    @Autowired
    private RegistrationNumberGeneratorDao registrationNumberGeneratorDao;

    public String getRegistrationNumber(int formatId, int sessionId, int degreeId, int branchId) {

        BatchMasterEntity batch = this.getBatch(sessionId);
        DegreeMasterEntity degree = this.getDegree(degreeId);
        BranchMasterEntity branch = this.getBranch(branchId);

        String registrationFormat = "";
        NumberFormat numberFormat = NumberFormat.getInstance();
        
        switch (formatId) {

            case 1: {
                registrationFormat = batch.getBatchName()+degree.getDegreeCode()+branch.getBranchShortName();
                break;
            }
            case 2: {
                numberFormat.setMinimumIntegerDigits(2);
                registrationFormat = batch.getShortBatchName()+numberFormat.format(degree.getId())+numberFormat.format(branch.getId());
                break;
            }
        }
        
        return registrationFormat;
    }

    @Override
    public BatchMasterEntity getBatch(int sessionId) {
        return registrationNumberGeneratorDao.getBatch(sessionId);
    }

    @Override
    public DegreeMasterEntity getDegree(int degreeId) {
        return registrationNumberGeneratorDao.getDegree(degreeId);
    }

    @Override
    public BranchMasterEntity getBranch(int branchId) {
        return registrationNumberGeneratorDao.getBranch(branchId);
    }
}
