package com.iitms.rfcampuspresentation.authentication;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.iitms.rfcampusdomain.academic.feecollection.service.ReceiptTypeService;

@EnableWebMvc
@ControllerAdvice
public class GlobalExceptionHandler {
//    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);
    
    @Autowired
    ReceiptTypeService receiptTypeService;
    
    public static final String DEFAULT_ERROR_VIEW = "error/genericError";
    
  
    
//    @ExceptionHandler( value = {SQLException.class, RuntimeException.class})
//    public String handleSQLException(HttpServletRequest request, Exception ex,ModelMap model){
//        logger.info("SQLException Occured:: URL="+request.getRequestURL());
//        model.addAttribute("reciptTypeList", receiptTypeService.listAllReceiptTypeService());
//        System.out.println("jaskirat SQLException Occured:");
//        return "error/genericError";
//    }
//    
// 
//    
//    @ExceptionHandler( value = {java.io.FileNotFoundException.class, RuntimeException.class})
//    public String FileNotFoundException(ModelMap model){
//        model.addAttribute("reciptTypeList", receiptTypeService.listAllReceiptTypeService());
//        logger.error("IOException handler executed");
//        System.out.println("jaskirat FileNotFoundException Occured:");
//        //returning 404 error code
//        return "error/genericError";
//    }
//    
//    @ExceptionHandler(value = {IOException.class, RuntimeException.class})
//    public String handleIOException(ModelMap model){
//        model.addAttribute("reciptTypeList", receiptTypeService.listAllReceiptTypeService());
//        logger.error("IOException handler executed");
//        System.out.println("jaskirat IOException handler executed Occured:");
//        //returning 404 error code
//        return "error/genericError";
//    }
    
    @ExceptionHandler(value = {Exception.class, RuntimeException.class})
    public ModelAndView defaultErrorHandler(HttpServletRequest request, Exception e) {
        
        ModelAndView mav = new ModelAndView(DEFAULT_ERROR_VIEW);
        mav.addObject("reciptTypeList", receiptTypeService.listAllReceiptTypeService());
        System.out.println("jaskirat All Exception Occured:");
        mav.addObject("datetime", new Date());
        mav.addObject("exception", e);
        mav.addObject("url", request.getRequestURL());
        return mav;
    }
    
    
    
} 
