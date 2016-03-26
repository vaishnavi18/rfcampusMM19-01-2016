package com.iitms.rfcampuspresentation.authentication;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DemoController {
    
    @RequestMapping(value = "/mypage99", method = RequestMethod.GET)
    public ModelAndView mypage1(ModelMap model) {
       System.out.println("inside mypage");
        ModelAndView modelAndView = new ModelAndView("demo/Section_RollNo_Allotment", model);
        return modelAndView;
    }
    
    @RequestMapping(value = "/mypage11", method = RequestMethod.GET)
    public ModelAndView mypage2(ModelMap model) {
       
        ModelAndView modelAndView = new ModelAndView("demo/batchAllotment", model);
        return modelAndView;
    }
    @RequestMapping(value = "/mypage13", method = RequestMethod.GET)
    public ModelAndView mypage3(ModelMap model) {
       
        ModelAndView modelAndView = new ModelAndView("demo/NewDemandCreation", model);
        return modelAndView;
    }
    
    @RequestMapping(value = "/mypage14", method = RequestMethod.GET)
    public ModelAndView mypage4(ModelMap model) {
       
        ModelAndView modelAndView = new ModelAndView("demo/Newjsp", model);
        return modelAndView;
    }
    
    @RequestMapping(value = "/mypage15", method = RequestMethod.GET)
    public ModelAndView mypage5(ModelMap model) {
       
        ModelAndView modelAndView = new ModelAndView("demo/IDCard", model);
        return modelAndView;
    }




}
