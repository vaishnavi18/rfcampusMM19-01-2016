package com.iitms.rfcampuspresentation.authentication;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.iitms.rfcampusdata.authentication.entity.ModuleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

//@ControllerAdvice
public class MyInterceptor  {

    private static final Logger logger = LoggerFactory.getLogger(MyInterceptor.class);
   // 
    //@Autowired
    private SessionUser sessionUser;
    
    //@Autowired
    private ModuleService moduleService;
    
    
    //@ModelAttribute
    public void globalAttributes(Model model) {
  
     if(sessionUser.getCustomLoginUser() == null){
         logger.info("User is null " );
     }else{
         logger.info("globalAttributes: 2" + sessionUser );
     List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
       logger.info("moduleList: 2" + moduleList );
     
     model.addAttribute("moduleList", moduleList);
     }
    }
    
    
}
