package com.iitms.rfcampuspresentation.authentication;

import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampuscommon.FileUploadUtil;
import com.iitms.rfcampusdata.authentication.entity.RoleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.UserMasterEntity;
import com.iitms.rfcampusdomain.authentication.service.RoleCreationService;
import com.iitms.rfcampusdomain.authentication.service.UserCreationService;

@Controller
public class UserCreationController {

    private static final Logger logger = LoggerFactory.getLogger(UserCreationController.class);

    @Autowired
    private UserCreationService userCreationService;

    @Autowired
    private RoleCreationService roleCreationService;

    @Autowired
    private FileUploadUtil fileUploadUtil;
    
    @RequestMapping(value = "/user-creation", method = RequestMethod.GET)
    public ModelAndView getUserJSP(ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("authentication/user-creation");
        /*List<ModuleMasterEntity> moduleList =
            moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());*/
        List<RoleMasterEntity> roleList = roleCreationService.getAllRoles();
        //modelAndView.addObject("moduleList", moduleList);
        modelAndView.addObject("roleList", roleList);

        return modelAndView;
    }

    @RequestMapping(value = "/user-creation/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute UserMasterEntity entity, BindingResult result,
        @RequestParam(name = "userImage") MultipartFile userImage, HttpServletRequest request,RedirectAttributes redirectAttributes) {
        logger.info("AddUser User : " + entity);
        String fileName = fileUploadUtil.uploadFile(request, userImage, entity.getOldUserPhoto(), ConstantUtil.IMAGE);
        entity.setUserPhoto(fileName);
        boolean status =  userCreationService.addUser(entity);
        if(status = true){    
            redirectAttributes.addFlashAttribute("message","add");
        }  
        
        return "redirect:/user-creation";
    }

    @RequestMapping(value = "/user-creation/update", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute UserMasterEntity entity, BindingResult result,
        @RequestParam(name = "userImage") MultipartFile userImage, HttpServletRequest request,RedirectAttributes redirectAttributes) {
        logger.info("Update User : " + entity);
        String fileName = fileUploadUtil.uploadFile(request, userImage, entity.getOldUserPhoto(), ConstantUtil.IMAGE);
        if(fileName != null){
            entity.setUserPhoto(fileName);
        }
        else{
            entity.setUserPhoto(entity.getOldUserPhoto());
        }
        boolean status =  userCreationService.updateUser(entity);
        if(status = true){    
            redirectAttributes.addFlashAttribute("message","update");
        }  
        
        return "redirect:/user-creation";
    }
    
    @RequestMapping(value = "/user-creation/search", method = RequestMethod.POST)
    public @ResponseBody List<UserMasterEntity> searchUserByCriteria(@RequestParam(name = "searchBy") int searchBy,
        @RequestParam(name = "searchText") String searchText) {
        logger.info("SearchUserByCriteria - searchBy : "+searchBy+", searchText : " + searchText);
        List<UserMasterEntity> list = userCreationService.searchUserByCriteria(searchBy, searchText);
        return list;
    }
    
    @RequestMapping(value = "/user-creation/{user-id}", method = RequestMethod.POST)
    public @ResponseBody UserMasterEntity getUserInformation(@PathVariable("user-id") int userId){
        logger.info("GetUserInformation - userId : "+userId);
        UserMasterEntity userInfo = userCreationService.getUserInformation(userId);
        userInfo.setRoleMasterEntityList(new HashSet<RoleMasterEntity>());
        return userInfo;
        
    }
}
