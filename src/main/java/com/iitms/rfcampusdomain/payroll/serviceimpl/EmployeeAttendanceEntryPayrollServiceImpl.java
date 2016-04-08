package com.iitms.rfcampusdomain.payroll.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.payroll.dto.EmployeeMasterDTO;
import com.iitms.rfcampusdata.payroll.dto.EmployeeMasterDTOList;
import com.iitms.rfcampusdata.payroll.dto.StaffMasterDTO;
import com.iitms.rfcampusdata.payroll.masters.dao.EmployeeAttendanceEntryPayrollDao;
import com.iitms.rfcampusdata.payroll.masters.entity.StaffMasterEntity;
import com.iitms.rfcampusdomain.payroll.service.EmployeeAttendanceEntryPayrollService;

@Service
@Transactional
public class EmployeeAttendanceEntryPayrollServiceImpl implements EmployeeAttendanceEntryPayrollService {

    @Autowired
    EmployeeAttendanceEntryPayrollDao employeeAttendanceEntryPayrollDao;

    @Override
    public int updateAddendanceEntry(EmployeeMasterDTOList employeeMasterDTOList) {

        return employeeAttendanceEntryPayrollDao.updateAttendanceEntry(employeeMasterDTOList);
    }

    @Override
    public List<StaffMasterDTO> getStaffCategoryList() {

        return employeeAttendanceEntryPayrollDao.getStaffCategoryList();
    }

    @Override
    public List<EmployeeMasterDTO> getEmployeeInfo(Integer[] id) {

        return employeeAttendanceEntryPayrollDao.getEmployeeInfo(id);
    }

    @Override
    public List<EmployeeMasterDTO> getEmployeePayInfo(Integer[] staffCategoryId) {

        return employeeAttendanceEntryPayrollDao.getEmployeePayInfo(staffCategoryId);
    }

    @Override
    public int updateSequenceNumber(EmployeeMasterDTOList employeeMasterDTOList) {
        // TODO Auto-generated method stub
        return employeeAttendanceEntryPayrollDao.updateSequenceNumber(employeeMasterDTOList);
    }
}
