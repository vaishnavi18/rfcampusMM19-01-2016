package com.iitms.rfcampuscommon;

import java.util.Date;

public class MasterModel {

    private int id;
    private int sequenceNumber;
    private String pfileNumber;
    private String uniqueId;
    private String title;
    private String firstName;
    private String middleName;
    private String lastName;
    private boolean gender;
    private String fatherName;
    private String motherName;
    
    //@Transient
    private String dateOfBirthString;
    
    private Date dateOfBirth;

    private Date dateOfJoining;
    
    
    
    //@Transient
    private String dateOfJoiningString;

    //@Transient
    private String dateOfRetirementString;

    //@Transient
    private String bankNumberString;

    //@Transient
    private String quarterString;

    //@Transient
    private String quarterNumberString;
    
    //@Transient
    private String sequenceNumberString;
    
    private Date dateOfIncrement;
    
    
    //@Transient
    private String dateOfIncrementString;
    private Date dateOfRetirement;
    
    private String height;
    
    private String identityMark1;
    
    private String identityMark2;
    
    private String residentialAddress1;
    
    private String townAddress1;
    
    private String phoneNumber;
    
    private String landlineNumber;
    
    private String emailId;
    
    private String officialEmailId;
    
    private int casteId;

    private int categoryId;
    private String subcaste;
    
    private String community;
    
    private int religionId;
    
    private int nationalityId;
    
    private boolean handicapped;
    
    private int subDepartmentNumber;
    
    private int subDesignationNumber;
    
    private int staffNumber;

    private int staffTypeNumber;
    
    private String bankAccountNumber;
    
    private int pfNumber;
    private String gpfNumber;
    private String ppfNumber;

    private String panNumber;
    private int bankNumber;
    private int bankCityNumber;
    private int clNumber;
    private boolean quarter;

    private int quarterNumber;
    private int internalTransactionNumber;  
    private String remark;
    private String commonRemark;
    private String monthlyRemark;
    private String authenticationReference;
    private int appointmentCategoryNumber;
    private String joiningAnFn;
    private String status;
    private boolean quarterRent;
    private String collegeCode;
    private String licNumber;
    private String rfidNumber;  
    private int bloodGroupId;
    private int stateId;

    private String motherTongue;
    private String otherAppointmentName;
    private Date dateOfLeaving;

    private String lockStatus;
    private String anFnLeave;
    private Date payRevisedDate;
    private int shiftNumber;
    private String emergencyContact;
    private boolean seniorCitizen;
    private String emergencyNumber;

    private String spouseName;
    private String jnmu;
    private String acite;
    private String bankBranch;
    private String ifscCode;
    private int stdNumber;
    private String basicPay;

    
    private String name;
    
    private Float name1;
    
    int districtId;
    
    int cityId;

    
    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public Float getName1() {
        return name1; 
    }

    public void setName1(Float name1) {
        this.name1 = name1;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSequenceNumber() {
        return sequenceNumber;
    }

    public void setSequenceNumber(int sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }

    public String getPfileNumber() {
        return pfileNumber;
    }

    public void setPfileNumber(String pfileNumber) {
        this.pfileNumber = pfileNumber;
    }

    public String getUniqueId() {
        return uniqueId;
    }

    public void setUniqueId(String uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public String getDateOfBirthString() {
        return dateOfBirthString;
    }

    public void setDateOfBirthString(String dateOfBirthString) {
        this.dateOfBirthString = dateOfBirthString;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Date getDateOfJoining() {
        return dateOfJoining;
    }

    public void setDateOfJoining(Date dateOfJoining) {
        this.dateOfJoining = dateOfJoining;
    }

    public String getDateOfJoiningString() {
        return dateOfJoiningString;
    }

    public void setDateOfJoiningString(String dateOfJoiningString) {
        this.dateOfJoiningString = dateOfJoiningString;
    }

    public String getDateOfRetirementString() {
        return dateOfRetirementString;
    }

    public void setDateOfRetirementString(String dateOfRetirementString) {
        this.dateOfRetirementString = dateOfRetirementString;
    }

    public String getBankNumberString() {
        return bankNumberString;
    }

    public void setBankNumberString(String bankNumberString) {
        this.bankNumberString = bankNumberString;
    }

    public String getQuarterString() {
        return quarterString;
    }

    public void setQuarterString(String quarterString) {
        this.quarterString = quarterString;
    }

    public String getQuarterNumberString() {
        return quarterNumberString;
    }

    public void setQuarterNumberString(String quarterNumberString) {
        this.quarterNumberString = quarterNumberString;
    }

    public String getSequenceNumberString() {
        return sequenceNumberString;
    }

    public void setSequenceNumberString(String sequenceNumberString) {
        this.sequenceNumberString = sequenceNumberString;
    }

    public Date getDateOfIncrement() {
        return dateOfIncrement;
    }

    public void setDateOfIncrement(Date dateOfIncrement) {
        this.dateOfIncrement = dateOfIncrement;
    }

    public String getDateOfIncrementString() {
        return dateOfIncrementString;
    }

    public void setDateOfIncrementString(String dateOfIncrementString) {
        this.dateOfIncrementString = dateOfIncrementString;
    }

    public Date getDateOfRetirement() {
        return dateOfRetirement;
    }

    public void setDateOfRetirement(Date dateOfRetirement) {
        this.dateOfRetirement = dateOfRetirement;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getIdentityMark1() {
        return identityMark1;
    }

    public void setIdentityMark1(String identityMark1) {
        this.identityMark1 = identityMark1;
    }

    public String getIdentityMark2() {
        return identityMark2;
    }

    public void setIdentityMark2(String identityMark2) {
        this.identityMark2 = identityMark2;
    }

    public String getResidentialAddress1() {
        return residentialAddress1;
    }

    public void setResidentialAddress1(String residentialAddress1) {
        this.residentialAddress1 = residentialAddress1;
    }

    public String getTownAddress1() {
        return townAddress1;
    }

    public void setTownAddress1(String townAddress1) {
        this.townAddress1 = townAddress1;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getLandlineNumber() {
        return landlineNumber;
    }

    public void setLandlineNumber(String landlineNumber) {
        this.landlineNumber = landlineNumber;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getOfficialEmailId() {
        return officialEmailId;
    }

    public void setOfficialEmailId(String officialEmailId) {
        this.officialEmailId = officialEmailId;
    }

    public int getCasteId() {
        return casteId;
    }

    public void setCasteId(int casteId) {
        this.casteId = casteId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getSubcaste() {
        return subcaste;
    }

    public void setSubcaste(String subcaste) {
        this.subcaste = subcaste;
    }

    public String getCommunity() {
        return community;
    }

    public void setCommunity(String community) {
        this.community = community;
    }

    public int getReligionId() {
        return religionId;
    }

    public void setReligionId(int religionId) {
        this.religionId = religionId;
    }

    public int getNationalityId() {
        return nationalityId;
    }

    public void setNationalityId(int nationalityId) {
        this.nationalityId = nationalityId;
    }

    public boolean isHandicapped() {
        return handicapped;
    }

    public void setHandicapped(boolean handicapped) {
        this.handicapped = handicapped;
    }

    public int getSubDepartmentNumber() {
        return subDepartmentNumber;
    }

    public void setSubDepartmentNumber(int subDepartmentNumber) {
        this.subDepartmentNumber = subDepartmentNumber;
    }

    public int getSubDesignationNumber() {
        return subDesignationNumber;
    }

    public void setSubDesignationNumber(int subDesignationNumber) {
        this.subDesignationNumber = subDesignationNumber;
    }

    public int getStaffNumber() {
        return staffNumber;
    }

    public void setStaffNumber(int staffNumber) {
        this.staffNumber = staffNumber;
    }

    public int getStaffTypeNumber() {
        return staffTypeNumber;
    }

    public void setStaffTypeNumber(int staffTypeNumber) {
        this.staffTypeNumber = staffTypeNumber;
    }

    public String getBankAccountNumber() {
        return bankAccountNumber;
    }

    public void setBankAccountNumber(String bankAccountNumber) {
        this.bankAccountNumber = bankAccountNumber;
    }

    public int getPfNumber() {
        return pfNumber;
    }

    public void setPfNumber(int pfNumber) {
        this.pfNumber = pfNumber;
    }

    public String getGpfNumber() {
        return gpfNumber;
    }

    public void setGpfNumber(String gpfNumber) {
        this.gpfNumber = gpfNumber;
    }

    public String getPpfNumber() {
        return ppfNumber;
    }

    public void setPpfNumber(String ppfNumber) {
        this.ppfNumber = ppfNumber;
    }

    public String getPanNumber() {
        return panNumber;
    }

    public void setPanNumber(String panNumber) {
        this.panNumber = panNumber;
    }

    public int getBankNumber() {
        return bankNumber;
    }

    public void setBankNumber(int bankNumber) {
        this.bankNumber = bankNumber;
    }

    public int getBankCityNumber() {
        return bankCityNumber;
    }

    public void setBankCityNumber(int bankCityNumber) {
        this.bankCityNumber = bankCityNumber;
    }

    public int getClNumber() {
        return clNumber;
    }

    public void setClNumber(int clNumber) {
        this.clNumber = clNumber;
    }

    public boolean isQuarter() {
        return quarter;
    }

    public void setQuarter(boolean quarter) {
        this.quarter = quarter;
    }

    public int getQuarterNumber() {
        return quarterNumber;
    }

    public void setQuarterNumber(int quarterNumber) {
        this.quarterNumber = quarterNumber;
    }

    public int getInternalTransactionNumber() {
        return internalTransactionNumber;
    }

    public void setInternalTransactionNumber(int internalTransactionNumber) {
        this.internalTransactionNumber = internalTransactionNumber;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCommonRemark() {
        return commonRemark;
    }

    public void setCommonRemark(String commonRemark) {
        this.commonRemark = commonRemark;
    }

    public String getMonthlyRemark() {
        return monthlyRemark;
    }

    public void setMonthlyRemark(String monthlyRemark) {
        this.monthlyRemark = monthlyRemark;
    }

    public String getAuthenticationReference() {
        return authenticationReference;
    }

    public void setAuthenticationReference(String authenticationReference) {
        this.authenticationReference = authenticationReference;
    }

    public int getAppointmentCategoryNumber() {
        return appointmentCategoryNumber;
    }

    public void setAppointmentCategoryNumber(int appointmentCategoryNumber) {
        this.appointmentCategoryNumber = appointmentCategoryNumber;
    }

    public String getJoiningAnFn() {
        return joiningAnFn;
    }

    public void setJoiningAnFn(String joiningAnFn) {
        this.joiningAnFn = joiningAnFn;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isQuarterRent() {
        return quarterRent;
    }

    public void setQuarterRent(boolean quarterRent) {
        this.quarterRent = quarterRent;
    }

    public String getCollegeCode() {
        return collegeCode;
    }

    public void setCollegeCode(String collegeCode) {
        this.collegeCode = collegeCode;
    }

    public String getLicNumber() {
        return licNumber;
    }

    public void setLicNumber(String licNumber) {
        this.licNumber = licNumber;
    }

    public String getRfidNumber() {
        return rfidNumber;
    }

    public void setRfidNumber(String rfidNumber) {
        this.rfidNumber = rfidNumber;
    }

    public int getBloodGroupId() {
        return bloodGroupId;
    }

    public void setBloodGroupId(int bloodGroupId) {
        this.bloodGroupId = bloodGroupId;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getMotherTongue() {
        return motherTongue;
    }

    public void setMotherTongue(String motherTongue) {
        this.motherTongue = motherTongue;
    }

    public String getOtherAppointmentName() {
        return otherAppointmentName;
    }

    public void setOtherAppointmentName(String otherAppointmentName) {
        this.otherAppointmentName = otherAppointmentName;
    }

    public Date getDateOfLeaving() {
        return dateOfLeaving;
    }

    public void setDateOfLeaving(Date dateOfLeaving) {
        this.dateOfLeaving = dateOfLeaving;
    }

    public String getLockStatus() {
        return lockStatus;
    }

    public void setLockStatus(String lockStatus) {
        this.lockStatus = lockStatus;
    }

    public String getAnFnLeave() {
        return anFnLeave;
    }

    public void setAnFnLeave(String anFnLeave) {
        this.anFnLeave = anFnLeave;
    }

    public Date getPayRevisedDate() {
        return payRevisedDate;
    }

    public void setPayRevisedDate(Date payRevisedDate) {
        this.payRevisedDate = payRevisedDate;
    }

    public int getShiftNumber() {
        return shiftNumber;
    }

    public void setShiftNumber(int shiftNumber) {
        this.shiftNumber = shiftNumber;
    }

    public String getEmergencyContact() {
        return emergencyContact;
    }

    public void setEmergencyContact(String emergencyContact) {
        this.emergencyContact = emergencyContact;
    }

    public boolean isSeniorCitizen() {
        return seniorCitizen;
    }

    public void setSeniorCitizen(boolean seniorCitizen) {
        this.seniorCitizen = seniorCitizen;
    }

    public String getEmergencyNumber() {
        return emergencyNumber;
    }

    public void setEmergencyNumber(String emergencyNumber) {
        this.emergencyNumber = emergencyNumber;
    }

    public String getSpouseName() {
        return spouseName;
    }

    public void setSpouseName(String spouseName) {
        this.spouseName = spouseName;
    }

    public String getJnmu() {
        return jnmu;
    }

    public void setJnmu(String jnmu) {
        this.jnmu = jnmu;
    }

    public String getAcite() {
        return acite;
    }

    public void setAcite(String acite) {
        this.acite = acite;
    }

    public String getBankBranch() {
        return bankBranch;
    }

    public void setBankBranch(String bankBranch) {
        this.bankBranch = bankBranch;
    }

    public String getIfscCode() {
        return ifscCode;
    }

    public void setIfscCode(String ifscCode) {
        this.ifscCode = ifscCode;
    }

    public int getStdNumber() {
        return stdNumber;
    }

    public void setStdNumber(int stdNumber) {
        this.stdNumber = stdNumber;
    }

    public String getBasicPay() {
        return basicPay;
    }

    public void setBasicPay(String basicPay) {
        this.basicPay = basicPay;
    }

    @Override
    public String toString() {
        return "MasterModel [id=" + id + ", sequenceNumber=" + sequenceNumber + ", pfileNumber=" + pfileNumber
            + ", uniqueId=" + uniqueId + ", title=" + title + ", firstName=" + firstName + ", middleName=" + middleName
            + ", lastName=" + lastName + ", gender=" + gender + ", fatherName=" + fatherName + ", motherName="
            + motherName + ", dateOfBirthString=" + dateOfBirthString + ", dateOfBirth=" + dateOfBirth
            + ", dateOfJoining=" + dateOfJoining + ", dateOfJoiningString=" + dateOfJoiningString
            + ", dateOfRetirementString=" + dateOfRetirementString + ", bankNumberString=" + bankNumberString
            + ", quarterString=" + quarterString + ", quarterNumberString=" + quarterNumberString
            + ", sequenceNumberString=" + sequenceNumberString + ", dateOfIncrement=" + dateOfIncrement
            + ", dateOfIncrementString=" + dateOfIncrementString + ", dateOfRetirement=" + dateOfRetirement
            + ", height=" + height + ", identityMark1=" + identityMark1 + ", identityMark2=" + identityMark2
            + ", residentialAddress1=" + residentialAddress1 + ", townAddress1=" + townAddress1 + ", phoneNumber="
            + phoneNumber + ", landlineNumber=" + landlineNumber + ", emailId=" + emailId + ", officialEmailId="
            + officialEmailId + ", casteId=" + casteId + ", categoryId=" + categoryId + ", subcaste=" + subcaste
            + ", community=" + community + ", religionId=" + religionId + ", nationalityId=" + nationalityId
            + ", handicapped=" + handicapped + ", subDepartmentNumber=" + subDepartmentNumber
            + ", subDesignationNumber=" + subDesignationNumber + ", staffNumber=" + staffNumber + ", staffTypeNumber="
            + staffTypeNumber + ", bankAccountNumber=" + bankAccountNumber + ", pfNumber=" + pfNumber + ", gpfNumber="
            + gpfNumber + ", ppfNumber=" + ppfNumber + ", panNumber=" + panNumber + ", bankNumber=" + bankNumber
            + ", bankCityNumber=" + bankCityNumber + ", clNumber=" + clNumber + ", quarter=" + quarter
            + ", quarterNumber=" + quarterNumber + ", internalTransactionNumber=" + internalTransactionNumber
            + ", remark=" + remark + ", commonRemark=" + commonRemark + ", monthlyRemark=" + monthlyRemark
            + ", authenticationReference=" + authenticationReference + ", appointmentCategoryNumber="
            + appointmentCategoryNumber + ", joiningAnFn=" + joiningAnFn + ", status=" + status + ", quarterRent="
            + quarterRent + ", collegeCode=" + collegeCode + ", licNumber=" + licNumber + ", rfidNumber=" + rfidNumber
            + ", bloodGroupId=" + bloodGroupId + ", stateId=" + stateId + ", motherTongue=" + motherTongue
            + ", otherAppointmentName=" + otherAppointmentName + ", dateOfLeaving=" + dateOfLeaving + ", lockStatus="
            + lockStatus + ", anFnLeave=" + anFnLeave + ", payRevisedDate=" + payRevisedDate + ", shiftNumber="
            + shiftNumber + ", emergencyContact=" + emergencyContact + ", seniorCitizen=" + seniorCitizen
            + ", emergencyNumber=" + emergencyNumber + ", spouseName=" + spouseName + ", jnmu=" + jnmu + ", acite="
            + acite + ", bankBranch=" + bankBranch + ", ifscCode=" + ifscCode + ", stdNumber=" + stdNumber
            + ", basicPay=" + basicPay + ", name=" + name + ", name1=" + name1 + "]";
    }

}
