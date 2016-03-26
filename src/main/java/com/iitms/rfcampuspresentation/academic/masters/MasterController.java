package com.iitms.rfcampuspresentation.academic.masters;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.academic.masters.entity.MasterData;
import com.iitms.rfcampusdata.academic.masters.entity.MasterFields;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;

@Controller
public class MasterController {

     private static final Logger Log = LoggerFactory.getLogger(MasterController.class);

    @Autowired
    private MasterService masterService;

    @RequestMapping(value = "/master", method = RequestMethod.GET)
    //@PreAuthorize("@sessionUser.hasAuthority(#pageno)")
    public String getMasterJSP(ModelMap model, @RequestParam("type") String masterType) {
        Log.info("Master : "  + masterType);
        
        MasterFields masterFields = masterService.getStaticFields(masterType);
        List<MasterData> data = masterService.loadMasterFields(masterFields.getRuntimeClass(), masterFields.getPropertyName());

        model.addAttribute("masterFields", masterFields);
        model.addAttribute("masterDataList", data);

        return "master";
    }

    @RequestMapping(value = "/master", method = RequestMethod.POST)
    public String addMaster(@ModelAttribute MasterFields masterFields, RedirectAttributes redirectAttributes) {
        Log.info("MasterFields : " + masterFields);
        int messageId = masterService.addmaster(masterFields);
        redirectAttributes.addFlashAttribute("message", ConstantUtil.getMessage(messageId));
        redirectAttributes.addAttribute("type", masterFields.getMasterType());
        Log.info("" + ConstantUtil.getMessage(messageId));
        return "redirect:/master";
    }
    
    /*@RequestMapping(value = "/master/{master}", method = RequestMethod.POST)
    public List<MasterModel> getMasterData(@PathVariable String master) {
        Log.info("master : " + master);
        return masterService.getMasterData(master);
    }*/
}
