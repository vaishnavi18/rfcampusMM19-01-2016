package com.iitms.rfcampuspresentation.academic.admission;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.admission.entity.ReferenceFileEntity;
import com.iitms.rfcampusdomain.academic.admission.service.ReferenceFileService;

@Controller
public class ReferenceFileController {

    private static final Logger logger = LoggerFactory.getLogger(ReferenceFileController.class);

    @Autowired
    private ReferenceFileService referenceFileService;

    @RequestMapping(value = "/reference", method = RequestMethod.GET)
    public ModelAndView getReferenceJSP(ModelMap model,
        @RequestParam(name = "message-id", required = false, defaultValue = "0") int messageId) {
        ModelAndView modelAndView = new ModelAndView("academic/create-registration-number");
        model.addAttribute("registrationNumberFormats", referenceFileService.getRegistrationNumberFormats());
        logger.info("Get Message Id: "+ConstantUtil.getMessage(messageId));
        model.addAttribute("message", ConstantUtil.getMessage(messageId));
        model.addAttribute("referenceRecord", referenceFileService.getReferenceRecord());
        return modelAndView;
    }

    @RequestMapping(value = "/reference", method = RequestMethod.POST)
    public String addUpdateReferenceRecord(@ModelAttribute ReferenceFileEntity referenceFileEntity) {
        int flag = referenceFileService.addReferenceRecord(referenceFileEntity);
        return "redirect:/reference?message-id="+flag;
    }
}
