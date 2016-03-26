package com.iitms.rfcampuspresentation.academic.feecollection;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.ReceiptTypeService;

@Controller
public class ReceiptTypeController {
    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(ReceiptTypeController.class);

    @Autowired
    private ReceiptTypeService receiptTypeService;

    @RequestMapping(value = "/receipttype", method = RequestMethod.GET)
    public String loadReceiptTypeJSP(ModelMap model) {
        model.addAttribute("receiptTypeList", receiptTypeService.listAllReceiptTypeService());
        return "feeCollection/receipt";
    }

    @RequestMapping(value = "/receipttype/add", method = RequestMethod.POST)
    public String addReceiptType(@ModelAttribute("Recipt") FeesReceiptTypeEntity entity,
        RedirectAttributes redirectAttributes) {

        Boolean result = false;
        result = receiptTypeService.getReceiptTypeForAlreadyExists(entity.getReceiptCode(), entity.getReceiptTitle());
        if (result) {
            redirectAttributes.addFlashAttribute("message",
                entity.getReceiptTitle() + " and " + entity.getReceiptCode() + " already exist.");
        } else {
            Boolean flag = receiptTypeService.addReceiptTypeService(entity);
            if (flag) {

                redirectAttributes.addFlashAttribute("message", "add");
            } else {

                redirectAttributes.addFlashAttribute("message", "error");
            }
        }
        return "redirect:/receipttype";
    }

    @RequestMapping(value = "/receipttype/update", method = RequestMethod.POST)
    public String updateReciptType(@ModelAttribute("Recipt") FeesReceiptTypeEntity entity,
        RedirectAttributes redirectAttributes) {
        Boolean result = false;
        result = receiptTypeService.updateReceiptTypeService(entity);
        LOG.info("Add result=>" + result);
        if (result = true) {
            redirectAttributes.addFlashAttribute("message", "update");
        }
        return "redirect:/receipttype";
    }
}
