package com.iitms.rfcampuspresentation.establishment.transaction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployeeServiceBook {

    @RequestMapping(value="/establishment/transactions/employeeServiceBook",method=RequestMethod.GET)
    public String getEmployeeServiceBook(){
        System.out.println("inside EmployeeServiceBook");
        
        return "/establishment/transactions/employeeServiceBook";
    }
    
    @RequestMapping(value="/establishment/transactions/employeeServiceBook/getDetails", method=RequestMethod.POST)
    public ModelAndView getEmployeeServiceBookDetails(){
        ModelAndView modelAndView = new ModelAndView();
        
        System.out.println("CALLED CONTROLLER");
        
        modelAndView.addObject("obj", "NAME");
        
        return modelAndView;
    }
    
}
