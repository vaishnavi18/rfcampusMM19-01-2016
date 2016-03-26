package com.iitms.rfcampuspresentation.academic.feecollection;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdomain.academic.admission.service.StudentAdmissionService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesDemandCreationTransactionService;
import com.iitms.rfcampusdomain.academic.feecollection.service.ReceiptTypeService;
import com.iitms.rfcampusdomain.academic.masters.service.AcademicSessionServices;
import com.iitms.rfcampusdomain.academic.masters.service.DegreeService;
import com.iitms.rfcampusdomain.academic.masters.service.PaymentTypeService;
import com.iitms.rfcampusdomain.academic.masters.service.SemesterService;

@Controller
public class FeesDemandCreationTransactionController {
    private static final Logger logger = org.slf4j.LoggerFactory.getLogger(FeesFeeheadController.class);

    @Autowired
    private ReceiptTypeService receiptTypeService;

    @Autowired
    private DegreeService degreeService;

    @Autowired
    private PaymentTypeService paymentTypeService;

    @Autowired
    private AcademicSessionServices academicSessionServices;

    @Autowired
    private SemesterService semesterService;

    @Autowired
    private StudentAdmissionService studentAdmissionService;

    @Autowired
    private FeesDemandCreationTransactionService feesDemandCreationTransactionService;

    @RequestMapping(value = "/feeCollection/demand", method = RequestMethod.GET)
    public ModelAndView loadDemandCreationJSP(ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("feeCollection/demand-creation");
        model.addAttribute("receiptTypeList", receiptTypeService.listAllReceiptTypeService());
        model.addAttribute("degreeList", degreeService.getAllDegree());
        model.addAttribute("paymentTypeList", paymentTypeService.getAllPaymentType());
        model.addAttribute("academicSessionList", academicSessionServices.getAcademicSession());
        model.addAttribute("semesterList", semesterService.getAllSemester());
        return modelAndView;
    }

    @RequestMapping(value = "/feeCollection/demand/student-list", method = RequestMethod.POST)
    public @ResponseBody List<StudentAdmissionEntity> getStudentList(@RequestParam("degreeId") int degreeId,
        @RequestParam("branchId") int branchId, @RequestParam("semesterId") int semesterId) {

        List<StudentAdmissionEntity> studentList =
            studentAdmissionService.getStudentList(degreeId, branchId, semesterId);

        return studentList;
    }

    @RequestMapping(value = "/feeCollection/demand/create", method = RequestMethod.POST)
    public @ResponseBody int createDemand(@RequestParam("receiptId") int receiptId,
        @RequestParam("degreeId") int degreeId, @RequestParam("branchId") int branchId,
        @RequestParam("paymentTypeId") int paymentTypeId, @RequestParam("semesterId") int semesterId,
        @RequestParam("demandFor") int demandFor, @RequestParam("enrollmentIds") String enrollmentIds,
        @RequestParam("acadamicSessionId") int acadamicSessionId,
        @RequestParam("overwriteDemand") String overwriteDemand) {
        logger.info("enrollmentIds:" + enrollmentIds);
        logger.info("overwriteDemand:" + overwriteDemand);
        if (overwriteDemand.equals("true")) {
            feesDemandCreationTransactionService.deleteDemand(degreeId, branchId, paymentTypeId, semesterId,
                enrollmentIds);
        }
        feesDemandCreationTransactionService.createDemand(receiptId, degreeId, branchId, paymentTypeId, semesterId,
            demandFor, enrollmentIds, acadamicSessionId);
        return 1;
    }

}
