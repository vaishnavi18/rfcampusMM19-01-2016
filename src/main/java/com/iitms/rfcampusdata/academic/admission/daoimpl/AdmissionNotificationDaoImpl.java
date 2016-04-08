package com.iitms.rfcampusdata.academic.admission.daoimpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.academic.admission.dao.AdmissionNotificationDao;
import com.iitms.rfcampusdata.academic.admission.entity.AdmissionNotificationDTO;
import com.iitms.rfcampusdata.academic.admission.entity.AdmissionNotificationEntity;
import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchPrefrenceMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;

@Repository
public class AdmissionNotificationDaoImpl implements AdmissionNotificationDao {

    private static final Logger LOG = LoggerFactory.getLogger(AdmissionNotificationDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public int addAdmissionNotification(AdmissionNotificationEntity admissionNotificationEntity)
        throws GenericException {
        try {
            Session session = this.sessionFactory.getCurrentSession();
            AdmissionNotificationEntity entity;
            for (String branchId : admissionNotificationEntity.getBranchIds().split(",")) {
                entity = new AdmissionNotificationEntity();
                admissionNotificationEntity.setBranchId(Integer.parseInt(branchId));
                entity.setNotificationParameter(admissionNotificationEntity);
                session.save(entity);
            }

            return ConstantUtil.RECORD_INSERTED;
        } catch (Exception e) {
            throw new GenericException("Error while Adding Admission Notification");
        }

    }

    @Override
    public int updateAdmissionNotification(AdmissionNotificationEntity admissionNotificationEntity)
        throws GenericException {
        try {
            Session session = this.sessionFactory.getCurrentSession();

            AdmissionNotificationEntity sessionEntity = (AdmissionNotificationEntity) session
                .get(AdmissionNotificationEntity.class, admissionNotificationEntity.getId());
            for (String branchId : admissionNotificationEntity.getBranchIds().split(",")) {
                admissionNotificationEntity.setBranchId(Integer.parseInt(branchId));
                sessionEntity.setNotificationParameter(admissionNotificationEntity);
                session.update(sessionEntity);
            }

            return ConstantUtil.RECORD_UPDATED;
        } catch (Exception e) {
            throw new GenericException("Error while Updating Admission Notification");
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<AdmissionNotificationEntity> getAdmissionNotificationList(int sessionId, int degreeId, int branchId)
        throws GenericException {
        try {
            Session session = this.sessionFactory.getCurrentSession();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("branchMasterEntity.branchShortName").as("branchShortName"));
            projectionList.add(Projections.property("academicSessionEntity.sessionName").as("sessionName"));
            projectionList.add(Projections.property("id").as("id"));
            projectionList.add(Projections.property("sessionId").as("sessionId"));
            projectionList.add(Projections.property("degreeId").as("degreeId"));
            projectionList.add(Projections.property("branchId").as("branchId"));
            projectionList.add(Projections.property("admissionStartDate").as("admissionStartDate"));
            projectionList.add(Projections.property("admissionEndDate").as("admissionEndDate"));
            projectionList.add(Projections.property("admissionPrintDate").as("admissionPrintDate"));
            projectionList.add(Projections.property("prefix").as("prefix"));
            projectionList.add(Projections.property("startNumber").as("startNumber"));
            projectionList.add(Projections.property("sufix").as("sufix"));

            Criteria criteria = session.createCriteria(AdmissionNotificationEntity.class)
                .createAlias("branchMasterEntity", "branchMasterEntity")
                .createAlias("academicSessionEntity", "academicSessionEntity").setProjection(projectionList);
            if (sessionId != 0) {
                criteria.add(Restrictions.eq("sessionId", sessionId));
            }
            if (degreeId != 0) {
                criteria.add(Restrictions.eq("degreeId", degreeId));
            }
            if (branchId != 0) {
                criteria.add(Restrictions.eq("branchId", branchId));
            }

            criteria.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
            List<AdmissionNotificationEntity> list = criteria.list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error while Getting Admission Notification List");
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<AdmissionNotificationDTO> getAdmissionNotification(int notificationId) throws GenericException {
        try {
            Session session = this.sessionFactory.getCurrentSession();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("branchMaster.branchShortName").as("branch"));
            projectionList.add(Projections.property("academicSession.sessionName").as("session"));
            projectionList.add(Projections.property("degreeMaster.degreeName").as("degree"));
            projectionList.add(Projections.property("admissionStartDate").as("admissionStartDate"));
            projectionList.add(Projections.property("admissionEndDate").as("admissionEndDate"));
            projectionList.add(Projections.property("admissionPrintDate").as("admissionPrintDate"));

            Criteria criteria = session.createCriteria(AdmissionNotificationEntity.class)
                .createAlias("branchMasterEntity", "branchMaster")
                .createAlias("academicSessionEntity", "academicSession")
                .createAlias("degreeMasterEntity", "degreeMaster").setProjection(projectionList)
                .add(Restrictions.eq("id", notificationId));

            criteria.setResultTransformer(new AliasToBeanResultTransformer(AdmissionNotificationDTO.class));
            List<AdmissionNotificationDTO> list = criteria.list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error while Getting Admission Notification");
        }
    }

    @Override
    public boolean isAdmissionNotificationExist(int sessionId, int degreeId) throws GenericException {
        try {
            Session session = this.sessionFactory.getCurrentSession();

            Criteria criteria =
                session.createCriteria(AdmissionNotificationEntity.class).setProjection(Projections.rowCount());
            if (sessionId != 0) {
                criteria.add(Restrictions.eq("sessionId", sessionId));
            }
            if (degreeId != 0) {
                criteria.add(Restrictions.eq("degreeId", degreeId));
            }
            Object o = criteria.uniqueResult();
            return (o != null ? true : false);
        } catch (Exception e) {
            throw new GenericException("Error while isAdmissionNotificationExist");
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<BranchMasterEntity> getActiveBranchList() throws GenericException {
        try {
            Session session = this.sessionFactory.getCurrentSession();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("branchMasterEntity.branchDegreeNumber").as("branchDegreeNumber"));
            projectionList.add(Projections.property("branchMasterEntity.branchShortName").as("branchShortName"));
            projectionList.add(Projections.property("branchId").as("branchId"));

            String currentDate = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(new Date());

            List<BranchMasterEntity> degreeList = session.createCriteria(AdmissionNotificationEntity.class)
                .createAlias("branchMasterEntity", "branchMasterEntity").setProjection(projectionList)
                .add(Restrictions.sqlRestriction(
                    "to_timestamp('" + currentDate + "', 'DD-MM-YYYY HH24:MI') >= this_.admission_start_date "))
                .add(Restrictions.sqlRestriction(
                    "to_timestamp('" + currentDate + "', 'DD-MM-YYYY HH24:MI') <= this_.admission_end_date"))
                .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).addOrder(Order.asc("degreeId")).list();

            return degreeList;
        } catch (Exception e) {
            throw new GenericException("Error while Getting Active Branch List");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<DegreeMasterEntity> getActiveDegrees() throws GenericException {
        try {
            Session session = this.sessionFactory.getCurrentSession();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.distinct(Projections.property("degreeId").as("degreeId")));
            projectionList.add(Projections.property("degreeMasterEntity.degreeName").as("degreeName"));
            projectionList.add(Projections.property("degreeMasterEntity.id").as("id"));

            String currentDate = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(new Date());

            List<DegreeMasterEntity> degreeList = session.createCriteria(AdmissionNotificationEntity.class)
                .createAlias("degreeMasterEntity", "degreeMasterEntity").setProjection(projectionList)
                .add(Restrictions.sqlRestriction(
                    "to_timestamp('" + currentDate + "', 'DD-MM-YYYY HH24:MI') >= this_.admission_start_date"))
                .add(Restrictions.sqlRestriction(
                    "to_timestamp('" + currentDate + "', 'DD-MM-YYYY HH24:MI') <= this_.admission_end_date"))
                .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).addOrder(Order.asc("degreeId")).list();

            return degreeList;
        } catch (Exception e) {
            throw new GenericException("Error while Getting Active Degrees");
        }
    }

    @Override
    public int deleteAdmissionNotification(int notificationId) throws GenericException {
        try {
            this.sessionFactory.getCurrentSession()
                .createQuery("Delete From AdmissionNotificationEntity entity where entity.id = :id")
                .setParameter("id", notificationId).executeUpdate();

            return ConstantUtil.RECORD_DELETED;
        } catch (Exception e) {
            throw new GenericException("Error while Deleting Admission Notification");
        }

    }

    @Override
    public String getMeritListName(int sessionId, int degreeId) throws GenericException {
        try {
            Session session = this.sessionFactory.getCurrentSession();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("degreeMasterEntity.degreeName"));
            projectionList.add(Projections.property("academicSessionEntity.sessionName"));

            Object[] object = (Object[]) session.createCriteria(AdmissionNotificationEntity.class)
                .createAlias("degreeMasterEntity", "degreeMasterEntity")
                .createAlias("academicSessionEntity", "academicSessionEntity").setProjection(projectionList)
                .add(Restrictions.eq("sessionId", sessionId)).add(Restrictions.eq("degreeId", degreeId))
                .setFirstResult(0).setMaxResults(1).uniqueResult();

            return object[0] + " - " + object[1];
        } catch (Exception e) {
            throw new GenericException("Error while Getting Merit List Name");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<AcademicSessionMasterEntity> getActiveSessionList() throws GenericException {
        try {
            Session session = this.sessionFactory.getCurrentSession();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.distinct(Projections.property("sessionId").as("id")));
            projectionList.add(Projections.property("academicSessionEntity.sessionName").as("sessionName"));

            List<AcademicSessionMasterEntity> list = session.createCriteria(AdmissionNotificationEntity.class)
                .createAlias("academicSessionEntity", "academicSessionEntity").setProjection(projectionList)
                .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error while GEtting Active Session List");
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Integer> getAlreadyRegisteredBranches() throws GenericException {
        try {
            List<Integer> branchIds =
                this.sessionFactory.getCurrentSession().createCriteria(BranchPrefrenceMasterEntity.class)
                    .setProjection(Projections.distinct(Projections.property("branchPrefNo"))).list();
            return branchIds;
        } catch (Exception e) {
            throw new GenericException("Error while Getting Already Registered Branches");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<BranchMasterEntity> getAllBranchList() throws GenericException {
        try {
            List<BranchMasterEntity> branchList =
                this.sessionFactory.getCurrentSession().createCriteria(BranchMasterEntity.class).list();
            return branchList;
        } catch (Exception e) {
            throw new GenericException("Error while : Getting All Branch List");
        }

    }

}
