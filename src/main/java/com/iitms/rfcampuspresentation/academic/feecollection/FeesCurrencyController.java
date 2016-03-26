package com.iitms.rfcampuspresentation.academic.feecollection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iitms.rfcampusdomain.academic.feecollection.service.FeesCurrencyService;

@Controller
public class FeesCurrencyController {
    
    private static final Logger logger = LoggerFactory.getLogger(FeesCurrencyController.class);
    
    @Autowired
    private FeesCurrencyService feesCurrencyService;
    
    @RequestMapping(value = "/feesCurrency", method = RequestMethod.GET)
    public String loadFeesCurrency(){
        logger.info("curreny list=>" + feesCurrencyService.getFeesCurrency());
        return "null";
    }

}

