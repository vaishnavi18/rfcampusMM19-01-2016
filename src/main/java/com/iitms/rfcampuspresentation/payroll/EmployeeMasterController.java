package com.iitms.rfcampuspresentation.payroll;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.admission.entity.SharedPropertiesModel;
import com.iitms.rfcampusdata.payroll.dto.PayscaleDTO;
import com.iitms.rfcampusdata.payroll.masters.entity.EmployeeMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.CasteService;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;
import com.iitms.rfcampusdomain.payroll.service.EmployeeMasterPayrollService;

@Controller
public class EmployeeMasterController {

    @Autowired
    SharedPropertiesModel sharedPropertiesModel;
    
    @Autowired 
    EmployeeMasterPayrollService employeeMasterPayrollService;
    
    @Autowired
    CasteService admissionCasteMasterService;
    

    @Autowired
    private MasterService masterService;
    
    
    @RequestMapping(value = "/payroll/employee-registration", method= RequestMethod.GET)
    public String addEmployeeDetails1(){
    return "payroll/payrollEmpInfo";
    
    }
    //
    @RequestMapping(value = "/payroll/employee-registration/add-update", method = RequestMethod.POST)
    public @ResponseBody int addUpdateEmployeePayroll (@ModelAttribute EmployeeMasterEntity employeeMasterEntity){
        //int serialNumber = employeeMasterPayrollService.getIdNumber(sessionUser.getCustomLoginUser().getUserId());
        int flag = employeeMasterPayrollService.addEmployeePayroll(employeeMasterEntity); 
    return flag;
    }
    
   
    @RequestMapping(value="/payroll/employee-registrations", method= RequestMethod.GET)
    public String getPayrollList(@RequestParam(name = "messageId", required = false, defaultValue = "0") int messageId,
    org.springframework.ui.Model model){
        
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_CASTE, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_CASTE));
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_TITLE, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_TITLE));
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_CATEGORY, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_CATEGORY));
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_NATIONALITY, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_NATIONALITY));
        
        
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_DESIGNATION_NATURE, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_DESIGNATION_NATURE));
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_DESIGNATION, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_DESIGNATION));
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_STAFF_TYPE, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_STAFF_TYPE));
        
        //2/3
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_APPOINTMENT_TYPE, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_APPOINTMENT_TYPE));
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_PAYRULE, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_PAYRULE));
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_PAYSCALE, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_PAYSCALE));
        
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_BANKNAME, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_BANKNAME));
        
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_DEPARTMENT, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_DEPARTMENT));
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_PF, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_PF));
        
        model.addAttribute(ConstantUtil.PAYROLL_MASTER_STAFF, masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_STAFF));
        
        model.addAttribute(ConstantUtil.MESSAGE, ConstantUtil.getMessage(messageId));
        
        model.addAttribute("maxId", employeeMasterPayrollService.getIdNumber(0));
            
        return "payroll/payrollEmpInfo"; 
    }
    
    @RequestMapping(value = "/payroll/employee-registration/getPayScale", method = RequestMethod.POST)
    public @ResponseBody List<PayscaleDTO> getPayScaleDetails (@RequestParam("ruleNumber")int ruleNumber){
        Integer[] object = {ruleNumber};
        List<PayscaleDTO> list = employeeMasterPayrollService.getPayscale(object);
       /* for(PayscaleDTO lists : list){
            System.out.println(lists.getScale());
            System.out.println(lists.getGradePay());
        
        }*/
        
        return list;
    }
    
    @RequestMapping(value = "/payroll/employee-registration/getGradePay", method = RequestMethod.POST)
    public @ResponseBody float getGradePayDetails (@RequestParam("id")int id){
        //Integer[] object = {id};
        employeeMasterPayrollService.getGradePay(id);
        System.out.println("Grade Pay:="+employeeMasterPayrollService.getGradePay(id));
        return employeeMasterPayrollService.getGradePay(id);
    }
}
    
