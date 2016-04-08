package com.iitms.rfcampusdomain.payroll.service;

import java.util.List;

import com.iitms.rfcampusdata.payroll.dto.PayrollMasterDTO;
import com.iitms.rfcampusdata.payroll.dto.PayscaleDTO;
import com.iitms.rfcampusdata.payroll.masters.entity.EmployeeMasterEntity;

public interface EmployeeMasterPayrollService {
    
    public int addEmployeePayroll(EmployeeMasterEntity employeeMaster);

    public String updateEmployeePayroll(EmployeeMasterEntity employeeMaster);
    
    public List<PayrollMasterDTO> getPayrollDetail(int genderId, int categoryId, int casteId, int nationalityId);
    
    public List<PayscaleDTO> getPayscale(Integer[] object);
    
    public float getGradePay(int id);
    
    public int getIdNumber(int userId);
    
    // for search by criteria
    public List<EmployeeMasterEntity> searchStudentsByCriteria(int searchBy, String searchText);

}
