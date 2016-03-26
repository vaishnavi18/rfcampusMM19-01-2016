package com.iitms.rfcampuspresentation.sms;

import java.io.File;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.List;

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

import com.google.gson.Gson;
import com.iitms.rfcampuscommon.UploadsDirectories;
import com.iitms.rfcampusdata.academic.admission.entity.SharedPropertiesModel;
import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BankMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BatchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BloodGroupMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DistrictMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DocumentListMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.EducationMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.NationalityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.OccupationMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.PaymentTypeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.PhysicallyHandicappedMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.ReligionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.SemesterMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StateMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentStatusMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.YearMasterEntity;
import com.iitms.rfcampusdomain.academic.admission.service.StudentInformationService;
import com.iitms.rfcampusdomain.sms.service.StudentSmsService;

@Controller
public class SmsController {
    private static final Logger LOG = LoggerFactory.getLogger(SmsController.class);
    
    private boolean staticParametersLoaded;
    
    @Autowired
    SharedPropertiesModel sharedPropertiesModel;

    @Autowired
    UploadsDirectories uploadsDirectories;
    
    @Autowired
    private StudentInformationService studentAdmissionService;
    
    /*jaskirat code here*/
    
    @Autowired
    private StudentSmsService studentSmsService;
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/bulk-sms", method = RequestMethod.GET)
    public String bulk_smsJSP(ModelMap model,HttpServletRequest request) {
        
        if (!staticParametersLoaded) {
         //java.util.Map<String, Object> map = studentAdmissionService.loadAllStateDistrictAndCity();
            java.util.Map<String, Object> map = null;
           
         String realPath = request.getSession().getServletContext().getRealPath("");
         File file = null;
         FileWriter os;

         try {
             file = new File(realPath + uploadsDirectories.getUploadDirectory() + "states.json");
             os = new FileWriter(file);
             os.write(new Gson().toJson((List<StateMasterEntity>) map.get("states")).toString());
             os.close();

             file = new File(realPath + uploadsDirectories.getUploadDirectory() + "districts.json");
             os = new FileWriter(file);
             os.write(new Gson().toJson((List<DistrictMasterEntity>) map.get("districts")).toString());
             os.close();

             file = new File(realPath + uploadsDirectories.getUploadDirectory() + "cities.json");
             os = new FileWriter(file);
             os.write(new Gson().toJson((List<CityMasterEntity>) map.get("cities")).toString());
             os.close();
         } catch (Exception e) {
             //.printStackTrace();
             LOG.error("err",e);
             
         }
            
            
            
            //map = studentAdmissionService.loadAllDropdowns();
         map = null;
            // ---jaskirat change starthere---
            sharedPropertiesModel.setCasteList((List<CasteMasterEntity>) map.get("CasteList"));
         // ---jaskirat change end here---
            sharedPropertiesModel.setBankList((List<BankMasterEntity>) map.get("bankList"));
            sharedPropertiesModel.setBatchList((List<BatchMasterEntity>) map.get("batchList"));
            sharedPropertiesModel.setBloodGroupList((List<BloodGroupMasterEntity>) map.get("bloodGroupList"));
            sharedPropertiesModel.setBranchList((List<BranchMasterEntity>) map.get("branchList"));
            sharedPropertiesModel.setCategoryList((List<CategoryMasterEntity>) map.get("categoryList"));
            sharedPropertiesModel.setDegreeList((List<DegreeMasterEntity>) map.get("degreeList"));
            sharedPropertiesModel.setDocumentList((List<DocumentListMasterEntity>) map.get("documentList"));
            sharedPropertiesModel.setMothertongueList((List<MothertongueMasterEntity>) map.get("mothertongueList"));
            sharedPropertiesModel.setNationalityList((List<NationalityMasterEntity>) map.get("nationalityList"));
            sharedPropertiesModel.setPaymentTypeList((List<PaymentTypeMasterEntity>) map.get("paymentTypeList"));
            sharedPropertiesModel
                .setPhysicallyHandicappedList((List<PhysicallyHandicappedMasterEntity>) map.get("physicallyHandicappedList"));
            sharedPropertiesModel.setReligionList((List<ReligionMasterEntity>) map.get("religionList"));
            sharedPropertiesModel.setSemesterList((List<SemesterMasterEntity>) map.get("semesterList"));
            sharedPropertiesModel.setStudentStatusList((List<StudentStatusMasterEntity>) map.get("studentStatusList"));
            sharedPropertiesModel.setYearList((List<YearMasterEntity>) map.get("yearList"));
            sharedPropertiesModel.setOccupationList((List<OccupationMasterEntity>) map.get("occupationList"));
            sharedPropertiesModel.setEducationList((List<EducationMasterEntity>) map.get("educationList"));
            staticParametersLoaded = true;
        }
        
        model.addAttribute("branchList", sharedPropertiesModel.getBranchList());
        System.out.println("Inside bulk sms1 ");
        return "sms/bulk-sms";
    }
    
    @RequestMapping(value="/getStudentList",method=RequestMethod.GET)
     public @ResponseBody List<StudentAdmissionEntity> getStudentList(@RequestParam( name="query")String query){
        System.out.println("Inside gettting sms student list ");
        List<StudentAdmissionEntity> student_list = studentSmsService.getStudentByQuery(query);
       return student_list;
    }
    
    @RequestMapping(value="/getSmsGroup2",method=RequestMethod.GET)
    public @ResponseBody HashMap<String,Object> getgroup2(@RequestParam(name="groupId") String  groupId,ModelMap model){
         
        
        HashMap<String,Object> map= new HashMap<String,Object>();
        
        switch(groupId.trim()) {
            case "branchList" :{
                List<?> group2List = sharedPropertiesModel.getBranchList();
                map.put("branchList", group2List);
                break;
            }
            case "bloodGroupList" :{
                List<?> group2List = sharedPropertiesModel.getBloodGroupList();
                map.put("bloodGroupList", group2List);
                break;
            }
            case "yearList" :{
                List<?> group2List = sharedPropertiesModel.getYearList();
                map.put("yearList", group2List);
                break;
            }
            case "categoryList" :{
                List<?> group2List = sharedPropertiesModel.getCategoryList();
                map.put("categoryList", group2List);
                break;
            }
            case "religionList" :{
                List<?> group2List = sharedPropertiesModel.getReligionList();
                map.put("religionList", group2List);
                break;
            }
            case "cityList" :{
                List<?> group2List = sharedPropertiesModel.getCategoryList();
                map.put("cityList", group2List);
                break;
            }
            case "stateList" :{
                List<?> group2List = sharedPropertiesModel.getCategoryList();
                map.put("stateList", group2List);
                break;
            }
            case "nationalityList" :{
                List<?> group2List = sharedPropertiesModel.getCategoryList();
                map.put("nationalityList", group2List);
                break;
            }
            
            // --jaskirat need to change below--
            case "casteList" :{
                List<?> group2List = sharedPropertiesModel.getCasteList();
                map.put("casteList", group2List);
                break;
            }
            
        }
         
        return map;
        
    }
    
}
