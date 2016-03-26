package com.iitms.rfcampuspresentation.academic.admission;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampuscommon.FileUploadUtil;
import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.academic.masters.entity.FamilyMemberDetailEntity;
import com.iitms.rfcampusdata.academic.masters.entity.LastQualifyingExamMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.QualifyingExamTypeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentAddressMasterEntity;
import com.iitms.rfcampusdomain.academic.admission.service.StudentInformationService;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;

@Controller
public class StudentInformationController {

    private static final Logger LOG = LoggerFactory.getLogger(StudentInformationController.class);

    @Autowired
    private StudentInformationService studentInformationService;

    @Autowired
    private FileUploadUtil fileUploadUtil;

    @Autowired
    private MasterService masterService;

    @RequestMapping(value = "/academic/student/information", method = RequestMethod.GET)
    public ModelAndView getCollegesJSP(ModelMap model, HttpServletRequest request) {
        
        try {
            ModelAndView modelAndView = new ModelAndView("academic/student-information");

            model.addAttribute(ConstantUtil.BLOOD_GROUP_LIST, masterService.getMasterData(ConstantUtil.BLOOD_GROUP_LIST));
            model.addAttribute(ConstantUtil.NATIONALITY_LIST, masterService.getMasterData(ConstantUtil.NATIONALITY_LIST));
            model.addAttribute(ConstantUtil.RELIGION_LIST, masterService.getMasterData(ConstantUtil.RELIGION_LIST));
            model.addAttribute(ConstantUtil.CATEGORY_LIST, masterService.getMasterData(ConstantUtil.CATEGORY_LIST));
            model.addAttribute(ConstantUtil.CASTE_LIST, masterService.getMasterData(ConstantUtil.CASTE_LIST));
            model.addAttribute(ConstantUtil.BRANCH_LIST, masterService.getMasterData(ConstantUtil.BRANCH_LIST));
            model.addAttribute(ConstantUtil.BATCH_LIST, masterService.getMasterData(ConstantUtil.BATCH_LIST));
            model.addAttribute(ConstantUtil.SEMESTER_LIST, masterService.getMasterData(ConstantUtil.SEMESTER_LIST));
            model.addAttribute(ConstantUtil.DEGREE_LIST, masterService.getMasterData(ConstantUtil.DEGREE_LIST));
            model.addAttribute(ConstantUtil.PAYMENT_TYPE_LIST, masterService.getMasterData(ConstantUtil.PAYMENT_TYPE_LIST));
            model.addAttribute(ConstantUtil.ACADEMIC_YEAR_LIST,
                masterService.getMasterData(ConstantUtil.ACADEMIC_YEAR_LIST));
            model.addAttribute(ConstantUtil.STUDENT_STATUS_LIST,
                masterService.getMasterData(ConstantUtil.STUDENT_STATUS_LIST));
            model.addAttribute(ConstantUtil.MOTHERTONGUE_LIST, masterService.getMasterData(ConstantUtil.MOTHERTONGUE_LIST));
            model.addAttribute(ConstantUtil.BANK_LIST, masterService.getMasterData(ConstantUtil.BANK_LIST));
            model.addAttribute(ConstantUtil.PHYSICALLY_HANDICAPPED_LIST,
                masterService.getMasterData(ConstantUtil.PHYSICALLY_HANDICAPPED_LIST));
            model.addAttribute(ConstantUtil.DOCUMENT_LIST, masterService.getMasterData(ConstantUtil.DOCUMENT_LIST));
            model.addAttribute(ConstantUtil.OCCUPATION_LIST, masterService.getMasterData(ConstantUtil.OCCUPATION_LIST));
            model.addAttribute(ConstantUtil.EDUCATION_LIST, masterService.getMasterData(ConstantUtil.EDUCATION_LIST));
            model.addAttribute(ConstantUtil.QUALIFYING_EXAM_LIST,
                masterService.getAllRecords(QualifyingExamTypeMasterEntity.class));
            model.addAttribute(ConstantUtil.SCHOLARSHIP_TYPE_LIST,
                masterService.getMasterData(ConstantUtil.SCHOLARSHIP_TYPE_LIST));
            model.addAttribute(ConstantUtil.STATE_LIST,
                masterService.getMasterData(ConstantUtil.STATE_LIST));
            return modelAndView;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information/add-ajax", method = RequestMethod.POST)
    public @ResponseBody int addStudentAjax(
        @RequestParam("studentAdmissionParameters") String studentAdmissionParameters,
        @RequestParam("studentAddressParameters") String studentAddressParameters,
        @RequestParam("sscHsscDetails") String sscHsscDetails,
        @RequestParam("lastQualifyingJsonStr") String lastQualifyingJsonStr,
        @RequestParam("entranceExamJsonStr") String entranceExamJsonStr,
        // @RequestParam("familyMemberJsonStr") String familyMemberJsonStr,
        @RequestParam(name = "studentOldPhoto", required = false) String studentOldPhoto,
        @RequestParam(name = "studentOldsignature", required = false) String studentOldsignature,
        @RequestParam(name = "studentImage", required = false) MultipartFile studentImage,
        @RequestParam(name = "studentSignatureImage", required = false) MultipartFile studentSignature,
        HttpServletRequest request) {

        try {
            LOG.info("studentAdmissionParameters : " + studentAdmissionParameters);
            LOG.info("studentAddressParameters : " + studentAddressParameters);
            LOG.info("sscHsscDetails : " + sscHsscDetails);
            LOG.info("lastQualifyingJsonStr : " + lastQualifyingJsonStr);
            LOG.info("entranceExamJsonStr : " + entranceExamJsonStr);
            LOG.info("photoLink : " + studentOldPhoto);
            LOG.info("signatureLink : " + studentOldsignature);

            StudentAdmissionEntity studentAdmissionEntity =
                new Gson().fromJson(studentAdmissionParameters, StudentAdmissionEntity.class);
            StudentAddressMasterEntity StudentAddressMasterEntity =
                new Gson().fromJson(studentAddressParameters, StudentAddressMasterEntity.class);

            String fileName;
            if (studentImage != null && studentImage.getOriginalFilename() != "") {
                fileName = fileUploadUtil.uploadFile(request, studentImage, studentAdmissionEntity.getStudentOldPhoto(),
                    ConstantUtil.IMAGE);
                studentAdmissionEntity
                    .setStudentPhoto((fileName != null ? fileName : studentAdmissionEntity.getStudentOldPhoto()));
            } else {
                studentAdmissionEntity.setStudentPhoto(studentAdmissionEntity.getStudentOldPhoto());
            }

            if (studentSignature != null && studentSignature.getOriginalFilename() != "") {
                fileName = fileUploadUtil.uploadFile(request, studentSignature,
                    studentAdmissionEntity.getStudentOldSignature(), ConstantUtil.IMAGE);
                studentAdmissionEntity
                    .setStudentSignature((fileName != null ? fileName : studentAdmissionEntity.getStudentOldSignature()));
            } else {
                studentAdmissionEntity.setStudentSignature(studentAdmissionEntity.getStudentOldSignature());
            }

            int studentId = studentInformationService.addStudentAjax(studentAdmissionEntity, StudentAddressMasterEntity,
                sscHsscDetails, lastQualifyingJsonStr, entranceExamJsonStr, ""/* familyMemberJsonStr */);

            return studentId;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information/basic-information", method = RequestMethod.POST)
    public @ResponseBody int updateStudentBasicInformation(@RequestBody StudentAdmissionEntity studentAdmissionEntity) {
        try {
            LOG.info("Admission : " + studentAdmissionEntity.getStudentBasicInformation());
            int studentId = studentInformationService.updateStudentBasicInformation(studentAdmissionEntity);
            return studentId;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information/parents-information", method = RequestMethod.POST)
    public @ResponseBody int updateStudentParentsDetails(
        @RequestBody StudentAddressMasterEntity StudentAddressMasterEntity) throws Exception {
        try {
            LOG.info("parents : " + StudentAddressMasterEntity.getStudentParentsDetails());
            int flag = studentInformationService.updateStudentParentsDetails(StudentAddressMasterEntity);
            return flag;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information/address-information", method = RequestMethod.POST)
    public @ResponseBody int updateStudentAddressDetails(
        @RequestBody StudentAddressMasterEntity StudentAddressMasterEntity) {
        try {
            LOG.info("address : " + StudentAddressMasterEntity.getStudentAddressDetails());
            int flag = studentInformationService.updateStudentAddressDetails(StudentAddressMasterEntity);
            return flag;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information/admission-information", method = RequestMethod.POST)
    public @ResponseBody int updateStudentAdmissionDetails(@RequestBody StudentAdmissionEntity studentAdmissionEntity) {
        try {
            LOG.info("admission : " + studentAdmissionEntity.getStudentAdmissionInformation());
            int studentId = studentInformationService.updateStudentAdmissionDetails(studentAdmissionEntity);
            return studentId;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information/personal-information", method = RequestMethod.POST)
    public @ResponseBody int updateStudentPersonalDetails(@RequestBody StudentAdmissionEntity studentAdmissionEntity) {
        try {
            LOG.info("personal : " + studentAdmissionEntity.getStudentPersonalDetails());
            int studentId = studentInformationService.updateStudentPersonalDetails(studentAdmissionEntity);
            return studentId;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information/document-information", method = RequestMethod.POST)
    public @ResponseBody boolean updateStudentDocumentList(@RequestParam(required = false) Integer studentId,
        @RequestParam String registrationNumber, @RequestParam(required = false) String documentList) {
        try {
            LOG.info("DocumentList : " + documentList);
            boolean flag = studentInformationService.updateStudentDocumentList(registrationNumber, documentList);
            return flag;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information/last-qualification", method = RequestMethod.POST)
    public @ResponseBody boolean updateStudentLastQualification(@RequestParam String registrationNumber,
        @RequestParam("lastQualifications") String lastQualificationJson,
        @RequestParam("sscHsscDetails") String sscHsscDetails,
        @RequestParam(name = "studentId", defaultValue = "0") int studentId) {
        try {
            LOG.info("RegistrationNumber : " + registrationNumber + "-- Array : " + lastQualificationJson);

            LastQualifyingExamMasterEntity[] lastQualifyingExams =
                new Gson().fromJson("[" + lastQualificationJson + "]", LastQualifyingExamMasterEntity[].class);
            for (LastQualifyingExamMasterEntity e : lastQualifyingExams)
                LOG.info("LastQualification : " + e.getLastQualification());

            LastQualifyingExamMasterEntity sscHsscDetail =
                new Gson().fromJson(sscHsscDetails, LastQualifyingExamMasterEntity.class);

            LOG.info("SscHsscDetail : " + sscHsscDetail.getSscHsscDetails());

            boolean flag = studentInformationService.updateStudentLastQualification(registrationNumber, lastQualifyingExams,
                sscHsscDetail, studentId);
            return flag;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information/entrance-exam", method = RequestMethod.POST)
    public @ResponseBody boolean updateStudentEntranceExam(@RequestParam String registrationNumber,
        @RequestParam("entranceExamJson") String entranceExamJson,
        @RequestParam(name = "studentId", defaultValue = "0") int studentId) {
        try {
            LOG.info("RegistrationNumber : " + registrationNumber + "-- Array : " + entranceExamJson);

            LastQualifyingExamMasterEntity entranceExam =
                new Gson().fromJson(entranceExamJson, LastQualifyingExamMasterEntity.class);
            LOG.info("EntranceDetails : " + entranceExam.getEntranceDetails());

            boolean flag = studentInformationService.updateStudentEntranceExam(registrationNumber, null, studentId);
            return flag;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information/family-member", method = RequestMethod.POST)
    public @ResponseBody boolean updateStudentFamilyMemberDetails(@RequestParam String registrationNumber,
        @RequestParam("familyMemberJson") String familyMemberJson,
        @RequestParam(name = "studentId", defaultValue = "0") int studentId) {
        try {
            LOG.info("RegistrationNumber : " + registrationNumber + "-- Array : " + familyMemberJson);

            FamilyMemberDetailEntity[] familyMemberArray =
                new Gson().fromJson("[" + familyMemberJson + "]", FamilyMemberDetailEntity[].class);

            boolean flag = studentInformationService.updateStudentFamilyMemberDetails(registrationNumber, familyMemberArray,
                studentId);
            return flag;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student", method = RequestMethod.GET)
    public @ResponseBody Map<String, Object> getStudentsByCriteria(@RequestParam String searchText,
        @RequestParam int srarchCriteria) {
        try {
            Map<String, Object> response = studentInformationService.getStudentsByCriteria(searchText, srarchCriteria);
            return response;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/student/information", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> getStudentsByCriteria(@RequestParam String registrationNumber) {
        try {
            LOG.info("studentInformationService : " + studentInformationService);

            Map<String, Object> response = studentInformationService.getStudentsByRegistrationNUmber(registrationNumber);

            StudentAdmissionEntity studentAdmissionEntity = (StudentAdmissionEntity) response.get("studentAdmissionEntity");
            studentAdmissionEntity.setDefaultValues();
            response.put("studentAdmissionEntity", studentAdmissionEntity);
            
            return response;
        } catch (Exception e) {
            throw e;
        }
    }

    @RequestMapping(value = "/academic/admission-successful", method = RequestMethod.GET)
    public String admissionSuccessfull() {
        try {
            LOG.info("Admission Successfull");
            return "academic/admission-successful";
        } catch (Exception e) {
            throw e;
        }
        
    }

}
