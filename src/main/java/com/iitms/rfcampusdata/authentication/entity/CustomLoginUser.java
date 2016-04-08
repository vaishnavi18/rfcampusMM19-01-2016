package com.iitms.rfcampusdata.authentication.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class CustomLoginUser implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private int userId;

    private int studentId;

    private String username;

    private String mobileNumber;

    private String emailid;

    private int collegeId;

    private int active;

    private String loginType;

    private Set<RoleMasterEntity> roleMasterEntityList;

    private List<Integer> allocatedRoleIds = new ArrayList<Integer>();

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public Set<RoleMasterEntity> getRoleMasterEntityList() {
        return roleMasterEntityList;
    }

    public void setRoleMasterEntityList(Set<RoleMasterEntity> roleMasterEntityList) {
        this.roleMasterEntityList = roleMasterEntityList;
    }

    public List<Integer> getAllocatedRoleIds() {
        return allocatedRoleIds;
    }

    public void setAllocatedRoleIds(List<Integer> allocatedRoleIds) {
        this.allocatedRoleIds = allocatedRoleIds;
    }

    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }

    @Override
    public String toString() {
        return "CustomLoginUser [username=" + username + "]";
    }

}
