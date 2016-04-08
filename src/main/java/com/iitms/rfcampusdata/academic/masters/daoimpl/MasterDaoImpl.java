package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Criterion;
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
//import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.academic.masters.dao.MasterDao;
import com.iitms.rfcampusdata.academic.masters.entity.MasterData;
import com.iitms.rfcampusdata.academic.masters.entity.MasterFields;

@Repository
public class MasterDaoImpl implements MasterDao {

    private static final Logger Log = LoggerFactory.getLogger(MasterDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<MasterData> loadMasterFields(Class criteriaClass, String[] propertyName) throws GenericException {
        Session session = this.sessionFactory.getCurrentSession();
        List<MasterData> list = new ArrayList<MasterData>();
        try {

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("id").as("id"));
            Log.info("propertyName : " + propertyName);
            int count = 1;
            for (String property : propertyName) {
                Log.info("property : " + property);
                projectionList.add(Projections.property(property).as("field" + (count++)));
            }

            list = session.createCriteria(criteriaClass).setProjection(projectionList)
                .setResultTransformer(new AliasToBeanResultTransformer(MasterData.class)).list();
        } catch (Exception ex) {
            Log.debug("Exception in loadMasterFields Method: " + ex);
            throw new GenericException("Exception in LoadMasterFields Method", ex);
        }
        return list;
    }

    @Override
    public int addmaster(Serializable model) {
        Log.info("Model : " + model);
        Session session = this.sessionFactory.getCurrentSession();
        session.save(model);
        return ConstantUtil.RECORD_INSERTED;
    }

    @Override
    public int updateMaster(Serializable model, MasterFields masterFields) {
        Session session = this.sessionFactory.getCurrentSession();
        Object model1 = session.get(masterFields.getEntityName(), masterFields.getRecordId());
        try {
            Class<?> theClass = Class.forName(masterFields.getEntityName());

            String[] properties = masterFields.getPropertyName().split(",");
            int count = 1;
            for (String cur_property : properties) {
                String setterName = "set" + cur_property.substring(0, 1).toUpperCase() + cur_property.substring(1);
                Method m = theClass.getMethod(setterName, String.class);
                String getterName = "getField" + count + "Name";
                Method getterMethod = masterFields.getClass().getMethod(getterName);
                String value = (String) getterMethod.invoke(masterFields);
                m.invoke(model1, value);
                count++;
            }
            session.update(model1);
            return ConstantUtil.RECORD_UPDATED;
        } catch (Exception ex) {
            System.out.println(ex);

        }

        /*
         * Query hqlQuery = getUpdateQuery(session, masterFields); hqlQuery.executeUpdate();
         */
        return 10;
    }

    private Query getUpdateQuery(Session session, MasterFields masterFields) {
        String hqlQueryString = "Update " + masterFields.getEntityName() + " entity set ";
        Query hqlQuery = null;
        String[] properties = masterFields.getPropertyName().split(",");

        switch (masterFields.getRuntimeClass().getSimpleName()) {

            case "DegreeMasterEntity": {

                hqlQueryString += "entity." + properties[0] + "= :" + properties[0];
                hqlQueryString += ", entity." + properties[1] + "= :" + properties[1];
                hqlQueryString += " where entity.id= :id";

                hqlQuery = session.createQuery(hqlQueryString).setParameter(properties[0], masterFields.getField1Name())
                    .setParameter(properties[1], masterFields.getField2Name()).setParameter("id", masterFields.getId());

                break;
            }

            case "CasteMasterEntity": {
                break;
            }
            case "ReligionMasterEntity": {
                break;
            }

            case "YearMasterEntity": {
                break;
            }
            case "BatchMasterEntity": {
                break;
            }

            case "BloodGroupMasterEntity": {
                break;
            }
            case "BranchMasterEntity": {
                break;
            }

            case "CategoryMasterEntity": {
                break;
            }
            case "NationalityMasterEntity": {
                break;
            }

            case "SemesterMasterEntity": {
                break;
            }
            case "PaymentTypeMasterEntity": {
                break;
            }

            case "MothertongueMasterEntity": {
                hqlQueryString += "entity." + properties[0] + "= :" + properties[0];
                hqlQueryString += " where entity.id= :id";

                hqlQuery = session.createQuery(hqlQueryString).setParameter(properties[0], masterFields.getField1Name())
                    .setParameter("id", masterFields.getId());
                break;
            }
            case "DocumentListMasterEntity": {
                break;
            }
            case "AcademicSessionMasterEntity": {
                break;
            }
            case "CountryMasterEntity": {
                break;
            }
            case "StateMasterEntity": {
                break;
            }
            case "StudentStatusMasterEntity": {
                hqlQueryString += "entity." + properties[0] + "= :" + properties[0];
                hqlQueryString += " where entity.id= :id";

                hqlQuery = session.createQuery(hqlQueryString).setParameter(properties[0], masterFields.getField1Name())
                    .setParameter("id", masterFields.getId());
                break;
            }
            case "BankMasterEntity": {
                break;
            }
            case "PhysicallyHandicappedMasterEntity": {
                hqlQueryString += "entity." + properties[0] + "= :" + properties[0];
                hqlQueryString += " where entity.id= :id";

                hqlQuery = session.createQuery(hqlQueryString).setParameter(properties[0], masterFields.getField1Name())
                    .setParameter("id", masterFields.getId());
                break;
            }
            case "OccupationMasterEntity": {
                break;
            }
            case "EducationMasterEntity": {
                break;
            }
            case "ScholarshipTypeMasterEntity": {
                break;
            }
            case "FloorMasterEntity": {
                hqlQueryString += "entity." + properties[0] + "= :" + properties[0];
                hqlQueryString += " where entity.id= :id";

                hqlQuery = session.createQuery(hqlQueryString).setParameter(properties[0], masterFields.getField1Name())
                    .setParameter("id", masterFields.getId());
                break;
            }
        }
        return hqlQuery;
    }

    @Override
    public boolean isRecordExist(MasterFields masterFields) {
        Session session = this.sessionFactory.getCurrentSession();
        Conjunction conjunction = Restrictions.conjunction();
        Long rec_count = 0L;
        try {
            String[] properties = masterFields.getPropertyName().split(",");
            int count = 1;
            for (String cur_property : properties) {
                String methodName = "getField" + count + "Name";
                Method m = masterFields.getClass().getMethod(methodName);
                String value = (String) m.invoke(masterFields);
                conjunction.add(Restrictions.eq(cur_property, value));
                count++;
            }

            rec_count = (Long) session.createCriteria(masterFields.getRuntimeClass())
                .setProjection(Projections.rowCount()).add(conjunction)
                // .add(Restrictions.eq(masterFields.getPropertyName(), masterFields.getField1Name()))
                .add(Restrictions.ne("id", masterFields.getRecordId())).uniqueResult();

            Log.info("Count : " + rec_count);
        } catch (Exception ex) {
            Log.debug("Exception in isRecordExist method" + ex);
            throw new GenericException("Exception in isRecordExist method", ex);
        }
        return (rec_count.intValue() != 0 ? true : false);
    }

    private Criterion restriction(MasterFields masterFields) {
        Conjunction conjunction = Restrictions.conjunction();
        String[] properties = masterFields.getPropertyName().split(",");

        switch (masterFields.getRuntimeClass().getSimpleName()) {

            case "DegreeMasterEntity": {
                conjunction.add(Restrictions.eq(properties[0], masterFields.getField1Name()));
                conjunction.add(Restrictions.eq(properties[1], masterFields.getField2Name()));
                break;
            }

            case "CasteMasterEntity": {
                break;
            }
            case "ReligionMasterEntity": {
                break;
            }

            case "YearMasterEntity": {
                break;
            }
            case "BatchMasterEntity": {
                break;
            }

            case "BloodGroupMasterEntity": {
                break;
            }
            case "BranchMasterEntity": {
                break;
            }

            case "CategoryMasterEntity": {
                break;
            }
            case "NationalityMasterEntity": {
                break;
            }

            case "SemesterMasterEntity": {
                break;
            }
            case "PaymentTypeMasterEntity": {
                break;
            }

            case "MothertongueMasterEntity": {
                conjunction.add(Restrictions.eq(properties[0], masterFields.getField1Name()));
                break;
            }
            case "DocumentListMasterEntity": {
                break;
            }
            case "AcademicSessionMasterEntity": {
                break;
            }
            case "CountryMasterEntity": {
                break;
            }
            case "StateMasterEntity": {
                break;
            }
            case "StudentStatusMasterEntity": {
                break;
            }
            case "BankMasterEntity": {
                break;
            }
            case "PhysicallyHandicappedMasterEntity": {
                break;
            }
            case "OccupationMasterEntity": {
                break;
            }
            case "EducationMasterEntity": {
                break;
            }
            case "ScholarshipTypeMasterEntity": {
                break;
            }
            case "FloorMasterEntity": {
                conjunction.add(Restrictions.eq(properties[0], masterFields.getField1Name()));
                break;
            }
        }

        return conjunction;
    }

    @Override
    public List<MasterModel> getMasterData(Class masterClass) {
        Session session = this.sessionFactory.getCurrentSession();
        ProjectionList projectionList = getProjection(masterClass);

        @SuppressWarnings("unchecked")
        List<MasterModel> list = session.createCriteria(masterClass).setProjection(projectionList)
            .addOrder(Order.asc("id")).setResultTransformer(new AliasToBeanResultTransformer(MasterModel.class)).list();

        return list;
    }

    /*------------------------------------------------------------------*/
    @SuppressWarnings("rawtypes")
    private ProjectionList getProjection(Class masterClass) {
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));

        switch (masterClass.getSimpleName()) {

            case "DegreeMasterEntity": {
                projectionList.add(Projections.property("degreeName").as("name"));
                break;
            }

            case "CasteMasterEntity": {
                projectionList.add(Projections.property("caste").as("name"));
                break;
            }
            case "ReligionMasterEntity": {
                projectionList.add(Projections.property("religion").as("name"));
                break;
            }

            case "YearMasterEntity": {
                projectionList.add(Projections.property("year").as("name"));
                break;
            }
            case "BatchMasterEntity": {
                projectionList.add(Projections.property("batchName").as("name"));
                break;
            }

            case "BloodGroupMasterEntity": {
                projectionList.add(Projections.property("bloodGroup").as("name"));
                break;
            }
            case "BranchMasterEntity": {
                projectionList.add(Projections.property("branchShortName").as("name"));
                break;
            }

            case "CategoryMasterEntity": {
                projectionList.add(Projections.property("categoryName").as("name"));
                break;
            }
            case "NationalityMasterEntity": {
                projectionList.add(Projections.property("nationality").as("name"));
                break;
            }

            case "SemesterMasterEntity": {
                projectionList.add(Projections.property("semesterName").as("name"));
                break;
            }
            case "PaymentTypeMasterEntity": {
                projectionList.add(Projections.property("paymentType").as("name"));
                break;
            }

            case "MothertongueMasterEntity": {
                projectionList.add(Projections.property("mothertongue").as("name"));
                break;
            }
            case "DocumentListMasterEntity": {
                projectionList.add(Projections.property("documentName").as("name"));
                break;
            }
            case "AcademicSessionMasterEntity": {
                projectionList.add(Projections.property("sessionName").as("name"));
                break;
            }
            case "CountryMasterEntity": {
                projectionList.add(Projections.property("country").as("name"));
                break;
            }
            case "StateMasterEntity": {
                projectionList.add(Projections.property("state").as("name"));
                break;
            }

            case "DistrictMasterEntity": {
                projectionList.add(Projections.property("districtName").as("name"));
                break;
            }

            case "CityMasterEntity": {
                projectionList.add(Projections.property("cityName").as("name"));
                break;
            }

            case "StudentStatusMasterEntity": {
                projectionList.add(Projections.property("statusType").as("name"));
                break;
            }
            case "BankMasterEntity": {
                projectionList.add(Projections.property("bankName").as("name"));
                break;
            }
            case "PhysicallyHandicappedMasterEntity": {
                projectionList.add(Projections.property("handicapType").as("name"));
                break;
            }
            case "OccupationMasterEntity": {
                projectionList.add(Projections.property("occupation").as("name"));
                break;
            }
            case "EducationMasterEntity": {
                projectionList.add(Projections.property("education").as("name"));
                break;
            }
            case "ScholarshipTypeMasterEntity": {
                projectionList.add(Projections.property("scholarshipType").as("name"));
                break;
            }

            case "StaffTypeMaster": {
                projectionList.add(Projections.property("staffType").as("name"));
                break;
            }

            case "SupplementaryHeadMaster": {
                projectionList.add(Projections.property("supplementaryHead").as("name"));
                break;
            }

            case "NomineeTypeMaster": {
                projectionList.add(Projections.property("nomineeType").as("name"));
                break;
            }

            case "QualificationLevelMaster": {
                projectionList.add(Projections.property("qualificationLevelName").as("name"));
                break;
            }

            case "LoanTypeMaster": {
                projectionList.add(Projections.property("loanType").as("name"));
                break;
            }

            case "ApprovalLevelMaster": {
                projectionList.add(Projections.property("approvalLevelType").as("name"));
                break;
            }

            case "FinancialYearMaster": {
                projectionList.add(Projections.property("financialYear").as("name"));
                break;
            }

            case "CompanyCategoryMaster": {
                projectionList.add(Projections.property("companyCategory").as("name"));
                break;
            }

            case "CurrencyMaster": {
                projectionList.add(Projections.property("currencyName").as("name"));
                break;
            }

            case "JobLocationMaster": {
                projectionList.add(Projections.property("jobLocation").as("name"));
                break;
            }

            case "JobTypeMaster": {
                projectionList.add(Projections.property("jobType").as("name"));
                break;
            }

            case "SelectionTypeMaster": {
                projectionList.add(Projections.property("selectionName").as("name"));
                break;
            }

            case "WorkAreaMaster": {
                projectionList.add(Projections.property("workArea").as("name"));
                break;
            }
            case "TitleMaster": {
                projectionList.add(Projections.property("title").as("name"));
                break;
            }

            case "BudgetHeadMaster": {
                projectionList.add(Projections.property("budgetHeadName").as("name"));
                break;
            }

            case "PayrollCategoryMasterEntity": {
                projectionList.add(Projections.property("categoryName").as("name"));
                break;
            }
            case "PayrollCasteMasterEntity": {
                projectionList.add(Projections.property("caste").as("name"));
                break;
            }

            case "PayrollNationalityMasterEntity": {
                projectionList.add(Projections.property("nationality").as("name"));
                break;
            }
            case "PayrollTitleMaster": {
                projectionList.add(Projections.property("title").as("name"));
                break;
            }
                /*
                 * case "StaffTypeMaster": { projectionList.add(Projections.property("staffType").as("name")); break; }
                 */
            case "PayrollSubdesignationMaster": {
                projectionList.add(Projections.property("subdesignationShortName").as("name"));
                break;
            }
            case "PayrollDesignationMaster": {
                projectionList.add(Projections.property("designation").as("name"));
                break;
            }

            case "AppointmentTypeMasterEntity": {
                projectionList.add(Projections.property("appointmentType").as("name"));
                break;
            }
            case "PayruleMaster": {
                projectionList.add(Projections.property("payruleShortName").as("name"));
                break;
            }
            case "PayscaleMaster": {
                projectionList.add(Projections.property("scale").as("name"));
                projectionList.add(Projections.property("gradePay").as("name1"));
                break;
            }

            case "PayrollBankMasterEntity": {
                projectionList.add(Projections.property("bankName").as("name"));
                break;
            }

            case "PayrollDepartmentMasterEntity": {
                projectionList.add(Projections.property("departmentName").as("name"));
                break;
            }
            case "ProvidentFundMasterEntity": {
                projectionList.add(Projections.property("pfShortName").as("name"));
                break;
            }

            case "StaffMasterEntity": {
                projectionList.add(Projections.property("staffCategory").as("name"));
                break;
            }
        }

        return projectionList;
    }

    @Override
    public MasterFields getStaticFields(String masterType) {

        MasterFields masterFields = (MasterFields) this.sessionFactory.getCurrentSession()
            .createCriteria(MasterFields.class).add(Restrictions.eq("masterType", masterType)).uniqueResult();

        return masterFields;
    }

    @SuppressWarnings("rawtypes")
    @Override
    public List<?> getAllRecords(Class criteriaClass) {

        List<?> allRecords = this.sessionFactory.getCurrentSession().createCriteria(criteriaClass)
            .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

        return allRecords;
    }

}
