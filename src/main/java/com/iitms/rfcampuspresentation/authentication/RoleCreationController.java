package com.iitms.rfcampuspresentation.authentication;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampuscommon.PaginationResponse;
import com.iitms.rfcampusdata.authentication.entity.RoleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.RoleTypeMasterEntity;
import com.iitms.rfcampusdomain.authentication.service.RoleCreationService;

@Controller
public class RoleCreationController {

    private static final Logger LOG = LoggerFactory.getLogger(RoleCreationController.class);

    @Autowired
    private RoleCreationService roleCreationService;

    @RequestMapping(value = "/roles", method = RequestMethod.GET)
    public ModelAndView getRolesListJSP(ModelMap model) {

        try {
            LOG.info("Get Roles");
            ModelAndView modelAndView = new ModelAndView("authentication/role-list", model);
            return modelAndView;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/roles/records", method = RequestMethod.GET)
    public @ResponseBody PaginationResponse getPaginationResponse(
        @RequestParam(required = false, defaultValue = "0") int sEcho,
        @RequestParam(required = false, defaultValue = "0") int iDisplayStart,
        @RequestParam(required = false, defaultValue = "0") int iDisplayLength,
        @RequestParam(required = false, defaultValue = "0") int iSortCol_0,
        @RequestParam(required = false, defaultValue = "asc") String sSortDir_0,
        @RequestParam(required = false, defaultValue = "null") String sSearch,
        @RequestParam(required = false, defaultValue = "0") int roleTypeId, HttpServletRequest request) {

        try {
            LOG.info("Query String : " + " - " + request.getQueryString());
            LOG.info("Roles Pagination : " + roleTypeId + " - " + sEcho + " - " + iDisplayStart + " - " + iDisplayLength
                + " - " + iSortCol_0 + " - " + sSearch);
            PaginationResponse response = roleCreationService.getPaginationResponse(sEcho, iDisplayStart,
                iDisplayLength, iSortCol_0, sSortDir_0, sSearch, roleTypeId);

            return response;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/roles/add", method = RequestMethod.POST)
    public String addRoleMaster(@ModelAttribute RoleMasterEntity entity, RedirectAttributes redirectAttributes) {

        try {
            LOG.info("Add Role : " + entity);
            boolean flag = roleCreationService.isRoleExist(entity.getUserTypeId(), entity.getRoleName());
            
            if(flag == false){
                flag =  roleCreationService.addRole(entity);
                if(flag == true){    
                    redirectAttributes.addFlashAttribute("message","add");
                }
            }else{
                redirectAttributes.addFlashAttribute("message","Role already Exist!!");
            }
            return "redirect:/roles";
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/roles/update", method = RequestMethod.POST)
    public String updateRoleMaster(@ModelAttribute RoleMasterEntity entity, RedirectAttributes redirectAttributes) {

        try {
            LOG.info("Update Role : " + entity);
            boolean flag = roleCreationService.updateRole(entity);
            if (flag == true) {
                redirectAttributes.addFlashAttribute("message", "update");
                redirectAttributes.addFlashAttribute("roleTypeId",entity.getUserTypeId());
                LOG.info("User Type : " + entity.getUserTypeId());
            }
            return "redirect:/roles";
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/roles/role-type", method = RequestMethod.GET)
    public @ResponseBody List<RoleTypeMasterEntity> getRoleTypes() {

        try {
            LOG.info("Get Role Types : " + roleCreationService);
            List<RoleTypeMasterEntity> list = roleCreationService.getRoleTypes();
            LOG.info("Size : " + list.size());
            return list;
        } catch (Exception e) {
            throw e;
        }

    }

    @RequestMapping(value = "/roles/roles-by-type", method = RequestMethod.POST)
    public @ResponseBody List<RoleMasterEntity> getRolesByType(@RequestParam int roleTypeId) {

        try {
            LOG.info("Get Roles By Type : " + roleTypeId);
            List<RoleMasterEntity> list = roleCreationService.getAllRoles(roleTypeId);
            return list;
        } catch (Exception e) {
            throw e;
        }
    }
}
