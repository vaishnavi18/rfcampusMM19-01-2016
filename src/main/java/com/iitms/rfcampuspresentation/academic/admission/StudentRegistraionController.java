package com.iitms.rfcampuspresentation.academic.admission;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iitms.rfcampuscommon.FileUploadUtil;
import com.iitms.rfcampusdata.academic.admission.entity.SharedPropertiesModel;
import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CountryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DistrictMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.GenderMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.NationalityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StateMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdomain.academic.admission.service.StudentAdmissionService;
import com.iitms.rfcampusdomain.academic.admission.service.StudentRegistrationService;
import com.iitms.rfcampusdomain.academic.masters.service.CasteService;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Controller
public class StudentRegistraionController {
    private static final Logger LOG = LoggerFactory.getLogger(StudentRegistraionController.class);

    @Autowired
    SharedPropertiesModel sharedPropertiesModel;

    @Autowired
    private StudentAdmissionService studentAdmissionService;

    @Autowired
    CasteService admissionCasteMasterService;

    @Autowired
    StudentRegistrationService studentRegistrationService;

    @Autowired
    private FileUploadUtil fileUploadUtil;

    @Autowired
    private SessionUser sessionUser;

    @Autowired
    private ModuleService moduleService;

    /*
     * @RequestMapping(value = "/academic/student-registration", method = RequestMethod.GET) public String
     * loadStudentRegistration(ModelMap model) { // Map<String, Object> map =
     * studentAdmissionService.loadAllStateDistrictAndCity(); List<ModuleMasterEntity> moduleList =
     * moduleService.listAuthorisedModule(sessionUser.getCustomLoginUser().getAllocatedRoleIds());
     * model.addAttribute("moduleList", moduleList); logger.info("ResetConfirmation : "); List<MothertongueMasterEntity>
     * motherTonguelist = sharedPropertiesModel.getMothertongueList(); List<CategoryMasterEntity> categoryList =
     * sharedPropertiesModel.getCategoryList(); // List<CityMasterEntity> cityList = (List<CityMasterEntity>)
     * map.get("cities"); // List<StateMasterEntity> stateList = (List<StateMasterEntity>) map.get("states");
     * List<NationalityMasterEntity> nationalityList = sharedPropertiesModel.getNationalityList();
     * List<CasteMasterEntity> castList = admissionCasteMasterService.getCastList(); List<BranchMasterEntity> branchList
     * = sharedPropertiesModel.getBranchList(); List<QualifyingExamTypeMasterEntity> qualifyingExamList =
     * sharedPropertiesModel.getQualifyingExamList(); model.addAttribute("motherTongueList", motherTonguelist);
     * model.addAttribute("categoryList", categoryList); // model.addAttribute("cityList", cityList); //
     * model.addAttribute("stateList", stateList); model.addAttribute("nationalityList", nationalityList);
     * model.addAttribute("castList", castList); model.addAttribute("branchList", branchList);
     * model.addAttribute("qualifyingExamList", qualifyingExamList); // logger.info("Result:"+list); return
     * "academic/student-registration"; }
     * @RequestMapping(value = "/academic/student-registration/add", method = RequestMethod.POST) public String
     * addStudentRegistration(@ModelAttribute("studentRegistration") TempStudentRegistrationEntity entity,
     * @RequestParam(name = "studentPhoto") MultipartFile studentPhoto,
     * @RequestParam(name = "signaturePhoto") MultipartFile signaturePhoto, HttpServletRequest request, ModelMap model)
     * { logger.info("Add Student :" + entity + " - studentPhoto: " + studentPhoto.getOriginalFilename() +
     * " - signaturePhoto: " + signaturePhoto.getOriginalFilename()); String fileName =
     * fileUploadUtil.uploadFile(request, studentPhoto, entity.getPhotoLink(), "academic", "registration");
     * entity.setPhotoLink((fileName != null ? fileName : entity.getPhotoLink())); fileName =
     * fileUploadUtil.uploadFile(request, signaturePhoto, entity.getSignatureLink(), "academic", "registration");
     * entity.setSignatureLink((fileName != null ? fileName : entity.getSignatureLink())); String registrationCredential
     * = studentRegistrationService.addStudentRegistrationInfo(entity); logger.info("Application Id:" +
     * registrationCredential); String[] credential = registrationCredential.split("#");
     * model.addAttribute("applicationId", credential[0]); model.addAttribute("applicationPassword", credential[1]);
     * return "/academic/registration-successfull"; }
     */

    @RequestMapping(value = "/academic/student-registration/information", method = RequestMethod.POST)
    public @ResponseBody TempStudentRegistrationEntity getStudentRegistrationInformation(
        @RequestParam String applicationId, @RequestParam(required = false) String password) {
        TempStudentRegistrationEntity entity =
            studentRegistrationService.getStudentRegistrationInformation(applicationId, password);
        LOG.info("Entity :  "+ entity );
        return entity;
    }

}
