package com.iitms.rfcampuspresentation.academic.feecollection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdomain.academic.feecollection.service.FeesCounterCreationService;
import com.iitms.rfcampusdomain.academic.feecollection.service.ReceiptTypeService;
import com.iitms.rfcampusdomain.authentication.service.UserCreationService;

@Controller
public class FeesCounterCreationController {
    private static final Logger LOG = LoggerFactory.getLogger(FeesCounterCreationController.class);

    @Autowired
    private ReceiptTypeService receiptTypeService;

    @Autowired
    private UserCreationService userCreationService;

    @Autowired
    private FeesCounterCreationService feesCounterCreationService;

    @RequestMapping(value = "/feeCollection/counter_creation", method = RequestMethod.GET)
    public ModelAndView loadCounterCreationForm() {
        ModelAndView model = new ModelAndView("feeCollection/counter_creation");
        model.addObject("receiptTypeList", receiptTypeService.listAllReceiptTypeService());
        LOG.info("Get Non faculty user:" + userCreationService.getNonFacultyUser());
        model.addObject("userList", userCreationService.getNonFacultyUser());
        model.addObject("counterList", feesCounterCreationService.getCounterList());
        return model;
    }

    @RequestMapping(value = "/feeCollection/counter_creation/add", method = RequestMethod.POST)
    public @ResponseBody String createCounter(@RequestParam("id") int id,
        @RequestParam("counterName") String counterName, @RequestParam("printName") String printName,
        @RequestParam("counterUser") int counterUser, @RequestParam("receiptType") String receipt_type,
        @RequestParam("receiptPrevList") String receiptPrevList, RedirectAttributes redirectAttributes) {
        LOG.info("counterName:" + counterName + " printName:" + printName + " counterUser:" + counterUser
            + " receipt_type:" + receipt_type);
        String message;
        if (feesCounterCreationService.checkCounterExist(counterUser)) {
            boolean result = feesCounterCreationService.addCounter(counterName, printName, counterUser, receipt_type);
            if (result) {
                message = "add";
            } else {
                message = "error";
            }
        } else {
            message = "exist";
        }
        return message;
    }

    @RequestMapping(value = "/feeCollection/counter_creation/update", method = RequestMethod.POST)
    public @ResponseBody String updateCounter(@RequestParam("id") int id,
        @RequestParam("counterName") String counterName, @RequestParam("printName") String printName,
        @RequestParam("counterUser") int counterUser, @RequestParam("receiptType") String receipt_type,
        @RequestParam("receiptPrevList") String receiptPrevList, RedirectAttributes redirectAttributes) {
        LOG.info("id:" + id + "counterName:" + counterName + " printName:" + printName + " counterUser:" + counterUser
            + " receipt_type:" + receipt_type + "receiptPrevList:" + receiptPrevList);
        boolean result = feesCounterCreationService.updateCounter(id, counterName, printName, counterUser, receipt_type,
            receiptPrevList);
        String message;
        if (result) {
            message = "update";
        } else {
            message = "error";
        }
        return message;
    }

}
