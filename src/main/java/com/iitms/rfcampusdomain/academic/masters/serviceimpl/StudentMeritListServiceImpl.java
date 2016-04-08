package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.admission.reportModel.DynamicJasperColumnNameModel;
import com.iitms.rfcampusdata.academic.masters.dao.StudentMeritListDao;
import com.iitms.rfcampusdata.academic.masters.entity.MeritListStoreMaster;
import com.iitms.rfcampusdata.academic.masters.entity.MeritListTransactionEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListSortingEntity;
import com.iitms.rfcampusdomain.academic.admission.service.AdmissionNotificationService;
import com.iitms.rfcampusdomain.academic.masters.service.StudentMeritListService;

@Service
@Transactional
public class StudentMeritListServiceImpl implements StudentMeritListService {


    @Autowired
    private StudentMeritListDao studentMeritListDao;

    @Autowired
    private AdmissionNotificationService admissionNotificationService;

    @Override
    public Session currentSession() {
        return null;
    }

    @Override
    public StudentMeritListMasterEntity getStudentId(final int studentId) {
        return studentMeritListDao.getStudentId(studentId);
    }

    @Override
    public StudentMeritListMasterEntity getId(final int id) {
        return studentMeritListDao.getId(id);
    }

    @Override
    public List<TempStudentRegistrationEntity> viewMeritList() {
        return studentMeritListDao.viewMeritList();
    }

    @Override
    public List<StudentMeritListSortingEntity> getSortingList() {
        return studentMeritListDao.getSortingList();
    }

    @Override
    public List<TempStudentRegistrationEntity> generateMeritList(final int category, final String restriction,
        final String orderedColumns) {
        return studentMeritListDao.generateMeritList(category, restriction, orderedColumns);
    }

    @Override
    public int transferMeritList(final int sessionId, final int degreeId, final String studentList, final String customMeritListName) {
        String meritListname = customMeritListName;
        if (customMeritListName == null)
            meritListname = admissionNotificationService.getMeritListName(sessionId, degreeId);
        MeritListTransactionEntity[] meritList =
            new Gson().fromJson("[" + studentList + "]", MeritListTransactionEntity[].class);
        return studentMeritListDao.transferMeritList(meritListname, meritList);
    }

    @Override
    public List<TempStudentRegistrationEntity> getMeritList(final int meritListId) {
        return studentMeritListDao.getMeritList(meritListId);
    }

    @Override
    public List<MeritListStoreMaster> viewAllMeritList() {
        return studentMeritListDao.viewAllMeritList();
    }

    @Override
    public String getMeritListNameById(final int meritListId) {
        return studentMeritListDao.getMeritListNameById(meritListId);
    }

    @Override
    public int editMeritList(final String meritListName1, MeritListTransactionEntity[] studentList1) {
        MeritListTransactionEntity[] meritListTransactionEntities =
            new Gson().fromJson("[" + studentList1 + "]", MeritListTransactionEntity[].class);

        return studentMeritListDao.editMeritList(meritListName1, meritListTransactionEntities);
    }

    @Override
    public List<TempStudentRegistrationEntity> getMeritListByStudentId(final int meritListId,final String id) {
        return studentMeritListDao.getMeritListByStudentId(meritListId, id);
    }

    @Override
    public int updateMeritList(final String meritListName, final String studentList) {
        MeritListTransactionEntity[] entities = new Gson().fromJson("[" + studentList + "]", MeritListTransactionEntity[].class);
        return studentMeritListDao.updateMeritList(meritListName, entities);
    }

    @Override
    public List<DynamicJasperColumnNameModel> getMeritListReport(final int meritListId) {
        List<TempStudentRegistrationEntity> tempStudentList = studentMeritListDao.getMeritList(meritListId);
        
        List<DynamicJasperColumnNameModel> jasperReportList  = new ArrayList<DynamicJasperColumnNameModel>();
        
        for(TempStudentRegistrationEntity list :tempStudentList){
            DynamicJasperColumnNameModel model = new DynamicJasperColumnNameModel();
                       
            /** Set Column Name is to be Display 
             * on Report.
             */
            model.setNameCol1("Sr. No.");
            model.setNameCol2("Application Id");
            model.setNameCol5("Student Name");
            model.setNameCol8("Middle Name");
            model.setNameCol11("Last Name");
            model.setNameCol14("Gender");
            model.setNameCol16("AIR");
            model.setNameCol17("Category");
            
            /** Set Column Data is to be Display 
             * on above column.
             */
            model.setIntCol1(list.getId());
            model.setStrCol2(list.getApplicationId());
            model.setStrCol5(list.getStudentName());
            model.setStrCol8(list.getFatherName());
            model.setStrCol11(list.getLastName());
            model.setStrCol14(list.getGenderName());
            model.setIntCol16(list.getEntranceExamRank());
            model.setStrCol17(list.getCategory());
                       
            jasperReportList.add(model);
        }
        
        return jasperReportList;
    }

}
