package com.iitms.rfcampusdata.payroll.masters.entity;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "payroll.payroll_employee_master")
public class EmployeeMasterEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "sequence_number")
    private int sequenceNumber;

    @Column(name = "pfile_number")
    private String pfileNumber;

    @Column(name = "unique_id")
    private String uniqueId;

    @Column(name = "title")
    private String title;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "middle_name")
    private String middleName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "gender")
    private boolean gender;

    @Column(name = " father_name")
    private String fatherName;

    @Column(name = "mother_name")
    private String motherName;

    @Transient
    private String dateOfBirthString;

    @Column(name = "date_of_birth")
    @DateTimeFormat(pattern = "MM/DD/YYYY")
    @Temporal(TemporalType.DATE)
    private Date dateOfBirth;

    public String getDateOfBirthString() {
        return dateOfBirthString;
    }

    public void setDateOfBirthString(String dateOfBirthString) {
        this.dateOfBirthString = dateOfBirthString;
    }

    @Column(name = "date_of_joining")
    @DateTimeFormat(pattern = "MM-DD-YYYY")
    @Temporal(TemporalType.DATE)
    private Date dateOfJoining;

    @Transient
    private String dateOfJoiningString;

    @Transient
    private String dateOfRetirementString;

    @Transient
    private String bankNumberString;

    @Transient
    private String quarterString;

    @Transient
    private String quarterNumberString;

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

    @Transient
    private String sequenceNumberString;

    @Column(name = "date_of_increment")
    @DateTimeFormat(pattern = "DD-MM-YYYY")
    @Temporal(TemporalType.DATE)
    private Date dateOfIncrement;

    @Transient
    private String dateOfIncrementString;

    @Column(name = "date_of_retirement")
    @DateTimeFormat(pattern = "DD-MM-YYYY")
    @Temporal(TemporalType.DATE)
    private Date dateOfRetirement;

    @Column(name = "height")
    private String height;

    @Column(name = "identity_mark1")
    private String identityMark1;

    @Column(name = "identity_mark2")
    private String identityMark2;

    @Column(name = "residential_address1")
    private String residentialAddress1;

    @Column(name = "town_address1")
    private String townAddress1;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "landline_number")
    private String landlineNumber;

    @Column(name = "email_id")
    private String emailId;

    @Column(name = "official_email_id")
    private String officialEmailId;

    @Column(name = "caste_id")
    private int casteId;

    @Column(name = "category_id")
    private int categoryId;

    @Column(name = "subcaste")
    private String subcaste;

    @Column(name = "community")
    private String community;

    @Column(name = "religion_id")
    private int religionId;

    @Column(name = "nationality_id")
    private int nationalityId;

    @Column(name = "handicapped")
    private boolean handicapped;

    @Column(name = "sub_department_number")
    private int subDepartmentNumber;

    @Column(name = "sub_designation_number")
    private int subDesignationNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sub_designation_number", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private PayrollSubdesignationMaster payrollSubdesignationMaster;

    @Column(name = "staff_number")
    private int staffNumber;

    @Column(name = "staff_type_number")
    private int staffTypeNumber;

    @Column(name = "bank_account_number")
    private String bankAccountNumber;

    @Column(name = "pf_number")
    private int pfNumber;

    @Column(name = "gpf_number")
    private String gpfNumber;

    @Column(name = "ppf_number")
    private String ppfNumber;

    @Column(name = "pan_number")
    private String panNumber;

    @Column(name = "bank_number")
    private int bankNumber;

    @Column(name = "bank_city_number")
    private int bankCityNumber;

    @Column(name = "cl_number")
    private int clNumber;

    @Column(name = "quarter")
    private boolean quarter;

    @Column(name = "quarter_number")
    private int quarterNumber;

    @Column(name = "internal_transaction_number")
    private int internalTransactionNumber;

    @Column(name = "remark")
    private String remark;

    @Column(name = "common_remark")
    private String commonRemark;

    @Column(name = "monthly_remark")
    private String monthlyRemark;

    @Column(name = "authentication_reference")
    private String authenticationReference;

    @Column(name = "appointment_category_number")
    private int appointmentCategoryNumber;

    @Column(name = "joining_an_fn")
    private String joiningAnFn;

    @Column(name = "status")
    private String status;

    @Column(name = "quarter_rent")
    private boolean quarterRent;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "lic_number")
    private String licNumber;

    @Column(name = "rfid_number")
    private String rfidNumber;

    @Column(name = "blood_group_id")
    private int bloodGroupId;

    @Column(name = "state_id")
    private int stateId;

    @Column(name = "mother_tongue")
    private String motherTongue;

    @Column(name = "other_appointment_name")
    private String otherAppointmentName;

    @Column(name = "date_of_leaving")
    @DateTimeFormat(pattern = "DD-MM-YYYY")
    @Temporal(TemporalType.DATE)
    private Date dateOfLeaving;

    @Column(name = "lock_status")
    private String lockStatus;

    @Column(name = "an_fn_leave")
    private String anFnLeave;

    @Column(name = "pay_revised_date")
    @DateTimeFormat(pattern = "DD-MM-YYYY")
    @Temporal(TemporalType.DATE)
    private Date payRevisedDate;

    @Column(name = "shift_number")
    private int shiftNumber;

    @Column(name = "emergency_contact")
    private String emergencyContact;

    @Column(name = "senior_citizen")
    private boolean seniorCitizen;

    @Column(name = "emergency_number")
    private String emergencyNumber;

    @Column(name = "spouse_name")
    private String spouseName;

    @Column(name = "jnmu")
    private String jnmu;

    @Column(name = "acite")
    private String acite;

    @Column(name = "bank_branch")
    private String bankBranch;

    @Column(name = "ifsc_code")
    private String ifscCode;

    @Column(name = "std_number")
    private int stdNumber;

    @Column(name = "basic_pay")
    private String basicPay;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Date getDateOfBirth() {
        System.out.println("Date of Birth=" + dateOfBirthString);
        if (dateOfBirthString != null && dateOfBirthString != "") {
            try {
                return new SimpleDateFormat("MM/dd/yyyy").parse(dateOfBirthString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return this.dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Date getDateOfJoining() {
        if (dateOfJoiningString != null && dateOfJoiningString != "") {
            try {
                return new SimpleDateFormat("dd-MM-yyyy").parse(dateOfJoiningString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return this.dateOfJoining;
    }

    public void setDateOfJoining(Date dateOfJoining) {
        this.dateOfJoining = dateOfJoining;
    }

    public Date getDateOfIncrement() {
        if (dateOfIncrementString != null && dateOfIncrementString != "") {
            try {
                return new SimpleDateFormat("dd-MM-yyyy").parse(dateOfIncrementString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return this.dateOfIncrement;
    }

    public String getDateOfIncrementString() {
        return dateOfIncrementString;
    }

    public void setDateOfIncrementString(String dateOfIncrementString) {
        this.dateOfIncrementString = dateOfIncrementString;
    }

    public void setDateOfIncrement(Date dateOfIncrement) {
        this.dateOfIncrement = dateOfIncrement;
    }

    public Date getDateOfRetirement() {
        if (dateOfRetirementString != null && dateOfRetirementString != "") {
            try {
                return new SimpleDateFormat("dd-MM-yyyy").parse(dateOfRetirementString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return this.dateOfRetirement;

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

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "EmployeeMasterEntity [id=" + id + ", sequenceNumber=" + sequenceNumber + ", pfileNumber=" + pfileNumber
            + ", uniqueId=" + uniqueId + ", title=" + title + ", firstName=" + firstName + ", middleName=" + middleName
            + ", lastName=" + lastName + ", gender=" + gender + ", fatherName=" + fatherName + ", motherName="
            + motherName + ", dateOfBirth=" + dateOfBirth + ", dateOfJoining=" + dateOfJoining + ", dateOfIncrement="
            + dateOfIncrement + ", dateOfRetirement=" + dateOfRetirement + ", height=" + height + ", identityMark1="
            + identityMark1 + ", identityMark2=" + identityMark2 + ", residentialAddress1=" + residentialAddress1
            + ", townAddress1=" + townAddress1 + ", phoneNumber=" + phoneNumber + ", landlineNumber=" + landlineNumber
            + ", emailId=" + emailId + ", officialEmailId=" + officialEmailId + ", casteId=" + casteId + ", categoryId="
            + categoryId + ", subcaste=" + subcaste + ", community=" + community + ", religionId=" + religionId
            + ", nationalityId=" + nationalityId + ", handicapped=" + handicapped + ", subDepartmentNumber="
            + subDepartmentNumber + ", subDesignationNumber=" + subDesignationNumber + ", staffNumber=" + staffNumber
            + ", staffTypeNumber=" + staffTypeNumber + ", bankAccountNumber=" + bankAccountNumber + ", pfNumber="
            + pfNumber + ", gpfNumber=" + gpfNumber + ", ppfNumber=" + ppfNumber + ", panNumber=" + panNumber
            + ", bankNumber=" + bankNumber + ", bankCityNumber=" + bankCityNumber + ", clNumber=" + clNumber
            + ", quarter=" + quarter + ", quarterNumber=" + quarterNumber + ", internalTransactionNumber="
            + internalTransactionNumber + ", remark=" + remark + ", commonRemark=" + commonRemark + ", monthlyRemark="
            + monthlyRemark + ", authenticationReference=" + authenticationReference + ", appointmentCategoryNumber="
            + appointmentCategoryNumber + ", joiningAnFn=" + joiningAnFn + ", status=" + status + ", quarterRent="
            + quarterRent + ", collegeCode=" + collegeCode + ", licNumber=" + licNumber + ", rfidNumber=" + rfidNumber
            + ", bloodGroupId=" + bloodGroupId + ", stateId=" + stateId + ", motherTongue=" + motherTongue
            + ", otherAppointmentName=" + otherAppointmentName + ", dateOfLeaving=" + dateOfLeaving + ", lockStatus="
            + lockStatus + ", anFnLeave=" + anFnLeave + ", payRevisedDate=" + payRevisedDate + ", shiftNumber="
            + shiftNumber + ", emergencyContact=" + emergencyContact + ", seniorCitizen=" + seniorCitizen
            + ", emergencyNumber=" + emergencyNumber + ", spouseName=" + spouseName + ", jnmu=" + jnmu + ", acite="
            + acite + ", bankBranch=" + bankBranch + ", ifscCode=" + ifscCode + ", stdNumber=" + stdNumber + "]";
    }
}
