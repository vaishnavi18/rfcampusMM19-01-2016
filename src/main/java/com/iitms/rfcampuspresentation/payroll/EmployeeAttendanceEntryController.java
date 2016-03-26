package com.iitms.rfcampuspresentation.payroll;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.payroll.dto.EmployeeMasterDTO;
import com.iitms.rfcampusdata.payroll.dto.EmployeeMasterDTOList;
import com.iitms.rfcampusdomain.payroll.service.EmployeeAttendanceEntryPayrollService;

/**
 * 
 * @author Sachinmt
 *
 */
@Controller
public class EmployeeAttendanceEntryController {
    
    private static final Logger LOG = LoggerFactory.getLogger(EmployeeAttendanceEntryController.class);
    
    @Autowired
    EmployeeAttendanceEntryPayrollService employeeAttendanceEntryPayrollService; 
    /** Display the Attendance Page
     *  
     * @param model
     * @return
     */
    @RequestMapping(value = "/payroll/employeeAttendanceEntry", method = RequestMethod.GET)
    public String getEmployeeAttendance (ModelMap model){
        LOG.info("Employees Attendance Entry : updateEmployeeAttendance()");
        model.addAttribute("staffCategoryList", employeeAttendanceEntryPayrollService.getStaffCategoryList());
        return "payroll/attendanceEntry";
    }
    
    /** Get Employee Details From Staff Category
     *  
     * @param staffCategoryId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/payroll/employeeAttendanceEntry/get", method = RequestMethod.GET)
    public @ResponseBody List<EmployeeMasterDTO> getEmployeeAttendance(@RequestParam("staffCategoryId")int staffCategoryId,RedirectAttributes redirectAttributes){
        LOG.info("Employees Attendance Entry : updateSequenceNoAllotment()");
        Integer[] object = {staffCategoryId};
        List<EmployeeMasterDTO> list =  employeeAttendanceEntryPayrollService.getEmployeePayInfo(object);
        return list;
    }
    
    /** Update the Employee Attendance Against Employee Id
     * 
     * @param employeeMasterDTOList
     * @return
     */
    @RequestMapping(value = "/payroll/employeeAttendanceEntry/update", method = RequestMethod.POST)
    public String updateEmployeeAttendance (@ModelAttribute("employeeMasterDTOList" )EmployeeMasterDTOList employeeMasterDTOList,RedirectAttributes redirectAttributes)
    {
       /* int staffCategoryId = 0;
        for(EmployeeMasterDTO list:employeeMasterDTOList.getEmployeeList()){
            System.out.println("id:=>"+list.getId());
            System.out.println("id:=>"+list.getAbsentDays());
            System.out.println("category=>"+list.getSubDesignationNumber());
            staffCategoryId =list.getSubDesignationNumber();
        }*/
        LOG.info("Employees Attendance Entry : Update "+employeeMasterDTOList.getEmployeeList());
        int  b = employeeAttendanceEntryPayrollService.updateAddendanceEntry(employeeMasterDTOList);
        if(b == 1){
            redirectAttributes.addFlashAttribute("message", "update");
        }else
            redirectAttributes.addFlashAttribute("message", "error");
        return "redirect:/payroll/employeeAttendanceEntry";
        /*return "redirect:/payroll/employeeAttendanceEntry/get?staffCategoryId="+staffCategoryId+"";*/
    }
    
    /** Display Sequence No Page
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/payroll/sequenceNumberAllotment", method = RequestMethod.GET)
    public String getSequenceNoAllotment (ModelMap model){
        LOG.info("Employees Attendance Entry : getSequenceNoAllotment()");
        model.addAttribute("staffCategoryList", employeeAttendanceEntryPayrollService.getStaffCategoryList());  
        return "payroll/sequenceNoAllotment";
    }
    
    /** Get Employee Details Against emp Id
     *  
     * @param staffCategoryId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/payroll/sequenceNumberAllotment/get", method = RequestMethod.POST)
    public @ResponseBody List<EmployeeMasterDTO> getSequenceNoAllotment (@RequestParam("staffCategoryId")int staffCategoryId){
        LOG.info("Employees Attendance Entry : updateSequenceNoAllotment()");
        Integer[] object = {staffCategoryId};
        List<EmployeeMasterDTO> list =  employeeAttendanceEntryPayrollService.getEmployeeInfo(object);
        return list;
    }
    
    /** Update Sequence No. Against Emp Id
     * 
     * @param employeeMasterDTOList
     * @return
     */
    @RequestMapping(value = "/payroll/sequenceNumberAllotment/update", method = RequestMethod.POST)
    public String updateSequenceNoAllotment(@ModelAttribute("employeeMasterDTOList" )EmployeeMasterDTOList employeeMasterDTOList,RedirectAttributes redirectAttributes)
    {
        LOG.info("Employees Attendance Entry : Update "+employeeMasterDTOList.getEmployeeList());
        int  b = employeeAttendanceEntryPayrollService.updateSequenceNumber(employeeMasterDTOList);
        if(b == 1){
            redirectAttributes.addFlashAttribute("message", "update");
        }else
            redirectAttributes.addFlashAttribute("message", "error");     
        return "redirect:/payroll/sequenceNumberAllotment";
    }
}
