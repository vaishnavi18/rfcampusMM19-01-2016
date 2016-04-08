package com.iitms.rfcampusdata.academic.admission.entity;

import java.io.Serializable;
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

import com.iitms.rfcampusdata.academic.masters.entity.BatchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BloodGroupMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.GenderMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.NationalityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.PaymentTypeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.ReligionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.SemesterMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StateMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.YearMasterEntity;

@Entity
@Table(name = "master.admission_student_admission_master")
public class StudentAdmissionEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "registration_number")
    private String registrationNumber;

    @Column(name = "registration_number1")
    private String registrationNumber1;

    @Column(name = "roll_number")
    private String rollNumber;

    @Column(name = "enrollment_number")
    private String enrollmentNumber;

    @Column(name = "student_name")
    private String studentName;

    @Column(name = "student_name_hindi")
    private String studentNameInHindi;

    @Column(name = "student_first_name")
    private String studentFirstName;

    @Column(name = "student_middle_name")
    private String studentMiddleName;

    @Column(name = "student_last_name")
    private String studentLastName;

    @Column(name = "father_name")
    private String fatherName;

    @Column(name = "mother_name ")
    private String motherName;

    @Column(name = "student_mobile")
    private String studentMobileNumber;

    @Column(name = "landline_number")
    private String studentLandlineNumber;

    /*
     * @Column(name = "father_mobile") private String fatherMobileNumber;
     */

    /*
     * @Column(name = "mother_mobile") private String motherMobileNumber;
     */

    /*
     * @Column(name = "father_office_number") private String fatherOfficeNumber;
     */

    /*
     * @Column(name = "mother_office_number") private String motherOfficeNumber;
     */

    @Column(name = "branch_id")
    private int branchNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private BranchMasterEntity branchMasterEntity;

    @Transient
    private String branchName;

    /*
     * @Column(name = "admission_branch_number") private int admissionBranchNumber;
     */

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    @Column(name = "gender")
    private int gender;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gender", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private GenderMasterEntity genderMasterEntity;

    @Transient
    private String genderName;

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }

    @Column(name = "is_married")
    private boolean married;

    @Column(name = "date_of_birth")
    @Temporal(value = TemporalType.DATE)
    @DateTimeFormat(pattern = "yyy-MM-dd")
    private Date dateOfBirth;

    @Transient
    private String dateOfBirthString;

    @Column(name = "birth_place")
    private String birthPlace;

    @Column(name = "mother_tongue_id")
    private int motherTongueId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mother_tongue_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private MothertongueMasterEntity mothertongueMasterEntity;

    @Column(name = "other_language")
    private String otherLanguage;

    @Column(name = "height")
    private String height;

    @Column(name = "weight")
    private String weight;

    @Column(name = "identity_mark1")
    private String identityMark1;

    @Column(name = "identity_mark2")
    private String identityMark2;

    @Column(name = "blood_group_id")
    private int bloodGroupId;

    @Column(name = "caste_id")
    private int casteId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "caste_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private CasteMasterEntity casteMasterEntity;

    @Column(name = "category_id")
    private int categoryId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private CategoryMasterEntity categoryMasterEntity;

    @Column(name = "nationality_id")
    private int nationalityId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nationality_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private NationalityMasterEntity nationalityMasterEntity;

    @Column(name = "religion_id")
    private int religionId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "religion_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private ReligionMasterEntity religionMasterEntity;

    @Column(name = "country_domicile")
    private String countryDomicile;

    @Column(name = "is_hosteler")
    private boolean hosteler;

    @Column(name = "is_regular")
    private boolean regular;

    @Column(name = "is_urban")
    private boolean urban;

    @Column(name = "admitted_to_year")
    private int admittedToYear;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "admitted_to_year", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private YearMasterEntity yearMasterEntity;

    @Column(name = "admission_year")
    private String admissionYear;

    @Column(name = "is_provisional_admission")
    private boolean provisionalAdmission;

    @Column(name = "batch_id")
    private int batchId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "batch_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private BatchMasterEntity batchMasterEntity;

    @Column(name = "semester_id")
    private int semesterId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "semester_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private SemesterMasterEntity semesterMasterEntity;

    @Transient
    private String semesterName;

    public String getSemesterName() {
        return semesterName;
    }

    public void setSemesterName(String semesterName) {
        this.semesterName = semesterName;
    }

    @Column(name = "degree_id")
    private int degreeId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "degree_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private DegreeMasterEntity degreeMasterEntity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "blood_group_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private BloodGroupMasterEntity bloodGroupMasterEntity;

    @Column(name = "state_of_eligibility")
    private int stateOfEligibility;

    @Column(name = "section_id")
    private int sectionId;

    @Column(name = "scheme_id")
    private int schemeId;

    @Column(name = "last_rollno")
    private String lastRollNumber;

    @Column(name = "roll_number2")
    private String rollNumber2;

    @Column(name = "account_number")
    private String accountNumber;

    @Column(name = "visa_number")
    private String visaNumber;

    @Column(name = "passport_number")
    private String passportNumber;

    @Column(name = "email")
    private String email;

    @Column(name = "state_id")
    private int stateId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "state_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private StateMasterEntity stateMasterEntity;

    @Column(name = "id_type")
    private int idType;

    @Column(name = "payment_type")
    private int paymentType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_type", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private PaymentTypeMasterEntity paymentTypeMasterEntity;

    @Column(name = "exam_payment_type")
    private int examPaymentType;

    @Column(name = "is_admission_cancel")
    private boolean admissionCancel;

    @Column(name = "admission_date")
    @Temporal(value = TemporalType.DATE)
    @DateTimeFormat(pattern = "yyy-MM-dd")
    private Date admissionDate;

    @Transient
    private String admissionDateString;

    @Column(name = "admission_batch")
    private int admissionBatch;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "admission_batch", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private BatchMasterEntity admissionBatchMasterEntity;

    @Column(name = "leave_date")
    @Temporal(value = TemporalType.DATE)
    @DateTimeFormat(pattern = "yyy-MM-dd")
    private Date leaveDate;

    @Column(name = "is_cancel")
    private boolean cancel;

    @Column(name = "admission_cancel_date")
    @Temporal(value = TemporalType.DATE)
    @DateTimeFormat(pattern = "yyy-MM-dd")
    private Date admissionCancelDate;

    @Column(name = "qualify_exam_number")
    private int qualifyExamNumber;

    @Column(name = "qualify_exam_name")
    private String qualifyExamName;

    @Column(name = "year_of_exam")
    private String yearOfExam;

    @Column(name = "all_india_rank")
    private int allIndiaRank;

    @Column(name = "state_rank")
    private int stateRank;

    @Column(name = "percentage")
    private float percentage;

    @Column(name = "percentile")
    private float percentile;

    @Column(name = "qualified_exam_rollno")
    private String qualifiedExamRollnumber;

    @Column(name = "remark")
    private String remark;

    @Column(name = "faculty_advisor_number")
    private int facultyAdvisorNumber;

    @Column(name = "project_name")
    private String projectName;

    @Column(name = "scholorship_type_id")
    private int scholorshipTypeId;

    @Column(name = "general_merit_number")
    private int generalMeritNumber;

    @Column(name = "category_merit_number")
    private int categoryMeritNumber;

    @Column(name = "registered_number")
    private String registeredNumber;

    @Column(name = "admission_round_number")
    private int admissionRoundNumber;

    @Column(name = "ssc_technical")
    private String sscTechnical;

    @Column(name = "is_defence_quota")
    private boolean defenceQuota;

    @Column(name = "is_physically_handicapped")
    private boolean physicallyHandicapped;

    @Column(name = "type_of_physically_handicap")
    private String typeOfPhysicallyHandicap;

    @Column(name = "is_person_with_disability")
    private boolean personWithDisability;

    @Column(name = "type_of_physical_disability")
    private String typeOfPhysicalDisability;

    @Column(name = "degree_of_disability")
    private String degreeOfDisability;

    @Column(name = "is_father_mother_domicile_maharashtra")
    private boolean fatherMotherDomicileMaharashtra;

    @Column(name = "is_father_mother_central_govt_employee")
    private boolean fatherMotherCentralGovtEmployee;

    @Column(name = "is_hsc_mcvc")
    private boolean hscMCVC;

    @Column(name = "annual_income")
    private float annualIncome;

    @Column(name = "is_certificate_attached_annual_income")
    private boolean certificateAttachedAnnualIncome;

    @Column(name = "is_intermediate_drawing_exam")
    private boolean intermediateDrawingExam;

    @Column(name = "admission_quota_number")
    private float admissionQuotaNumber;

    @Column(name = "registration_status")
    private boolean registrationStatus;

    @Column(name = "other_scheme_number")
    private int otherSchemeNumber;

    @Column(name = "sports_quota")
    private int sportsQuota;

    @Column(name = "permanent_registration_number")
    private int permanentRegistrationAumber;

    @Column(name = "scheme_type")
    private String schemeType;

    @Column(name = "shift")
    private int shift;

    @Column(name = "cap_institute")
    private int capInstitute;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "admission_category_number")
    private int admissionCategoryNumber;

    @Column(name = "old_registration_number")
    private String oldRegistrationNumber;

    @Column(name = "bank_number")
    private int bankNumber;

    /*
     * @Column(name = "phd_status") private boolean phdStatus;
     */

    @Column(name = "phd_supervisor_id")
    private int phdSupervisorId;

    /*
     * @Column(name = "phd_supervisor_id1") private int phdSupervisorId1;
     */

    /*
     * @Column(name = "phd_supervisor_id2") private int phdSupervisorId2;
     */

    /*
     * @Column(name = "type_supervisor") private int typeSupervisor;
     */

    @Column(name = "type_of_cosupervisor1")
    private int typeOfCosupervisor1;

    @Column(name = "type_of_cosupervisor2")
    private int typeOfCosupervisor2;

    @Column(name = "is_net")
    private boolean net;

    @Column(name = "phd_status_category")
    private int phdStatusCategory;

    @Column(name = "reattend")
    private int reattend;

    @Column(name = "sequence_number")
    private int sequenceNumber;

    @Column(name = "is_transport")
    private boolean transport;

    @Column(name = "admission_type")
    private int admissionType;

    @Column(name = "npr_status")
    private boolean nprStatus;

    @Column(name = "is_scholership")
    private boolean scholership;

    @Column(name = "scholership_details")
    private String scholershipDetails;

    @Column(name = "title")
    private int title;

    @Column(name = "is_reserve_category")
    private boolean reserveCategory;

    @Column(name = "is_ebc")
    private boolean ebc;

    @Column(name = "emergency_contact_number")
    private String emergencyContactNumber;

    @Column(name = "is_local")
    private boolean local;

    @Column(name = "bank_address")
    private String bankAddress;

    @Column(name = "bank_ifsc_code")
    private String bankIFSCCode;

    @Column(name = "pan_number")
    private String panNumber;

    @Column(name = "voter_number")
    private String voterNumber;

    @Column(name = "npr_number")
    private String nprNumber;

    @Column(name = "status_of_student")
    private boolean statusOfStudent;

    /*
     * @Column(name = "mother_maiden_name") private String motherMaidenName;
     */

    @Column(name = "conf_hostel")
    private boolean confHostel;

    @Column(name = "convener_allotment")
    private String convenerAllotment;

    @Column(name = "region")
    private String region;

    @Column(name = "adhar_number")
    private String adharCardNumber;

    @Column(name = "route_number")
    private String routeNumber;

    @Column(name = "route_amount")
    private float routeAmount;

    @Column(name = "is_medical_problem")
    private boolean medicalProblem;

    @Column(name = "medical_details")
    private String medicalDetails;

    @Column(name = "number_of_brother")
    private int numberOfBrother;

    @Column(name = "number_of_sister")
    private int numberOfSister;

    @Column(name = "student_photo")
    private String studentPhoto;

    @Transient
    private String studentOldPhoto;

    @Column(name = "student_signature")
    private String studentSignature;

    @Transient
    private String studentOldSignature;

    @Column(name = "left_thumb")
    private String leftThumb;

    @Transient
    private String oldLeftThumb;

    @Column(name = "right_thumb")
    private String rightThumb;

    @Transient
    private String oldRightThumb;

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "macaddress ")
    private String macAddress;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "created_date ")
    @Temporal(value = TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyy-MM-dd HH:mm:ss")
    private Date createdDate;

    @Column(name = "modified_by")
    private int modifiedBy;

    @Column(name = "modified_date")
    @Temporal(value = TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyy-MM-dd HH:mm:ss")
    private Date modifiedDate;

    @Column(name = "document_list")
    private String documentList;

    @Column(name = "student_type")
    private int studentType;

    @Column(name = "scholarship_type")
    private int scholarshipType;

    @Column(name = "scholarship_category")
    private String scholarshipCategory;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public String getRegistrationNumber1() {
        return registrationNumber1;
    }

    public void setRegistrationNumber1(String registrationNumber1) {
        this.registrationNumber1 = registrationNumber1;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getEnrollmentNumber() {
        return enrollmentNumber;
    }

    public void setEnrollmentNumber(String enrollmentNumber) {
        this.enrollmentNumber = enrollmentNumber;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentFirstName() {
        return studentFirstName;
    }

    public void setStudentFirstName(String studentFirstName) {
        this.studentFirstName = studentFirstName;
    }

    public String getStudentMiddleName() {
        return studentMiddleName;
    }

    public void setStudentMiddleName(String studentMiddleName) {
        this.studentMiddleName = studentMiddleName;
    }

    public String getStudentLastName() {
        return studentLastName;
    }

    public void setStudentLastName(String studentLastName) {
        this.studentLastName = studentLastName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public String getStudentMobileNumber() {
        return studentMobileNumber;
    }

    public void setStudentMobileNumber(String studentMobileNumber) {
        this.studentMobileNumber = studentMobileNumber;
    }

    /*
     * public String getFatherMobileNumber() { return fatherMobileNumber; } public void setFatherMobileNumber(String
     * fatherMobileNumber) { this.fatherMobileNumber = fatherMobileNumber; }
     */

    /*
     * public String getMotherMobileNumber() { return motherMobileNumber; } public void setMotherMobileNumber(String
     * motherMobileNumber) { this.motherMobileNumber = motherMobileNumber; }
     */

    /*
     * public String getFatherOfficeNumber() { return fatherOfficeNumber; } public void setFatherOfficeNumber(String
     * fatherOfficeNumber) { this.fatherOfficeNumber = fatherOfficeNumber; }
     */

    /*
     * public String getMotherOfficeNumber() { return motherOfficeNumber; } public void setMotherOfficeNumber(String
     * motherOfficeNumber) { this.motherOfficeNumber = motherOfficeNumber; }
     */

    public String getStudentNameInHindi() {
        return studentNameInHindi;
    }

    public void setStudentNameInHindi(String studentNameInHindi) {
        this.studentNameInHindi = studentNameInHindi;
    }

    public int getBranchNumber() {
        return branchNumber;
    }

    public void setBranchNumber(int branchNumber) {
        this.branchNumber = branchNumber;
    }

    /*
     * public int getAdmissionBranchNumber() { return admissionBranchNumber; } public void setAdmissionBranchNumber(int
     * admissionBranchNumber) { this.admissionBranchNumber = admissionBranchNumber; }
     */

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public boolean isMarried() {
        return married;
    }

    public void setMarried(boolean married) {
        this.married = married;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getBirthPlace() {
        return birthPlace;
    }

    public void setBirthPlace(String birthPlace) {
        this.birthPlace = birthPlace;
    }

    public int getMotherTongueId() {
        return motherTongueId;
    }

    public void setMotherTongueId(int motherTongueId) {
        this.motherTongueId = motherTongueId;
    }

    public String getOtherLanguage() {
        return otherLanguage;
    }

    public void setOtherLanguage(String otherLanguage) {
        this.otherLanguage = otherLanguage;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
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

    public int getBloodGroupId() {
        return bloodGroupId;
    }

    public void setBloodGroupId(int bloodGroupId) {
        this.bloodGroupId = bloodGroupId;
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

    public int getNationalityId() {
        return nationalityId;
    }

    public void setNationalityId(int nationalityId) {
        this.nationalityId = nationalityId;
    }

    public int getReligionId() {
        return religionId;
    }

    public void setReligionId(int religionId) {
        this.religionId = religionId;
    }

    public String getCountryDomicile() {
        return countryDomicile;
    }

    public void setCountryDomicile(String countryDomicile) {
        this.countryDomicile = countryDomicile;
    }

    public boolean isHosteler() {
        return hosteler;
    }

    public void setHosteler(boolean hosteler) {
        this.hosteler = hosteler;
    }

    public boolean isRegular() {
        return regular;
    }

    public void setRegular(boolean regular) {
        this.regular = regular;
    }

    public boolean isUrban() {
        return urban;
    }

    public void setUrban(boolean urban) {
        this.urban = urban;
    }

    public int getAdmittedToYear() {
        return admittedToYear;
    }

    public void setAdmittedToYear(int admittedToYear) {
        this.admittedToYear = admittedToYear;
    }

    public boolean isProvisionalAdmission() {
        return provisionalAdmission;
    }

    public void setProvisionalAdmission(boolean provisionalAdmission) {
        this.provisionalAdmission = provisionalAdmission;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    public int getSemesterId() {
        return semesterId;
    }

    public void setSemesterId(int semesterId) {
        this.semesterId = semesterId;
    }

    public int getDegreeId() {
        return degreeId;
    }

    public void setDegreeId(int degreeId) {
        this.degreeId = degreeId;
    }

    public int getSectionId() {
        return sectionId;
    }

    public void setSectionId(int sectionId) {
        this.sectionId = sectionId;
    }

    public int getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(int schemeId) {
        this.schemeId = schemeId;
    }

    public String getLastRollNumber() {
        return lastRollNumber;
    }

    public void setLastRollNumber(String lastRollNumber) {
        this.lastRollNumber = lastRollNumber;
    }

    public String getRollNumber2() {
        return rollNumber2;
    }

    public void setRollNumber2(String rollNumber2) {
        this.rollNumber2 = rollNumber2;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public int getIdType() {
        return idType;
    }

    public void setIdType(int idType) {
        this.idType = idType;
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

    public boolean isCancel() {
        return cancel;
    }

    public void setCancel(boolean cancel) {
        this.cancel = cancel;
    }

    public Date getAdmissionCancelDate() {
        return admissionCancelDate;
    }

    public void setAdmissionCancelDate(Date admissionCancelDate) {
        this.admissionCancelDate = admissionCancelDate;
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

    public String getSscTechnical() {
        return sscTechnical;
    }

    public void setSscTechnical(String sscTechnical) {
        this.sscTechnical = sscTechnical;
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

    public boolean isFatherMotherDomicileMaharashtra() {
        return fatherMotherDomicileMaharashtra;
    }

    public void setFatherMotherDomicileMaharashtra(boolean fatherMotherDomicileMaharashtra) {
        this.fatherMotherDomicileMaharashtra = fatherMotherDomicileMaharashtra;
    }

    public boolean isFatherMotherCentralGovtEmployee() {
        return fatherMotherCentralGovtEmployee;
    }

    public void setFatherMotherCentralGovtEmployee(boolean fatherMotherCentralGovtEmployee) {
        this.fatherMotherCentralGovtEmployee = fatherMotherCentralGovtEmployee;
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

    public boolean isCertificateAttachedAnnualIncome() {
        return certificateAttachedAnnualIncome;
    }

    public void setCertificateAttachedAnnualIncome(boolean certificateAttachedAnnualIncome) {
        this.certificateAttachedAnnualIncome = certificateAttachedAnnualIncome;
    }

    public boolean isIntermediateDrawingExam() {
        return intermediateDrawingExam;
    }

    public void setIntermediateDrawingExam(boolean intermediateDrawingExam) {
        this.intermediateDrawingExam = intermediateDrawingExam;
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

    public int getShift() {
        return shift;
    }

    public void setShift(int shift) {
        this.shift = shift;
    }

    public int getCapInstitute() {
        return capInstitute;
    }

    public void setCapInstitute(int capInstitute) {
        this.capInstitute = capInstitute;
    }

    public String getCollegeCode() {
        return collegeCode;
    }

    public void setCollegeCode(String collegeCode) {
        this.collegeCode = collegeCode;
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

    /*
     * public boolean isPhdStatus() { return phdStatus; } public void setPhdStatus(boolean phdStatus) { this.phdStatus =
     * phdStatus; }
     */

    public int getPhdSupervisorId() {
        return phdSupervisorId;
    }

    public void setPhdSupervisorId(int phdSupervisorId) {
        this.phdSupervisorId = phdSupervisorId;
    }

    /*
     * public int getPhdSupervisorId1() { return phdSupervisorId1; } public void setPhdSupervisorId1(int
     * phdSupervisorId1) { this.phdSupervisorId1 = phdSupervisorId1; }
     */

    /*
     * public int getPhdSupervisorId2() { return phdSupervisorId2; } public void setPhdSupervisorId2(int
     * phdSupervisorId2) { this.phdSupervisorId2 = phdSupervisorId2; }
     */

    /*
     * public int getTypeSupervisor() { return typeSupervisor; } public void setTypeSupervisor(int typeSupervisor) {
     * this.typeSupervisor = typeSupervisor; }
     */

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

    public boolean isNet() {
        return net;
    }

    public void setNet(boolean net) {
        this.net = net;
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

    public boolean isTransport() {
        return transport;
    }

    public void setTransport(boolean transport) {
        this.transport = transport;
    }

    public int getAdmissionType() {
        return admissionType;
    }

    public void setAdmissionType(int admissionType) {
        this.admissionType = admissionType;
    }

    public boolean isNprStatus() {
        return nprStatus;
    }

    public void setNprStatus(boolean nprStatus) {
        this.nprStatus = nprStatus;
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

    public int getTitle() {
        return title;
    }

    public void setTitle(int title) {
        this.title = title;
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

    /*
     * public String getMotherMaidenName() { return motherMaidenName; } public void setMotherMaidenName(String
     * motherMaidenName) { this.motherMaidenName = motherMaidenName; }
     */

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

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getMacAddress() {
        return macAddress;
    }

    public void setMacAddress(String macAddress) {
        this.macAddress = macAddress;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(int modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public void setStudentRegistrationEntry(int id, String enrollmentNumber, int title, String studentName,
        Date dateOfBirth, int gender, String identityMark1, String identityMark2, String fatherName,
        String studentFirstName, String studentMiddleName, String studentLastName, int bloodGroupId, int nationalityId,
        int religionId, boolean reserveCategory, float annualIncome, boolean ebc, int categoryId,
        int admissionCategoryNumber, String email, boolean married, String studentMobileNumber,
        String studentLandlineNumber, String emergencyContactNumber) {
        this.id = id;
        this.enrollmentNumber = enrollmentNumber;
        this.title = title;
        this.studentName = studentName;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.identityMark1 = identityMark1;
        this.identityMark2 = identityMark2;
        this.fatherName = fatherName;
        this.studentFirstName = studentFirstName;
        this.studentMiddleName = studentMiddleName;
        this.studentLastName = studentLastName;
        this.bloodGroupId = bloodGroupId;
        this.nationalityId = nationalityId;
        this.religionId = religionId;
        this.reserveCategory = reserveCategory;
        this.annualIncome = annualIncome;
        this.ebc = ebc;
        this.categoryId = categoryId;
        this.admissionCategoryNumber = admissionCategoryNumber;
        this.email = email;
        this.married = married;
        this.studentMobileNumber = studentMobileNumber;
        this.studentLandlineNumber = studentLandlineNumber;
        this.emergencyContactNumber = emergencyContactNumber;
    }

    public void setAdmissionAndPersonalInformation(Date admissionDate, int branchNumber, int admissionBatch,
        boolean scholership, boolean local, int semesterId, int degreeId, int paymentType, int admittedToYear,
        int categoryId, int scholarshipDetails, int statusStudent,

        String birthPlace, int motherTongueId, String otherLanguage, String height, String weight, boolean urban,
        String passportNumber, String bankAddress, int bankNumber, String bankIFSCCode, boolean physicallyHandicapped,
        String typeOfPhysicallyHandicap, String visaNumber, String panNumber, String voterNumber,
        String adharCardNumber, boolean hosteler, boolean nprStatus, boolean transport, String nprNumber,
        String routeNumber, float routeAmount, boolean medicalProblem, String medicalDetails, int numberOfBrother,
        int numberOfSister, String countryDomicile) {

        this.admissionDate = admissionDate;
        this.branchNumber = branchNumber;
        this.admissionBatch = admissionBatch;
        this.scholership = scholership;
        this.local = local;
        this.semesterId = semesterId;
        this.degreeId = degreeId;
        this.paymentType = paymentType;
        this.admittedToYear = admittedToYear;
        this.categoryId = categoryId;
        // this.scholarshipDetails = scholarshipDetails;
        // this.statusStudent = statusStudent;
        this.birthPlace = birthPlace;
        this.motherTongueId = motherTongueId;
        this.otherLanguage = otherLanguage;
        this.height = height;
        this.weight = weight;
        this.urban = urban;
        this.passportNumber = passportNumber;
        this.bankAddress = bankAddress;
        this.bankNumber = bankNumber;
        this.bankIFSCCode = bankIFSCCode;
        this.physicallyHandicapped = physicallyHandicapped;
        this.typeOfPhysicallyHandicap = typeOfPhysicallyHandicap;
        this.visaNumber = visaNumber;
        this.panNumber = panNumber;
        this.voterNumber = voterNumber;
        this.adharCardNumber = adharCardNumber;
        this.hosteler = hosteler;
        this.nprStatus = nprStatus;
        this.transport = transport;
        this.nprNumber = nprNumber;
        this.routeNumber = routeNumber;
        this.routeAmount = routeAmount;
        this.medicalProblem = medicalProblem;
        this.medicalDetails = medicalDetails;
        this.numberOfBrother = numberOfBrother;
        this.numberOfSister = numberOfSister;
        this.countryDomicile = countryDomicile;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getStudentLandlineNumber() {
        return studentLandlineNumber;
    }

    public void setStudentLandlineNumber(String studentLandlineNumber) {
        this.studentLandlineNumber = studentLandlineNumber;
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

    @Override
    public String toString() {
        return "StudentAdmissionEntity [id=" + id + ", registrationNumber=" + registrationNumber
            + ", registrationNumber1=" + registrationNumber1 + ", rollNumber=" + rollNumber + ", enrollmentNumber="
            + enrollmentNumber + ", studentName=" + studentName + ", studentFirstName=" + studentFirstName
            + ", studentMiddleName=" + studentMiddleName + ", studentLastName=" + studentLastName + ", fatherName="
            + fatherName + ", motherName=" + motherName + ", studentMobileNumber=" + studentMobileNumber
            + ", studentLandlineNumber=" + studentLandlineNumber + ", studentNameInHindi=" + studentNameInHindi
            + ", branchNumber=" + branchNumber + ", gender=" + gender + ", married=" + married + ", dateOfBirth="
            + dateOfBirth + ", birthPlace=" + birthPlace + ", motherTongueId=" + motherTongueId + ", otherLanguage="
            + otherLanguage + ", height=" + height + ", weight=" + weight + ", identityMark1=" + identityMark1
            + ", identityMark2=" + identityMark2 + ", bloodGroupId=" + bloodGroupId + ", casteId=" + casteId
            + ", categoryId=" + categoryId + ", nationalityId=" + nationalityId + ", religionId=" + religionId
            + ", countryDomicile=" + countryDomicile + ", hosteler=" + hosteler + ", regular=" + regular + ", urban="
            + urban + ", admittedToYear=" + admittedToYear + ", provisionalAdmission=" + provisionalAdmission
            + ", batchId=" + batchId + ", semesterId=" + semesterId + ", degreeId=" + degreeId + ", sectionId="
            + sectionId + ", schemeId=" + schemeId + ", lastRollNumber=" + lastRollNumber + ", rollNumber2="
            + rollNumber2 + ", accountNumber=" + accountNumber + ", visaNumber=" + visaNumber + ", passportNumber="
            + passportNumber + ", email=" + email + ", stateId=" + stateId + ", idType=" + idType + ", paymentType="
            + paymentType + ", examPaymentType=" + examPaymentType + ", admissionCancel=" + admissionCancel
            + ", admissionDate=" + admissionDate + ", admissionBatch=" + admissionBatch + ", leaveDate=" + leaveDate
            + ", cancel=" + cancel + ", admissionCancelDate=" + admissionCancelDate + ", qualifyExamNumber="
            + qualifyExamNumber + ", qualifyExamName=" + qualifyExamName + ", yearOfExam=" + yearOfExam
            + ", allIndiaRank=" + allIndiaRank + ", stateRank=" + stateRank + ", percentage=" + percentage
            + ", percentile=" + percentile + ", qualifiedExamRollnumber=" + qualifiedExamRollnumber + ", remark="
            + remark + ", facultyAdvisorNumber=" + facultyAdvisorNumber + ", projectName=" + projectName
            + ", scholorshipTypeId=" + scholorshipTypeId + ", generalMeritNumber=" + generalMeritNumber
            + ", categoryMeritNumber=" + categoryMeritNumber + ", registeredNumber=" + registeredNumber
            + ", admissionRoundNumber=" + admissionRoundNumber + ", sscTechnical=" + sscTechnical + ", defenceQuota="
            + defenceQuota + ", physicallyHandicapped=" + physicallyHandicapped + ", typeOfPhysicallyHandicap="
            + typeOfPhysicallyHandicap + ", personWithDisability=" + personWithDisability
            + ", typeOfPhysicalDisability=" + typeOfPhysicalDisability + ", fatherMotherDomicileMaharashtra="
            + fatherMotherDomicileMaharashtra + ", fatherMotherCentralGovtEmployee=" + fatherMotherCentralGovtEmployee
            + ", hscMCVC=" + hscMCVC + ", annualIncome=" + annualIncome + ", certificateAttachedAnnualIncome="
            + certificateAttachedAnnualIncome + ", intermediateDrawingExam=" + intermediateDrawingExam
            + ", admissionQuotaNumber=" + admissionQuotaNumber + ", registrationStatus=" + registrationStatus
            + ", otherSchemeNumber=" + otherSchemeNumber + ", sportsQuota=" + sportsQuota
            + ", permanentRegistrationAumber=" + permanentRegistrationAumber + ", schemeType=" + schemeType + ", shift="
            + shift + ", capInstitute=" + capInstitute + ", collegeCode=" + collegeCode + ", admissionCategoryNumber="
            + admissionCategoryNumber + ", oldRegistrationNumber=" + oldRegistrationNumber + ", bankNumber="
            + bankNumber + ", phdSupervisorId=" + phdSupervisorId + ", typeOfCosupervisor1=" + typeOfCosupervisor1
            + ", typeOfCosupervisor2=" + typeOfCosupervisor2 + ", net=" + net + ", phdStatusCategory="
            + phdStatusCategory + ", reattend=" + reattend + ", sequenceNumber=" + sequenceNumber + ", transport="
            + transport + ", admissionType=" + admissionType + ", nprStatus=" + nprStatus + ", scholership="
            + scholership + ", scholershipDetails=" + scholershipDetails + ", title=" + title + ", reserveCategory="
            + reserveCategory + ", ebc=" + ebc + ", emergencyContactNumber=" + emergencyContactNumber + ", local="
            + local + ", bankAddress=" + bankAddress + ", bankIFSCCode=" + bankIFSCCode + ", panNumber=" + panNumber
            + ", voterNumber=" + voterNumber + ", nprNumber=" + nprNumber + ", statusOfStudent=" + statusOfStudent
            + ", confHostel=" + confHostel + ", convenerAllotment=" + convenerAllotment + ", region=" + region
            + ", adharCardNumber=" + adharCardNumber + ", routeNumber=" + routeNumber + ", routeAmount=" + routeAmount
            + ", medicalProblem=" + medicalProblem + ", medicalDetails=" + medicalDetails + ", numberOfBrother="
            + numberOfBrother + ", numberOfSister=" + numberOfSister + ", ipAddress=" + ipAddress + ", macAddress="
            + macAddress + ", createdBy=" + createdBy + ", createdDate=" + createdDate + ", modifiedBy=" + modifiedBy
            + ", modifiedDate=" + modifiedDate + "]";
    }

    public Date getDateOfBirthString() {
        try {
            return new SimpleDateFormat("dd-MM-yyyy").parse(dateOfBirthString);
        } catch (Exception e) {
            return new Date();
        }
    }

    public void setDateOfBirthString(String dateOfBirthString) {
        this.dateOfBirthString = dateOfBirthString;
    }

    public Date getAdmissionDateString() {
        try {
            return new SimpleDateFormat("dd-MM-yyyy").parse(admissionDateString);
        } catch (Exception e) {
            return new Date();
        }
    }

    public void setAdmissionDateString(String admissionDateString) {
        this.admissionDateString = admissionDateString;
    }

    public String getStudentPhoto() {
        return studentPhoto;
    }

    public void setStudentPhoto(String studentPhoto) {
        this.studentPhoto = studentPhoto;
    }

    public String getStudentOldPhoto() {
        if (this.studentPhoto != null) {
            return this.studentPhoto;
        }
        return studentOldPhoto;
    }

    public void setStudentOldPhoto(String studentOldPhoto) {
        this.studentOldPhoto = studentOldPhoto;
    }

    public String getStudentSignature() {
        return studentSignature;
    }

    public void setStudentSignature(String studentSignature) {
        this.studentSignature = studentSignature;
    }

    public String getStudentOldSignature() {
        if (this.studentSignature != null) {
            return this.studentSignature;
        }
        return studentOldSignature;
    }

    public void setStudentOldSignature(String studentOldSignature) {
        this.studentOldSignature = studentOldSignature;
    }

    public String getLeftThumb() {
        return leftThumb;
    }

    public void setLeftThumb(String leftThumb) {
        this.leftThumb = leftThumb;
    }

    public String getOldLeftThumb() {
        if (this.leftThumb != null) {
            return this.leftThumb;
        }
        return oldLeftThumb;
    }

    public void setOldLeftThumb(String oldLeftThumb) {
        this.oldLeftThumb = oldLeftThumb;
    }

    public String getRightThumb() {
        return rightThumb;
    }

    public void setRightThumb(String rightThumb) {
        this.rightThumb = rightThumb;
    }

    public String getOldRightThumb() {
        if (this.rightThumb != null) {
            return this.rightThumb;
        }
        return oldRightThumb;
    }

    public void setOldRightThumb(String oldRightThumb) {
        this.oldRightThumb = oldRightThumb;
    }

    public String getDocumentList() {
        return documentList;
    }

    public void setDocumentList(String documentList) {
        this.documentList = documentList;
    }

    public String getStudentBasicInformation() {
        return "\nregistrationNumber : " + this.registrationNumber + "" + "\nenrollmentNumber : "
            + this.enrollmentNumber + "\ntitle : " + this.title + "\nstudentName : " + this.studentName
            + "\ndateOfBirthString : " + this.dateOfBirthString + "\ngender : " + this.gender + "\n religionId : "
            + this.religionId + "\n categoryId : " + this.categoryId + "\ncasteId : " + this.casteId + "\n email : "
            + this.email + "\n studentNameInHindi : " + this.studentNameInHindi + "\n adharCardNumber : "
            + this.adharCardNumber + "\n married : " + this.married + "\n nationalityId : " + this.nationalityId
            + "\n admissionCategoryNumber : " + this.admissionCategoryNumber + "\n bloodGroupId : " + this.bloodGroupId
            + "\n studentMobileNumber : " + this.studentMobileNumber;
    }

    public void setStudentBasicInformation(StudentAdmissionEntity entity) {
        try {
            // this.enrollmentNumber = entity.getEnrollmentNumber();
            // this.registrationNumber = entity.getRegistrationNumber();
            this.title = entity.getTitle();
            this.studentName = entity.getStudentName();
            this.dateOfBirth = entity.getDateOfBirthString();
            this.gender = entity.getGender();
            this.religionId = entity.getReligionId();
            this.categoryId = entity.getCategoryId();
            this.casteId = entity.getCasteId();
            this.email = entity.getEmail();
            this.studentNameInHindi = entity.getStudentNameInHindi();
            this.adharCardNumber = entity.getAdharCardNumber();
            this.married = entity.isMarried();
            this.nationalityId = entity.getNationalityId();
            this.admissionCategoryNumber = entity.getAdmissionCategoryNumber();
            this.bloodGroupId = entity.getBloodGroupId();
            this.studentMobileNumber = entity.getStudentMobileNumber();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public String getStudentAdmissionInformation() {
        return "admissionDateString   : " + this.admissionDateString + "\n" + "degreeId   : " + this.degreeId + "\n"
            + "admittedToYear   : " + this.admittedToYear + "\n" + "paymentType   : " + this.paymentType + "\n"
            + "studentType   : " + this.studentType + "\n" + "admissionYear   : " + this.admissionYear + "\n"
            + "branchNumber   : " + this.branchNumber + "\n" + "semesterId   : " + this.semesterId + "\n"
            + "stateOfEligibility   : " + this.stateOfEligibility + "\n" + "hosteler   : " + this.hosteler + "\n" +

        "annualIncome   : " + this.annualIncome + "\n" + "urban   : " + this.urban + "\n" + "scholarshipType   : "
            + this.scholarshipType + "\n" + "scholarshipCategory   : " + this.scholarshipCategory + "\n";
    }

    public void setStudentAdmissionInformation(StudentAdmissionEntity entity) {

        System.out.println("Hosteler : " + entity.isHosteler() + " : Urban : " + entity.isUrban());

        this.admissionDate = entity.getAdmissionDateString();
        this.degreeId = entity.getDegreeId();
        this.admittedToYear = entity.getAdmittedToYear();
        this.paymentType = entity.getPaymentType();
        this.studentType = entity.getStudentType();
        // this.quota
        this.admissionYear = entity.getAdmissionYear();
        this.branchNumber = entity.getBranchNumber();
        this.semesterId = entity.getSemesterId();
        this.stateOfEligibility = entity.getStateOfEligibility();
        this.hosteler = entity.isHosteler();

        this.annualIncome = entity.getAnnualIncome();
        this.urban = entity.isUrban();
        this.scholarshipType = entity.getScholarshipType();
        this.scholarshipCategory = entity.getScholarshipCategory();
    }

    public String getStudentPersonalDetails() {
        return "birthPlace   : " + this.birthPlace + "\n" + "identityMark1   : " + this.identityMark1 + "\n"
            + "countryDomicile   : " + this.countryDomicile + "\n" + "bankNumber   : " + this.bankNumber + "\n"
            + "physicallyHandicapped   : " + this.physicallyHandicapped + "\n" + "height   : " + this.height + "\n"
            + "motherTongueId   : " + this.motherTongueId + "\n" + "visaNumber   : " + this.visaNumber + "\n"
            + "accountNumber   : " + this.accountNumber + "\n" + "typeOfPhysicallyHandicap   : "
            + this.typeOfPhysicallyHandicap + "\n" + "weight   : " + this.weight + "\n" + "otherLanguage   : "
            + this.otherLanguage + "\n" + "passportNumber   : " + this.passportNumber + "\n" + "degreeOfDisability   : "
            + this.degreeOfDisability + "\n";
    }

    public void setStudentPersonalDetails(StudentAdmissionEntity entity) {
        this.birthPlace = entity.getBirthPlace();
        this.identityMark1 = entity.getIdentityMark1();
        this.countryDomicile = entity.getCountryDomicile();
        this.bankNumber = entity.getBankNumber();
        this.physicallyHandicapped = entity.isPhysicallyHandicapped();
        this.height = entity.getHeight();
        this.motherTongueId = entity.getMotherTongueId();
        this.visaNumber = entity.getVisaNumber();
        this.accountNumber = entity.getAccountNumber();
        this.typeOfPhysicallyHandicap = entity.getTypeOfPhysicallyHandicap();
        this.weight = entity.getWeight();
        this.otherLanguage = entity.getOtherLanguage();
        this.passportNumber = entity.getPassportNumber();
        this.degreeOfDisability = entity.getDegreeOfDisability();
    }

    public void setImages(String studentPhoto, String studentSignature, String leftThumb, String rightThumb) {
        this.studentPhoto = studentPhoto;
        this.studentSignature = studentSignature;
        this.leftThumb = leftThumb;
        this.rightThumb = rightThumb;
    }

    public BranchMasterEntity getBranchMasterEntity() {
        return branchMasterEntity;
    }

    public void setBranchMasterEntity(BranchMasterEntity branchMasterEntity) {
        this.branchMasterEntity = branchMasterEntity;
    }

    public SemesterMasterEntity getSemesterMasterEntity() {
        return semesterMasterEntity;
    }

    public void setSemesterMasterEntity(SemesterMasterEntity semesterMasterEntity) {
        this.semesterMasterEntity = semesterMasterEntity;
    }

    public int getStudentType() {
        return studentType;
    }

    public void setStudentType(int studentType) {
        this.studentType = studentType;
    }

    public String getAdmissionYear() {
        return admissionYear;
    }

    public void setAdmissionYear(String admissionYear) {
        this.admissionYear = admissionYear;
    }

    public int getStateOfEligibility() {
        return stateOfEligibility;
    }

    public void setStateOfEligibility(int stateOfEligibility) {
        this.stateOfEligibility = stateOfEligibility;
    }

    public String getDegreeOfDisability() {
        return degreeOfDisability;
    }

    public void setDegreeOfDisability(String degreeOfDisability) {
        this.degreeOfDisability = degreeOfDisability;
    }

    public int getScholarshipType() {
        return scholarshipType;
    }

    public void setScholarshipType(int scholarshipType) {
        this.scholarshipType = scholarshipType;
    }

    public String getScholarshipCategory() {
        return scholarshipCategory;
    }

    public void setScholarshipCategory(String scholarshipCategory) {
        this.scholarshipCategory = scholarshipCategory;
    }

    public DegreeMasterEntity getDegreeMasterEntity() {
        return degreeMasterEntity;
    }

    public void setDegreeMasterEntity(DegreeMasterEntity degreeMasterEntity) {
        this.degreeMasterEntity = degreeMasterEntity;
    }

    public GenderMasterEntity getGenderMasterEntity() {
        return genderMasterEntity;
    }

    public void setGenderMasterEntity(GenderMasterEntity genderMasterEntity) {
        this.genderMasterEntity = genderMasterEntity;
    }

    public CasteMasterEntity getCasteMasterEntity() {
        return casteMasterEntity;
    }

    public void setCasteMasterEntity(CasteMasterEntity casteMasterEntity) {
        this.casteMasterEntity = casteMasterEntity;
    }

    public CategoryMasterEntity getCategoryMasterEntity() {
        return categoryMasterEntity;
    }

    public void setCategoryMasterEntity(CategoryMasterEntity categoryMasterEntity) {
        this.categoryMasterEntity = categoryMasterEntity;
    }

    public NationalityMasterEntity getNationalityMasterEntity() {
        return nationalityMasterEntity;
    }

    public void setNationalityMasterEntity(NationalityMasterEntity nationalityMasterEntity) {
        this.nationalityMasterEntity = nationalityMasterEntity;
    }

    public ReligionMasterEntity getReligionMasterEntity() {
        return religionMasterEntity;
    }

    public void setReligionMasterEntity(ReligionMasterEntity religionMasterEntity) {
        this.religionMasterEntity = religionMasterEntity;
    }

    public YearMasterEntity getYearMasterEntity() {
        return yearMasterEntity;
    }

    public void setYearMasterEntity(YearMasterEntity yearMasterEntity) {
        this.yearMasterEntity = yearMasterEntity;
    }

    public BatchMasterEntity getBatchMasterEntity() {
        return batchMasterEntity;
    }

    public void setBatchMasterEntity(BatchMasterEntity batchMasterEntity) {
        this.batchMasterEntity = batchMasterEntity;
    }

    public StateMasterEntity getStateMasterEntity() {
        return stateMasterEntity;
    }

    public void setStateMasterEntity(StateMasterEntity stateMasterEntity) {
        this.stateMasterEntity = stateMasterEntity;
    }

    public BloodGroupMasterEntity getBloodGroupMasterEntity() {
        return bloodGroupMasterEntity;
    }

    public void setBloodGroupMasterEntity(BloodGroupMasterEntity bloodGroupMasterEntity) {
        this.bloodGroupMasterEntity = bloodGroupMasterEntity;
    }

    public PaymentTypeMasterEntity getPaymentTypeMasterEntity() {
        return paymentTypeMasterEntity;
    }

    public void setPaymentTypeMasterEntity(PaymentTypeMasterEntity paymentTypeMasterEntity) {
        this.paymentTypeMasterEntity = paymentTypeMasterEntity;
    }

    /*
     * public void setStudentDetails(TempStudentRegistrationEntity entity) { this.motherTongueId =
     * entity.getMotherTongueId(); this.dateOfBirth = entity.getDateOfBirth(); }
     */

    public void setDefaultValues() {
        this.setBranchMasterEntity(new BranchMasterEntity());
        this.setSemesterMasterEntity(new SemesterMasterEntity());
        this.setGenderMasterEntity(new GenderMasterEntity());
        this.setCasteMasterEntity(new CasteMasterEntity());
        this.setCategoryMasterEntity(new CategoryMasterEntity());
        this.setNationalityMasterEntity(new NationalityMasterEntity());
        this.setReligionMasterEntity(new ReligionMasterEntity());
        this.setYearMasterEntity(new YearMasterEntity());
        this.setBatchMasterEntity(new BatchMasterEntity());
        this.setDegreeMasterEntity(new DegreeMasterEntity());
        this.setStateMasterEntity(new StateMasterEntity());
        this.setBloodGroupMasterEntity(new BloodGroupMasterEntity());
        this.setPaymentTypeMasterEntity(new PaymentTypeMasterEntity());
    }

}
