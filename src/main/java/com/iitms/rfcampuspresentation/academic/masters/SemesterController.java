package com.iitms.rfcampuspresentation.academic.masters;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.academic.masters.entity.SemesterMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.masters.service.SemesterService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Controller
public class SemesterController {
    private static final Logger LOG=org.slf4j.LoggerFactory.getLogger(DegreeController.class);
    @Autowired
    private SemesterService admissionSemesterMasterService;
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private SessionUser sessionUser;
    @RequestMapping(value="/semester",method=RequestMethod.GET)
    public String loadSemesterJSP(ModelMap model) 
    {
        /*List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        model.addAttribute("moduleList", moduleList);*/
        model.addAttribute("semesterList", admissionSemesterMasterService.getAllSemester()); 
        return "semester";    
    }
    @RequestMapping(value="/semester/add",method=RequestMethod.POST)
    public String addSemesterForm(@ModelAttribute("semester")SemesterMasterEntity entity,RedirectAttributes redirectAttributes) 
    {
        LOG.info("Entity>"+entity);  
        Boolean result=false;        
        result=admissionSemesterMasterService.getSemesterAlreadyExist(entity.getSemesterName(),entity.getSemesterFullName());
        if(result)
        {
            redirectAttributes.addFlashAttribute("message", entity.getSemesterFullName()+" Semester already exist.");
        }
        else {
            result=admissionSemesterMasterService.addSemester(entity);
            if(result=true){    
                redirectAttributes.addFlashAttribute("message","add");
            }
            else{
            redirectAttributes.addFlashAttribute("message","errorCreation");
            }
            } 
        return "redirect:/semester";    
    }
    @RequestMapping(value="/semester/update",method=RequestMethod.POST)
    public String updateSemesterForm(@ModelAttribute("semester")SemesterMasterEntity entity,RedirectAttributes redirectAttributes) 
    {
        boolean result=admissionSemesterMasterService.updateSemester(entity);
        LOG.info("Update Result::"+result);
        if(result = true){    
            redirectAttributes.addFlashAttribute("message","update");
        }else{
            redirectAttributes.addFlashAttribute("message","errorUpdation");
            }
        return "redirect:/semester";    
    }
}
