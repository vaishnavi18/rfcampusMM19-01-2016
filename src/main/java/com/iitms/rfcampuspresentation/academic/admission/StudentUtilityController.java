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
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdomain.academic.admission.service.StudentAdmissionService;
import com.iitms.rfcampusdomain.academic.admission.service.StudentInformationService;
import com.iitms.rfcampusdomain.academic.admission.service.StudentRegistrationService;
import com.iitms.rfcampusdomain.academic.feecollection.service.FeesDemandCreationTransactionService;
import com.iitms.rfcampusdomain.academic.feecollection.service.ReceiptTypeService;
import com.iitms.rfcampusdomain.academic.feecollection.service.StandardFeeMasterService;
import com.iitms.rfcampusdomain.academic.masters.service.AcademicSessionServices;
import com.iitms.rfcampusdomain.academic.masters.service.CollegeHeaderMasterService;
import com.iitms.rfcampusdomain.academic.masters.service.DegreeService;
import com.iitms.rfcampusdomain.academic.masters.service.PaymentTypeService;
import com.iitms.rfcampusdomain.academic.masters.service.SemesterService;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.IDCardInformation;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.IDCardInformationList;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;

@Controller
public class StudentUtilityController {
    private static final Logger LOG = LoggerFactory.getLogger(StudentUtilityController.class);

    @Autowired
    CollegeHeaderMasterService collegeHeaderMasterService;

    @Autowired
    StudentRegistrationService studentRegistrationService;

    @Autowired
    ReceiptTypeService receiptTypeService;

    @Autowired
    DegreeService degreeService;

    @Autowired
    StudentInformationService studentInformationService;

    @Autowired
    PaymentTypeService paymentTypeService;

    @Autowired
    AcademicSessionServices academicSessionServices;

    @Autowired
    SemesterService semesterService;

    /*
     * @Autowired FeesFeeheadService feesFeeheadService;
     */
    @Autowired
    StudentAdmissionService studentAdmissionService;

    @Autowired
    StandardFeeMasterService standardFeeMasterService;

    @Autowired
    FeesDemandCreationTransactionService feesDemandCreationTransactionService;

    // displaying students information
    @RequestMapping(value = "/studentinfo", method = RequestMethod.GET)
    public ModelAndView loadDemandCreationJSP(ModelMap model, @RequestParam("util") String util) {
        /*
         * List<IDCardInformation> cardInformations = studentInformationService.getIDCardDetails(); System.out.println(
         * "idcard into==>"+cardInformations);
         */ ModelAndView modelAndView = new ModelAndView("/idcardutil");
        model.addAttribute("receiptTypeList", receiptTypeService.listAllReceiptTypeService());
        model.addAttribute("degreeList", degreeService.getAllDegree());
        model.addAttribute("paymentTypeList", paymentTypeService.getAllPaymentType());
        model.addAttribute("academicSessionList", academicSessionServices.getAcademicSession());
        model.addAttribute("semesterList", semesterService.getAllSemester());
        model.addAttribute("utilityType", util);
        return modelAndView;
    }

    @RequestMapping(value = "/academic/student/info1", method = RequestMethod.POST)
    public @ResponseBody List<StudentAdmissionEntity> getStudentLists(@RequestParam("degreeId") int degreeId,
        @RequestParam("branchId") int branchId, @RequestParam("semesterId") int semesterId, RedirectAttributes redirectAttributes) {

        List<StudentAdmissionEntity> studentList =
            studentAdmissionService.getStudentList(degreeId, branchId, semesterId);
        if(studentList.isEmpty())
        {redirectAttributes.addFlashAttribute("message","No records available");}
        return studentList;
    }

    /** Generates Id Card In PDF format
     * 
     * @param degreeId
     * @param branchId
     * @param semesterId
     * @param request
     * @return
     * @throws IOException
     * @throws JRException
     */
    @RequestMapping(value = "/idCardReport", method = RequestMethod.GET)
    public ModelAndView generateIdCardReport(@RequestParam("degreeId") int degreeId,
        @RequestParam("branchId") int branchId, @RequestParam("semesterId") int semesterId,
        final HttpServletRequest request,RedirectAttributes redirectAttributes) throws IOException, JRException {
        ModelAndView modelAndView = new ModelAndView();
        Map<String, Object> parameterMap = new HashMap<String, Object>();

        /** Get Image Folder Path **/
        String uploadPath = request.getSession().getServletContext().getInitParameter("uploadPath");
        LOG.info("IMAGE_PATH: " + uploadPath);
        parameterMap.put("IMAGE_PATH", uploadPath); 
        /** Get Report Path **/
        String reportPath = request.getSession().getServletContext().getInitParameter("reportPath");
        LOG.info("SUBREPORT_DIR: " + reportPath);
        parameterMap.put("SUBREPORT_DIR", reportPath);

        /*JasperCompileManager.compileReportToFile(reportPath + "idCardReport.jrxml");
       */
        /** Get the Student Ids from Above Filtration Criteria
         * 
         */
        List<Integer> studentIds = studentInformationService.getStudentIds(degreeId, branchId, semesterId);
        
        /** Get the Student List Base on List of Ids
         * 
         */
        List<IDCardInformation> regStudentRecords =
            studentInformationService.getIDCardDetails(studentIds.toArray(new Integer[studentIds.size()]));

        
        /** Create Object of JRDataSource to Display the 
         * Data on Jasper report.  
         */
       if(regStudentRecords.isEmpty())
       { redirectAttributes.addFlashAttribute("message","NO ID CARD DETAILS AVAILABLE");}

       if(regStudentRecords.isEmpty())
       { redirectAttributes.addFlashAttribute("message","NO ID CARD DETAILS AVAILABLE");}
        JRDataSource dataSource = new JRBeanCollectionDataSource(regStudentRecords);
        parameterMap.put("dataSource", dataSource);
        
        /** Get the College Details
         * 
         */
        Integer[] collegeId = {50001};
        List<CollegeInformation> collstudentIds = studentInformationService.getCollegeInfo(collegeId);
        for (CollegeInformation list : collstudentIds) {
            parameterMap.put("collegeName", list.getCollegeName());
            parameterMap.put("collegeAddress", list.getCollegeAddress());
            parameterMap.put("collegeLogo", list.getCollegeLogo());
        }
        
        /**Mapping with jrxml file
         * 
         */
        modelAndView = new ModelAndView("idCardReport", parameterMap);
        return modelAndView;
    }

    /** Generates the Addresses Labels in Address report
     *  
     * @param degreeId
     * @param branchId
     * @param semesterId
     * @param name
     * @param address
     * @param request
     * @return
     * @throws IOException
     * @throws JRException
     */
    @RequestMapping(value = "/addressReport", method = RequestMethod.GET)
    public ModelAndView generateAddressReport(@RequestParam("degreeId") int degreeId,
        @RequestParam("branchId") int branchId, @RequestParam("semesterId") int semesterId,
        @RequestParam("name") String name, @RequestParam String address, final HttpServletRequest request, RedirectAttributes redirectAttributes)
            throws IOException, JRException {
        ModelAndView modelAndView = new ModelAndView();
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        /** Get Student Ids based on Filtration Criteria
         * 
         */
        List<Integer> studentIds = studentInformationService.getStudentIds(degreeId, branchId, semesterId);
        /** Get the list of student as per the Fitration
         * 
         */
        List<IDCardInformation> students =
            studentInformationService.getAddressList(name, address, studentIds.toArray(new Integer[studentIds.size()]));

        if(students.isEmpty())
        {
            redirectAttributes.addFlashAttribute("message","NO ADDRESS DETAILS AVAILABLE");
        }
        /** Get Report Path **/
        String reportPath = request.getSession().getServletContext().getInitParameter("reportPath");
        LOG.info("SUBREPORT_DIR: " + reportPath);
        parameterMap.put("SUBREPORT_DIR", reportPath);
        
        /*JasperCompileManager.compileReportToFile(reportPath + "addressesReports.jrxml");*/

        JRDataSource dataSource = new JRBeanCollectionDataSource(students);
        parameterMap.put("dataSource", dataSource);

        modelAndView = new ModelAndView("addressReport", parameterMap);
        return modelAndView;
    }

    /** Generates the three Types of report for
     * Student Register report i.e. Multiple Student Reports,
     * Single Student Report, Student wise Separate reports.
     * 
     * @param degreeId
     * @param branchId
     * @param semesterId
     * @param reportType
     * @param request
     * @return
     * @throws IOException
     * @throws JRException
     */
    @RequestMapping(value = "/horizontalRegistrationReport", method = RequestMethod.GET)
    public ModelAndView getHorizontalInfo(@RequestParam("degreeId") int degreeId,
        @RequestParam("branchId") int branchId, @RequestParam("semesterId") int semesterId,
        @RequestParam("reportType") int reportType, final HttpServletRequest request, RedirectAttributes redirectAttributes) throws IOException, JRException {

        ModelAndView modelAndView = new ModelAndView();
        Map<String, Object> parameterMap = new HashMap<String, Object>();

        String uploadPath = request.getSession().getServletContext().getInitParameter("uploadPath");
        LOG.info("IMAGE_PATH: " + uploadPath);
        parameterMap.put("IMAGE_PATH", uploadPath); 
        /** Get Report Path **/
        String reportPath = request.getSession().getServletContext().getInitParameter("reportPath");
        LOG.info("SUBREPORT_DIR: " + reportPath);
        parameterMap.put("SUBREPORT_DIR", reportPath);

        /*
         * JasperCompileManager.compileReportToFile(reportPath + "horizontalRegistrationReport.jrxml");
         * JasperCompileManager.compileReportToFile(reportPath + "horizontalRegistrationReport.jrxml");
         */

        /** Get Student Ids Based on Filter.
         * 
         */
        List<Integer> studentIds = studentInformationService.getStudentIds(degreeId, branchId, semesterId);
        Integer[] collegeId = {1};
        List<CollegeInformation> collstudentIds = studentInformationService.getCollegeInfo(collegeId);

        for (CollegeInformation list : collstudentIds) {
            parameterMap.put("collegeName", list.getCollegeName());
            parameterMap.put("collegeAddress", list.getCollegeAddress());
            parameterMap.put("collegeLogo", list.getCollegeLogo());
        }

        /**
         * Get Student Details
         */
        List<IDCardInformation> students =
            studentInformationService.getHorizontalInfo(studentIds.toArray(new Integer[studentIds.size()]));
        if(students.isEmpty())
        {
            redirectAttributes.addFlashAttribute("message","NO REPORT AVAILABLE");
        }
        if (reportType == 1) {
            /**
             * Horizontal Report for multiple Students
             */
            LOG.info("student Info:" + students);
            JRDataSource dataSource = new JRBeanCollectionDataSource(students);
            parameterMap.put("dataSource", dataSource);
            modelAndView = new ModelAndView("horizontalRegistrationReport", parameterMap);

        } else if (reportType == 2) {
            /**
             * Vertical Single Pdf reports with multiple 
             * Student records.
             */
            IDCardInformationList cardInformationList = new IDCardInformationList();
            cardInformationList.setIdCardInformationList(students);
            JRDataSource dataSource = new JRBeanCollectionDataSource(Arrays.asList(cardInformationList));
            parameterMap.put("dataSource", dataSource);
            modelAndView = new ModelAndView("verticalRegSinglePDF", parameterMap);

        } else {
            /**
             * Vertical Multiple Pdf. Single Pdf 
             * for One Student
             */
            int count = 1;
            for (IDCardInformation list1 : students) {
                IDCardInformationList listObj = new IDCardInformationList();
                listObj.setIdCardInformationList(Arrays.asList(list1));
                JRDataSource dataSource = new JRBeanCollectionDataSource(listObj.getIdCardInformationList());
                parameterMap.put("dataSource", dataSource);
                JasperPrint print;
                try {
                    print = JasperFillManager.fillReport(reportPath + "verticalRegisterReport_separate" + ".jasper",
                        parameterMap, dataSource);
                    JRExporter exporter = new JRPdfExporter();
                    exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
                    /** Export Each PDF Report with its Registration No as 
                     *  Name of Report.
                     */
                    exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
                        new FileOutputStream("c:/tmp/" +list1.getRegistrationNumber() + ".pdf")); // your output goes here
                    exporter.exportReport();
                } catch (JRException e) {
                    e.printStackTrace();
                }
                count++;
            }
        }
        return modelAndView;
    }

    /** Generate Student Roll Number List Report
     * 
     * @param degreeId
     * @param branchId
     * @param semesterId
     * @param request
     * @param genderSymbol
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/rollNumberReport", method = RequestMethod.GET)
    public ModelAndView getRollNumberList(@RequestParam("degreeId") int degreeId,
        @RequestParam("branchId") int branchId, @RequestParam("semesterId") int semesterId,
        final HttpServletRequest request, @RequestParam("genderSymbol") String genderSymbol,RedirectAttributes redirectAttributes) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        
        /** Get Image Folder Path **/
        String uploadPath = request.getSession().getServletContext().getInitParameter("uploadPath");
        LOG.info("IMAGE_PATH: " + uploadPath);
        parameterMap.put("IMAGE_PATH", uploadPath); 
        /** Report Path **/
        String reportPath = request.getSession().getServletContext().getInitParameter("reportPath");
        parameterMap.put("SUBREPORT_DIR", reportPath);

        String symbol = "";
        if (genderSymbol.equals("1")) {
            symbol = "*";
        } else {
            symbol = "#";
        }
        parameterMap.put("symbol", symbol);

        /** College Header **/
        Integer[] collegeId = {1};
        List<CollegeInformation> collstudentIds = studentInformationService.getCollegeInfo(collegeId);
        for (CollegeInformation list : collstudentIds) {
            parameterMap.put("collegeName", list.getCollegeName());
            parameterMap.put("collegeAddress", list.getCollegeAddress());
            parameterMap.put("collegeLogo", list.getCollegeLogo());
        }
        List<StudentAdmissionEntity> studentIds = studentInformationService.getRollList(branchId, semesterId, degreeId);
        if(studentIds.isEmpty())
        {
            redirectAttributes.addFlashAttribute("message","NO ADDRESS DETAILS AVAILABLE");
        }
        JRDataSource dataSource = new JRBeanCollectionDataSource(studentIds);
        parameterMap.put("dataSource", dataSource);
        modelAndView = new ModelAndView("studentRollNoList", parameterMap);
        return modelAndView;
    }
}
