package com.iitms.rfcampusdata.academic.feecollection.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.dto.StudentDemandDTO;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentFeeDetailsDTO;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterEntity;

public interface FeesDemandCreationTransactionDao {

    public int createDemand(int receiptId, int degreeId, int branchId, int paymentTypeId, int semesterId, int demandFor,
        String enrollmentIds, int acadamicSessionId, List<StandardFeeMasterEntity> feeHeads);

    public void deleteDemand(int degreeId, int branchId, int paymentTypeId, int semesterId, String enrollmentIds);

    public List<StudentDemandDTO> getStudentDemand(String enrollment_id, int semesterId);

    public List<StudentDemandDTO> getStudentOutStandingBalance(String enrollment_id, int semesterId);

    public List<StudentFeeDetailsDTO> getStudentFeeDetails(String enrollment_id, int semesterId, int studentId);
}
