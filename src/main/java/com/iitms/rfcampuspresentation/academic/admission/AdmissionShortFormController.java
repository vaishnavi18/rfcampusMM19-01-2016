package com.iitms.rfcampuspresentation.academic.admission;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdmissionShortFormController {
    

    
    @RequestMapping(value="academic/admission-short-form", method = RequestMethod.GET)
    public String getAdmissionShortFromController(){
        
        return "academic/admission-short-form";
    }

}
