package com.iitms.rfcampusdomain.payroll.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.authentication.entity.UserMasterEntity;
import com.iitms.rfcampusdata.payroll.dto.PayrollMasterDTO;
import com.iitms.rfcampusdata.payroll.dto.PayscaleDTO;
import com.iitms.rfcampusdata.payroll.masters.dao.EmployeeMasterPayrollDao;
import com.iitms.rfcampusdata.payroll.masters.entity.EmployeeMasterEntity;
import com.iitms.rfcampusdomain.payroll.service.EmployeeMasterPayrollService;

@Service
@Transactional
public class EmployeePayrollServiceImpl implements EmployeeMasterPayrollService {

    @Autowired
    EmployeeMasterPayrollDao employeeMasterPayrollDao;

    @Override
    public int addEmployeePayroll(EmployeeMasterEntity employeeMaster) {
        return employeeMasterPayrollDao.addEmployeePayroll(employeeMaster);
    }

    @Override
    public String updateEmployeePayroll(EmployeeMasterEntity employeeMaster) {
        return null;
    }

    @Override
    public List<PayrollMasterDTO> getPayrollDetail(int genderId, int categoryId, int casteId, int nationalityId) {
        return employeeMasterPayrollDao.getPayrollDetail(genderId, categoryId, casteId, nationalityId);

    }

    @Override
    public List<PayscaleDTO> getPayscale(Integer[] object) {
        return employeeMasterPayrollDao.getPayScale(object);
    }

    @Override
    public float getGradePay(int id) {
        return employeeMasterPayrollDao.getGradePay(id);
    }

    @Override
    public int getIdNumber(int userId) {
        return employeeMasterPayrollDao.getIdNumber(userId);
    }

    @Override
    public List<EmployeeMasterEntity> searchStudentsByCriteria(int searchBy, String searchText) {
        return employeeMasterPayrollDao.searchStudentsByCriteria(searchBy, searchText);
    }

}
