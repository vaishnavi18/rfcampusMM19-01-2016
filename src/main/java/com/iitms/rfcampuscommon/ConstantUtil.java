package com.iitms.rfcampuscommon;

public class ConstantUtil {

    /*public static enum SearchBy{
        USER_NAME(1), USER_ID(1), LOGIN_ID(3);
        
        private int value;
        
        private SearchBy(final int value){
            this.value = value;
        }
        
        
    }*/
    
    public static final int USER_NAME = 1;
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
        }
        return message;
    }
    
    
    public static final int ADMISSION_MODE_DIRECT = 1;
    public static final int ADMISSION_MODE_MERIT = 2;
    public static final int ADMISSION_MODE_EXCEL = 3;
}
