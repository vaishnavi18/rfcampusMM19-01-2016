package com.iitms.rfcampuspresentation.payroll;

import javax.servlet.http.HttpSession;

import org.jfree.util.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.admission.entity.SharedPropertiesModel;
import com.iitms.rfcampusdata.payroll.masters.entity.PayscaleMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;
import com.iitms.rfcampusdomain.payroll.service.PayScaleService;

@Controller
public class PayScaleController {
    private static final Logger logger = LoggerFactory.getLogger(PayScaleController.class);

    @Autowired
    SharedPropertiesModel sharedPropertiesModel;

    @Autowired
    PayScaleService payScaleService;

    @Autowired
    private MasterService masterService;

    @RequestMapping(value = "/payroll/payscale", method = RequestMethod.GET)
    public ModelAndView addPayscaleDetails(HttpSession session) {

        ModelAndView model = new ModelAndView("payroll/payScale");
        model.addObject("payruleShortName", masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_PAYRULE));
        model.addObject("payscaleList", payScaleService.getAllPayScale());
        Log.info("payscaleMaster:" + masterService.getMasterData(ConstantUtil.PAYROLL_MASTER_PAYRULE));
        return model;
    }

    /*
     * @RequestMapping(value = "/payroll/payscale/add-update", method = RequestMethod.POST) public @ResponseBody int
     * addUpdateEmployeePayroll (@ModelAttribute PayscaleMaster payscaleMaster){ int list =
     * payScaleService.addPayScale(payscaleMaster); return list; }
     */

    @SuppressWarnings("unused")
    @RequestMapping(value = "/payroll/getPayScaleDetail", method = RequestMethod.POST)
    public String genratePayscale(@ModelAttribute("payscale") PayscaleMasterEntity payscaleMaster) {
        int result = 0;
        result = payScaleService.getPayScaleDetail(payscaleMaster);
        return "redirect:/payroll/payscale";

    }

    @RequestMapping(value = "/payscale/update", method = RequestMethod.POST)
    public String updatePayscale(@ModelAttribute("payscaleUpdate") PayscaleMasterEntity payscaleMaster) {
        payScaleService.updatePayscaleRecord(payscaleMaster);
        return "redirect:/payroll/payscale";
    }
}
