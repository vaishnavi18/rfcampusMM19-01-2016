package com.iitms.rfcampuspresentation.authentication;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.authentication.entity.MenuMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.ModuleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;
import com.iitms.rfcampusdomain.authentication.service.MenuCreationService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Controller
/*@PreAuthorize("@sessionUser.hasAuthority(#pageno)")*/
public class MenuCreationController {

    private static final Logger logger = LoggerFactory.getLogger(MenuCreationController.class);
    
    @Autowired
    private MenuCreationService menuCreationServive;
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private SessionUser sessionUser;
    @Autowired
    private MasterService masterService;
    
    /* master default tab */
    @RequestMapping(value = "/menu-creation")
    public ModelAndView menuCreationJSP(ModelMap modelmap) {

        ModelAndView model = new ModelAndView();

        // List<ModuleMasterEntity> menus =moduleService.listAuthorisedModule();
        // model.addObject("menus", menus);

        /*List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        model.addObject("moduleList", moduleList);*/

        model.setViewName("authentication/menu_creation");

        return model;
    }

    @RequestMapping(value = {"/modules-list"}, method = RequestMethod.GET)
    public @ResponseBody List<?> getModulesList(HttpServletRequest rquest) throws IOException {

        //List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        List<?> moduleList = masterService.getAllRecords(ModuleMasterEntity.class);

        logger.info("Menus : " + moduleList.size());
        return moduleList;

    }

    @RequestMapping(value = {"/get_menu-lists"}, method = RequestMethod.POST)
    public @ResponseBody List<MenuMasterEntity> getMenuList(@RequestParam("module_id") int moduleId,
        @RequestParam(name = "parentMenuId" , required = false, defaultValue = "0") int parentMenuId)
        throws IOException {
        logger.info("Get Menu List : parentMenuId - " + parentMenuId + " module_id - " + moduleId);
        List<MenuMasterEntity> MenuMasterEntityList = menuCreationServive.getMainMainById(moduleId, parentMenuId);

        return MenuMasterEntityList;

    }

    @RequestMapping(value = {"/add-menu-creation"}, method = RequestMethod.POST)
    public String addMenu(@ModelAttribute("menuCreation") MenuMasterEntity menuMasterEnitity,RedirectAttributes redirectAttributes) throws IOException {
        logger.info(" Add ===>" + menuMasterEnitity);
        boolean menu_flag = menuCreationServive.isMenuExist(menuMasterEnitity.getParentMenuId(),menuMasterEnitity.getMenuName());
        System.out.println("menuflag:="+menu_flag);
        if(menu_flag == false){   
            boolean flag = menuCreationServive.addMainMenuCreation(menuMasterEnitity);
            if(flag = true){    
                redirectAttributes.addFlashAttribute("message","Record Saved Successfully!!");
            }
        }else{
            redirectAttributes.addFlashAttribute("message",menuMasterEnitity.getMenuName()+" Menu Already Exist!!");
        }
        return "redirect:/menu-creation";
    }
    
    @RequestMapping(value = {"/update-menu-creation"}, method = RequestMethod.POST)
    public String updateMenu(@RequestParam("call") String call,
        @ModelAttribute("menuCreation") MenuMasterEntity menuMasterEnitity,RedirectAttributes redirectAttributes) throws IOException {
        logger.info(" Update ===>" + menuMasterEnitity);
        boolean flag =  menuCreationServive.updateMainMenuCreation(menuMasterEnitity);
        if(flag = true){    
            redirectAttributes.addFlashAttribute("message","Record Updated Successfully!!");
        }   
        return "redirect:/menu-creation";

    }
}
