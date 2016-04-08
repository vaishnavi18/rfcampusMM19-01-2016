package com.iitms.rfcampusdomain.academic.feecollection.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.dto.StudentDemandDTO;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentFeeDetailsDTO;

public interface FeesDemandCreationTransactionService {
    public int createDemand(int receiptId, int degreeId, int branchId, int paymentTypeId, int semesterId,
        int demandFor, String enrollmentIds, int acadamicSessionId);

    public void deleteDemand(int degreeId, int branchId, int paymentTypeId, int semesterId, String enrollmentIds);

    public List<StudentDemandDTO> getStudentDemand(String enrollment_id, int semesterId);

    public List<StudentFeeDetailsDTO> getStudentFeeDetails(String enrollment_id, int semesterId, int studentId);
}
