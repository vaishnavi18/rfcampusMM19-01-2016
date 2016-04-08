package com.iitms.rfcampuspresentation.academic.studentsection.entity;

import java.util.Date;

/**
 * @author Sachinmt
 */
public class IDCardInformation {

    private String registrationNumber;

    private String studentName;

    private String degreeName;

    private String branchName;

    private String branchShortName;

    private String identityMark1;

    private String dateOfValidity;

    private String studentPhoto;

    private String studentSignature;

    private String authoritySignature;

    private String fatherName;

    private String motherName;

    private String fatherMobileNumber;

    private String motherMobileNumber;

    private String fatherEmailid;

    private String motherEmailid;

    private String fatherDesignation;

    private String motherDesignation;

    private String localAddress;

    private String issueDate;

    private Date dateOfBirth;

    private String height;

    private int bloodGroupId;

    private String bloodGroup;

    private int gender;

    private String genderName;

    private String email;

    private String studentMobileNumber;

    private String studentLandlineNumber;

    private String mothertongue;

    private String otherLanguage;

    private String weight;

    private String caste;

    private String categoryName;

    private String nationality;

    private String religion;

    private int admittedToYear;

    private String year;

    private String admissionYear;

    private String batchName;

    private String semesterName;

    private String semesterFullName;

    private String accountNumber;

    private String visaNumber;

    private String passportNumber;

    private int paymentType;

    private int examPaymentType;

    private boolean admissionCancel;

    private Date admissionDate;

    private int admissionBatch;

    private Date leaveDate;

    private int qualifyExamNumber;

    private String qualifyExamName;

    private String yearOfExam;

    private int allIndiaRank;

    private int stateRank;

    private float percentage;

    private float percentile;

    private String qualifiedExamRollnumber;

    private String remark;

    private int facultyAdvisorNumber;

    private String projectName;

    private int scholorshipTypeId;

    private int generalMeritNumber;

    private int categoryMeritNumber;

    private String registeredNumber;

    private int admissionRoundNumber;

    private boolean defenceQuota;

    private boolean physicallyHandicapped;

    private String typeOfPhysicallyHandicap;

    private boolean personWithDisability;

    private String typeOfPhysicalDisability;

    private boolean hscMCVC;

    private float annualIncome;

    private float admissionQuotaNumber;

    private boolean registrationStatus;

    private int otherSchemeNumber;

    private int sportsQuota;

    private int permanentRegistrationAumber;

    private String schemeType;

    private int capInstitute;

    private int admissionCategoryNumber;

    private String oldRegistrationNumber;

    private int bankNumber;

    private int phdSupervisorId;

    private int typeOfCosupervisor1;

    private int typeOfCosupervisor2;

    private int phdStatusCategory;

    private int reattend;

    private int sequenceNumber;

    private int admissionType;

    private boolean scholership;

    private String scholershipDetails;

    private boolean reserveCategory;

    private boolean ebc;

    private String emergencyContactNumber;

    private boolean local;

    private String bankAddress;

    private String bankIFSCCode;

    private String panNumber;

    private String voterNumber;

    private String nprNumber;

    private boolean statusOfStudent;

    private boolean confHostel;

    private String convenerAllotment;

    private String region;

    private String adharCardNumber;

    private String routeNumber;

    private float routeAmount;

    private boolean medicalProblem;

    private String medicalDetails;

    private int numberOfBrother;

    private int numberOfSister;

    private String leftThumb;

    /** local address master **/

    private String localTown;

    private String localCityName;

    private String localDistrictName;

    private String localState;

    private String localTelephone;

    private String localMobileNumber;

    private String localEmail;

    private String localPINCode;

    private String localLandmark;

    /** permanent address **/

    private String permenantAddress;

    private String permanentCityName;

    private String permenantTown;

    private String permanentDistrictName;

    private String permanentState;

    private String permanentTelephone;

    private String permanentMobileNumber;

    private String permanentEmail;

    private String permanentPINCode;

    private String permanantLandmark;

    /** Guardian Address **/
    private String guardianName;

    private String relationWithGuardian;

    private String guardianAddress;

    private String guardianOccupationName;

    private String guardianPhone;

    private String guardianEmail;

    private String guardianFlatNo;

    private String guardianStreetName;

    private String guardianLandmark;

    private String guardianTelephone;

    private String guardianCity;

    private String guardianDistrict;

    private String guardianState;

    private String guardianPINCode;

    private String guardianTown;

    /** address **/

    private String name;

    private String address;

    private String city;

    private String district;

    private String state;

    private String pincode;

    private String phone;

    private String mobile;

    private String permenantPINCode;

    /*
     * private StudentAdmissionEntity student; public StudentAdmissionEntity getStudentAdmissionEntity() { return
     * student; } public void setStudentAdmissionEntity(StudentAdmissionEntity student) { this.student = student; }
     */

    public String getPermenantPINCode() {
        return permenantPINCode;
    }

    public void setPermenantPINCode(String permenantPINCode) {
        this.permenantPINCode = permenantPINCode;
    }

    public IDCardInformation() {
        super();
    }

    /*
     * public IDCardInformation(String registrationNumber, String studentName, String degreeName, String branchName,
     * String distinguishMark, String dateOfValidity, String studentPhoto, String studentSignature, String
     * authoritySignature, String fatherName, String motherName, String addressPresent, String addressPermanent, String
     * issueDate, String fatherMobile, String motherMobile, Date dateOfBirth, String height, int bloodGroupId, String
     * bloodGroupName, int gender, String genderName, String email, String studentMobileNumber) { super();
     * this.registrationNumber = registrationNumber; this.studentName = studentName; this.degreeName = degreeName;
     * this.branchName = branchName; // this.distinguishMark = distinguishMark; this.dateOfValidity = dateOfValidity;
     * this.studentPhoto = studentPhoto; this.studentSignature = studentSignature; this.authoritySignature =
     * authoritySignature; this.fatherName = fatherName; this.motherName = motherName; // this.addressPresent =
     * addressPresent; // this.addressPermanent = addressPermanent; this.issueDate = issueDate; // this.fatherMobile =
     * fatherMobile; // this.motherMobile = motherMobile; this.dateOfBirth = dateOfBirth; this.height = height;
     * this.bloodGroupId = bloodGroupId; // this.bloodGroupName = bloodGroupName; this.gender = gender; this.genderName
     * = genderName; this.email = email; this.studentMobileNumber = studentMobileNumber; }
     */

    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getDegreeName() {
        return degreeName;
    }

    public void setDegreeName(String degreeName) {
        this.degreeName = degreeName;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getIdentityMark1() {
        return identityMark1;
    }

    public void setIdentityMark1(String identityMark1) {
        this.identityMark1 = identityMark1;
    }

    public String getDateOfValidity() {
        return dateOfValidity;
    }

    public void setDateOfValidity(String dateOfValidity) {
        this.dateOfValidity = dateOfValidity;
    }

    public String getStudentPhoto() {
        return studentPhoto;
    }

    public void setStudentPhoto(String studentPhoto) {
        this.studentPhoto = studentPhoto;
    }

    public String getStudentSignature() {
        return studentSignature;
    }

    public void setStudentSignature(String studentSignature) {
        this.studentSignature = studentSignature;
    }

    public String getAuthoritySignature() {
        return authoritySignature;
    }

    public void setAuthoritySignature(String authoritySignature) {
        this.authoritySignature = authoritySignature;
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

    public String getLocalAddress() {
        return localAddress;
    }

    public void setLocalAddress(String localAddress) {
        this.localAddress = localAddress;
    }

    public String getPermenantAddress() {
        return permenantAddress;
    }

    public void setPermenantAddress(String permenantAddress) {
        this.permenantAddress = permenantAddress;
    }

    public String getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(String issueDate) {
        this.issueDate = issueDate;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public int getBloodGroupId() {
        return bloodGroupId;
    }

    public void setBloodGroupId(int bloodGroupId) {
        this.bloodGroupId = bloodGroupId;
    }

    public String getFatherMobileNumber() {
        return fatherMobileNumber;
    }

    public void setFatherMobileNumber(String fatherMobileNumber) {
        this.fatherMobileNumber = fatherMobileNumber;
    }

    public String getMotherMobileNumber() {
        return motherMobileNumber;
    }

    public void setMotherMobileNumber(String motherMobileNumber) {
        this.motherMobileNumber = motherMobileNumber;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStudentMobileNumber() {
        return studentMobileNumber;
    }

    public void setStudentMobileNumber(String studentMobileNumber) {
        this.studentMobileNumber = studentMobileNumber;
    }

    public String getGuardianName() {
        return guardianName;
    }

    public void setGuardianName(String guardianName) {
        this.guardianName = guardianName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getPhone() {
        return phone;
    }

    /* change */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocalPINCode() {
        return localPINCode;
    }

    public void setLocalPINCode(String localPINCode) {
        this.localPINCode = localPINCode;
    }

    /****/

    public String getFatherEmailid() {
        return fatherEmailid;
    }

    public void setFatherEmailid(String fatherEmailid) {
        this.fatherEmailid = fatherEmailid;
    }

    public String getMotherEmailid() {
        return motherEmailid;
    }

    public void setMotherEmailid(String motherEmailid) {
        this.motherEmailid = motherEmailid;
    }

    public String getFatherDesignation() {
        return fatherDesignation;
    }

    public void setFatherDesignation(String fatherDesignation) {
        this.fatherDesignation = fatherDesignation;
    }

    public String getMotherDesignation() {
        return motherDesignation;
    }

    public void setMotherDesignation(String motherDesignation) {
        this.motherDesignation = motherDesignation;
    }

    public String getStudentLandlineNumber() {
        return studentLandlineNumber;
    }

    public void setStudentLandlineNumber(String studentLandlineNumber) {
        this.studentLandlineNumber = studentLandlineNumber;
    }

    public String getMothertongue() {
        return mothertongue;
    }

    public void setMothertongue(String mothertongue) {
        this.mothertongue = mothertongue;
    }

    public String getOtherLanguage() {
        return otherLanguage;
    }

    public void setOtherLanguage(String otherLanguage) {
        this.otherLanguage = otherLanguage;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getCaste() {
        return caste;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public int getAdmittedToYear() {
        return admittedToYear;
    }

    public void setAdmittedToYear(int admittedToYear) {
        this.admittedToYear = admittedToYear;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getAdmissionYear() {
        return admissionYear;
    }

    public void setAdmissionYear(String admissionYear) {
        this.admissionYear = admissionYear;
    }

    public String getBatchName() {
        return batchName;
    }

    public void setBatchName(String batchName) {
        this.batchName = batchName;
    }

    public String getSemesterName() {
        return semesterName;
    }

    public void setSemesterName(String semesterName) {
        this.semesterName = semesterName;
    }

    public String getSemesterFullName() {
        return semesterFullName;
    }

    public void setSemesterFullName(String semesterFullName) {
        this.semesterFullName = semesterFullName;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getVisaNumber() {
        return visaNumber;
    }

    public void setVisaNumber(String visaNumber) {
        this.visaNumber = visaNumber;
    }

    public String getPassportNumber() {
        return passportNumber;
    }

    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    public int getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(int paymentType) {
        this.paymentType = paymentType;
    }

    public int getExamPaymentType() {
        return examPaymentType;
    }

    public void setExamPaymentType(int examPaymentType) {
        this.examPaymentType = examPaymentType;
    }

    public boolean isAdmissionCancel() {
        return admissionCancel;
    }

    public void setAdmissionCancel(boolean admissionCancel) {
        this.admissionCancel = admissionCancel;
    }

    public Date getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }

    public int getAdmissionBatch() {
        return admissionBatch;
    }

    public void setAdmissionBatch(int admissionBatch) {
        this.admissionBatch = admissionBatch;
    }

    public Date getLeaveDate() {
        return leaveDate;
    }

    public void setLeaveDate(Date leaveDate) {
        this.leaveDate = leaveDate;
    }

    public int getQualifyExamNumber() {
        return qualifyExamNumber;
    }

    public void setQualifyExamNumber(int qualifyExamNumber) {
        this.qualifyExamNumber = qualifyExamNumber;
    }

    public String getQualifyExamName() {
        return qualifyExamName;
    }

    public void setQualifyExamName(String qualifyExamName) {
        this.qualifyExamName = qualifyExamName;
    }

    public String getYearOfExam() {
        return yearOfExam;
    }

    public void setYearOfExam(String yearOfExam) {
        this.yearOfExam = yearOfExam;
    }

    public int getAllIndiaRank() {
        return allIndiaRank;
    }

    public void setAllIndiaRank(int allIndiaRank) {
        this.allIndiaRank = allIndiaRank;
    }

    public int getStateRank() {
        return stateRank;
    }

    public void setStateRank(int stateRank) {
        this.stateRank = stateRank;
    }

    public float getPercentage() {
        return percentage;
    }

    public void setPercentage(float percentage) {
        this.percentage = percentage;
    }

    public float getPercentile() {
        return percentile;
    }

    public void setPercentile(float percentile) {
        this.percentile = percentile;
    }

    public String getQualifiedExamRollnumber() {
        return qualifiedExamRollnumber;
    }

    public void setQualifiedExamRollnumber(String qualifiedExamRollnumber) {
        this.qualifiedExamRollnumber = qualifiedExamRollnumber;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getFacultyAdvisorNumber() {
        return facultyAdvisorNumber;
    }

    public void setFacultyAdvisorNumber(int facultyAdvisorNumber) {
        this.facultyAdvisorNumber = facultyAdvisorNumber;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public int getScholorshipTypeId() {
        return scholorshipTypeId;
    }

    public void setScholorshipTypeId(int scholorshipTypeId) {
        this.scholorshipTypeId = scholorshipTypeId;
    }

    public int getGeneralMeritNumber() {
        return generalMeritNumber;
    }

    public void setGeneralMeritNumber(int generalMeritNumber) {
        this.generalMeritNumber = generalMeritNumber;
    }

    public int getCategoryMeritNumber() {
        return categoryMeritNumber;
    }

    public void setCategoryMeritNumber(int categoryMeritNumber) {
        this.categoryMeritNumber = categoryMeritNumber;
    }

    public String getRegisteredNumber() {
        return registeredNumber;
    }

    public void setRegisteredNumber(String registeredNumber) {
        this.registeredNumber = registeredNumber;
    }

    public int getAdmissionRoundNumber() {
        return admissionRoundNumber;
    }

    public void setAdmissionRoundNumber(int admissionRoundNumber) {
        this.admissionRoundNumber = admissionRoundNumber;
    }

    public boolean isDefenceQuota() {
        return defenceQuota;
    }

    public void setDefenceQuota(boolean defenceQuota) {
        this.defenceQuota = defenceQuota;
    }

    public boolean isPhysicallyHandicapped() {
        return physicallyHandicapped;
    }

    public void setPhysicallyHandicapped(boolean physicallyHandicapped) {
        this.physicallyHandicapped = physicallyHandicapped;
    }

    public String getTypeOfPhysicallyHandicap() {
        return typeOfPhysicallyHandicap;
    }

    public void setTypeOfPhysicallyHandicap(String typeOfPhysicallyHandicap) {
        this.typeOfPhysicallyHandicap = typeOfPhysicallyHandicap;
    }

    public boolean isPersonWithDisability() {
        return personWithDisability;
    }

    public void setPersonWithDisability(boolean personWithDisability) {
        this.personWithDisability = personWithDisability;
    }

    public String getTypeOfPhysicalDisability() {
        return typeOfPhysicalDisability;
    }

    public void setTypeOfPhysicalDisability(String typeOfPhysicalDisability) {
        this.typeOfPhysicalDisability = typeOfPhysicalDisability;
    }

    public boolean isHscMCVC() {
        return hscMCVC;
    }

    public void setHscMCVC(boolean hscMCVC) {
        this.hscMCVC = hscMCVC;
    }

    public float getAnnualIncome() {
        return annualIncome;
    }

    public void setAnnualIncome(float annualIncome) {
        this.annualIncome = annualIncome;
    }

    public float getAdmissionQuotaNumber() {
        return admissionQuotaNumber;
    }

    public void setAdmissionQuotaNumber(float admissionQuotaNumber) {
        this.admissionQuotaNumber = admissionQuotaNumber;
    }

    public boolean isRegistrationStatus() {
        return registrationStatus;
    }

    public void setRegistrationStatus(boolean registrationStatus) {
        this.registrationStatus = registrationStatus;
    }

    public int getOtherSchemeNumber() {
        return otherSchemeNumber;
    }

    public void setOtherSchemeNumber(int otherSchemeNumber) {
        this.otherSchemeNumber = otherSchemeNumber;
    }

    public int getSportsQuota() {
        return sportsQuota;
    }

    public void setSportsQuota(int sportsQuota) {
        this.sportsQuota = sportsQuota;
    }

    public int getPermanentRegistrationAumber() {
        return permanentRegistrationAumber;
    }

    public void setPermanentRegistrationAumber(int permanentRegistrationAumber) {
        this.permanentRegistrationAumber = permanentRegistrationAumber;
    }

    public String getSchemeType() {
        return schemeType;
    }

    public void setSchemeType(String schemeType) {
        this.schemeType = schemeType;
    }

    public int getCapInstitute() {
        return capInstitute;
    }

    public void setCapInstitute(int capInstitute) {
        this.capInstitute = capInstitute;
    }

    public int getAdmissionCategoryNumber() {
        return admissionCategoryNumber;
    }

    public void setAdmissionCategoryNumber(int admissionCategoryNumber) {
        this.admissionCategoryNumber = admissionCategoryNumber;
    }

    public String getOldRegistrationNumber() {
        return oldRegistrationNumber;
    }

    public void setOldRegistrationNumber(String oldRegistrationNumber) {
        this.oldRegistrationNumber = oldRegistrationNumber;
    }

    public int getBankNumber() {
        return bankNumber;
    }

    public void setBankNumber(int bankNumber) {
        this.bankNumber = bankNumber;
    }

    public int getPhdSupervisorId() {
        return phdSupervisorId;
    }

    public void setPhdSupervisorId(int phdSupervisorId) {
        this.phdSupervisorId = phdSupervisorId;
    }

    public int getTypeOfCosupervisor1() {
        return typeOfCosupervisor1;
    }

    public void setTypeOfCosupervisor1(int typeOfCosupervisor1) {
        this.typeOfCosupervisor1 = typeOfCosupervisor1;
    }

    public int getTypeOfCosupervisor2() {
        return typeOfCosupervisor2;
    }

    public void setTypeOfCosupervisor2(int typeOfCosupervisor2) {
        this.typeOfCosupervisor2 = typeOfCosupervisor2;
    }

    public int getPhdStatusCategory() {
        return phdStatusCategory;
    }

    public void setPhdStatusCategory(int phdStatusCategory) {
        this.phdStatusCategory = phdStatusCategory;
    }

    public int getReattend() {
        return reattend;
    }

    public void setReattend(int reattend) {
        this.reattend = reattend;
    }

    public int getSequenceNumber() {
        return sequenceNumber;
    }

    public void setSequenceNumber(int sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }

    public int getAdmissionType() {
        return admissionType;
    }

    public void setAdmissionType(int admissionType) {
        this.admissionType = admissionType;
    }

    public boolean isScholership() {
        return scholership;
    }

    public void setScholership(boolean scholership) {
        this.scholership = scholership;
    }

    public String getScholershipDetails() {
        return scholershipDetails;
    }

    public void setScholershipDetails(String scholershipDetails) {
        this.scholershipDetails = scholershipDetails;
    }

    public boolean isReserveCategory() {
        return reserveCategory;
    }

    public void setReserveCategory(boolean reserveCategory) {
        this.reserveCategory = reserveCategory;
    }

    public boolean isEbc() {
        return ebc;
    }

    public void setEbc(boolean ebc) {
        this.ebc = ebc;
    }

    public String getEmergencyContactNumber() {
        return emergencyContactNumber;
    }

    public void setEmergencyContactNumber(String emergencyContactNumber) {
        this.emergencyContactNumber = emergencyContactNumber;
    }

    public boolean isLocal() {
        return local;
    }

    public void setLocal(boolean local) {
        this.local = local;
    }

    public String getBankAddress() {
        return bankAddress;
    }

    public void setBankAddress(String bankAddress) {
        this.bankAddress = bankAddress;
    }

    public String getBankIFSCCode() {
        return bankIFSCCode;
    }

    public void setBankIFSCCode(String bankIFSCCode) {
        this.bankIFSCCode = bankIFSCCode;
    }

    public String getPanNumber() {
        return panNumber;
    }

    public void setPanNumber(String panNumber) {
        this.panNumber = panNumber;
    }

    public String getVoterNumber() {
        return voterNumber;
    }

    public void setVoterNumber(String voterNumber) {
        this.voterNumber = voterNumber;
    }

    public String getNprNumber() {
        return nprNumber;
    }

    public void setNprNumber(String nprNumber) {
        this.nprNumber = nprNumber;
    }

    public boolean isStatusOfStudent() {
        return statusOfStudent;
    }

    public void setStatusOfStudent(boolean statusOfStudent) {
        this.statusOfStudent = statusOfStudent;
    }

    public boolean isConfHostel() {
        return confHostel;
    }

    public void setConfHostel(boolean confHostel) {
        this.confHostel = confHostel;
    }

    public String getConvenerAllotment() {
        return convenerAllotment;
    }

    public void setConvenerAllotment(String convenerAllotment) {
        this.convenerAllotment = convenerAllotment;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getAdharCardNumber() {
        return adharCardNumber;
    }

    public void setAdharCardNumber(String adharCardNumber) {
        this.adharCardNumber = adharCardNumber;
    }

    public String getRouteNumber() {
        return routeNumber;
    }

    public void setRouteNumber(String routeNumber) {
        this.routeNumber = routeNumber;
    }

    public float getRouteAmount() {
        return routeAmount;
    }

    public void setRouteAmount(float routeAmount) {
        this.routeAmount = routeAmount;
    }

    public boolean isMedicalProblem() {
        return medicalProblem;
    }

    public void setMedicalProblem(boolean medicalProblem) {
        this.medicalProblem = medicalProblem;
    }

    public String getMedicalDetails() {
        return medicalDetails;
    }

    public void setMedicalDetails(String medicalDetails) {
        this.medicalDetails = medicalDetails;
    }

    public int getNumberOfBrother() {
        return numberOfBrother;
    }

    public void setNumberOfBrother(int numberOfBrother) {
        this.numberOfBrother = numberOfBrother;
    }

    public int getNumberOfSister() {
        return numberOfSister;
    }

    public void setNumberOfSister(int numberOfSister) {
        this.numberOfSister = numberOfSister;
    }

    public String getLeftThumb() {
        return leftThumb;
    }

    public void setLeftThumb(String leftThumb) {
        this.leftThumb = leftThumb;
    }

    public String getLocalTown() {
        return localTown;
    }

    public void setLocalTown(String localTown) {
        this.localTown = localTown;
    }

    public String getLocalCityName() {
        return localCityName;
    }

    public void setLocalCityName(String localCityName) {
        this.localCityName = localCityName;
    }

    public String getLocalDistrictName() {
        return localDistrictName;
    }

    public void setLocalDistrictName(String localDistrictName) {
        this.localDistrictName = localDistrictName;
    }

    public String getLocalState() {
        return localState;
    }

    public void setLocalState(String localState) {
        this.localState = localState;
    }

    public String getLocalTelephone() {
        return localTelephone;
    }

    public void setLocalTelephone(String localTelephone) {
        this.localTelephone = localTelephone;
    }

    public String getLocalMobileNumber() {
        return localMobileNumber;
    }

    public void setLocalMobileNumber(String localMobileNumber) {
        this.localMobileNumber = localMobileNumber;
    }

    public String getLocalEmail() {
        return localEmail;
    }

    public void setLocalEmail(String localEmail) {
        this.localEmail = localEmail;
    }

    public String getLocalLandmark() {
        return localLandmark;
    }

    public void setLocalLandmark(String localLandmark) {
        this.localLandmark = localLandmark;
    }

    public String getPermanentCityName() {
        return permanentCityName;
    }

    public void setPermanentCityName(String permanentCityName) {
        this.permanentCityName = permanentCityName;
    }

    public String getPermenantTown() {
        return permenantTown;
    }

    public void setPermenantTown(String permenantTown) {
        this.permenantTown = permenantTown;
    }

    public String getPermanentDistrictName() {
        return permanentDistrictName;
    }

    public void setPermanentDistrictName(String permanentDistrictName) {
        this.permanentDistrictName = permanentDistrictName;
    }

    public String getPermanentState() {
        return permanentState;
    }

    public void setPermanentState(String permanentState) {
        this.permanentState = permanentState;
    }

    public String getPermanentTelephone() {
        return permanentTelephone;
    }

    public void setPermanentTelephone(String permanentTelephone) {
        this.permanentTelephone = permanentTelephone;
    }

    public String getPermanentMobileNumber() {
        return permanentMobileNumber;
    }

    public void setPermanentMobileNumber(String permanentMobileNumber) {
        this.permanentMobileNumber = permanentMobileNumber;
    }

    public String getPermanentEmail() {
        return permanentEmail;
    }

    public void setPermanentEmail(String permanentEmail) {
        this.permanentEmail = permanentEmail;
    }

    public String getPermanentPINCode() {
        return permanentPINCode;
    }

    public void setPermanentPINCode(String permanentPINCode) {
        this.permanentPINCode = permanentPINCode;
    }

    public String getPermanantLandmark() {
        return permanantLandmark;
    }

    public void setPermanantLandmark(String permanantLandmark) {
        this.permanantLandmark = permanantLandmark;
    }

    public String getRelationWithGuardian() {
        return relationWithGuardian;
    }

    public void setRelationWithGuardian(String relationWithGuardian) {
        this.relationWithGuardian = relationWithGuardian;
    }

    public String getGuardianAddress() {
        return guardianAddress;
    }

    public void setGuardianAddress(String guardianAddress) {
        this.guardianAddress = guardianAddress;
    }

    public String getGuardianOccupationName() {
        return guardianOccupationName;
    }

    public void setGuardianOccupationName(String guardianOccupationName) {
        this.guardianOccupationName = guardianOccupationName;
    }

    public String getGuardianPhone() {
        return guardianPhone;
    }

    public void setGuardianPhone(String guardianPhone) {
        this.guardianPhone = guardianPhone;
    }

    public String getGuardianEmail() {
        return guardianEmail;
    }

    public void setGuardianEmail(String guardianEmail) {
        this.guardianEmail = guardianEmail;
    }

    public String getGuardianFlatNo() {
        return guardianFlatNo;
    }

    public void setGuardianFlatNo(String guardianFlatNo) {
        this.guardianFlatNo = guardianFlatNo;
    }

    public String getGuardianStreetName() {
        return guardianStreetName;
    }

    public void setGuardianStreetName(String guardianStreetName) {
        this.guardianStreetName = guardianStreetName;
    }

    public String getGuardianLandmark() {
        return guardianLandmark;
    }

    public void setGuardianLandmark(String guardianLandmark) {
        this.guardianLandmark = guardianLandmark;
    }

    public String getGuardianTelephone() {
        return guardianTelephone;
    }

    public void setGuardianTelephone(String guardianTelephone) {
        this.guardianTelephone = guardianTelephone;
    }

    public String getGuardianCity() {
        return guardianCity;
    }

    public void setGuardianCity(String guardianCity) {
        this.guardianCity = guardianCity;
    }

    public String getGuardianDistrict() {
        return guardianDistrict;
    }

    public void setGuardianDistrict(String guardianDistrict) {
        this.guardianDistrict = guardianDistrict;
    }

    public String getGuardianState() {
        return guardianState;
    }

    public void setGuardianState(String guardianState) {
        this.guardianState = guardianState;
    }

    public String getGuardianPINCode() {
        return guardianPINCode;
    }

    public void setGuardianPINCode(String guardianPINCode) {
        this.guardianPINCode = guardianPINCode;
    }

    public String getGuardianTown() {
        return guardianTown;
    }

    public void setGuardianTown(String guardianTown) {
        this.guardianTown = guardianTown;
    }

    public String getBranchShortName() {
        return branchShortName;
    }

    public void setBranchShortName(String branchShortName) {
        this.branchShortName = branchShortName;
    }

}
