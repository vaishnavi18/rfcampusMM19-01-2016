package com.iitms.rfcampusdomain.academic.masters.service;

import java.util.List;

import org.hibernate.Session;

import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.admission.reportModel.DynamicJasperColumnNameModel;
import com.iitms.rfcampusdata.academic.masters.entity.MeritListStoreMaster;
import com.iitms.rfcampusdata.academic.masters.entity.MeritListTransactionEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListSortingEntity;

public interface StudentMeritListService {

    Session currentSession();

    StudentMeritListMasterEntity getStudentId(final int studentId);

    StudentMeritListMasterEntity getId(final int id);

    List<TempStudentRegistrationEntity> generateMeritList(final int category, final String restriction, final String orderedColumns);

    public int transferMeritList(final int sessionId, final int degreeId, final String studentList, final String meritListName);

    public List<TempStudentRegistrationEntity> viewMeritList();

    List<StudentMeritListSortingEntity> getSortingList();

    public List<TempStudentRegistrationEntity> getMeritList(int meritListId);
    
    public List<DynamicJasperColumnNameModel> getMeritListReport(int meritListId);
    
    public List<MeritListStoreMaster> viewAllMeritList();
    
    public String getMeritListNameById(final int meritListId);
    
    public int editMeritList(final String meritListName1,MeritListTransactionEntity[] studentList1);
    
    
    public List<TempStudentRegistrationEntity> getMeritListByStudentId(final int meritListId,final String id);
    
   // public int updateMeritList(String meritListName, MeritListTransactionEntity[] studentList);

   // public int updateMeritList(String meritListName, String studentList, String customMeritListName);

    int updateMeritList(final String meritListName, final String studentList);
}
