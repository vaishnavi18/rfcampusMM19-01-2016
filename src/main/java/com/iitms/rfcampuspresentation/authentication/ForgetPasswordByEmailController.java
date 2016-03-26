package com.iitms.rfcampuspresentation.authentication;

import java.io.UnsupportedEncodingException;

import javax.xml.bind.DatatypeConverter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampusdata.authentication.entity.UserMasterEntity;
import com.iitms.rfcampusdomain.authentication.service.ForgetPasswordByEmailService;

@Controller
public class ForgetPasswordByEmailController
{
	private static final Logger logger = LoggerFactory.getLogger(ForgetPasswordByEmailController.class);
	
	@Autowired
	private ForgetPasswordByEmailService forgetPasswordByEmailService ;
	
	@Autowired
	private JavaMailSenderImpl mailSender ;
	
	
	@RequestMapping(value="/forgetPassword",method=RequestMethod.GET)
	public String loadForgetPassword()// load forgetPassword Page
	{ 
		return "authentication/forgetPassword";
	}

	/** Method For Verify mail And Send Mail
	 * @throws UnsupportedEncodingException **/
	@RequestMapping(value="/forgetPassword",method=RequestMethod.POST)
	   public ModelAndView verifyEmail(@RequestParam("email")String email) throws UnsupportedEncodingException
	   {
		 ModelAndView model = new ModelAndView();
		   logger.info(email);
		    UserMasterEntity user=forgetPasswordByEmailService.checkEmailService(email);
		   if (user!=null)
		   {
			  logger.info("User id="+user.getUserId());			 
	          String subject= "Reset Password link";
	          String id = ""+user.getUserId();	          
	          byte[] message1 = id.getBytes("UTF-8");
	          String encoded = DatatypeConverter.printBase64Binary(message1);
	          String message= "http://localhost:8080/rfcampuspresentation/forgetPassword/reset?est="+encoded;
	          
	          logger.info("URL="+message );
	          logger.info("Encoding="+encoded );
	          System.out.println(encoded);
	         	          
			  SimpleMailMessage mailMessage= new SimpleMailMessage(); 
			  mailMessage.setTo(email);
			  mailMessage.setSubject(subject);
			  mailMessage.setText(message);
	          mailSender.send(mailMessage);
	          
	          model.setViewName("authentication/forgetPassword");
	          model.addObject("status", "Mail Send Successfully on "+email);
	        return model;
		   }
		   model.addObject("status", "Please Enter Registerd EmailId");
		   model.setViewName("authentication/forgetPassword");
		   return model;
	   }
	
	/**Method for Reset Password
	 * @throws UnsupportedEncodingException 
	 * @throws NumberFormatException **/
	@RequestMapping(value="/forgetPassword/reset",method=RequestMethod.GET)
	   public String  resetPassword(Model model,@RequestParam("est") String id) throws NumberFormatException, UnsupportedEncodingException
	   {
		   //ModelAndView model= new ModelAndView();
			byte[] decoded = DatatypeConverter.parseBase64Binary(id);
		   model.addAttribute("id",Integer.parseInt(new String(decoded,"UTF-8")));
		 //  model.setViewName("forgetPasswordReset");
		   //return model;
		   return "authentication/forgetPasswordReset";
	   }
	
	/**Method for Update Password**/
	 @RequestMapping(value="/forgetPassword/update",method=RequestMethod.POST)
	   public String updatePassword(@RequestParam("id")int id,@RequestParam("cpassword")String cpassword)
	   {
	          Boolean status=forgetPasswordByEmailService.updatePasswordService(id, cpassword); 	   
	          logger.info("Status:"+status);
		       return "authentication/result";
	   }
	
}
