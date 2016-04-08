package com.iitms.rfcampusdomain.payroll.service;

import java.util.List;

import com.iitms.rfcampusdata.payroll.dto.EmployeeMasterDTO;
import com.iitms.rfcampusdata.payroll.dto.EmployeeMasterDTOList;
import com.iitms.rfcampusdata.payroll.dto.StaffMasterDTO;

/**
 * 
 * @author Sachinmt
 *
 */
public interface EmployeeAttendanceEntryPayrollService {
    
    public int updateAddendanceEntry(EmployeeMasterDTOList employeeMasterDTOList);
    public int updateSequenceNumber(EmployeeMasterDTOList employeeMasterDTOList);
    public List<StaffMasterDTO>getStaffCategoryList();
    public List<EmployeeMasterDTO>getEmployeeInfo(Integer[] staffcategryId);
    public List<EmployeeMasterDTO>getEmployeePayInfo(Integer[] staffCategoryId);
    
}
