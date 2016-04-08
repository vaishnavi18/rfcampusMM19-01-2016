package com.iitms.rfcampusdata.payroll.masters.dao;

import java.util.List;

import com.iitms.rfcampusdata.payroll.dto.EmployeeMasterDTO;
import com.iitms.rfcampusdata.payroll.dto.EmployeeMasterDTOList;
import com.iitms.rfcampusdata.payroll.dto.StaffMasterDTO;

/**
 * @author Sachinmt
 */
public interface EmployeeAttendanceEntryPayrollDao {

    public int updateAttendanceEntry(EmployeeMasterDTOList employeeMasterDTOList);

    public int updateSequenceNumber(EmployeeMasterDTOList employeeMasterDTOList);

    public List<StaffMasterDTO> getStaffCategoryList();

    public List<EmployeeMasterDTO> getEmployeeInfo(Integer[] id);

    public List<EmployeeMasterDTO> getEmployeePayInfo(Integer[] staffCategoryId);
}
