package com.iitms.rfcampuspresentation.academic.masters;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.masters.service.BranchService;
import com.iitms.rfcampusdomain.academic.masters.service.DegreeService;
import com.iitms.rfcampusdomain.academic.masters.service.DepartmentService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Controller
public class BranchController 
{
    private static final Logger LOG=org.slf4j.LoggerFactory.getLogger(BranchController.class);
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private DegreeService admissionDegreeMasterService;
    @Autowired
    private BranchService admissionBranchMasterService;
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private SessionUser sessionUser;
   /* @RequestMapping(value="/branch",method=RequestMethod.GET)
    public String excelHome(Model model) {
        Map<String, String> entities = new LinkedHashMap<String, String>();
        return "branch"; 
     }*/
    @RequestMapping(value="/branch",method=RequestMethod.GET)   
    public String loadBranchJSP(ModelMap model) 
    {
        /*List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        model.addAttribute("moduleList", moduleList);*/
        model.addAttribute("branchList", admissionBranchMasterService.getAllBranch()); 
        model.addAttribute("degreeList", admissionDegreeMasterService.getAllDegree());
       LOG.info("Degree=" +admissionDegreeMasterService.getAllDegree().size());
        model.addAttribute("departmentList", departmentService.getAllDepartment());
        return "branch";    
    }
    
    @RequestMapping(value="/branch/add",method=RequestMethod.POST)
    public String addBranchForm(@ModelAttribute("branch")BranchMasterEntity entity,RedirectAttributes redirectAttributes) 
    {
        LOG.info("Entity>"+entity);  
        Boolean result=false;        
        result=admissionBranchMasterService.getBranchAlreadyExist(entity.getBranchShortName(), entity.getBranchLongName());
        if(result)
        {
            redirectAttributes.addFlashAttribute("message", entity.getBranchLongName()+" branch already exist.");
        }
        else {
            result=admissionBranchMasterService.addBranch(entity);
            if(result=true){    
              
                redirectAttributes.addFlashAttribute("message","add");
            }
            else{
              
                redirectAttributes.addFlashAttribute("message","error");
            }    
        }
        return "redirect:/branch";    
    }
    @RequestMapping(value="/branch/update",method=RequestMethod.POST)
    public String updateBranchForm(@ModelAttribute("degree")BranchMasterEntity entity,RedirectAttributes redirectAttributes) 
    {
        boolean result=admissionBranchMasterService.updateBranch(entity);
        LOG.info("Update Result::"+result);
        if(result = true){    
            redirectAttributes.addFlashAttribute("message","update");
        }
        return "redirect:/branch";    
    }
    
    @RequestMapping(value="/branch/getBranchByDegree",method=RequestMethod.POST)
    public@ResponseBody List<BranchMasterEntity> getBranchByDegree(@RequestParam("degreeId") int degreeId) {
        List<BranchMasterEntity>branchList=admissionBranchMasterService.getBranchByDegree(degreeId);
        LOG.info("Branch List:"+branchList);
        return branchList; 
    }
}
