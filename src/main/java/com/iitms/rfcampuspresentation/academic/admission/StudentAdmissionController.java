package com.iitms.rfcampuspresentation.academic.admission;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.admission.entity.SharedPropertiesModel;
import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.NationalityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.SemesterMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentAddressMasterEntity;
import com.iitms.rfcampusdomain.academic.admission.service.StudentAdmissionService;
import com.iitms.rfcampusdomain.academic.admission.service.StudentRegistrationService;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;
import com.iitms.rfcampusdomain.academic.masters.service.PaymentTypeService;

@Controller
public class StudentAdmissionController {

    @Autowired
    private StudentAdmissionService studentAdmissionService;

    @Autowired
    private SharedPropertiesModel sharedPropertiesModel;

    @Autowired
    private PaymentTypeService paymentTypeService;
    
    @Autowired
    private StudentRegistrationService studentRegistrationService;

    @Autowired
    private MasterService masterService;
    
    private static final Logger logger = LoggerFactory.getLogger(StudentInformationController.class);

    @RequestMapping(value = "/academic/admission", method = RequestMethod.GET)
    public String studentsAdmissionJSP(ModelMap model) {
        logger.info("StudentsAdmissionForm");
        
        model.addAttribute(ConstantUtil.PAYMENT_TYPE_LIST, masterService.getMasterData(ConstantUtil.PAYMENT_TYPE_LIST));
        model.addAttribute(ConstantUtil.BRANCH_LIST, masterService.getMasterData(ConstantUtil.BRANCH_LIST));
        model.addAttribute(ConstantUtil.BATCH_LIST, masterService.getMasterData(ConstantUtil.BATCH_LIST));
        model.addAttribute(ConstantUtil.DEGREE_LIST, masterService.getMasterData(ConstantUtil.DEGREE_LIST));
        model.addAttribute(ConstantUtil.SEMESTER_LIST, masterService.getMasterData(ConstantUtil.SEMESTER_LIST));
        model.addAttribute(ConstantUtil.CATEGORY_LIST, masterService.getMasterData(ConstantUtil.CATEGORY_LIST));
        model.addAttribute(ConstantUtil.CASTE_LIST, masterService.getMasterData(ConstantUtil.CASTE_LIST));
        model.addAttribute(ConstantUtil.NATIONALITY_LIST, masterService.getMasterData(ConstantUtil.NATIONALITY_LIST));
        model.addAttribute(ConstantUtil.COUNTRY_LIST, masterService.getMasterData(ConstantUtil.COUNTRY_LIST));
        model.addAttribute(ConstantUtil.STATE_LIST, masterService.getMasterData(ConstantUtil.STATE_LIST));

        return "academic/admission-short-form";
    }

    @RequestMapping(value = "/academic/admission", method = RequestMethod.POST)
    public @ResponseBody int studentsAdmissionFormPost(
        @RequestParam("studentAdmissionParameters") String studentAdmissionParameters,
        @RequestParam("studentAddressParameters") String studentAddressParameters,
        @RequestParam("admission-type") int admissionType) {
        logger.info("StudentsAdmissionFormPost");
        logger.info("studentAdmissionParameters : " + studentAdmissionParameters);
        logger.info("studentAddressParameters : " + studentAddressParameters);
        logger.info("admission-type : " + admissionType);

        StudentAdmissionEntity studentAdmissionEntity =
            new Gson().fromJson(studentAdmissionParameters, StudentAdmissionEntity.class);
        StudentAddressMasterEntity studentAddressMasterEntity =
            new Gson().fromJson(studentAddressParameters, StudentAddressMasterEntity.class);

        int studentId = studentAdmissionService.addStudent(studentAdmissionEntity, studentAddressMasterEntity, admissionType);

        return studentId;
    }

    @RequestMapping(value = "/academic/master/caste", method = RequestMethod.POST)
    public @ResponseBody List<CasteMasterEntity> getCasteList(@RequestParam("category-id") int categoryId) {
        logger.info("GetCasteList");
        List<CasteMasterEntity> casteList = studentAdmissionService.getCasteList(categoryId);

        return casteList;
    }

    @RequestMapping(value = "/academic/master/branch", method = RequestMethod.POST)
    public @ResponseBody List<BranchMasterEntity> getBranchList(@RequestParam("degree-id") int degreeId) {
        logger.info("GetBranchList");
        List<BranchMasterEntity> branchList = studentAdmissionService.getBranchList(degreeId);

        return branchList;
    }

    @RequestMapping(value = "/academic/student/info", method = RequestMethod.POST)
    public @ResponseBody List<StudentAdmissionEntity> getStudentInformation(@RequestParam("degreeId") int degreeId,
        @RequestParam("branchId") int branchId, @RequestParam("semesterId") int semesterId) {
        logger.info("GetStudentInformation");
        List<StudentAdmissionEntity> studentList =
            studentAdmissionService.getStudentList(degreeId, branchId, semesterId);

        return studentList;
    }
}
