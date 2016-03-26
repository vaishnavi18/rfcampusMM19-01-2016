package com.iitms.rfcampuspresentation.academic.studentsection;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.masters.entity.SelectedPropertiesMasterEntity;
import com.iitms.rfcampuspresentation.academic.studentsection.service.StudentSelectedFiledsService;

@Controller
public class StudentSelectedFiledsController {

    private static final Logger Log = LoggerFactory.getLogger(StudentSelectedFiledsController.class);

    @Autowired
    private StudentSelectedFiledsService studentSelectedFiledsService;

    @RequestMapping(value = "/utility/student-selected-fields", method = RequestMethod.GET)
    public String homeJSP(ModelMap map) {
        Log.info("");
        map.addAttribute("academicProperties", studentSelectedFiledsService.getAllAcademicProperties());
        
        return "student-section/Newjsp";
    }

    @RequestMapping(value = "/utility/student-selected-fields", method = RequestMethod.POST)
    public @ResponseBody List<SelectedPropertiesMasterEntity> showReport(@RequestParam String selectedFields,
        @RequestParam String orderBy, @RequestParam String filters) {
        Log.info("selectedFields : " + selectedFields + " - orderBy : " + orderBy + " - filters : " + filters);
        return studentSelectedFiledsService.getSelectedProperties(selectedFields, orderBy, filters);
    }

    @RequestMapping(value = "/utility/student-selected-fields/report", method = RequestMethod.POST)
    public ModelAndView export(@RequestParam String selectedFields, @RequestParam String orderBy,
        @RequestParam String filters, ModelMap map) {
        Log.info("Export : selectedFields : " + selectedFields + " - orderBy : " + orderBy + " - filters : " + filters);
        List<SelectedPropertiesMasterEntity> list =
            studentSelectedFiledsService.getSelectedProperties(selectedFields, orderBy, filters);

        map.addAttribute("excelModel", list);
        map.addAttribute("excelReportName", ConstantUtil.EXCEL_SELECTED_FIELD);
        
        return new ModelAndView("excelView", "excelModel", list);
    }
}
