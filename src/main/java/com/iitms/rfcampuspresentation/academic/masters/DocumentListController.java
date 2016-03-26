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

import com.iitms.rfcampusdata.academic.masters.entity.DocumentListMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.masters.service.DocumentListService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Controller
public class DocumentListController {
    private static final Logger logger=org.slf4j.LoggerFactory.getLogger(DocumentListController.class);
    @Autowired
    ModuleService moduleService; 
    @Autowired
    DocumentListService documentListService;
    @Autowired
    private SessionUser sessionUser;
    
    @RequestMapping(value = "/document", method = RequestMethod.GET)
    public String documentListJSP(ModelMap model) {
        logger.info("document:"+documentListService );
        List<DocumentListMasterEntity> docList = documentListService.getDocumentList();
        model.addAttribute("documentList", docList);
        //List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule();
       /*List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        model.addAttribute("moduleList", moduleList);*/
        return "document-list";
    }

   @RequestMapping(value = "/document/add", method = RequestMethod.POST)
    public String createDocument(@ModelAttribute("documentList") DocumentListMasterEntity entity, Model model,RedirectAttributes redirectAttributes) {
        boolean b = false;
        b = documentListService.addDocumentList  (entity);
        logger.info("Result : " + b);
        if(b = true){    
            redirectAttributes.addFlashAttribute("message","add");
        } 
        return "redirect:/document";
    }
    

    @RequestMapping(value = "/document/update", method = RequestMethod.POST)
    public String uppdateDocument(@ModelAttribute("documentList") DocumentListMasterEntity entity, Model model,RedirectAttributes redirectAttributes) {
        boolean b = false;
        b = documentListService.updateDocumentList(entity);
        logger.info("Result : " + b);
        if(b = true){    
            redirectAttributes.addFlashAttribute("message","update");
        } 
        return "redirect:/document";
    }

}


