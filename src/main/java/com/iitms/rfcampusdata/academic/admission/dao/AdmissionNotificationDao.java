package com.iitms.rfcampusdata.academic.admission.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.admission.entity.AdmissionNotificationDTO;
import com.iitms.rfcampusdata.academic.admission.entity.AdmissionNotificationEntity;
import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;

public interface AdmissionNotificationDao {

    public int addAdmissionNotification(AdmissionNotificationEntity admissionNotificationEntity);

    public int updateAdmissionNotification(AdmissionNotificationEntity admissionNotificationEntity);

    public int deleteAdmissionNotification(int notificationId);

    public List<AdmissionNotificationEntity> getAdmissionNotificationList(int sessionId, int degreeTypeId,
        int degreeId);

    // for printing notification report
    public List<AdmissionNotificationDTO> getAdmissionNotification(int notificationId);

    public boolean isAdmissionNotificationExist(int sessionId, int degreeId);

    public List<AcademicSessionMasterEntity> getActiveSessionList();

    public List<BranchMasterEntity> getActiveBranchList();

    public List<DegreeMasterEntity> getActiveDegrees();

    public String getMeritListName(int sessionId, int degreeTypeId);

    public List<Integer> getAlreadyRegisteredBranches();

    public List<BranchMasterEntity> getAllBranchList();

}
