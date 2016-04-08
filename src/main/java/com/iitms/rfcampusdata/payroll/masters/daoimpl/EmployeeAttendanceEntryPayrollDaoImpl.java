package com.iitms.rfcampusdata.payroll.masters.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.payroll.dto.EmployeeMasterDTO;
import com.iitms.rfcampusdata.payroll.dto.EmployeeMasterDTOList;
import com.iitms.rfcampusdata.payroll.dto.StaffMasterDTO;
import com.iitms.rfcampusdata.payroll.masters.dao.EmployeeAttendanceEntryPayrollDao;
import com.iitms.rfcampusdata.payroll.masters.entity.EmployeeMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.EmployeePayDetailsMaster;
import com.iitms.rfcampusdata.payroll.masters.entity.StaffMasterEntity;

/**
 * @author Sachinmt
 */
@Repository
public class EmployeeAttendanceEntryPayrollDaoImpl implements EmployeeAttendanceEntryPayrollDao {

    private static final Logger LOG = LoggerFactory.getLogger(EmployeeAttendanceEntryPayrollDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<StaffMasterDTO> getStaffCategoryList() {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("staffCategory").as("staffCategory"));

        List<StaffMasterDTO> list = session.createCriteria(StaffMasterEntity.class).setProjection(projectionList)
            .setResultTransformer(new AliasToBeanResultTransformer(StaffMasterDTO.class)).list();

        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<EmployeeMasterDTO> getEmployeeInfo(Integer[] id) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("sequenceNumber").as("sequenceNumber"));
        projectionList.add(Projections.property("firstName").as("firstName"));
        projectionList.add(Projections.property("middleName").as("middleName"));
        projectionList.add(Projections.property("lastName").as("lastName"));
        projectionList.add(Projections.property("subDesignationNumber").as("subDesignationNumber"));
        projectionList.add(
            Projections.property("payrollSubdesignationMaster.subdesignationLongName").as("subdesignationLongName"));

        List<EmployeeMasterDTO> list = session.createCriteria(EmployeeMasterEntity.class)
            .createAlias("payrollSubdesignationMaster", "payrollSubdesignationMaster", JoinType.LEFT_OUTER_JOIN)
            .setProjection(projectionList).add(Restrictions.in("staffNumber", id))
            .setResultTransformer(new AliasToBeanResultTransformer(EmployeeMasterDTO.class)).list();

        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<EmployeeMasterDTO> getEmployeePayInfo(Integer[] staffCategoryId) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("employeeMasterEntity.id").as("id"));
        projectionList.add(Projections.property("employeeMasterEntity.firstName").as("firstName"));
        projectionList.add(Projections.property("employeeMasterEntity.middleName").as("middleName"));
        projectionList.add(Projections.property("employeeMasterEntity.lastName").as("lastName"));
        projectionList
            .add(Projections.property("employeeMasterEntity.subDesignationNumber").as("subDesignationNumber"));
        projectionList.add(Projections.property("absentDays").as("absentDays"));
        projectionList.add(
            Projections.property("payrollSubdesignationMaster.subdesignationLongName").as("subdesignationLongName"));

        List<EmployeeMasterDTO> list = session.createCriteria(EmployeePayDetailsMaster.class)
            .createAlias("employeeMasterEntity", "employeeMasterEntity", JoinType.LEFT_OUTER_JOIN)
            .createAlias("employeeMasterEntity.payrollSubdesignationMaster", "payrollSubdesignationMaster",
                JoinType.LEFT_OUTER_JOIN)
            .setProjection(projectionList).add(Restrictions.in("employeeMasterEntity.staffNumber", staffCategoryId))

            .setResultTransformer(new AliasToBeanResultTransformer(EmployeeMasterDTO.class)).list();
        return list;
    }

    @Override
    public int updateAttendanceEntry(EmployeeMasterDTOList employeeMasterDTOList) {
        Session session = this.sessionFactory.getCurrentSession();
        LOG.info("Inside updateAttendanceEntry");
        int result = 0;
        for (EmployeeMasterDTO employeeMasterDTO : employeeMasterDTOList.getEmployeeList()) {
            Query query = session.createQuery(
                "update EmployeePayDetailsMaster set absentDays = :absentDays where employeeId = :employeeId");
            query.setParameter("absentDays", employeeMasterDTO.getAbsentDays());
            query.setParameter("employeeId", employeeMasterDTO.getId());
            result = query.executeUpdate();
        }
        return result;
    }

    @Override
    public int updateSequenceNumber(EmployeeMasterDTOList employeeMasterDTOList) {
        Session session = this.sessionFactory.getCurrentSession();
        LOG.info("Inside updateAttendanceEntry");
        int result = 0;
        for (EmployeeMasterDTO employeeMasterDTO : employeeMasterDTOList.getEmployeeList()) {
            Query query =
                session.createQuery("update EmployeeMasterEntity set sequenceNumber = :sequenceNumber where id = :id");
            query.setParameter("sequenceNumber", employeeMasterDTO.getSequenceNumber());
            query.setParameter("id", employeeMasterDTO.getId());
            result = query.executeUpdate();
        }
        return result;
    }
}
