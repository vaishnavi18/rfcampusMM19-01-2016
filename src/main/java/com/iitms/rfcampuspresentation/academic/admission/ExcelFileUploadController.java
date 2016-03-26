/*******************************************************************************
 * Copyright (c) 2015 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *******************************************************************************/
package com.iitms.rfcampuspresentation.academic.admission;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

//import org.hibernate.mapping.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampuscommon.ExcelModel;
import com.iitms.rfcampusdomain.academic.admission.service.AdmissionExcelService;

/**
 * Upload MS-Excel into Database.
 * 
 * @author Sachinmt
 */
@Controller
public class ExcelFileUploadController {

    private static final Logger LOG = LoggerFactory.getLogger(ExcelFileUploadController.class);

    @Autowired
    private AdmissionExcelService admissionExcelService;

    @RequestMapping(value = "/excel-upload", method = RequestMethod.GET)
    public String excelHomeJSP(ModelMap model) {
        return "uploadExcel";
    }

    @RequestMapping(value = "/reg-excel", method = RequestMethod.GET)
    public String stdRegJSP(ModelMap model) {
        return "uploadExcel";
    }

    @RequestMapping(value = "/reg-excel", method = RequestMethod.POST)
    public String saveStdReg(Model model, @RequestParam("file") MultipartFile file, HttpServletRequest request,
        RedirectAttributes redirectAttributes) throws IOException, ParseException {

        int count = admissionExcelService.saveExcelSheet(file);
        LOG.info("Row Count : ", count);
        
        redirectAttributes.addFlashAttribute("message", "add");
        return "redirect:/excel-upload";
    }

    @RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public ModelAndView downloadExcel(ModelMap map) {
        LOG.info("Inside downloadExcel() Method");
        Date date = new Date();
        List<ExcelModel> excelModel = new ArrayList<ExcelModel>();

        excelModel.add(new ExcelModel(1, 80208784, 47788, "KIRAN VIRAJ CHOUDHARI", "BOT", "OBC", "OBC",
            "MAHARASHTRA", date, "National Institute of Technology, Raipur", "OTHERSTATE", "VIRAJ P. CHOUDHARI",
            "VIDYA VIRAJ CHOUDHARI", 9440545585l, "M"));

        excelModel.add(new ExcelModel(2, 80214330, 44295, "SATISH RAJESH SHARMA", "BOT", "GE", "GEN", "MAHARASHTRA",
            date, "National Institute of Technology, Raipur", "HOMESTATE", "RAJESH D. SHARMA", "RITA RAJESH SHARMA",
            9040610022l, "F"));
        
        map.addAttribute("excelModel", excelModel);
        map.addAttribute("excelReportName", ConstantUtil.EXCEL_SAMPLE_DOWNLOAD);

        return new ModelAndView("excelView", "excelModel", excelModel);
    }
}
