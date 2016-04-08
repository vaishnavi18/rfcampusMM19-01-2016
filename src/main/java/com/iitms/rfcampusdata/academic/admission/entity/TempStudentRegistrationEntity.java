package com.iitms.rfcampusdata.academic.admission.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CountryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DistrictMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.GenderMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.NationalityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StateMasterEntity;

@Entity
@Table(name = "master.student_registration_temp")
public class TempStudentRegistrationEntity {
    private static final Logger LOG = LoggerFactory.getLogger(TempStudentRegistrationEntity.class);

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    int id;

    @Column(name = "application_id")
    String applicationId;

    @Column(name = "password")
    String password;

    @Column(name = "session_id")
    int sessionId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "session_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private AcademicSessionMasterEntity academicSessionMasterEntity;

    @Transient
    private String sessionName;

    @Column(name = "student_name")
    String studentName;

    @Column(name = "father_name")
    String fatherName;

    @Column(name = "mother_name")
    String motherName;

    @Column(name = "last_name")
    String lastName;

    @Column(name = "gender")
    int gender;

    @Transient
    private String genderName;

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gender", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private GenderMasterEntity genderMasterEntity;

    @Column(name = "date_of_birth")
    Date dateOfBirth;

    @Transient
    String dob;

    @Column(name = "mother_tongue_id")
    int motherTongueId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mother_tongue_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private MothertongueMasterEntity mothertongueMasterEntity;

    @Transient
    private String motherTongue;

    @Column(name = "pincode")
    String pincode;

    @Column(name = "address")
    String address;

    @Column(name = "city_id")
    int cityId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "city_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private CityMasterEntity cityMasterEntity;

    @Transient
    private String cityName;

    @Column(name = "district_id")
    int districtId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "district_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private DistrictMasterEntity districtMasterEntity;

    @Transient
    private String districtName;

    @Column(name = "state_id")
    int stateId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "state_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private StateMasterEntity stateMasterEntity;

    @Transient
    private String state;

    @Column(name = "country_id")
    int countryId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "country_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private CountryMasterEntity countryMasterEntity;

    @Transient
    private String country;

    @Column(name = "permanent_telephone_std")
    String permanentTelephoneStd;

    @Column(name = "permanent_telephone")
    String permanentTelephone;

    @Column(name = "mobile_number")
    String mobileNumber;

    @Column(name = "email_id")
    String emailId;

    @Column(name = "caste_id")
    int casteId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "caste_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private CasteMasterEntity casteMasterEntity;

    @Transient
    private String caste;

    @Column(name = "category_id")
    int categoryId;

    @Column(name = "nationality_id")
    int nationalityId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nationality_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private NationalityMasterEntity nationalityMasterEntity;

    @Transient
    private String nationality;

    @Column(name = "is_minority")
    Boolean isMinority;

    @Column(name = "last_qualification_id")
    int lastQualificationId;

    @Column(name = "ssc_maths")
    int sscMaths;

    @Column(name = "ssc_maths_maximum")
    int sscMathsMaximum;

    @Column(name = "ssc_perentage")
    double sscPerentage;

    @Column(name = "ssc_total")
    int sscTotal;

    @Column(name = "ssc_outof")
    int sscOutof;

    @Column(name = "ssc_passing_year")
    String sscPassingYear;

    @Column(name = "hsc_maths")
    int hscMaths;

    @Column(name = "hsc_maths_max")
    int hscMathsMax;

    @Column(name = "hsc_chemestry")
    int hscChemestry;

    @Column(name = "hsc_chemestry_max")
    int hscChemestryMax;

    @Column(name = "hsc_physics")
    int hscPhysics;

    @Column(name = "hsc_physics_max")
    int hscPhysicsMax;

    @Formula("hsc_physics  + hsc_chemestry + hsc_maths")
    @Column(name = "hsc_pcm")
    int hscPcm;

    @Column(name = "hsc_pcm_max")
    int hscPcmMax;

    @Column(name = "hsc_percentage")
    double hscPercentage;

    @Column(name = "hsc_total")
    int hscTotal;

    @Column(name = "hsc_out_of")
    int hscOutOf;

    @Column(name = "hsc_passing_year")
    String hscPassingYear;

    @Column(name = "admission_status")
    String admissionStatus;

    @Column(name = "branch_id")
    int branchId;

    @Column(name = "degree_id")
    int degreeId;

    @Column(name = "entrance_exam_id")
    int entranceExamId;

    @Column(name = "entrance_exam_year")
    int entranceExamYear;

    @Column(name = "entrance_exam_score")
    int entranceExamScore;

    @Column(name = "entrance_exam_rank")
    int entranceExamRank;

    @Column(name = "entrance_exam_roll_number")
    int entranceExamRollNumber;

    @Column(name = "photo_link")
    String photoLink;

    @Column(name = "signature_link")
    String signatureLink;

    @Column(name = "ssc_marksheet")
    String sscMarksheet;

    @Column(name = "hsc_marksheet")
    String hscMarksheet;

    @Column(name = "entrance_scorecard")
    String entranceScorecard;

    @Column(name = "birth_certificate")
    String birthCertificate;

    @Column(name = "leaving_certificate")
    String leavingCertificate;

    @Column(name = "nationality_certificate")
    String nationalityCertificate;

    @Column(name = "migration_certificate")
    String migrationCertificate;

    @Column(name = "domicile_certificate")
    String domicileCertificate;

    @Column(name = "hindi_affidavit")
    String hindiAffidavit;

    @Column(name = "undertakings")
    String undertakings;

    @Column(name = "cast_certificate")
    String castCertificate;

    /*
     * @OneToMany(mappedBy = "studRegi", cascade = CascadeType.ALL) Set<BranchPrefrenceEntity> prefrenceList; public
     * Set<BranchPrefrenceEntity> getPrefrenceList() { return prefrenceList; } public void
     * setPrefrenceList(Set<BranchPrefrenceEntity> prefrenceList) { this.prefrenceList = prefrenceList; }
     */

    @Column(name = "final_submission")
    private boolean finalSubmission;

    @Column(name = "is_active")
    private boolean active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private CategoryMasterEntity categoryEntity;

    @Transient
    private String category;

    @Transient
    private List<TempStudentRegistrationEntity> registardStudentList;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(String applicationId) {
        this.applicationId = applicationId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
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

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getMotherTongueId() {
        return motherTongueId;
    }

    public void setMotherTongueId(int motherTongueId) {
        this.motherTongueId = motherTongueId;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public int getCountryId() {
        return countryId;
    }

    public void setCountryId(int countryId) {
        this.countryId = countryId;
    }

    public String getPermanentTelephoneStd() {
        return permanentTelephoneStd;
    }

    public void setPermanentTelephoneStd(String permanentTelephoneStd) {
        this.permanentTelephoneStd = permanentTelephoneStd;
    }

    public String getPermanentTelephone() {
        return permanentTelephone;
    }

    public void setPermanentTelephone(String permanentTelephone) {
        this.permanentTelephone = permanentTelephone;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
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

    public int getLastQualificationId() {
        return lastQualificationId;
    }

    public void setLastQualificationId(int lastQualificationId) {
        this.lastQualificationId = lastQualificationId;
    }

    public int getSscMaths() {
        return sscMaths;
    }

    public void setSscMaths(int sscMaths) {
        this.sscMaths = sscMaths;
    }

    public int getSscMathsMaximum() {
        return sscMathsMaximum;
    }

    public void setSscMathsMaximum(int sscMathsMaximum) {
        this.sscMathsMaximum = sscMathsMaximum;
    }

    public double getSscPerentage() {
        return sscPerentage;
    }

    public void setSscPerentage(double sscPerentage) {
        this.sscPerentage = sscPerentage;
    }

    public int getSscTotal() {
        return sscTotal;
    }

    public void setSscTotal(int sscTotal) {
        this.sscTotal = sscTotal;
    }

    public int getSscOutof() {
        return sscOutof;
    }

    public void setSscOutof(int sscOutof) {
        this.sscOutof = sscOutof;
    }

    public String getSscPassingYear() {
        return sscPassingYear;
    }

    public void setSscPassingYear(String sscPassingYear) {
        this.sscPassingYear = sscPassingYear;
    }

    public int getHscMaths() {
        return hscMaths;
    }

    public void setHscMaths(int hscMaths) {
        this.hscMaths = hscMaths;
    }

    public int getHscMathsMax() {
        return hscMathsMax;
    }

    public void setHscMathsMax(int hscMathsMax) {
        this.hscMathsMax = hscMathsMax;
    }

    public int getHscChemestry() {
        return hscChemestry;
    }

    public void setHscChemestry(int hscChemestry) {
        this.hscChemestry = hscChemestry;
    }

    public int getHscChemestryMax() {
        return hscChemestryMax;
    }

    public void setHscChemestryMax(int hscChemestryMax) {
        this.hscChemestryMax = hscChemestryMax;
    }

    public int getHscPhysics() {
        return hscPhysics;
    }

    public void setHscPhysics(int hscPhysics) {
        this.hscPhysics = hscPhysics;
    }

    public int getHscPhysicsMax() {
        return hscPhysicsMax;
    }

    public void setHscPhysicsMax(int hscPhysicsMax) {
        this.hscPhysicsMax = hscPhysicsMax;
    }

    public int getHscPcm() {
        return hscPcm;
    }

    public void setHscPcm(int hscPcm) {
        this.hscPcm = hscPcm;
    }

    public int getHscPcmMax() {
        return hscPcmMax;
    }

    public void setHscPcmMax(int hscPcmMax) {
        this.hscPcmMax = hscPcmMax;
    }

    public double getHscPercentage() {
        return hscPercentage;
    }

    public void setHscPercentage(double hscPercentage) {
        this.hscPercentage = hscPercentage;
    }

    public int getHscTotal() {
        return hscTotal;
    }

    public void setHscTotal(int hscTotal) {
        this.hscTotal = hscTotal;
    }

    public int getHscOutOf() {
        return hscOutOf;
    }

    public void setHscOutOf(int hscOutOf) {
        this.hscOutOf = hscOutOf;
    }

    public String getHscPassingYear() {
        return hscPassingYear;
    }

    public void setHscPassingYear(String hscPassingYear) {
        this.hscPassingYear = hscPassingYear;
    }

    public String getAdmissionStatus() {
        return admissionStatus;
    }

    public void setAdmissionStatus(String admissionStatus) {
        this.admissionStatus = admissionStatus;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public int getDegreeId() {
        return degreeId;
    }

    public void setDegreeId(int degreeId) {
        this.degreeId = degreeId;
    }

    public int getEntranceExamScore() {
        return entranceExamScore;
    }

    public void setEntranceExamScore(int entranceExamScore) {
        this.entranceExamScore = entranceExamScore;
    }

    public int getEntranceExamRank() {
        return entranceExamRank;
    }

    public void setEntranceExamRank(int entranceExamRank) {
        this.entranceExamRank = entranceExamRank;
    }

    public int getEntranceExamRollNumber() {
        return entranceExamRollNumber;
    }

    public void setEntranceExamRollNumber(int entranceExamRollNumber) {
        this.entranceExamRollNumber = entranceExamRollNumber;
    }

    public String getPhotoLink() {
        return photoLink;
    }

    public void setPhotoLink(String photoLink) {
        this.photoLink = photoLink;
    }

    public String getSignatureLink() {
        return signatureLink;
    }

    public void setSignatureLink(String signatureLink) {
        this.signatureLink = signatureLink;
    }

    public String getSscMarksheet() {
        return sscMarksheet;
    }

    public void setSscMarksheet(String sscMarksheet) {
        this.sscMarksheet = sscMarksheet;
    }

    public String getHscMarksheet() {
        return hscMarksheet;
    }

    public void setHscMarksheet(String hscMarksheet) {
        this.hscMarksheet = hscMarksheet;
    }

    public String getEntranceScorecard() {
        return entranceScorecard;
    }

    public void setEntranceScorecard(String entranceScorecard) {
        this.entranceScorecard = entranceScorecard;
    }

    public String getBirthCertificate() {
        return birthCertificate;
    }

    public void setBirthCertificate(String birthCertificate) {
        this.birthCertificate = birthCertificate;
    }

    public String getLeavingCertificate() {
        return leavingCertificate;
    }

    public void setLeavingCertificate(String leavingCertificate) {
        this.leavingCertificate = leavingCertificate;
    }

    public String getNationalityCertificate() {
        return nationalityCertificate;
    }

    public void setNationalityCertificate(String nationalityCertificate) {
        this.nationalityCertificate = nationalityCertificate;
    }

    public String getMigrationCertificate() {
        return migrationCertificate;
    }

    public void setMigrationCertificate(String migrationCertificate) {
        this.migrationCertificate = migrationCertificate;
    }

    public String getDomicileCertificate() {
        return domicileCertificate;
    }

    public void setDomicileCertificate(String domicileCertificate) {
        this.domicileCertificate = domicileCertificate;
    }

    public String getHindiAffidavit() {
        return hindiAffidavit;
    }

    public void setHindiAffidavit(String hindiAffidavit) {
        this.hindiAffidavit = hindiAffidavit;
    }

    public String getUndertakings() {
        return undertakings;
    }

    public void setUndertakings(String undertakings) {
        this.undertakings = undertakings;
    }

    public String getCastCertificate() {
        return castCertificate;
    }

    public void setCastCertificate(String castCertificate) {
        this.castCertificate = castCertificate;
    }

    @Transient
    private String preferences;

    public String getPreferences() {
        return preferences;
    }

    public void setPreferences(String preferences) {
        this.preferences = preferences;
    }

    @Override
    public String toString() {
        return "TempStudentRegistrationEntity [id=" + id + ", applicationId=" + applicationId + ", password=" + password
            + ", sessionId=" + sessionId + ", studentName=" + studentName + ", fatherName=" + fatherName
            + ", motherName=" + motherName + ", lastName=" + lastName + ", gender=" + gender + ", dateOfBirth="
            + dateOfBirth + ", dob=" + dob + ", motherTongueId=" + motherTongueId + ", pincode=" + pincode
            + ", address=" + address + ", cityId=" + cityId + ", stateId=" + stateId + ", countryId=" + countryId
            + ", permanentTelephoneStd=" + permanentTelephoneStd + ", permanentTelephone=" + permanentTelephone
            + ", mobileNumber=" + mobileNumber + ", emailId=" + emailId + ", casteId=" + casteId + ", categoryId="
            + categoryId + ", nationalityId=" + nationalityId + ", isMinority=" + isMinority + ", lastQualificationId="
            + lastQualificationId + ", sscMaths=" + sscMaths + ", sscMathsMaximum=" + sscMathsMaximum
            + ", sscPerentage=" + sscPerentage + ", sscTotal=" + sscTotal + ", sscOutof=" + sscOutof
            + ", sscPassingYear=" + sscPassingYear + ", hscMaths=" + hscMaths + ", hscMathsMax=" + hscMathsMax
            + ", hscChemestry=" + hscChemestry + ", hscChemestryMax=" + hscChemestryMax + ", hscPhysics=" + hscPhysics
            + ", hscPhysicsMax=" + hscPhysicsMax + ", hscPcm=" + hscPcm + ", hscPcmMax=" + hscPcmMax
            + ", hscPercentage=" + hscPercentage + ", hscTotal=" + hscTotal + ", hscOutOf=" + hscOutOf
            + ", hscPassingYear=" + hscPassingYear + ", admissionStatus=" + admissionStatus + ", branchId=" + branchId
            + ", degreeId=" + degreeId + ", entranceExamId=" + entranceExamId + ", entranceExamScore="
            + entranceExamScore + ", entranceExamRank=" + entranceExamRank + ", entranceExamRollNumber="
            + entranceExamRollNumber + ", photoLink=" + photoLink + ", signatureLink=" + signatureLink
            + ", sscMarksheet=" + sscMarksheet + ", hscMarksheet=" + hscMarksheet + ", entranceScorecard="
            + entranceScorecard + ", birthCertificate=" + birthCertificate + ", leavingCertificate="
            + leavingCertificate + ", nationalityCertificate=" + nationalityCertificate + ", migrationCertificate="
            + migrationCertificate + ", domicileCertificate=" + domicileCertificate + ", hindiAffidavit="
            + hindiAffidavit + ", undertakings=" + undertakings + ", castCertificate=" + castCertificate
            + ", preferences=" + preferences + "]";
    }

    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    public int getEntranceExamId() {
        return entranceExamId;
    }

    public void setEntranceExamId(int entranceExamId) {
        this.entranceExamId = entranceExamId;
    }

    public int getEntranceExamYear() {
        return entranceExamYear;
    }

    public void setEntranceExamYear(int entranceExamYear) {
        this.entranceExamYear = entranceExamYear;
    }

    public boolean isFinalSubmission() {
        return finalSubmission;
    }

    public void setFinalSubmission(boolean finalSubmission) {
        this.finalSubmission = finalSubmission;
    }

    public CategoryMasterEntity getCategoryEntity() {
        return categoryEntity;
    }

    public void setCategoryEntity(CategoryMasterEntity categoryEntity) {
        this.categoryEntity = categoryEntity;
    }

    public List<TempStudentRegistrationEntity> getRegistardStudentList() {
        return registardStudentList;
    }

    public void setRegistardStudentList(List<TempStudentRegistrationEntity> registardStudentList) {
        this.registardStudentList = registardStudentList;
    }

    public String getDob() {
        if (this.dateOfBirth != null) {
            return new SimpleDateFormat("dd/MM/yyyy").format(this.dateOfBirth);
        } else {
            return null;
        }
    }

    public void setDob(String dob) {
        this.dob = dob;
        try {
            if (!dob.isEmpty()) {
                this.dateOfBirth = new SimpleDateFormat("dd/MM/yyyy").parse(dob);
            }
        } catch (ParseException e) {
            // e.printStackTrace();
            LOG.error("err", e);
        }
    }

    public AcademicSessionMasterEntity getAcademicSessionMasterEntity() {
        return academicSessionMasterEntity;
    }

    public void setAcademicSessionMasterEntity(AcademicSessionMasterEntity academicSessionMasterEntity) {
        this.academicSessionMasterEntity = academicSessionMasterEntity;
    }

    public String getSessionName() {
        return sessionName;
    }

    public void setSessionName(String sessionName) {
        this.sessionName = sessionName;
    }

    public GenderMasterEntity getGenderMasterEntity() {
        return genderMasterEntity;
    }

    public void setGenderMasterEntity(GenderMasterEntity genderMasterEntity) {
        this.genderMasterEntity = genderMasterEntity;
    }

    public MothertongueMasterEntity getMothertongueMasterEntity() {
        return mothertongueMasterEntity;
    }

    public void setMothertongueMasterEntity(MothertongueMasterEntity mothertongueMasterEntity) {
        this.mothertongueMasterEntity = mothertongueMasterEntity;
    }

    public String getMotherTongue() {
        return motherTongue;
    }

    public void setMotherTongue(String motherTongue) {
        this.motherTongue = motherTongue;
    }

    public CityMasterEntity getCityMasterEntity() {
        return cityMasterEntity;
    }

    public void setCityMasterEntity(CityMasterEntity cityMasterEntity) {
        this.cityMasterEntity = cityMasterEntity;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public DistrictMasterEntity getDistrictMasterEntity() {
        return districtMasterEntity;
    }

    public void setDistrictMasterEntity(DistrictMasterEntity districtMasterEntity) {
        this.districtMasterEntity = districtMasterEntity;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public StateMasterEntity getStateMasterEntity() {
        return stateMasterEntity;
    }

    public void setStateMasterEntity(StateMasterEntity stateMasterEntity) {
        this.stateMasterEntity = stateMasterEntity;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public CountryMasterEntity getCountryMasterEntity() {
        return countryMasterEntity;
    }

    public void setCountryMasterEntity(CountryMasterEntity countryMasterEntity) {
        this.countryMasterEntity = countryMasterEntity;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public CasteMasterEntity getCasteMasterEntity() {
        return casteMasterEntity;
    }

    public void setCasteMasterEntity(CasteMasterEntity casteMasterEntity) {
        this.casteMasterEntity = casteMasterEntity;
    }

    public String getCaste() {
        return caste;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public NationalityMasterEntity getNationalityMasterEntity() {
        return nationalityMasterEntity;
    }

    public void setNationalityMasterEntity(NationalityMasterEntity nationalityMasterEntity) {
        this.nationalityMasterEntity = nationalityMasterEntity;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public Boolean getIsMinority() {
        return isMinority;
    }

    public void setIsMinority(Boolean isMinority) {
        this.isMinority = isMinority;
    }

    public void updateStudentRegistrationInfo(TempStudentRegistrationEntity student) {

    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

}
