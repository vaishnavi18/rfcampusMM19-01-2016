package com.iitms.rfcampuspresentation.academic.feecollection;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeesFeeheadEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.StandardFeeMasterList;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesFeeheadService;
import com.iitms.rfcampusdomain.academic.feecollection.service.ReceiptTypeService;
import com.iitms.rfcampusdomain.academic.feecollection.service.StandardFeeMasterService;
import com.iitms.rfcampusdomain.academic.masters.service.AcademicSessionServices;
import com.iitms.rfcampusdomain.academic.masters.service.DegreeService;
import com.iitms.rfcampusdomain.academic.masters.service.PaymentTypeService;
import com.iitms.rfcampusdomain.academic.masters.service.SemesterService;

@Controller
public class StandardFeeController {

    private static final Logger logger = LoggerFactory.getLogger(StandardFeeController.class);

    @Autowired
    ReceiptTypeService receiptTypeService;

    @Autowired
    DegreeService degreeService;

    @Autowired
    PaymentTypeService paymentTypeService;

    @Autowired
    AcademicSessionServices academicSessionServices;

    @Autowired
    SemesterService semesterService;

    @Autowired
    FeesFeeheadService feesFeeheadService;

    @Autowired
    StandardFeeMasterService standardFeeMasterService;

    // loading standard fee form
    @RequestMapping(value = "/feeCollection/standardFee", method = RequestMethod.GET)
    public ModelAndView loadStandardFeeJSP(ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("feeCollection/standard-fee-definition");
        model.addAttribute("receiptTypeList", receiptTypeService.listAllReceiptTypeService());
        model.addAttribute("degreeList", degreeService.getAllDegree());
        model.addAttribute("paymentTypeList", paymentTypeService.getAllPaymentType());
        model.addAttribute("academicSessionList", academicSessionServices.getAcademicSession());
        model.addAttribute("semesterList", semesterService.getAllSemester());
        model.addAttribute("feeDescriptionList", standardFeeMasterService.getDescription());
        return modelAndView;
    }

    // show standard fee(Show definition)
    @RequestMapping(value = "/feeCollection/standardFee/fee-head", method = RequestMethod.POST)
    public @ResponseBody List<FeesFeeheadEntity> getFeeHeads(@RequestParam("receiptId") int receiptId) {
        List<FeesFeeheadEntity> feeHeadList = feesFeeheadService.getFeeHeadsList(receiptId);
        return feeHeadList;
    }

    @RequestMapping(value = "/feeCollection/standardFee/fee", method = RequestMethod.POST)
    public @ResponseBody List<StandardFeeMasterEntity> showStandardFee(@RequestParam("receiptId") int receiptId,
        @RequestParam("degreeId") int degreeId, @RequestParam("paymentTypeId") int paymentid,
        @RequestParam("acadamicSessionId") int acadamicSessionId,
        @RequestParam("semesterId") int semesterId/* ,ModelMap model */) {
        logger.info("Params : " + "receiptId : " + receiptId + " - " + "degreeId : " + degreeId + " - " + "paymentid : "
            + paymentid + " - " + "acadamicSessionId : " + acadamicSessionId + " - " + "semesterId : " + semesterId);
        List<StandardFeeMasterEntity> standardFeeList =
            standardFeeMasterService.getStandardFeeList(receiptId, degreeId, acadamicSessionId, paymentid, semesterId);
        return standardFeeList;
    }

    // add and update standard fee
    @RequestMapping(value = "/feeCollection/standardFee/add", method = RequestMethod.POST)
    public String addUpdateStandardFee(
        @ModelAttribute("StandardFeeMasterList") StandardFeeMasterList standardFeeMasterList, BindingResult result,
        Model model, RedirectAttributes redirectAttributes) {
        boolean status = standardFeeMasterService.addStandardFee(standardFeeMasterList);
        if(status = true){    
            redirectAttributes.addFlashAttribute("message","add");
        }     
        return "redirect:/feeCollection/standardFee";
    }

    @RequestMapping(value = "/feeCollection/standardFee/exist", method = RequestMethod.POST)
    public @ResponseBody int addUpdateStandardFee(@RequestParam("receiptId") int receiptId, @RequestParam("degreeId") int degreeId,
        @RequestParam("paymentTypeId") int paymentid, @RequestParam("acadamicSessionId") int acadamicSessionId,
        @RequestParam("semesterId") int semesterId) {
       logger.info("receiptId:"+receiptId+" "+"degreeId:"+degreeId+" "+"paymentTypeId:"+paymentid+" "+"acadamicSessionId:"+acadamicSessionId+" "+"semesterId"+semesterId);
        int count = standardFeeMasterService.isStandardFeeDefined(receiptId, degreeId, acadamicSessionId, paymentid,
            semesterId);
        return count;
    }
    
    @RequestMapping(value = "/feeCollection/standardFee/copy", method = RequestMethod.POST)
    public @ResponseBody int copyStandardFee(@RequestParam("receiptId") int receiptId,
        @RequestParam("degreeId") int degreeId, @RequestParam("paymentTypeId") int paymentid,
        @RequestParam("acadamicSessionId") int acadamicSessionId,
        @RequestParam("semesterId") int semesterId,@RequestParam("receiptId_To") int receiptId_To,
        @RequestParam("degreeId_To") int degreeId_To, @RequestParam("paymentTypeId_To") int paymentid_To,
        @RequestParam("acadamicSessionId_To") int acadamicSessionId_To,
        @RequestParam("semesterId_To") int semesterId_To,@RequestParam("feeDiscription") String feeDiscription,@RequestParam("overwriteDemand") boolean overwriteDemand/* ,ModelMap model */) {
        logger.info("Params : " + "receiptId : " + receiptId + " - " + "degreeId : " + degreeId + " - " + "paymentid : "
            + paymentid + " - " + "acadamicSessionId : " + acadamicSessionId + " - " + "semesterId : " + semesterId+ " - " + "receiptId_To : " + receiptId_To+" - " + "degreeId_To : " + degreeId_To+ " - " + "paymentid_To : "
            + paymentid_To+ " - " + "acadamicSessionId : " + acadamicSessionId_To + " - " + "overwriteDemand : " + overwriteDemand);
        int result=
            standardFeeMasterService.copyStandardFee(receiptId, degreeId,acadamicSessionId, paymentid, semesterId, receiptId_To, degreeId_To, acadamicSessionId_To,paymentid_To, semesterId_To,feeDiscription,overwriteDemand);
        return result;
    }
    
    @RequestMapping(value = "/feeCollection/standardFee/standard_fee", method = RequestMethod.POST)
    public @ResponseBody List<StandardFeeMasterEntity> showStandardFeeByFeeDesecription(@RequestParam("feeDesecription") String feeDesecription) {
        List<StandardFeeMasterEntity> standardFeeList = standardFeeMasterService.getStandardFeeListByDesecriptionService(feeDesecription);
        return standardFeeList;
    }

    
}
