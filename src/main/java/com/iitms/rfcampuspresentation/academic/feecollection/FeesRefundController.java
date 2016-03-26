package com.iitms.rfcampuspresentation.academic.feecollection;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.feecollection.dto.ReceiptTypeDTO;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesFeeheadEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundMainTransaction;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundRuleEntity;
import com.iitms.rfcampusdata.academic.feecollection.entity.FeesRefundruleCalculativeEntity;
import com.iitms.rfcampusdomain.academic.admission.service.StudentInformationService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesRefundService;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;

@Controller
public class FeesRefundController {

    private static final Logger LOG = LoggerFactory.getLogger(FeesRefundController.class);

    @Autowired
    private FeesRefundService feesRefundService;

    @Autowired
    private MasterService masterService;

    @Autowired
    private StudentInformationService studentInformationService;

    /* Fees Refund APIs */

    @RequestMapping(value = "/fees-refund")
    public String getFeesRefundJSP(ModelMap model) {
        LOG.info("Get Fees Refund JSP :");
        return "feeCollection/feesRefund";
    }

    @RequestMapping(value = "/fees-refund/get-info")
    public @ResponseBody Map<String, Object> getFeesInformation(@RequestParam String enrollmentNumber,
        @RequestParam int receiptTypeId, @RequestParam(required = false, defaultValue = "0") String dcrMainId,
        HttpSession httpSession) {
        LOG.info("Get Fees Information :");
        LOG.info("enrollmentNumber : " + enrollmentNumber + " = dcrMainId : " + dcrMainId + " = receiptTypeId : "
            + receiptTypeId);

        try {
            int studentId = getStudentId(enrollmentNumber, httpSession);
            Map<String, Object> map =
                feesRefundService.getFeesInformation(studentId, enrollmentNumber, receiptTypeId, dcrMainId);
            List<FeesRefundruleCalculativeEntity> refundRule = feesRefundService.getFeeRefundRule(9);
            for (FeesRefundruleCalculativeEntity entity : refundRule) {
                entity.setFeeheadEntity(new FeesFeeheadEntity());
            }
            map.put("refundRule", refundRule);
            return map;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/fees-refund/show-receipts")
    public @ResponseBody List<ReceiptTypeDTO> getStudentsReceipts(@RequestParam String enrollmentNumber,
        HttpSession httpSession) {
        LOG.info("Get Students Receipts :");
        try {
            return feesRefundService.getStudentsReceipts(getStudentId(enrollmentNumber, httpSession));
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/fees-refund/refund", method = RequestMethod.POST)
    public String setRefundFee(@ModelAttribute FeesRefundMainTransaction refundMainTransaction) throws Exception {
        LOG.info("Set Refund Fee :");
        LOG.info("refundMain : " + refundMainTransaction);
        try {
            feesRefundService.saveRefundMainRecord(refundMainTransaction);
            return "redirect:/fees-refund";
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/fees-refund/set-attributes", method = RequestMethod.GET)
    public @ResponseBody boolean setRefundRuleOptions(@RequestParam int paymentTypeId, @RequestParam int receiptTypeId,
        @RequestParam int refundRuleId, HttpSession session) {
        LOG.info("Set Refund Rule Options: ");
        session.setAttribute("paymentTypeId", paymentTypeId);
        session.setAttribute("receiptTypeId", receiptTypeId);
        session.setAttribute("refundRuleId", refundRuleId);
        return true;
    }

    /********************************************/

    /* Fees Refund Rules APIs */
    @RequestMapping(value = "/fees-refund-rule")
    public String getFeesRefundRuleJSP(ModelMap model) {
        LOG.info("Fees Refund Rule:");
        try {
            model.addAttribute(ConstantUtil.DEGREE_LIST, masterService.getMasterData(ConstantUtil.DEGREE_LIST));
            model.addAttribute(ConstantUtil.PAYMENT_TYPE_LIST,
                masterService.getMasterData(ConstantUtil.PAYMENT_TYPE_LIST));
            model.addAttribute(ConstantUtil.FEES_COLLECTION_RECEIPT_TYPE,
                masterService.getMasterData(ConstantUtil.FEES_COLLECTION_RECEIPT_TYPE));
            return "feeCollection/feeRefundRule";
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/fees-refund-rule", method = RequestMethod.POST)
    public String addFeesRefundRule(@ModelAttribute FeesRefundRuleEntity feesRefundRuleEntity) {
        LOG.info("Add Fees Refund Rule: " + feesRefundRuleEntity);
        try {
            feesRefundRuleEntity.setId(feesRefundService.getFeeRefundId(feesRefundRuleEntity.getDegreeId(),
                feesRefundRuleEntity.getPaymentTypeId(), feesRefundRuleEntity.getReceiptTypeId()));
            feesRefundService.saveRefundRule(feesRefundRuleEntity);
            return "redirect:/fees-refund-rule";
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/fees-refund-rule/heads", method = RequestMethod.GET)
    public @ResponseBody List<FeesRefundruleCalculativeEntity> getFeeHeads(@RequestParam int degreeId,
        @RequestParam int paymentTypeId, @RequestParam int receiptTypeId) {
        LOG.info("Get Fee Heads: ");
        try {
            return feesRefundService.getFeeHeads(degreeId, paymentTypeId, receiptTypeId);
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/fees-refund-rule/rules", method = RequestMethod.GET)
    public @ResponseBody List<FeesRefundRuleEntity> getRefundRuleOptions(@RequestParam int paymentTypeId,
        @RequestParam int receiptTypeId) {
        LOG.info("Get Refund Rule Options: ");
        try {
            return feesRefundService.getRefundRuleOptions(paymentTypeId, receiptTypeId);
        } catch (Exception e) {
            throw e;
        }
    }

    /********************************************/

    private int getStudentId(String enrollmentNumber, HttpSession httpSession) {
        Integer studentId = (Integer) httpSession.getAttribute("studentId");
        if (null == studentId) {
            studentId = studentInformationService.getStudentIdByEnrollmentNumber(enrollmentNumber);
            httpSession.setAttribute("studentId", studentId);
        }
        studentId = (int) httpSession.getAttribute("studentId");
        return studentId;
    }
}
