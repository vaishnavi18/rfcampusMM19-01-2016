package com.iitms.rfcampuspresentation.academic.admission;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.admission.entity.AdmissionNotificationDTO;
import com.iitms.rfcampusdata.academic.admission.entity.AdmissionNotificationEntity;
import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;
import com.iitms.rfcampusdomain.academic.admission.service.AdmissionNotificationService;
import com.iitms.rfcampusdomain.academic.admission.service.StudentInformationService;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
public class AdmissionNotificationController {

    private static final Logger LOG = LoggerFactory.getLogger(AdmissionNotificationController.class);

    @Autowired
    private AdmissionNotificationService admissionNotificationService;
    
    @Autowired
    private StudentInformationService studentInformationService;

    @Autowired
    private MasterService masterService;
    
    @RequestMapping(value = "/academic/admission-notification", method = RequestMethod.GET)
    public ModelAndView getAdmissionNotificationJSP(ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("academic/admission-notification");
        /*List<ModuleMasterEntity> moduleList =
            moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        model.addAttribute("moduleList", moduleList);*/
        //model.addAttribute("degreeTypeList", sharedPropertiesModel.getDegreeTypeList());
        model.addAttribute(ConstantUtil.DEGREE_LIST, masterService.getMasterData(ConstantUtil.DEGREE_LIST));
        model.addAttribute(ConstantUtil.BRANCH_LIST, masterService.getMasterData(ConstantUtil.BRANCH_LIST));
        model.addAttribute(ConstantUtil.ACADEMIC_SESSION_LIST, masterService.getMasterData(ConstantUtil.ACADEMIC_SESSION_LIST));

        return modelAndView;
    }

    @RequestMapping(value = "/academic/admission-notification1", method = RequestMethod.GET)
    public ModelAndView getAdmissionNotification1JSP(ModelMap model) {
        ModelAndView modelAndView = new ModelAndView("academic/admission-notification1");
        /*List<ModuleMasterEntity> moduleList =
            moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
        model.addAttribute("moduleList", moduleList);*/
        //model.addAttribute("degreeTypeList", sharedPropertiesModel.getDegreeTypeList());
        model.addAttribute(ConstantUtil.DEGREE_LIST, masterService.getMasterData(ConstantUtil.DEGREE_LIST));
        model.addAttribute(ConstantUtil.BRANCH_LIST, masterService.getMasterData(ConstantUtil.BRANCH_LIST));
        model.addAttribute(ConstantUtil.ACADEMIC_SESSION_LIST, masterService.getMasterData(ConstantUtil.ACADEMIC_SESSION_LIST));

        return modelAndView;
    }
    
    @RequestMapping(value = "/academic/admission-notification/notifications", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> getAdmissionNotificationList(
        @RequestParam(required = false, defaultValue = "0") int sessionId,
        @RequestParam(required = false, defaultValue = "0") int degreeId,
        @RequestParam(required = false, defaultValue = "0") int branchId) {
        List<AdmissionNotificationEntity> admissionNotificationList =
            admissionNotificationService.getAdmissionNotificationList(sessionId, degreeId, branchId);
            List<Integer> registeredranchIds = admissionNotificationService.getAlreadyRegisteredBranches();
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("admissionNotificationList", admissionNotificationList);
            map.put("registeredranchIds", registeredranchIds);
            
        return map;
    }

    @RequestMapping(value = "/academic/admission-notification/add-update", method = RequestMethod.POST)
    public @ResponseBody int addUpdateAdmissionNotification(
        @ModelAttribute AdmissionNotificationEntity admissionNotificationEntity) {
        LOG.info("Degree Ids : " + admissionNotificationEntity.getBranchIds().split(",").length);
        int flag = admissionNotificationService.addAdmissionNotification(admissionNotificationEntity);

        return flag;
    }

    @RequestMapping(value = "/academic/admission-notification/delete", method = RequestMethod.POST)
    public @ResponseBody int deleteAdmissionNotification(@RequestParam(name = "notificationId") int notificationId) {
        LOG.info("Delete Notification : " + notificationId);
        int flag = admissionNotificationService.deleteAdmissionNotification(notificationId);

        return flag;
    }

    @RequestMapping(value = "/academic/admission-notification/active-degrees", method = RequestMethod.POST)
    public @ResponseBody List<DegreeMasterEntity> getActiveDegreeList(
        @RequestParam(name = "degreeTypeId", required = false, defaultValue = "0") int degreeTypeId) {
        List<DegreeMasterEntity> list = admissionNotificationService.getActiveDegrees();

        return list;
    }

    @RequestMapping(value = "/academic/admission-notification/active-branch-list", method = RequestMethod.POST)
    public @ResponseBody List<BranchMasterEntity> getActiveBranchList() {
        List<BranchMasterEntity> list = admissionNotificationService.getActiveBranchList();

        return list;
    }

    @RequestMapping(value = "/academic/admission-notification/all-branches", method = RequestMethod.POST)
    public @ResponseBody List<BranchMasterEntity> getAllBranchList() {
        return admissionNotificationService.getAllBranchList();
    }

    @RequestMapping(value = "/academic/admission-notification/name", method = RequestMethod.POST)
    public @ResponseBody String gfhgh(@RequestParam(name = "sessionId", defaultValue = "0", required = false) int sessionId,
        @RequestParam(name = "degreeTypeId", defaultValue = "0", required = false) int degreeTypeId) {
        LOG.info("Merit List Name : "+sessionId + " - " + degreeTypeId);
        return admissionNotificationService.getMeritListName(sessionId, degreeTypeId);
    }
    
    
    @RequestMapping(value = "/academic/admission-notification/active-session", method = RequestMethod.POST)
    public @ResponseBody List<AcademicSessionMasterEntity> getActiveSession() {
        LOG.info("GetActiveSession : ");
        return admissionNotificationService.getActiveSessionList();
    }
    
    @RequestMapping(value = "/academic/admission-notification/print", method = RequestMethod.GET)
    public String printNotification(@RequestParam int notificationId) {
        LOG.info("PrintNotification : ");
         List<AdmissionNotificationDTO> notificationList = admissionNotificationService.getAdmissionNotification(notificationId);
        return "";
        
    }
    
    
    /** Generate Admission Notification Report
     * 
     * @param notificationId
     * @param request
     * @return
     * @throws IOException
     * @throws JRException
     */
    @RequestMapping(value = "/academic/admission-notification/printnotificationreport",method = RequestMethod.GET )
    public ModelAndView getAllAdmissionNotification(@RequestParam ("notificationId") int notificationId,final HttpServletRequest request) 
        throws IOException, JRException{
       
        ModelAndView modelAndView = new ModelAndView();      
        Map<String,Object> parameterMap = new HashMap<String,Object>();  
        
        /** Get Image Folder Path **/
        String uploadPath = request.getSession().getServletContext().getInitParameter("uploadPath");
        LOG.info("IMAGE_PATH: " + uploadPath);
        parameterMap.put("IMAGE_PATH", uploadPath); 
        /** Get Report Path **/
        String reportPath = request.getSession().getServletContext().getInitParameter("reportPath"); 
        parameterMap.put("SUBREPORT_DIR", reportPath);        
        
        List<AdmissionNotificationDTO> admissionNotfication = admissionNotificationService.getAdmissionNotification(notificationId);
       
        JRDataSource dataSource = new JRBeanCollectionDataSource(admissionNotfication);
        parameterMap.put("dataSource", dataSource);      
        
        Integer[] collegeId = {1}; 
        List<CollegeInformation> collstudentIds =  studentInformationService.getCollegeInfo(collegeId);
        for(CollegeInformation list:collstudentIds){
            parameterMap.put("collegeName", list.getCollegeName());
            parameterMap.put("collegeAddress", list.getCollegeAddress());
            parameterMap.put("collegeLogo", list.getCollegeLogo());
        }
        modelAndView = new ModelAndView("admissionNotification", parameterMap); 
        return modelAndView;    
    }
}
