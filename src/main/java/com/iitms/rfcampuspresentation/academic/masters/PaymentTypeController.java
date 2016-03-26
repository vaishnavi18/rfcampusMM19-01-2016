package com.iitms.rfcampuspresentation.academic.masters;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.academic.masters.entity.PaymentTypeMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.ModuleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.masters.service.PaymentTypeService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Controller
public class PaymentTypeController {
    private static final Logger LOG=org.slf4j.LoggerFactory.getLogger(PaymentTypeController.class);
    @Autowired
   private  PaymentTypeService admissionPaymentTypeMasterService;
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private SessionUser sessionUser;
    @RequestMapping(value="/paymenttype",method=RequestMethod.GET)
    public String loadPaymentTypeJSP(ModelMap model) 
    {
        /*List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        model.addAttribute("moduleList", moduleList);*/
       model.addAttribute("paymentTypeList", admissionPaymentTypeMasterService.getAllPaymentType()); 
      return "paymenttype";    
    }
    
    @RequestMapping(value="/paymenttype/add",method=RequestMethod.POST)
    public String addPaymentType(@ModelAttribute("paymentType")PaymentTypeMasterEntity entity,RedirectAttributes redirectAttributes ) 
    {
        LOG.info("Entity>"+entity);  
        Boolean result=false;        
        result=admissionPaymentTypeMasterService.getPaymentTypeAlreadyExist(entity.getPaymentType());
        if(result)
        {
            redirectAttributes.addFlashAttribute("message", entity.getPaymentType()+" already exist.");
        }
        else {
            result=admissionPaymentTypeMasterService.addPaymentType(entity);
            if(result=true){    
              
                redirectAttributes.addFlashAttribute("message","add");
            }
            else{
       
                redirectAttributes.addFlashAttribute("message","errorCreation");
            }
            }
      return "redirect:/paymenttype";    
    }
    
    @RequestMapping(value="/paymenttype/update",method=RequestMethod.POST)
    public String updatePaymentType(@ModelAttribute("paymentType")PaymentTypeMasterEntity entity,RedirectAttributes redirectAttributes) 
    {
        boolean result=admissionPaymentTypeMasterService.updatePaymentType(entity);
        LOG.info("Update Result::"+result);
        if(result=true){    
            
            redirectAttributes.addFlashAttribute("message","update");
        }
        else
            {    
             
            redirectAttributes.addFlashAttribute("message","errorUpdation");
            }
        
      return "redirect:/paymenttype";    
    }
}
