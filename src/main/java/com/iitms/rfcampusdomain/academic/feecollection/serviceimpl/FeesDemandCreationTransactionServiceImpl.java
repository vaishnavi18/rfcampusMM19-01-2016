package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.feecollection.dao.FeesDemandCreationTransactionDao;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentDemandDTO;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentFeeDetailsDTO;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesDemandCreationTransactionService;
import com.iitms.rfcampusdomain.academic.feecollection.service.StandardFeeMasterService;

@Service
@Transactional
public class FeesDemandCreationTransactionServiceImpl implements FeesDemandCreationTransactionService {

    @Autowired
    private FeesDemandCreationTransactionDao feesDemandCreationTransactionDao;

    @Autowired
    private StandardFeeMasterService standardFeeMasterService;

    
    @Override
    public int createDemand(int receiptId, int degreeId, int branchId, int paymentTypeId, int semesterId,
        int demandFor, String enrollmentIds, int acadamicSessionId) {
        List<StandardFeeMasterEntity> feeHeads = standardFeeMasterService.getStandardFeeList(receiptId, degreeId,
            acadamicSessionId, paymentTypeId, demandFor);
        if (feeHeads.isEmpty()){
            return 0;
        }
        else
        {
            return  feesDemandCreationTransactionDao.createDemand(receiptId, degreeId, branchId, paymentTypeId, semesterId,
                demandFor, enrollmentIds, acadamicSessionId, feeHeads);   
        } 
    }

    @Override
    public void deleteDemand(int degreeId, int branchId, int paymentTypeId, int semesterId, String enrollmentIds) {
        feesDemandCreationTransactionDao.deleteDemand(degreeId, branchId, paymentTypeId, semesterId, enrollmentIds);
    }

    @Override
    public List<StudentDemandDTO> getStudentDemand(String enrollment_id, int semesterId) {
        // getStudentDemand(enrollment_id, semesterId) return demand of student from Demand Table for given parameter
        // getStudentDemand1(enrollment_id, semesterId) return individual sum of head(OutStanding amount) from Demand
        // AND DcrMain Table
        /* feesDemandCreationTransactionDao.getStudentDemand(enrollment_id, semesterId); */
        List<StudentDemandDTO> list =
            feesDemandCreationTransactionDao.getStudentOutStandingBalance(enrollment_id, semesterId);
        return list;
    }

    @Override
    public List<StudentFeeDetailsDTO> getStudentFeeDetails(String enrollment_id, int semesterId, int studentId) {
      
        return feesDemandCreationTransactionDao.getStudentFeeDetails(enrollment_id, semesterId,studentId);
    }
    
    

}
