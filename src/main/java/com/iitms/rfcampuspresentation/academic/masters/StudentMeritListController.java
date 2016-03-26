package com.iitms.rfcampuspresentation.academic.masters;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.admission.entity.SharedPropertiesModel;
import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.admission.reportModel.DynamicJasperColumnNameModel;
import com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.MeritListStoreMaster;
import com.iitms.rfcampusdata.academic.masters.entity.MeritListTransactionEntity;
import com.iitms.rfcampusdata.academic.masters.entity.ReligionMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.admission.service.AdmissionNotificationService;
import com.iitms.rfcampusdomain.academic.admission.service.StudentInformationService;
import com.iitms.rfcampusdomain.academic.masters.service.CollegeHeaderMasterService;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;
import com.iitms.rfcampusdomain.academic.masters.service.StudentMeritListService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
public class StudentMeritListController {
    private static final Logger logger = LoggerFactory.getLogger(StudentMeritListController.class);

    @Autowired
    CollegeHeaderMasterService collegeHeaderMasterService;
    
    @Autowired
    StudentMeritListService studentMeritListService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    StudentInformationService studentInformationService;
    
    @Autowired
    private SharedPropertiesModel sharedPropertiesModel;

    @Autowired
    private SessionUser sessionUser;
    
    @Autowired
    private MasterService masterService;


    @Autowired
    private AdmissionNotificationService admissionNotificationService;
    /*
     * @RequestMapping(value= "/category/add", method =RequestMethod.POST) public String
     * addCategoryForm(@ModelAttribute("category")SharedPropertiesModel entity){ boolean result = sharedPropertiesModel;
     * return "redirect:/category"; }
     */
    // java.util.Map<String, Object> map = studentAdmissionService.loadAllStateDistrictAndCity();

    @RequestMapping(value = "/studentMeritList", method = RequestMethod.GET)
    public String meritListJSP(ModelMap model) {
        /*List<ModuleMasterEntity> moduleList =
            moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());*/

        List<CategoryMasterEntity> categoryList = sharedPropertiesModel.getCategoryList();
        List<ReligionMasterEntity> religionList = sharedPropertiesModel.getReligionList();
        model.addAttribute("categoryList", categoryList);
        //model.addAttribute("moduleList", moduleList);
        model.addAttribute("religionList", religionList);
        model.addAttribute("orderByList", studentMeritListService.getSortingList());
        model.addAttribute("sessionList", admissionNotificationService.getActiveSessionList());
        model.addAttribute("degreeList", sharedPropertiesModel.getDegreeList());
        return "studentMeritList";
        // List<StateMasterEntity>

    }

    @RequestMapping(value = "/studentMeritList1", method = RequestMethod.GET)
    public String meritList1JSP(ModelMap model) {
        /*List<ModuleMasterEntity> moduleList =
            moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());

        model.addAttribute("moduleList", moduleList);*/
        model.addAttribute("orderByList", studentMeritListService.getSortingList());
        model.addAttribute("sessionList", sharedPropertiesModel.getAcademicSessionList());
        return "studentMeritList";
        // List<StateMasterEntity>
    }

    @RequestMapping(value = "/academic/studentMeritList/generate", method = RequestMethod.POST)
    public @ResponseBody List<TempStudentRegistrationEntity> generateMeritList(
        @RequestParam(required = false, defaultValue = "0") int category, @RequestParam String restriction,
        @RequestParam(defaultValue = "null") String orderedColumns,RedirectAttributes redirectAttributes) {
        logger.info("GenerateMeritList : " + category + " - " + restriction + " - " + orderedColumns);
        List<TempStudentRegistrationEntity> list =
            studentMeritListService.generateMeritList(category, restriction, orderedColumns);
        if(list.isEmpty())
        {
            redirectAttributes.addFlashAttribute("message","NO MERIT LIST DETAILS AVAILABLE");
        }
        return list;
    }

    @RequestMapping(value = "/academic/studentMeritList/transfer", method = RequestMethod.POST)
    public @ResponseBody int transferMeritList(@RequestParam int sessionId, @RequestParam int degreeId,
        @RequestParam String studentList, @RequestParam(defaultValue = "null") String meritListName,RedirectAttributes redirectAttributes) {
        logger.info("transferMeritList : " + sessionId + " - " + degreeId + " - " + studentList);
        int meritListId = studentMeritListService.transferMeritList(sessionId, degreeId, studentList, meritListName);
        if(meritListId>0)
        {
            redirectAttributes.addFlashAttribute("message","MERIT LIST DETAILS TRANSFERRED SUCCESSFULLY");
        }
        else
        {
            redirectAttributes.addFlashAttribute("message","AN ERROR OCCURED...");
        }
        return meritListId;
    }

    @RequestMapping(value = "/academic/studentMeritList/show-merit-list", method = RequestMethod.GET)
    public String showMeritListJSP(ModelMap map, @RequestParam(name = "merit-list-id") int meritListId) {
        /*List<ModuleMasterEntity> moduleList =
            moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());*/
        
        logger.info("showMeritList : ");
        List<TempStudentRegistrationEntity> studentList = studentMeritListService.getMeritList(meritListId);
        String meritListName = studentMeritListService.getMeritListNameById(meritListId);
        //map.addAttribute("moduleList",moduleList);
        map.addAttribute("studentList",studentList);
        map.addAttribute("meritListName",meritListName);
        map.addAttribute("meritListId",meritListId);
        return "academic/generate-merit-list";
    }

    /*for viewing list of all merit list*/  
    @RequestMapping(value ="/academic/viewAllMeritList", method= RequestMethod.GET)
    public String viewAllMeritJSP(ModelMap map){
        
        logger.info("viewAllMeritList : ");
        List<MeritListStoreMaster> list= studentMeritListService.viewAllMeritList();
        map.addAttribute("meritList", list);
        return "academic/merit-list";
    }
    
    @RequestMapping(value = "/getList", method = RequestMethod.GET)
    public @ResponseBody HashMap<String, Object> getgroup2(@RequestParam(name = "groupId") String groupId,
        ModelMap model) {

        HashMap<String, Object> map = new HashMap<String, Object>();

        switch (groupId.trim()) {
            case "categoryList": {
                List<?> group2List = masterService.getMasterData(ConstantUtil.CATEGORY_LIST);
                map.put("categoryList", group2List);
                break;
                
            }
          
        }
       return map;
    }
    
    
    /** Generate Merit List Report
     *  
     * @param meritListId
     * @param webRequest
     * @param request
     * @return
     * @throws JRException 
     */
        
    @RequestMapping(value = "/show-merit-list-report",method = RequestMethod.GET )
    public ModelAndView generateMeritListReport(@RequestParam("meritListId")int meritListId,
        org.springframework.web.context.request.WebRequest webRequest,final HttpServletRequest request,RedirectAttributes redirectAttributes) throws JRException{
        
        logger.info("showMeritList : ");
        ModelAndView modelAndView = new ModelAndView();
        Map<String, Object> parameterMap = new HashMap<String, Object>();

        /** Get Image Folder Path **/
        String uploadPath = request.getSession().getServletContext().getInitParameter("uploadPath");
        logger.info("IMAGE_PATH: " + uploadPath);
        parameterMap.put("IMAGE_PATH", uploadPath); 
        /** Get Report Path **/
        String reportPath = request.getSession().getServletContext().getInitParameter("reportPath");
        logger.info("SUBREPORT_DIR: " + reportPath);
        parameterMap.put("SUBREPORT_DIR", reportPath); 
        /**
         * Get Student Merit List Data table
         */
        List<DynamicJasperColumnNameModel> studentMeritList = studentMeritListService.getMeritListReport(meritListId);
        if(studentMeritList.isEmpty())
        {
            redirectAttributes.addFlashAttribute("message","MERIT LIST GENERATED SUCCESSFULLY");
        }
        logger.info("Get Merit List: " + studentMeritList);

        JRDataSource JRdataSource = new JRBeanCollectionDataSource(studentMeritList);
        parameterMap.put("tableDataSource", JRdataSource);
        parameterMap.put("col1", true);
        parameterMap.put("col2", true);
        parameterMap.put("col5", true);
        parameterMap.put("col8", true);
        parameterMap.put("col11", true);
        parameterMap.put("col14", true);
        parameterMap.put("col16", true);
        parameterMap.put("col17", true);

        /** Get Merit List Name By its Id **/
        String meritListName = studentMeritListService.getMeritListNameById(meritListId);
        logger.info("Merit List Name: " + meritListName);
        parameterMap.put("meritListNamedataSource", meritListName);

        
        Integer[] collegeId = {1};
        List<CollegeInformation> collstudentIds = studentInformationService.getCollegeInfo(collegeId);
        for (CollegeInformation list : collstudentIds) {
            parameterMap.put("collegeName", list.getCollegeName());
            parameterMap.put("collegeAddress", list.getCollegeAddress());
            parameterMap.put("collegeLogo", list.getCollegeLogo());
        }
        modelAndView = new ModelAndView("meritList", parameterMap);
        return modelAndView;   
    } 
     
    @RequestMapping(value = "/academic/studentMeritList/student", method = RequestMethod.POST)
    public @ResponseBody List<TempStudentRegistrationEntity> getMeritListByStudentId(@RequestParam int meritListId, @RequestParam String id,RedirectAttributes redirectAttributes) {
        List<TempStudentRegistrationEntity> entity= studentMeritListService.getMeritListByStudentId(meritListId,id);
        if(entity.isEmpty())
        {
            redirectAttributes.addFlashAttribute("message","MERIT LIST NOT FOUND");
        }
        logger.info("Size :"+entity.size());
        return entity ;
    }
    
       
    @RequestMapping(value = "/academic/studentMeritList/edit", method = RequestMethod.POST)
    public @ResponseBody int editMeritList(@RequestParam String meritListName1, @RequestParam MeritListTransactionEntity[] studentList1, 
        @RequestParam(required = false, defaultValue = "0") int meritListId,RedirectAttributes redirectAttributes) {
        int meritList1 = studentMeritListService.editMeritList(meritListName1, studentList1);
        if(meritList1>0)
        {
            redirectAttributes.addFlashAttribute("message","update");
        }
        logger.info("EditMeritList :"+meritListId);
        //list meritListName = studentMeritListService.editMeritList(meritListId);
        return meritList1 ;
    }
    
        
    @RequestMapping(value = "/academic/studentMeritList/update", method = RequestMethod.POST)
    public @ResponseBody int updateMeritList(@RequestParam String studentList, 
        @RequestParam String meritListName,RedirectAttributes redirectAttributes) {
        int meritListId = studentMeritListService.updateMeritList(meritListName, studentList);
        if(meritListId>0)
        {
            redirectAttributes.addFlashAttribute("message","update");
        }
        return meritListId;
    }

}



