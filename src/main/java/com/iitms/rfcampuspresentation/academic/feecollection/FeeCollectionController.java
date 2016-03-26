package com.iitms.rfcampuspresentation.academic.feecollection;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentDemandDTO;
import com.iitms.rfcampusdata.academic.feecollection.dto.StudentInfoForDCR;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesCounterMasterEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesDcrmainTransactionEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.admission.service.StudentInformationService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeeCollectionService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesCounterCreationService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesCurrencyService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesDemandCreationTransactionService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesPaymentModeService;
import com.iitms.rfcampusdomain.academic.feecollection.service.StandardFeeMasterService;
import com.iitms.rfcampusdomain.academic.masters.service.BankService;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;

@Controller
public class FeeCollectionController {
    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(FeeCollectionController.class);

    @Autowired
    private FeeCollectionService feeCollectionService;

    @Autowired
    private FeesDemandCreationTransactionService feesDemandCreationTransactionService;

    @Autowired
    private FeesCounterCreationService feesCounterCreationService;

    @Autowired
    private FeesPaymentModeService feesPaymentModeService;

    @Autowired
    private SessionUser sessionUser;

    @Autowired
    private MasterService masterService;

    @Autowired
    private BankService bankService;

    @Autowired
    private StudentInformationService studentInformationService;

    @Autowired
    private FeesCurrencyService feesCurrencyService;

    @Autowired
    private StandardFeeMasterService standardFeeMasterService;

    @RequestMapping(value = "/feeCollection/dcr", method = RequestMethod.GET)
    public ModelAndView loadFeeCollectionForm(HttpSession session) {
        LOG.info("control in loadFeeCollectionForm ");
        ModelAndView model = new ModelAndView("feeCollection/feeCollection");

        model.addObject("receiptTypeList",
            feesCounterCreationService.getRecipt(sessionUser.getCustomLoginUser().getUserId()));
        model.addObject("paymentModeList", feesPaymentModeService.getFeesPaymentMode());
        model.addObject("semesterList", masterService.getMasterData(ConstantUtil.SEMESTER_LIST));
        model.addObject("degreeList", masterService.getMasterData(ConstantUtil.DEGREE_LIST));
        model.addObject("branchList", masterService.getMasterData(ConstantUtil.BRANCH_LIST));
        model.addObject("yearList", masterService.getMasterData(ConstantUtil.ACADEMIC_YEAR_LIST));
        model.addObject("counterActive", session.getAttribute("counterActive"));
        model.addObject("currencyList", feesCurrencyService.getFeesCurrency());
        model.addObject("bankList", bankService.getAllBank());
        return model;
    }

    @RequestMapping(value = "/feeCollection/dcr/information", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> getStudentDetails(@RequestParam("enrollmentId") String enrollmentId,
        @RequestParam("semesterId") int semesterId, HttpSession session) {
        LOG.info("control in getStudentDetails ");
        List<StudentDemandDTO> studentDemand =
            feesDemandCreationTransactionService.getStudentDemand(enrollmentId, semesterId);
        Map<String, Object> map = new HashMap<String, Object>();
        List<StudentInfoForDCR> studentInfo = studentInformationService.getStudentByEnrollmentNumber(enrollmentId);
        if (!studentDemand.isEmpty()) {
            map.put("result", true);

            int studentId = studentInfo.get(0).getStudentId();
            String academicBatch = studentInfo.get(0).getAdmissionBatch();

            FeesCounterMasterEntity counter =
                feesCounterCreationService.getCounter(sessionUser.getCustomLoginUser().getUserId());

            session.setAttribute("counterId", counter.getId());

            String receiptNumber = feeCollectionService.getReceiptNo((int) session.getAttribute("receiptType"),
                (int) session.getAttribute("paymentMode"), sessionUser.getCustomLoginUser().getUserId(), academicBatch,
                counter.getCounterPrintName());

            int serialNumber = feeCollectionService.getReceiptSerialNo(sessionUser.getCustomLoginUser().getUserId(),
                counter.getId(), (int) session.getAttribute("receiptType"), (int) session.getAttribute("paymentMode"),
                receiptNumber);
            map.put("message", "false");
            map.put("studentDemand", studentDemand);
            map.put("studentInfo", studentInfo);
            map.put("receiptNumber", receiptNumber + (serialNumber + 1));
            map.put("feeDetails", feesDemandCreationTransactionService.getStudentFeeDetails(enrollmentId, semesterId));
            LOG.info("excess amount: " + feeCollectionService.getExcessAmount(studentId));
            map.put("excessAmt", feeCollectionService.getExcessAmount(studentId));
            LOG.info("counter : " + counter.getCounterPrintName());

        } else {
            int count = standardFeeMasterService.isStandardFeeDefined((int) session.getAttribute("receiptType"),
                studentInfo.get(0).getDegreeId(), studentInfo.get(0).getAdmissionBatchId(),
                studentInfo.get(0).getPaymentTypeId(), semesterId);

            if (count == 0) {
                map.put("message", "true");
            }
            map.put("result", "false");
            map.put("semesterId", semesterId);
            map.put("studentInfo", studentInfo);
        }
        return map;
    }

    @RequestMapping(value = "/feeCollection/dcr/setDcr", method = RequestMethod.POST)
    public String setDcr(@RequestParam("receiptType") int receiptType, @RequestParam("paymentMode") int paymentMode,
        HttpSession session) {
        LOG.info("control in set DCR ");
        session.setAttribute("receiptType", receiptType);
        session.setAttribute("paymentMode", paymentMode);
        session.setAttribute("counterActive", true);
        return "redirect:/feeCollection/dcr";
    }

    @RequestMapping(value = "/feeCollection/dcr/addDcr", method = RequestMethod.POST)
    public String addStudentDetails(@ModelAttribute("dcrMain") FeesDcrmainTransactionEntity mainEntity,
        HttpSession session) {
        LOG.info("main Entity:" + mainEntity.getTotalPaidAmount());
        int receiptId = (Integer) session.getAttribute("receiptType");
        int counterId = (Integer) session.getAttribute("counterId");
        int paymentModeId = (Integer) session.getAttribute("paymentMode");
        mainEntity.setCounterId(counterId);
        mainEntity.setReceiptId(receiptId);
        feeCollectionService.addStudentFeeDetails(mainEntity, paymentModeId);
        return "redirect:/feeCollection/dcr";
    }

    @RequestMapping(value = "/feeCollection/dcr/addDemand", method = RequestMethod.POST)
    public @ResponseBody String createStudentDemand(@RequestParam("degreeId") int degreeId,
        @RequestParam("branchId") int branchId, @RequestParam("paymentTypeId") int paymentTypeId,
        @RequestParam("demandFor") int demandFor, @RequestParam("semesterId") int semesterId,
        @RequestParam("enrollmentNumber") String enrollmentNumber, @RequestParam("admissionBatch") int admissionBatch,
        HttpSession session) {
        LOG.info("control in createStudentDemand");
        LOG.info("degreeId:" + degreeId + " branchId:" + branchId + " paymentTypeId:" + paymentTypeId + " demandFor:"
            + demandFor + " semesterId:" + semesterId + " " + "enrollmentNumber:" + enrollmentNumber
            + " admissionBatch:" + admissionBatch);
        feesDemandCreationTransactionService.createDemand((int) session.getAttribute("receiptType"), degreeId, branchId,
            paymentTypeId, semesterId, demandFor, enrollmentNumber, admissionBatch);
        return "demand created";
    }
}
