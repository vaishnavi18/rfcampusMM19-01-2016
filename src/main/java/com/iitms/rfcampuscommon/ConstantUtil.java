package com.iitms.rfcampuscommon;

public class ConstantUtil {

    /*public static enum SearchBy{
        USER_NAME(1), USER_ID(1), LOGIN_ID(3);
        
        private int value;
        
        private SearchBy(final int value){
            this.value = value;
        }
        
        
    }*/
    
    public static final int  USER_NAME = 1;
    public static final int USER_ID = 2;
    public static final int LOGIN_ID = 3;
    
    /*Search Student Criteria */
    public static final int STUDENT_NAME = 1;
    public static final int ID_NO = 2;
    public static final int BRANCH = 3;
    public static final int SEMESTER = 4;
    public static final int ENROLLMENT_NO = 5;
    public static final int ROLL_NO = 6;
    
    public static final int TENTH_PERCENTAGE = 1;
    public static final int TWELVE_PERCENTAGE = 2;
    public static final int NUMBER_OF_STUDENT= 3;
    public static final int CATEGORY= 4;
    public static final int RELIGION= 5;
     
    
    public static final int RECORD_INSERTED = 1;
    public static final int RECORD_UPDATED = 2;
    public static final int RECORD_DELETED = 3;
    public static final int RECORD_EXIST = 4;
    
    public static String getMessage(int id){
        String message = null;
        switch(id){
            case RECORD_INSERTED:
                message = "Record Inserted Successfully";
                break;
            case RECORD_UPDATED:
                message = "Record Updated Successfully";
                break;
            case RECORD_DELETED:
                message = "Record Deleted Successfully";
                break;
            case RECORD_EXIST:
                message = "Record Already Exist";
                break;    
        }
        return message;
    }
    
    
    public static final int ADMISSION_MODE_DIRECT = 1;
    public static final int ADMISSION_MODE_MERIT = 2;
    public static final int ADMISSION_MODE_EXCEL = 3;
    
    //public static final int MOTHERTONGUE = 0;
   // public static final int DOCUMENT_LIST = 1;
    
    
    //public static final String BRANCH_LIST = "branchList";
    
    
    /*All Master Constant */
    public static final String MASTER_DEGREE = "com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity";
    public static final String MASTER_CASTE = "com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity";
    public static final String MASTER_RELIGION = "com.iitms.rfcampusdata.academic.masters.entity.ReligionMasterEntity";
    public static final String MASTER_ACADEMIC_YEAR = "com.iitms.rfcampusdata.academic.masters.entity.YearMasterEntity";
    public static final String MASTER_ADMISSION_BATCH = "com.iitms.rfcampusdata.academic.masters.entity.BatchMasterEntity";
    public static final String MASTER_BLOOD_GROUP = "com.iitms.rfcampusdata.academic.masters.entity.BloodGroupMasterEntity";
    public static final String MASTER_BRANCH = "com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity";
    public static final String MASTER_CATEGORY = "com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity";
    public static final String MASTER_NATIONALITY = "com.iitms.rfcampusdata.academic.masters.entity.NationalityMasterEntity";
    public static final String MASTER_SEMESTER = "com.iitms.rfcampusdata.academic.masters.entity.SemesterMasterEntity";
    public static final String MASTER_PAYMENT_TYPE = "com.iitms.rfcampusdata.academic.masters.entity.PaymentTypeMasterEntity";
    public static final String MASTER_MOTHERTONGUE = "com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity";
    public static final String MASTER_DOCUMENT_LIST = "com.iitms.rfcampusdata.academic.masters.entity.DocumentListMasterEntity";
    
    /*All Master Constant */
    public static final String DEGREE_LIST = "DEGREE_LIST";
    public static final String CASTE_LIST = "CASTE_LIST";
    public static final String RELIGION_LIST = "RELIGION_LIST";
    public static final String ACADEMIC_YEAR_LIST = "ACADEMIC_YEAR_LIST";
    public static final String ACADEMIC_SESSION_LIST = "ACADEMIC_SESSION_LIST";
    public static final String ADMISSION_BATCH_LIST = "ADMISSION_BATCH_LIST";
    public static final String BLOOD_GROUP_LIST = "BLOOD_GROUP_LIST";
    public static final String BRANCH_LIST = "BRANCH_LIST";
    public static final String BATCH_LIST = "BATCH_LIST";
    public static final String CATEGORY_LIST = "CATEGORY_LIST";
    public static final String NATIONALITY_LIST = "NATIONALITY_LIST";
    public static final String SEMESTER_LIST = "SEMESTER_LIST";
    public static final String PAYMENT_TYPE_LIST = "PAYMENT_TYPE_LIST";
    public static final String MOTHERTONGUE_LIST = "MOTHERTONGUE_LIST";
    public static final String DOCUMENT_LIST = "DOCUMENT_LIST";
    public static final String COUNTRY_LIST = "COUNTRY_LIST";
    public static final String STATE_LIST = "STATE_LIST";
    public static final String DISTRICT_LIST = "DISTRICT_LIST";
    public static final String CITY_LIST = "CITY_LIST";
    public static final String STUDENT_STATUS_LIST = "STUDENT_STATUS_LIST";
    public static final String BANK_LIST = "BANK_LIST";
    public static final String PHYSICALLY_HANDICAPPED_LIST = "PHYSICALLY_HANDICAPPED_LIST";
    public static final String OCCUPATION_LIST = "OCCUPATION_LIST";
    public static final String EDUCATION_LIST = "EDUCATION_LIST";
    public static final String SCHOLARSHIP_TYPE_LIST = "SCHOLARSHIP_TYPE_LIST";
    //public static final String QUALIFYING_EXAM_LIST = "QUALIFYING_EXAM_LIST";
    
    
    //payroll masters
    public static final String PAYROLL_MASTER_CATEGORY = "PAYROLL_MASTER_CATEGORY";
    public static final String PAYROLL_MASTER_CASTE = "PAYROLL_MASTER_CASTE";
    public static final String PAYROLL_MASTER_NATIONALITY = "PAYROLL_MASTER_NATIONALITY";
    public static final String PAYROLL_MASTER_TITLE = "PAYROLL_MASTER_TITLE";
    
    public static final String PAYROLL_MASTER_DESIGNATION_NATURE = "PAYROLL_MASTER_DESIGNATION_NATURE";
    public static final String PAYROLL_MASTER_DESIGNATION = "PAYROLL_MASTER_DESIGNATION";
    public static final String PAYROLL_MASTER_STAFF_TYPE = "PAYROLL_MASTER_STAFF_TYPE";
    

    //new 2/3
    public static final String PAYROLL_MASTER_APPOINTMENT_TYPE = "PAYROLL_MASTER_APPOINTMENT_TYPE";
    public static final String PAYROLL_MASTER_PAYRULE = "PAYROLL_MASTER_PAYRULE";
    
    public static final String PAYROLL_MASTER_BANKNAME = "PAYROLL_MASTER_BANKNAME"; 
    
    public static final String PAYROLL_MASTER_DEPARTMENT = "PAYROLL_MASTER_DEPARTMENT";
    public static final String PAYROLL_MASTER_PF = "PAYROLL_MASTER_PF";
    
    public static final String PAYROLL_MASTER_STAFF = "PAYROLL_MASTER_STAFF";
    
    public static final String PAYROLL_MASTER_PAYSCALE = "PAYROLL_MASTER_PAYSCALE";
    
    public static final String FEES_COLLECTION_RECEIPT_TYPE = "FEES_COLLECTION_RECEIPT_TYPE";
    

    
    public static final String STUDENT = "student";
    public static final String MESSAGE = "message";
    public static final String PREFERENCE_LIST = "preferenceList";
    public static final String QUALIFYING_EXAM_LIST = "qualifyingExamList";
    
    public static final String EXCEL_SAMPLE = "EXCEL_SAMPLE";
    public static final String EXCEL_SAMPLE_DOWNLOAD = "EXCEL_SAMPLE_DOWNLOAD";
    public static final String[] EXCEL_SAMPLE_HEADER = {"Sr No", "Roll No", "AIR", "Candidate Name", "Branch Name",
    "Alloted Category", "Candidate Category", "Home State", "Reporting Date", "Reported From",
    "Quota", "Father Name", "Mother Name", "Mobile ", "Gender"};
    public static final String EXCEL_SELECTED_FIELD = "EXCEL_SELECTED_FIELD";
    
    //for address list
    public static final String S_NAME ="1";
    public static final String F_NAME ="2";
    public static final String G_NAME ="3";
    
    
    
    public static final String LOCAL_ADDRESS ="1";
    public static final String PERMANENT_ADDRESS ="2";
    public static final String GUARDIAN_ADDRESS ="3";
    
    
    
    /* Upload File Types */
    public static final String IMAGE ="IMAGE";
    public static final String PDF ="PDF";
    
    
    // Login Type
    public static final String STUDENT_LOGIN = "STUDENT";
    public static final String STAFF_LOGIN = "STAFF";
}
