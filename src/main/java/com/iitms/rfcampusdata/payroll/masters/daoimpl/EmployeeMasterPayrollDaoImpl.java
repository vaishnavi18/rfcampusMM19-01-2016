package com.iitms.rfcampusdata.payroll.masters.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.payroll.dto.PayrollMasterDTO;
import com.iitms.rfcampusdata.payroll.dto.PayscaleDTO;
import com.iitms.rfcampusdata.payroll.masters.dao.EmployeeMasterPayrollDao;
import com.iitms.rfcampusdata.payroll.masters.entity.EmployeeMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.PayscaleMasterEntity;

@Repository
public class EmployeeMasterPayrollDaoImpl implements EmployeeMasterPayrollDao {

    // private static final Logger logger = LoggerFactory.getLogger(EmployeeMasterPayrollDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public int addEmployeePayroll(EmployeeMasterEntity employeeMaster) {
        Session session = this.sessionFactory.getCurrentSession();
        // employeeMaster.setId(employeeMaster.getId());
        session.save(employeeMaster);
        return ConstantUtil.RECORD_INSERTED;
    }

    @Override
    public String updateEmployeePayroll(EmployeeMasterEntity employeeMaster) {
        return null;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<PayrollMasterDTO> getPayrollDetail(int genderId, int categoryId, int casteId, int nationalityId) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("payrollGenderMasterEntity.genderName").as("genderName"));
        projectionList.add(Projections.property("payrollCategoryMasterEntity.categoryName").as("categoryName"));
        projectionList.add(Projections.property("payrollCasteMasterEntity.caste").as("caste"));
        projectionList.add(Projections.property("payrollNationalityMasterEntity.nationality").as("nationality"));

        Criteria criteria = session.createCriteria(PayrollMasterDTO.class)
            .createAlias("payrollGenderMasterEntity", "payrollGenderMasterEntity")
            .createAlias("payrollCategoryMasterEntity", "payrollCategoryMasterEntity")
            .createAlias("payrollCasteMasterEntity", "payrollCasteMasterEntity")
            .createAlias("payrollNationalityMasterEntity", "payrollNationalityMasterEntity")
            .setProjection(projectionList);

        criteria.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
        List<PayrollMasterDTO> list = criteria.list();

        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<PayscaleDTO> getPayScale(Integer[] ruleNumber) {
        Session session = this.sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("scale").as("scale"));
        projectionList.add(Projections.property("gradePay").as("gradePay"));
        projectionList.add(Projections.property("ruleNumber").as("ruleNumber"));
        List<PayscaleDTO> list = session.createCriteria(PayscaleMasterEntity.class).setProjection(projectionList)
            .add(Restrictions.in("ruleNumber", ruleNumber))
            .setResultTransformer(new AliasToBeanResultTransformer(PayscaleDTO.class)).list();
        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public float getGradePay(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        String queryDel = "from PayscaleMasterEntity where id =:id";
        Query query = session.createQuery(queryDel).setParameter("id", id);
        List<PayscaleMasterEntity> list = query.list();
        return list.get(0).getGradePay();
    }

    @SuppressWarnings("unused")
    @Override
    // @SuppressWarnings("unchecked")
    public int getIdNumber(int userId) {
        Session session = sessionFactory.getCurrentSession();

        EmployeeMasterEntity userCounter = (EmployeeMasterEntity) session.get(EmployeeMasterEntity.class, userId);
        /* EmployeeMasterEntity userCounter = (EmployeeMasterEntity).getIdNumber(userId); */

        int maxId = ((Integer) session.createCriteria(EmployeeMasterEntity.class).setProjection(Projections.max("id"))
            .uniqueResult()).intValue();
        System.out.println("max id" + maxId);
        return (maxId + 1);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<EmployeeMasterEntity> searchStudentsByCriteria(int searchBy, String searchText) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("lastName").as("lastName"));
        projectionList.add(Projections.property("firstName").as("firstName"));

        Criteria criteria = session.createCriteria(EmployeeMasterEntity.class).setProjection(projectionList)
            .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);

        switch (searchBy) {
            case ConstantUtil.USER_NAME: {
                criteria.add(Restrictions.ilike("firstName", searchText + "%"));
            }
                break;
            case ConstantUtil.USER_ID: {
                criteria.add(Restrictions.eq("id", Integer.parseInt(searchText)));
            }
                break;
            case ConstantUtil.LOGIN_ID: {
                criteria.add(Restrictions.ilike("lastName", searchText + "%"));
            }
                break;
        }

        List<EmployeeMasterEntity> list = criteria.list();

        return list;
    }

}
