package com.iitms.rfcampuspresentation.academic.feecollection;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeesPaymentModeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesUserCounterMasterEntity;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeeSessionCounterService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesCounterCreationService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesPaymentModeService;
import com.iitms.rfcampusdomain.academic.masters.service.AcademicSessionServices;

@Controller
public class FeeSessionCounterController {
    private static final Logger LOG = LoggerFactory.getLogger(FeesCounterCreationController.class);

    @Autowired
    private FeeSessionCounterService feeSessionCounterService;

    @Autowired
    private FeesPaymentModeService feesPaymentModeService;

    @Autowired
    private FeesCounterCreationService feesCounterCreationService;

    @Autowired
    private AcademicSessionServices academicSessionServices;

    @RequestMapping(value = "/feeCollection/counter_session", method = RequestMethod.GET)
    public ModelAndView loadCounterCreationForm() {
        ModelAndView model = new ModelAndView("feeCollection/sessionCounterConfiguration");
        // model.addObject("receiptTypeList", receiptTypeService.listAllReceiptTypeService());
        // LOG.info("Get Non faculty user:"+userCreationService.getNonFacultyUser());
        loadBasicData(model);
        return model;
    }

    @RequestMapping(value = "/feeCollection/showRecords", method = RequestMethod.GET)
    public ModelAndView showRecords(@RequestParam("acadamicSessionId") int acadamicSessionId,
        @RequestParam("userName") int userId, HttpSession session) {
        ModelAndView model = new ModelAndView("feeCollection/sessionCounterConfiguration");
        loadBasicData(model);

        List<FeesPaymentModeEntity> paymentModes = feesPaymentModeService.getFeesPaymentMode2(false);
        List<FeesReceiptTypeEntity> reciptList = feesCounterCreationService.getRecipt(userId);
        LOG.info("reciptList:" + reciptList);
        String[][] receiptsMatrix =
            feeSessionCounterService.showRecords(acadamicSessionId, userId, paymentModes, reciptList);

        LOG.info("Worked on counter creation " + receiptsMatrix);
        session.setAttribute("paymentModes", paymentModes);
        session.setAttribute("receiptTypes", reciptList);
        session.setAttribute("receiptsMatrix", receiptsMatrix);
        return model;
    }

    @RequestMapping(value = "/feeCollection/updateReceiptsNumber", method = RequestMethod.POST)
    public String updateReceiptsNumber(HttpServletRequest request, HttpSession session,
        RedirectAttributes redirectAttributes) {
        ModelAndView model = new ModelAndView("feeCollection/sessionCounterConfiguration");
        List<FeesPaymentModeEntity> paymentModes = (ArrayList) session.getAttribute("paymentModes");
        List<FeesUserCounterMasterEntity> reciptList = (ArrayList) session.getAttribute("receiptTypes");
        String[][] receiptsMatrix = (String[][]) session.getAttribute("receiptsMatrix");
        loadBasicData(model);
        boolean flag = feeSessionCounterService.updateCounterSeqNo(request, receiptsMatrix, paymentModes, reciptList);
        if (flag == true) {
            redirectAttributes.addFlashAttribute("message", "update");
        }
        session.removeAttribute("paymentModes");
        session.removeAttribute("receiptTypes");
        session.removeAttribute("receiptsMatrix");
        return "redirect:/feeCollection/counter_session";

    }

    private void loadBasicData(ModelAndView model) {
        model.addObject("userList", feesCounterCreationService.getCounterAllocatedUsers());
        model.addObject("academicSessionList", academicSessionServices.getAcademicSession());
    }

}
