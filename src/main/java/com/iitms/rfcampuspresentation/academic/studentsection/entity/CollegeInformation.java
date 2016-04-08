package com.iitms.rfcampuspresentation.academic.studentsection.entity;

public class CollegeInformation {

    private int collegeId;

    private String CollegeName;

    private String CollegeAddress;

    private String CollegeLogo;

    private String branchId;

    private String sessionId;

    public String getCollegeName() {
        return CollegeName;
    }

    public void setCollegeName(String collegeName) {
        CollegeName = collegeName;
    }

    public String getCollegeAddress() {
        return CollegeAddress;
    }

    public void setCollegeAddress(String collegeAddress) {
        CollegeAddress = collegeAddress;
    }

    public String getCollegeLogo() {
        return CollegeLogo;
    }

    public void setCollegeLogo(String collegeLogo) {
        CollegeLogo = collegeLogo;
    }

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    public String getBranchId() {
        return branchId;
    }

    public void setBranchId(String branchId) {
        this.branchId = branchId;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }
}
