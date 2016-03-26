package com.iitms.rfcampuspresentation.academic.admission;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampuscommon.FileUploadUtil;
import com.iitms.rfcampusdata.academic.admission.entity.ListTempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.admission.reportModel.StudentEducationDetailModel;
import com.iitms.rfcampusdata.academic.admission.reportModel.StudentPersonalInformationReportModel;
import com.iitms.rfcampusdata.academic.masters.entity.CollegeHeaderMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.QualifyingExamTypeMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.admission.service.AdmissionNotificationService;
import com.iitms.rfcampusdomain.academic.admission.service.StudentInformationService;
import com.iitms.rfcampusdomain.academic.admission.service.StudentRegistrationService;
import com.iitms.rfcampusdomain.academic.masters.service.CasteService;
import com.iitms.rfcampusdomain.academic.masters.service.CollegeHeaderMasterService;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;

/**
 * @author Sachinmt
 */
@Controller
public class StudentApplicationRegistrationController {

    private static final Logger LOG = LoggerFactory.getLogger(StudentApplicationRegistrationController.class);

    @Autowired
    private MasterService masterService;

    @Autowired
    CasteService admissionCasteMasterService;

    @Autowired
    StudentRegistrationService studentRegistrationService;

    @Autowired
    private FileUploadUtil fileUploadUtil;

    @Autowired
    private JavaMailSenderImpl mailSender;

    @Autowired
    private SessionUser sessionUser;

    @Autowired
    private CollegeHeaderMasterService collegeHeaderMasterService;
    
    @Autowired
    StudentInformationService studentInformationService;
    
    @Autowired
    AdmissionNotificationService admissionNotificationService;
    
    @RequestMapping(value = "/academic/application-registration", method = RequestMethod.GET)
    public String loadApplicationRegistration(ModelMap model) {
        LOG.info("loadApplicationRegistration : ");
        model.addAttribute(ConstantUtil.DEGREE_LIST, admissionNotificationService.getActiveDegrees());
        model.addAttribute(ConstantUtil.CATEGORY_LIST, masterService.getMasterData(ConstantUtil.CATEGORY_LIST));
        return "academic/application-reg";
    }

    @RequestMapping(value = "/academic/application-registration", method = RequestMethod.POST)
    public String addStudentRegistration(@ModelAttribute("studentRegistration") TempStudentRegistrationEntity entity,
        HttpServletRequest request, ModelMap model) {
        String registrationCredential = studentRegistrationService.addStudentRegistrationInfo(entity);
        LOG.info("Application Id:" + registrationCredential);
        String[] credential = registrationCredential.split("#");
        // ----------------------Mail------
        String subject = "Student registration for admission 2016-17";
        String message = "UserId/Application Id:" + credential[0] + "   Password:" + credential[1];

        LOG.info("URL=" + message);
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(entity.getEmailId());
        mailMessage.setSubject(subject);
        mailMessage.setText(message);
        try {
            mailSender.send(mailMessage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // -----------------------
        return "redirect:/academic/registration-successful";
    }

    @RequestMapping(value = "/academic/registration-successful", method = RequestMethod.GET)
    public String registrationSuccessfulJSP(ModelMap model) {
        LOG.info("RegistrationSuccessful:");
        return "/academic/registration-successful";
    }

    @RequestMapping(value = {"/academic/student-registration"}, method = RequestMethod.GET)
    public String getStudentRegistration(
        @RequestParam(name = "messageId", required = false, defaultValue = "0") int messageId,
        org.springframework.ui.Model model) {
        // if (id != 0) {
        model.addAttribute(ConstantUtil.MOTHERTONGUE_LIST, masterService.getMasterData(ConstantUtil.MOTHERTONGUE_LIST));
        model.addAttribute(ConstantUtil.CASTE_LIST, masterService.getMasterData(ConstantUtil.CASTE_LIST));
        model.addAttribute(ConstantUtil.CATEGORY_LIST, masterService.getMasterData(ConstantUtil.CATEGORY_LIST));
        model.addAttribute(ConstantUtil.COUNTRY_LIST, masterService.getMasterData(ConstantUtil.COUNTRY_LIST));
        model.addAttribute(ConstantUtil.STATE_LIST, masterService.getMasterData(ConstantUtil.STATE_LIST));
        model.addAttribute(ConstantUtil.NATIONALITY_LIST, masterService.getMasterData(ConstantUtil.NATIONALITY_LIST));
        model.addAttribute(ConstantUtil.QUALIFYING_EXAM_LIST,
            masterService.getAllRecords(QualifyingExamTypeMasterEntity.class));
        model.addAttribute(ConstantUtil.PREFERENCE_LIST,
            studentRegistrationService.getStudentBranchPrefrence(sessionUser.getCustomLoginUser().getStudentId()));
        model.addAttribute(ConstantUtil.STUDENT,
            studentRegistrationService.getStudentById(sessionUser.getCustomLoginUser().getStudentId()));
        model.addAttribute(ConstantUtil.MESSAGE, ConstantUtil.getMessage(messageId));

        return "academic/student-registration";
    }


    @RequestMapping(value = "/academic/student-registration", method = RequestMethod.POST)
    public String updateStudentRegistration(@ModelAttribute("studentRegistration") TempStudentRegistrationEntity entity,
        @RequestParam(name = "studentPhoto") MultipartFile studentPhoto,
        @RequestParam(name = "signaturePhoto") MultipartFile signaturePhoto, HttpServletRequest request,
        ModelMap model, RedirectAttributes redirectAttributes ) {
        LOG.info("Update Student :" + entity + " - studentPhoto: " + studentPhoto.getOriginalFilename()
            + " - signaturePhoto: " + signaturePhoto.getOriginalFilename());
        String fileName;
        if (studentPhoto != null && studentPhoto.getOriginalFilename() != "") {
            fileName =
                fileUploadUtil.uploadFile(request, studentPhoto, entity.getPhotoLink(), ConstantUtil.IMAGE);
            entity.setPhotoLink((fileName != null ? fileName : entity.getPhotoLink()));
        }

        if (signaturePhoto != null && signaturePhoto.getOriginalFilename() != "") {
            fileName = fileUploadUtil.uploadFile(request, signaturePhoto, entity.getSignatureLink(), ConstantUtil.IMAGE);
            entity.setSignatureLink((fileName != null ? fileName : entity.getSignatureLink()));
        }

        TempStudentRegistrationEntity result = studentRegistrationService.updateStudentRegistrationInfo(entity);

        LOG.info("Result:" + result);

        redirectAttributes.addFlashAttribute(ConstantUtil.MESSAGE, ConstantUtil.getMessage(2));
        
        return "redirect:/academic/student-registration";

    }

    @RequestMapping(value = "/student-login", method = RequestMethod.GET)
    public String loadApplicationRegistration1(ModelMap model) {
        LOG.info("student-login : ");
        return "academic/student-login";
    }
    
    /*==========Report By Sachin============*/
    /** Registration Report By Sachinmt
     * 
     * @param applicationId
     * @param password
     * @param webRequest
     * @param request
     * @return
     * @throws IOException
     * @throws JRException 
     */
    @RequestMapping(value = "/show-registration-report",method = RequestMethod.GET )
    public ModelAndView generateRegistrationReport(@RequestParam("applicationId")String applicationId,@RequestParam("password")String password,
        org.springframework.web.context.request.WebRequest webRequest,final HttpServletRequest request) throws IOException, JRException{
        
        ModelAndView modelAndView = new ModelAndView();
        LOG.info("Registration Application Id: "+applicationId+" Password"+password);
        Map<String,Object> parameterMap = new HashMap<String,Object>();
        
        /** Get Report Path **/
        String reportPath = request.getSession().getServletContext().getInitParameter("reportPath"); 
        parameterMap.put("SUBREPORT_DIR", reportPath);  
      
        /*JasperCompileManager.compileReportToFile(reportPath+"student-registration-report_personalInfoSubReport.jrxml");
        JasperCompileManager.compileReportToFile(reportPath+"registration.jrxml");
        JasperCompileManager.compileReportToFile(reportPath+"headerSubreport.jrxml");*/
        /** Student Information **/
        List<StudentPersonalInformationReportModel> studentPersonalInfoList = studentRegistrationService.getReport(applicationId,password); 
        LOG.info("Student Personal Information List: "+studentPersonalInfoList);
            
        for(StudentPersonalInformationReportModel list:studentPersonalInfoList){
           /** Student Personal Info
            * 
            */
            parameterMap.put("id", list.getId()); 
            parameterMap.put("applicationId", list.getApplicationId()); 
            parameterMap.put("studentName", list.getStudentName()); 
            parameterMap.put("middleName", list.getFatherName()); 
            parameterMap.put("lastName", list.getLastName()); 
            parameterMap.put("motherName", list.getMotherName()); 
            parameterMap.put("motherTongue", list.getMotherTungue()); 
            parameterMap.put("dob", list.getDateOfBirth()); 
            parameterMap.put("gender", list.getGenderName()); 
            parameterMap.put("caste", list.getCaste()); 
            parameterMap.put("category", list.getCategory()); 
            parameterMap.put("natinality", list.getNationality());
            System.out.println("photo list==>"+list.getPhotoLink());
            System.out.println("signature ==>"+list.getSignatureLink());
            parameterMap.put("photoLink", list.getPhotoLink());
            parameterMap.put("signatureLink", list.getSignatureLink());
            
            /** Student Address 
             * 
             */
            parameterMap.put("country", list.getCountry());
            parameterMap.put("state", list.getState());
            parameterMap.put("district", list.getDistrict());
            parameterMap.put("city", list.getCity());
            parameterMap.put("pincode", list.getPincode());
            parameterMap.put("address", list.getAddress());
            
            /** Student Contacts
             * 
             */
            parameterMap.put("permanantTelephone", list.getPermanentTelephoneStd()+"-"+list.getPermanentTelephone());
            parameterMap.put("permanantTelephoneStd",list.getPermanentTelephoneStd());
            parameterMap.put("mobile", list.getMobileNumber());
            parameterMap.put("email", list.getEmailId());
        }
            
        /**Student Education Details
         * 
         */
        List<StudentEducationDetailModel> educationDetailList = studentRegistrationService.getEducationDetails(  applicationId,  password);
        LOG.info("Student Student Eduaction List: "+educationDetailList);
        
        for(StudentEducationDetailModel list:educationDetailList){
               /** 10th Details
                * 
                */
                parameterMap.put("sscMath", list.getSscMaths());
                parameterMap.put("sscMathMax", list.getSscMathsMaximum());
                parameterMap.put("sscTotal", list.getSscTotal());
                parameterMap.put("sscOutOf", list.getSscOutof());
                parameterMap.put("sscPassingYear", list.getSscPassingYear());
                parameterMap.put("sscPercentage", list.getSscPerentage());
                /** 12th Details
                 * 
                 */
                parameterMap.put("hscMath", list.getHscMaths());
                parameterMap.put("hscMathmax", list.getHscMathsMax());
                parameterMap.put("hscChemistry", list.getHscChemestry());
                parameterMap.put("hscChemMax", list.getHscChemestryMax());
                parameterMap.put("hscPhysics", list.getHscPhysics());
                parameterMap.put("hscPhyMax", list.getHscPhysicsMax());
                parameterMap.put("hscPcm", list.getHscPcm());
                parameterMap.put("hscPcmMax", list.getHscPcmMax());
                parameterMap.put("hscTotal", list.getHscTotal());
                parameterMap.put("hscOutOf", list.getHscOutOf());
                parameterMap.put("hscPercentage", list.getHscPercentage());
                parameterMap.put("hscPassingYear", list.getHscPassingYear());
                /** Entrance Details
                 * 
                 */
                parameterMap.put("entranceExamId", list.getEntranceExamId());
                parameterMap.put("entranceExamRank", list.getEntranceExamRank());
                parameterMap.put("entranceExamRollNo", list.getEntranceExamRollNumber());
                parameterMap.put("entranceExamScore", list.getEntranceExamScore());
                parameterMap.put("entranceExamYear", list.getEntranceExamYear());
                /** Admission Status
                 * 
                 */
                parameterMap.put("admissionStatus", list.getAdmissionStatus());
            }
            
        
        /** Get College Header List Data **/
        List<CollegeHeaderMasterEntity> headerList = collegeHeaderMasterService.getCollegeHeader(); 
        LOG.info("College Header List: "+headerList);
        JRDataSource JRdataSource = new JRBeanCollectionDataSource(headerList);
        
       /* for(CollegeHeaderMasterEntity list:headerList){            
            parameterMap.put("collegeName", list.getCollegeName());
            parameterMap.put("collegeAddress", list.getCollegeAddress());
            parameterMap.put("collegeSocietyName", list.getNameOfSociety());
        }*/
        Integer[] collegeId = {1};
        List<CollegeInformation> collstudentIds = studentInformationService.getCollegeInfo(collegeId);
        for (CollegeInformation list : collstudentIds) {

            parameterMap.put("collegeName", list.getCollegeName());
            parameterMap.put("collegeAddress", list.getCollegeAddress());
            parameterMap.put("collegeLogo", list.getCollegeLogo());
        }
        parameterMap.put("dataSource", JRdataSource);   
        modelAndView = new ModelAndView("studentRegistrationReport", parameterMap);         
        return modelAndView;         
    }

    
    @RequestMapping(value = "/registrationMultipleReports",method = RequestMethod.GET )
    public ModelAndView generateMultipleReport(final HttpServletRequest request) throws IOException, JRException{
        /*LOG.info("Multiple Registration: "+applicationId+" Password"+password);*/
        ModelAndView modelAndView = new ModelAndView();
        Map<String,Object> parameterMap = new HashMap<String,Object>();
        
        /** Get Report Path **/
        String reportPath = request.getSession().getServletContext().getInitParameter("reportPath"); 
        LOG.info("SUBREPORT_DIR: "+reportPath);
        parameterMap.put("SUBREPORT_DIR", reportPath);  
        
        /** Student Information **/ 
        List<ListTempStudentRegistrationEntity> regStudentRecords = studentRegistrationService.getMultipleRegistardStudentsReports();  
        List<TempStudentRegistrationEntity> tempstdList = studentRegistrationService.getMultipleRegistardStudentsReports1();        
        List<CollegeHeaderMasterEntity> headerList = collegeHeaderMasterService.getCollegeHeader(); 
                
        /*JasperCompileManager.compileReportToFile(reportPath+"multipleRegistrationReport_subreport.jrxml");
        JasperCompileManager.compileReportToFile(reportPath+"multipleRegistrationReport.jrxml");
        JasperCompileManager.compileReportToFile(reportPath+"headerSubreport.jrxml");    */        
            
        int i = 1;
        if( i == 1){           
            JRDataSource jRdataSource = new JRBeanCollectionDataSource(regStudentRecords);
            parameterMap.put("dataSource", jRdataSource);        
            Integer[] collegeId = {1};
            List<CollegeInformation> collstudentIds = studentInformationService.getCollegeInfo(collegeId);
            for (CollegeInformation list : collstudentIds) {
                parameterMap.put("collegeName", list.getCollegeName());
                parameterMap.put("collegeAddress", list.getCollegeAddress());
                parameterMap.put("collegeLogo", list.getCollegeLogo());
            }
            
        modelAndView = new ModelAndView("multipleRegistration", parameterMap);         
        return modelAndView;
        }
        else if(i == 2)
        {
            int count = 1;
            for(TempStudentRegistrationEntity  list1:tempstdList){   
                ListTempStudentRegistrationEntity listObj = new ListTempStudentRegistrationEntity();                
                listObj.setRegistardStudentList(Arrays.asList(list1));               
                JRDataSource dataSource = new JRBeanCollectionDataSource(listObj.getRegistardStudentList());
                parameterMap.put("dataSource", dataSource);    
                 
                Integer[] collegeId = {1};
                List<CollegeInformation> collstudentIds = studentInformationService.getCollegeInfo(collegeId);
                for (CollegeInformation list : collstudentIds) {
                    parameterMap.put("collegeName", list.getCollegeName());
                    parameterMap.put("collegeAddress", list.getCollegeAddress());
                    parameterMap.put("collegeLogo", list.getCollegeLogo());
                } 
                
                JasperPrint print;
                try {
                    print = JasperFillManager.fillReport(reportPath+"jasperReport/multipleRegistrationSeparateReport" + ".jasper", parameterMap, dataSource);
                    JRExporter exporter = new JRPdfExporter();                    
                    exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
                    exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, new FileOutputStream("c:/tmp/report"+count + ".pdf")); // your output goes here
                    exporter.exportReport();
                } catch (JRException e) {                   
                    e.printStackTrace();
                }                                
                count++;
            }
            return null;
        }
            
                 
        return modelAndView;
    }
}
