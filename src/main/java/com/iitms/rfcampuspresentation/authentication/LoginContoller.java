package com.iitms.rfcampuspresentation.authentication;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampusdata.authentication.daoimpl.MenuListItem;
import com.iitms.rfcampusdata.authentication.entity.ModuleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.RoleMenuResponse;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.authentication.service.LoginService;
import com.iitms.rfcampusdomain.authentication.service.MenuCreationService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Controller
@SessionAttributes("readonlySettings")
public class LoginContoller {

    private static final Logger LOG = LoggerFactory.getLogger(LoginContoller.class);
    
    @Autowired
    private LoginService loginService;
    
    @Autowired
    private SessionUser sessionUser;
    
    @Autowired
    private ModuleService moduleService;
    
    @Autowired
    private MenuCreationService menuCreationService;
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@RequestParam(value = "error", required = false) Integer error, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        LOG.info("Already Logged In : " + (auth instanceof AnonymousAuthenticationToken));
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            return "redirect:/success";
        }
        
        if(error != null){
            if (error == 1) {
                model.addAttribute("error", "Invalid Username or Password");
            } else if (error == 2) {
                model.addAttribute("error", "Your Credential is Expired");
            } else if (error == 3) {
                model.addAttribute("error", "Your Account is Disabled");
            } else if (error == 4) {
                model.addAttribute("error", "Your Account is Locked");
            }else if (error == 5) {
                model.addAttribute("error", "Invalid Username or Password");
            }   
        }
        return "authentication/login1";
    }

    @RequestMapping(value = "/invalid-session", method = RequestMethod.GET)
    public String invalid() {
        return "authentication/invalid-session";
    }
    
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error404() {
        return "authentication/404";
    }
    
    @RequestMapping(value = {"/success"}, method = RequestMethod.GET)
    public ModelAndView successJSP(ModelMap model) {
        LOG.info("Role : " + sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        /*List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        model.addAttribute("moduleList", moduleList);
        LOG.info("Module List : " + moduleList);*/
        HashMap<Integer, MenuListItem> moduleMap = menuCreationService.getModulewiseMenu(sessionUser.getCustomLoginUser().getUserId(),
            sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        sessionUser.setModuleMap(moduleMap);
        ModelAndView modelAndView = new ModelAndView("authentication/admin1", model);
        return modelAndView;
    }
    
    @RequestMapping(value = "/master1", method = RequestMethod.GET)
    public @ResponseBody List<MenuListItem> test(@RequestParam("id") int id, Model model) {
        LOG.info("Module Id : " + id + " - Role Id : " + sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        sessionUser.setSelectedModule(id);
        HashMap<Integer, MenuListItem> moduleMap = menuCreationService.getModulewiseMenu(sessionUser.getCustomLoginUser().getUserId(),
            sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        
        
        sessionUser.setModuleMap(moduleMap);
        List<MenuListItem> menuList = sessionUser.getModuleMenus();
        LOG.info("menuList Size: " + menuList.size());
        return menuList;
    }
    
    @RequestMapping(value = "/change-password", method = RequestMethod.GET)
    public String firstLoginAttempt(HttpServletRequest request, HttpServletResponse response) {
        LOG.info("FirstLoginAttempt : " +request.getRequestURI());
        try {
            if(sessionUser.getCustomLoginUser().getActive() != 0){
                response.sendRedirect("./success");
            }  
        } catch (Exception e) {
            //e.printStackTrace();
            LOG.error("err",e);
        }
        
        return "authentication/reset-password";
    }
    
    @RequestMapping(value = "/change-password", method = RequestMethod.POST)
    public String setNewPassword(@RequestParam("password") String password, ModelMap model) {
        LOG.info("SetNewPassword : " +sessionUser.getCustomLoginUser().getUsername(), password + " - " + password);
        loginService.changePassword(sessionUser.getCustomLoginUser().getUsername(), password);
        return "redirect:/password-change-confirmation";
    }
    
    @RequestMapping(value = "/password-change-confirmation", method = RequestMethod.GET)
    public String resetConfirmation(ModelMap model) {
        LOG.info("ResetConfirmation : ");
        model.addAttribute("message", "Password Has been successfully Reset !");
        return "authentication/admin";
    }
    
    
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String baseUrl(@RequestParam(value = "error", required = false) Integer error, Model model) {
        return "redirect:/success";
    } 
    
    
   /* @RequestMapping(value = "/s")
    public String success1(ModelMap map) {
        ReadonlySettings settings = (ReadonlySettings) map.get("readonlySettings");
        LOG.info("Session Ob : " + settings);
        return "success";
    }*/
}
