package com.iitms.rfcampuspresentation.academic.feecollection;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeeHeadList;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesFeeheadEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesFeeheadService;
import com.iitms.rfcampusdomain.academic.feecollection.service.ReceiptTypeService;

@Controller
public class FeesFeeheadController {
    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(FeesFeeheadController.class);

    @Autowired
    private ReceiptTypeService receiptTypeService;

    @Autowired
    private FeesFeeheadService feesFeeheadService;

    @RequestMapping(value = "/feeHeads", method = RequestMethod.GET)
    public String loadFeeHeadsJSP(ModelMap model) {
        model.addAttribute("reciptTypeList", receiptTypeService.listAllReceiptTypeService());
        return "feeCollection/feehead";
    }

    @RequestMapping(value = "/feeHeads/add", method = RequestMethod.POST)
    public String addFeeHeads(@ModelAttribute("FeeHeadList") FeeHeadList feeHeadList, BindingResult result, Model model,
        RedirectAttributes redirectAttributes) {
        LOG.info("HeadList : " + feeHeadList.getFeeHeads() + "  recipt id:" + feeHeadList.getReceiptTypeId());
        model.addAttribute("reciptTypeList", receiptTypeService.listAllReceiptTypeService());
        boolean status = feesFeeheadService.addFeeHeads(feeHeadList);
        LOG.info("Add result status" + status);
        if (status = true) {
            redirectAttributes.addFlashAttribute("message", "add");
        } else {
            redirectAttributes.addFlashAttribute("message", "update");
        }
        return "redirect:/feeHeads";
    }

    @RequestMapping(value = "/feeHeads/getList", method = RequestMethod.POST)
    public @ResponseBody List<FeesFeeheadEntity> getFeeHeads(@RequestParam("id") int id) {
        List<FeesFeeheadEntity> feeHeads = feesFeeheadService.getFeeHeadsList(id);
        // model.addAttribute("headLists",headList );
        LOG.info("Head List for Recipt:" + feeHeads);
        return feeHeads;
    }
}
