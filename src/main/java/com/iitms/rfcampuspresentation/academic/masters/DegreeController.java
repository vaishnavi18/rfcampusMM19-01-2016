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

import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.ModuleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.masters.service.DegreeService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Controller
public class DegreeController 
{
    private static final Logger LOG=org.slf4j.LoggerFactory.getLogger(DegreeController.class);
    @Autowired
   private DegreeService admissionDegreeMasterService;
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private SessionUser sessionUser;
    @RequestMapping(value="/degree",method=RequestMethod.GET)
    public String loadDegreeJSP(ModelMap model) 
    {
        /*List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        model.addAttribute("moduleList", moduleList);*/
        model.addAttribute("degreeList", admissionDegreeMasterService.getAllDegree()); 
        return "degree";    
    }
    @RequestMapping(value="/degree/add",method=RequestMethod.POST)
    public String addDegreeForm(@ModelAttribute("degree")DegreeMasterEntity entity,RedirectAttributes redirectAttributes) 
    {
        LOG.info("Entity>"+entity);  
        Boolean result=false;        
        result=admissionDegreeMasterService.getDegreeAlreadyExist(entity.getDegreeName(),entity.getDegreeCode());
        if(result)
        {
            redirectAttributes.addFlashAttribute("message", entity.getDegreeName()+" degree already exist.");
        }
        else {
            result=admissionDegreeMasterService.addDegree(entity);
            if(result=true){    
             redirectAttributes.addFlashAttribute("message","add");
            }
            else{
        
                redirectAttributes.addFlashAttribute("message","errorCreation");
            }
        }
        return "redirect:/degree";    
    }
    @RequestMapping(value="/degree/update",method=RequestMethod.POST)
    public String updateDegreeForm(@ModelAttribute("degree")DegreeMasterEntity entity,RedirectAttributes redirectAttributes) 
    {
        boolean result=admissionDegreeMasterService.updateDegree(entity);
        LOG.info("Update Result::"+result);
        if(result = true)
        {    
            redirectAttributes.addFlashAttribute("message","update");
        }
        else{
             redirectAttributes.addFlashAttribute("message","errorUpdation");
            }
        return "redirect:/degree";    
    }
}
