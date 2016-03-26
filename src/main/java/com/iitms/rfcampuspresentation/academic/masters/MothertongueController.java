package com.iitms.rfcampuspresentation.academic.masters;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.masters.service.MothertongueService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Controller
public class MothertongueController {
    private static final Logger logger=org.slf4j.LoggerFactory.getLogger(DocumentListController.class);
    
    @Autowired
    ModuleService moduleService;
    
    @Autowired
    MothertongueService mothertongueService;
    
    @Autowired
    private SessionUser sessionUser;
    
@RequestMapping(value = "/mothertongue", method = RequestMethod.GET)
    public String mothertongueJSP(ModelMap model) {
        logger.info("mothertongue:" );
        List<MothertongueMasterEntity> motList = mothertongueService.getMothertongue();
        model.addAttribute("mothertongueList", motList);
        //List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule();
       /*List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        model.addAttribute("moduleList", moduleList);*/
      
        return "mothertongue";
    }

   @RequestMapping(value = "/mothertongue/add", method = RequestMethod.POST)
    public String createDocument(@ModelAttribute("mothertongue") MothertongueMasterEntity entity, Model model,RedirectAttributes redirectAttributes) {
        boolean b = false;
        b = mothertongueService.addMothertongue(entity);
        logger.info("Result : " + b);
        if(b = true){    
        redirectAttributes.addFlashAttribute("message", "add");
        }
   /* model.addAttribute("notification", "Successfully did it!");*/
        return "redirect:/mothertongue";
    }
    
   
    @RequestMapping(value = "/mothertongue/update", method = RequestMethod.POST)
    public String uppdateDocument(@ModelAttribute("mothertongueList") MothertongueMasterEntity entity, Model model,RedirectAttributes redirectAttributes) {
        boolean b = false;
        b = mothertongueService.updateMothertongue(entity);
        logger.info("Result : " + b);
        if(b = true){    
            redirectAttributes.addFlashAttribute("message", "update");
            }
        return "redirect:/mothertongue";
    }
}
