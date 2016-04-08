package com.iitms.rfcampuspresentation.academic.studentsection.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.academic.masters.entity.SelectedPropertiesMasterEntity;
import com.iitms.rfcampuspresentation.academic.studentsection.dao.StudentSelectedFiledsDao;

@Repository
public class StudentSelectedFiledsDaoImpl implements StudentSelectedFiledsDao {

    private static final Logger Log = LoggerFactory.getLogger(StudentSelectedFiledsDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<SelectedPropertiesMasterEntity> getAllAcademicProperties() {
        List<SelectedPropertiesMasterEntity> list = this.sessionFactory.getCurrentSession()
            .createCriteria(SelectedPropertiesMasterEntity.class).add(Restrictions.eq("module", "ACAD")).list();

        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<SelectedPropertiesMasterEntity> getSelectedProperties(
        SelectedPropertiesMasterEntity[] selectedFieldsArray, SelectedPropertiesMasterEntity[] orderByArray,
        SelectedPropertiesMasterEntity restrictions) {
        Session session = this.sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();

        Criteria selectedFieldCriteria = session.createCriteria(StudentAdmissionEntity.class);

        for (SelectedPropertiesMasterEntity property : selectedFieldsArray) {
            if (!property.getAliasName().equals("N")) {
                Log.info("Create Alias : " + property.getAliasName());
                selectedFieldCriteria.createAlias(property.getAliasName(), property.getAliasName());
            }
            projectionList.add(Projections.property(property.getPropertyName()).as(property.getDisplayPropertyName()));
        }

        addRestriction(selectedFieldCriteria, restrictions);

        for (SelectedPropertiesMasterEntity orderByProperty : orderByArray) {
            selectedFieldCriteria.addOrder(Order.asc(orderByProperty.getPropertyName()));
        }
        List<SelectedPropertiesMasterEntity> list = selectedFieldCriteria.setProjection(projectionList)
            .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

        return list;
    }

    /*--------------------Private Methods-----------------------*/
    private void addRestriction(Criteria selectedFieldCriteria, SelectedPropertiesMasterEntity restrictions) {

        if (restrictions.getDegreeId() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("degreeId", restrictions.getDegreeId()));
        }
        if (restrictions.getBranchNumber() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("branchNumber", restrictions.getBranchNumber()));
        }
        if (restrictions.getCasteId() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("casteId", restrictions.getCasteId()));
        }
        if (restrictions.getCategoryId() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("categoryId", restrictions.getCategoryId()));
        }
        if (restrictions.getReligionId() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("religionId", restrictions.getReligionId()));
        }
        if (restrictions.getNationalityId() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("nationalityId", restrictions.getNationalityId()));
        }
        if (restrictions.getAdmittedToYear() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("admittedToYear", restrictions.getAdmittedToYear()));
        }
        if (restrictions.getSemesterId() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("semesterId", restrictions.getSemesterId()));
        }
        if (restrictions.getBatchId() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("batchId", restrictions.getBatchId()));
        }
        if (restrictions.getPaymentType() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("paymentType", restrictions.getPaymentType()));
        }
        if (restrictions.getBloodGroupId() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("bloodGroupId", restrictions.getBloodGroupId()));
        }
        if (restrictions.getMotherTongueId() != 0) {
            selectedFieldCriteria.add(Restrictions.eq("motherTongueId", restrictions.getMotherTongueId()));
        }

    }

}
