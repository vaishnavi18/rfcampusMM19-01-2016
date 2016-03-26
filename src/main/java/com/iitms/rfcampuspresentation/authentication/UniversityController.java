package com.iitms.rfcampuspresentation.authentication;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdata.authentication.entity.UniversityMaster;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;
import com.iitms.rfcampusdomain.authentication.service.UniversityAndBoardService;

@Controller
public class UniversityController
{
	 private static final Logger logger=org.slf4j.LoggerFactory.getLogger(UniversityController.class);
    @Autowired
    ModuleService moduleService; 
	@Autowired
	UniversityAndBoardService universityAndBoardService;
	@Autowired
    private SessionUser sessionUser;
	
	@RequestMapping(value = "/university", method = RequestMethod.GET)
	public String university_default_redirectJSP(ModelMap model) {
		//model.addAttribute("university", new UniversityMaster());
		model.addAttribute("universityList", universityAndBoardService.getAllUniversity());
		//List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule();
		/*List<ModuleMasterEntity> moduleList = moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
		model.addAttribute("moduleList", moduleList);*/
		return "authentication/university";
	}

	@RequestMapping(value = "/university/add", method = RequestMethod.POST)
	public String createUniversity(@ModelAttribute("university") UniversityMaster universityEntity, Model model,RedirectAttributes redirectAttributes) {
		boolean result = false;
		result = universityAndBoardService.getUniversityAlreadyExist(universityEntity.getUniversityCode(), universityEntity.getUniversityName());
		if (result) {
            redirectAttributes.addFlashAttribute("message","University Code "+universityEntity.getUniversityCode()+ " already exist.");
        }else{
            boolean flag = universityAndBoardService.addUniversity(universityEntity);
            if(flag){    
                redirectAttributes.addFlashAttribute("message","add");
            } else {
                redirectAttributes.addFlashAttribute("message", "error");
            }
        }
		return "redirect:/university";
	}
	

	@RequestMapping(value = "/university/update", method = RequestMethod.POST)
	public String uppdateUniversity(@ModelAttribute("university") UniversityMaster universityEntity, Model model,RedirectAttributes redirectAttributes) {
		boolean b = false;
		b = universityAndBoardService.updateUniversity(universityEntity);
		logger.info("Result : " + b);
		if(b = true){    
		    redirectAttributes.addFlashAttribute("message","update");
        } 
		return "redirect:/university";
	}

}
