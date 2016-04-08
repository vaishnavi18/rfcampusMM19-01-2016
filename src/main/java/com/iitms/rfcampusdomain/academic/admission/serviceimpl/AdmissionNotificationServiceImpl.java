package com.iitms.rfcampusdomain.academic.admission.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.admission.dao.AdmissionNotificationDao;
import com.iitms.rfcampusdata.academic.admission.entity.AdmissionNotificationDTO;
import com.iitms.rfcampusdata.academic.admission.entity.AdmissionNotificationEntity;
import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;
import com.iitms.rfcampusdomain.academic.admission.service.AdmissionNotificationService;

@Service
@Transactional
public class AdmissionNotificationServiceImpl implements AdmissionNotificationService{

    @Autowired
    private AdmissionNotificationDao admissionNotificationDao;
    
    @Override
    public int addAdmissionNotification(AdmissionNotificationEntity admissionNotificationEntity) {
        if(admissionNotificationEntity.getId() == 0){
            return admissionNotificationDao.addAdmissionNotification(admissionNotificationEntity);
        }else{
            return this.updateAdmissionNotification(admissionNotificationEntity);
        }
        
    }

    @Override
    public int updateAdmissionNotification(AdmissionNotificationEntity admissionNotificationEntity) {
        return admissionNotificationDao.updateAdmissionNotification(admissionNotificationEntity);
    }

    @Override
    public List<AdmissionNotificationEntity> getAdmissionNotificationList(int sessionId, int degreeTypeId, int degreeId) {
        return admissionNotificationDao.getAdmissionNotificationList(sessionId, degreeTypeId, degreeId);
    }

    @Override
    public boolean isAdmissionNotificationExist(int sessionId, int degreeId) {
        return admissionNotificationDao.isAdmissionNotificationExist(sessionId, degreeId);
    }

    @Override
    public List<BranchMasterEntity> getActiveBranchList() {
        return admissionNotificationDao.getActiveBranchList();
    }

    @Override
    public int deleteAdmissionNotification(int notificationId) {
        return admissionNotificationDao.deleteAdmissionNotification(notificationId);
    }

    @Override
    public List<DegreeMasterEntity> getActiveDegrees() {
        return admissionNotificationDao.getActiveDegrees();
    }

    @Override
    public String getMeritListName(int sessionId, int degreeTypeId) {
        String meritListName = "Merit List For ";
        meritListName += admissionNotificationDao.getMeritListName(sessionId, degreeTypeId);
        return meritListName;
    }

    @Override
    public List<AcademicSessionMasterEntity> getActiveSessionList() {
        return admissionNotificationDao.getActiveSessionList();
    }

    @Override
    public List<Integer> getAlreadyRegisteredBranches() {
        return admissionNotificationDao.getAlreadyRegisteredBranches();
    }

    @Override
    public List<AdmissionNotificationDTO> getAdmissionNotification(int notificationId) {
        return admissionNotificationDao.getAdmissionNotification(notificationId);
    }

    @Override
    public List<BranchMasterEntity> getAllBranchList() {
        List<BranchMasterEntity> branchList = admissionNotificationDao.getAllBranchList(); 
        for(BranchMasterEntity branch : branchList){
            branch.setAdmissionDegreeMasterEntity(new DegreeMasterEntity());
        }
        return branchList;
    }

}
