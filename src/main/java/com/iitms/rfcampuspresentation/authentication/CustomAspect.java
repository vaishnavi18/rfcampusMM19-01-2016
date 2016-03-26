package com.iitms.rfcampuspresentation.authentication;

import java.util.HashMap;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.iitms.rfcampusdata.authentication.daoimpl.MenuListItem;
import com.iitms.rfcampusdata.authentication.entity.ModuleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.RoleMenuResponse;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.authentication.service.MenuCreationService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Aspect
@Component
public class CustomAspect {

    @Autowired
    private SessionUser sessionUser;

    @Autowired
    private MenuCreationService menuCreationService;

    @Autowired
    private ModuleService moduleService;

    @After("execution(* *.*JSP(..))")
    public void logBefore(JoinPoint joinPoint) {

        Object[] args = joinPoint.getArgs();
        ModelMap modelMap = (ModelMap) args[0];

        //System.out.println("logBefore() is running!");
        //System.out.println("hijacked : " + joinPoint.getSignature().getName());
        if (sessionUser.getSelectedModule() != 0) {
            HashMap<Integer, MenuListItem> moduleMap = (HashMap<Integer, MenuListItem>) sessionUser.getModuleMap();
            List<MenuListItem> menuList = moduleMap.get(sessionUser.getSelectedModule()).getSubMenus();
            /*modelMap.addAttribute("authorisedMenuList", menuList);*/
        }
        /*List<ModuleMasterEntity> moduleList =
            moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        modelMap.addAttribute("moduleList", moduleList);*/
        //System.out.println("******");
    }
}
