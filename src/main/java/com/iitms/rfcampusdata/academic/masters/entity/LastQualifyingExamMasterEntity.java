package com.iitms.rfcampusdata.academic.masters.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;

/**
 * Table:master.admission_last_qualifying_exam Fields: 58
 * 
 * @author Sachinmt
 */
@Entity
@Table(name = "master.admission_last_qualifying_exam")
public class LastQualifyingExamMasterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int qualifyingExamId;

    @Column(name = "student_id")
    private int studentId;

    @Column(name = "qualifying_exam_id")
    private int qualifyingExamNumber;

    @Column(name = "qualifying_number")
    private int qualifyingNumber;

    @Column(name = "year_of_exam_hssc")
    private int yearOfExamHssc;

    @Column(name = "registration_number")
    private String regNumber;

    @Column(name = "qualifying_exam_rollno")
    private int qualifyingExamRollNo;

    @Column(name = "school_college_name")
    private String schoolCollegeName;

    @Column(name = "board")
    private String board;

    @Column(name = "grade")
    private String grade;

    @Column(name = "attempts_taken")
    private int attemptsTaken;

    @Column(name = "merit_number")
    private int meritNumber;

    @Column(name = "marks_obtained")
    private int marksObtained;

    @Column(name = "out_of_marks")
    private int outOfMarks;

    @Column(name = "maximum_marks")
    private int maxMarks;

    @Column(name = "percentage")
    private float percentage;

    @Column(name = "percentile")
    private float percentile;

    @Column(name = "hsc_pcm")
    private int hscPcm;

    @Column(name = "hsc_pcm_max")
    private int hscPcmMax;

    @Column(name = "hsc_bio")
    private int hscBio;

    @Column(name = "hsc_bio_max")
    private int hscBioMax;

    @Column(name = "hsc_eng")
    private int hscEng;

    @Column(name = "hsc_eng_max")
    private int hscEngMax;

    @Column(name = "hsc_mat")
    private int hscMat;

    @Column(name = "hsc_mat_max")
    private int hscMatMax;

    @Column(name = "hsc_che")
    private int hscChe;

    @Column(name = "hsc_che_max")
    private int hscCheMax;

    @Column(name = "hsc_phy")
    private int hscPhy;

    @Column(name = "hsc_phy_max")
    private int hscPhyMax;

    @Column(name = "hsc_comp_sc")
    private int hscCompSc;

    @Column(name = "hsc_comp_sc_max")
    private int hscCompScMax;

    @Column(name = "res_topic")
    private String resTopic;

    @Column(name = "ssc_exam_year")
    private String sscExamYear;

    @Column(name = "ssc_marks_obtained")
    private float sscMarksObtained;

    @Column(name = "ssc_outof")
    private float sscOutOf;

    @Column(name = "ssc_percentage")
    private float sscPercentage;

    @Column(name = "ssc_percentile")
    private String sscPercentile;

    @Column(name = "ssc_roll_number")
    private String sscRollNumber;

    @Column(name = "ssc_board")
    private String sscBoard;

    @Column(name = "ssc_grade")
    private String sscGrade;

    @Column(name = "ssc_attempts")
    private int sscAttempts;

    @Column(name = "supervisor_name1")
    private String supervisorName1;

    @Column(name = "supervisor_name2")
    private String supervisorName2;

    @Column(name = "number_of_subjects_offered")
    private int numberOfSubjectsOffered;

    @Column(name = "number_of_subjects_passed")
    private int numberOfSubjectPassed;

    @Column(name = "number_of_backlog_subjects")
    private int numberOfBacklogSubjects;

    /*
     * @Column(name = "transfer_enter") private String transferEnter;
     */

    @Column(name = "remark")
    private String remark;

    @Column(name = "others_1")
    private int others1;

    @Column(name = "others_1_max")
    private int others1Max;

    @Column(name = "others_2")
    private int others2;

    @Column(name = "others_2_max")
    private int others2Max;

    @Column(name = "nata_score")
    private int nataScore;

    @Column(name = "category")
    private int category;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "semester_id")
    private String semesterId;

    @Column(name = "cgpa")
    private float cgpa;

    @Column(name = "state_rank")
    private int stateRank;

    @Column(name = "rank")
    private int rank;

    @Column(name = "other_details")
    private String otherDetails;

    @Column(name = "other_entrance_exam")
    private String otherEntranceExam;

    /*
     * @Column(name = "score") private int score;
     */

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "macaddress")
    private String macAddress;

    @Column(name = "created_by")
    private int createdBy;

    @Column(name = "created_date")
    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;

    @Column(name = "modified_by")
    private int modifiedBy;

    @Column(name = "modified_date")
    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedDate;

    public int getQualifyingExamId() {
        return qualifyingExamId;
    }

    public void setQualifyingExamId(int qualifyingExamId) {
        this.qualifyingExamId = qualifyingExamId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getQualifyingExamNumber() {
        return qualifyingExamNumber;
    }

    public void setQualifyingExamNumber(int qualifyingExamNumber) {
        this.qualifyingExamNumber = qualifyingExamNumber;
    }

    public int getQualifyingNumber() {
        return qualifyingNumber;
    }

    public void setQualifyingNumber(int qualifyingNumber) {
        this.qualifyingNumber = qualifyingNumber;
    }

    public int getYearOfExamHssc() {
        return yearOfExamHssc;
    }

    public void setYearOfExamHssc(int yearOfExamHssc) {
        this.yearOfExamHssc = yearOfExamHssc;
    }

    public String getRegNumber() {
        return regNumber;
    }

    public void setRegNumber(String regNumber) {
        this.regNumber = regNumber;
    }

    public int getQualifyingExamRollNo() {
        return qualifyingExamRollNo;
    }

    public void setQualifyingExamRollNo(int qualifyingExamRollNo) {
        this.qualifyingExamRollNo = qualifyingExamRollNo;
    }

    public String getSchoolCollegeName() {
        return schoolCollegeName;
    }

    public void setSchoolCollegeName(String schoolCollegeName) {
        this.schoolCollegeName = schoolCollegeName;
    }

    public String getBoard() {
        return board;
    }

    public void setBoard(String board) {
        this.board = board;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getAttemptsTaken() {
        return attemptsTaken;
    }

    public void setAttemptsTaken(int attemptsTaken) {
        this.attemptsTaken = attemptsTaken;
    }

    public int getMeritNumber() {
        return meritNumber;
    }

    public void setMeritNumber(int meritNumber) {
        this.meritNumber = meritNumber;
    }

    public int getMarksObtained() {
        return marksObtained;
    }

    public void setMarksObtained(int marksObtained) {
        this.marksObtained = marksObtained;
    }

    public int getOutOfMarks() {
        return outOfMarks;
    }

    public void setOutOfMarks(int outOfMarks) {
        this.outOfMarks = outOfMarks;
    }

    public int getMaxMarks() {
        return maxMarks;
    }

    public void setMaxMarks(int maxMarks) {
        this.maxMarks = maxMarks;
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

    public int getHscBio() {
        return hscBio;
    }

    public void setHscBio(int hscBio) {
        this.hscBio = hscBio;
    }

    public int getHscBioMax() {
        return hscBioMax;
    }

    public void setHscBioMax(int hscBioMax) {
        this.hscBioMax = hscBioMax;
    }

    public int getHscEng() {
        return hscEng;
    }

    public void setHscEng(int hscEng) {
        this.hscEng = hscEng;
    }

    public int getHscEngMax() {
        return hscEngMax;
    }

    public void setHscEngMax(int hscEngMax) {
        this.hscEngMax = hscEngMax;
    }

    public int getHscMat() {
        return hscMat;
    }

    public void setHscMat(int hscMat) {
        this.hscMat = hscMat;
    }

    public int getHscMatMax() {
        return hscMatMax;
    }

    public void setHscMatMax(int hscMatMax) {
        this.hscMatMax = hscMatMax;
    }

    public int getHscChe() {
        return hscChe;
    }

    public void setHscChe(int hscChe) {
        this.hscChe = hscChe;
    }

    public int getHscCheMax() {
        return hscCheMax;
    }

    public void setHscCheMax(int hscCheMax) {
        this.hscCheMax = hscCheMax;
    }

    public int getHscPhy() {
        return hscPhy;
    }

    public void setHscPhy(int hscPhy) {
        this.hscPhy = hscPhy;
    }

    public int getHscPhyMax() {
        return hscPhyMax;
    }

    public void setHscPhyMax(int hscPhyMax) {
        this.hscPhyMax = hscPhyMax;
    }

    public int getHscCompSc() {
        return hscCompSc;
    }

    public void setHscCompSc(int hscCompSc) {
        this.hscCompSc = hscCompSc;
    }

    public int getHscCompScMax() {
        return hscCompScMax;
    }

    public void setHscCompScMax(int hscCompScMax) {
        this.hscCompScMax = hscCompScMax;
    }

    public String getResTopic() {
        return resTopic;
    }

    public void setResTopic(String resTopic) {
        this.resTopic = resTopic;
    }

    public String getSupervisorName1() {
        return supervisorName1;
    }

    public void setSupervisorName1(String supervisorName1) {
        this.supervisorName1 = supervisorName1;
    }

    public String getSupervisorName2() {
        return supervisorName2;
    }

    public void setSupervisorName2(String supervisorName2) {
        this.supervisorName2 = supervisorName2;
    }

    public int getNumberOfSubjectsOffered() {
        return numberOfSubjectsOffered;
    }

    public void setNumberOfSubjectsOffered(int numberOfSubjectsOffered) {
        this.numberOfSubjectsOffered = numberOfSubjectsOffered;
    }

    public int getNumberOfSubjectPassed() {
        return numberOfSubjectPassed;
    }

    public void setNumberOfSubjectPassed(int numberOfSubjectPassed) {
        this.numberOfSubjectPassed = numberOfSubjectPassed;
    }

    public int getNumberOfBacklogSubjects() {
        return numberOfBacklogSubjects;
    }

    public void setNumberOfBacklogSubjects(int numberOfBacklogSubjects) {
        this.numberOfBacklogSubjects = numberOfBacklogSubjects;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getOthers1() {
        return others1;
    }

    public void setOthers1(int others1) {
        this.others1 = others1;
    }

    public int getOthers1Max() {
        return others1Max;
    }

    public void setOthers1Max(int others1Max) {
        this.others1Max = others1Max;
    }

    public int getOthers2() {
        return others2;
    }

    public void setOthers2(int others2) {
        this.others2 = others2;
    }

    public int getOthers2Max() {
        return others2Max;
    }

    public void setOthers2Max(int others2Max) {
        this.others2Max = others2Max;
    }

    public int getNataScore() {
        return nataScore;
    }

    public void setNataScore(int nataScore) {
        this.nataScore = nataScore;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getCollegeCode() {
        return collegeCode;
    }

    public void setCollegeCode(String collegeCode) {
        this.collegeCode = collegeCode;
    }

    public String getSemesterId() {
        return semesterId;
    }

    public void setSemesterId(String semesterId) {
        this.semesterId = semesterId;
    }

    public float getCgpa() {
        return cgpa;
    }

    public void setCgpa(float cgpa) {
        this.cgpa = cgpa;
    }

    public int getStateRank() {
        return stateRank;
    }

    public void setStateRank(int stateRank) {
        this.stateRank = stateRank;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public String getOtherDetails() {
        return otherDetails;
    }

    public void setOtherDetails(String otherDetails) {
        this.otherDetails = otherDetails;
    }

    public String getOtherEntranceExam() {
        return otherEntranceExam;
    }

    public void setOtherEntranceExam(String otherEntranceExam) {
        this.otherEntranceExam = otherEntranceExam;
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

    public void setAdmissionLastQualifyingExam(int studentId, int qualifyingExamNumber, int yearOfExamHssc,
        int marksObtained, int outOfMarks, float percentage, int attemptsTaken, String schoolCollegeName, String board,
        String grade,

        int qualifyingNumber, String regNumber, int qualifyingExamRollNo, int meritNumber, int maxMarks,
        float percentile, int hscPcm, int hscPcmMax, int hscBio, int hscBioMax, int hscEng, int hscEngMax, int hscMat,
        int hscMatMax, int hscChe, int hscCheMax, int hscPhy, int hscPhyMax, int hscCompSc, int hscCompScMax,
        String resTopic, String supervisorName1, String supervisorName2, int numberOfSubjectsOffered,
        int numberOfSubjectPassed, int numberOfBacklogSubjects, String transferEnter, String remark, int others1,
        int others1Max, int others2, int others2Max, int nataScore, int category, String collegeCode, String semesterId,
        float cgpa, int stateRank, int rank, String otherDetails, String otherEntranceExam, int score, String ipAddress,
        String macAddress, int createdBy, Date createdDate, int modifiedBy, Date modifiedDate) {
        this.qualifyingExamId = qualifyingExamId;
        this.studentId = studentId;
        this.qualifyingExamNumber = qualifyingExamNumber;
        this.qualifyingNumber = qualifyingNumber;
        this.yearOfExamHssc = yearOfExamHssc;
        this.regNumber = regNumber;
        this.qualifyingExamRollNo = qualifyingExamRollNo;
        this.schoolCollegeName = schoolCollegeName;
        this.board = board;
        this.grade = grade;
        this.attemptsTaken = attemptsTaken;
        this.meritNumber = meritNumber;
        this.marksObtained = marksObtained;
        this.outOfMarks = outOfMarks;
        this.maxMarks = maxMarks;
        this.percentage = percentage;
        this.percentile = percentile;
        this.hscPcm = hscPcm;
        this.hscPcmMax = hscPcmMax;
        this.hscBio = hscBio;
        this.hscBioMax = hscBioMax;
        this.hscEng = hscEng;
        this.hscEngMax = hscEngMax;
        this.hscMat = hscMat;
        this.hscMatMax = hscMatMax;
        this.hscChe = hscChe;
        this.hscCheMax = hscCheMax;
        this.hscPhy = hscPhy;
        this.hscPhyMax = hscPhyMax;
        this.hscCompSc = hscCompSc;
        this.hscCompScMax = hscCompScMax;
        this.resTopic = resTopic;
        this.supervisorName1 = supervisorName1;
        this.supervisorName2 = supervisorName2;
        this.numberOfSubjectsOffered = numberOfSubjectsOffered;
        this.numberOfSubjectPassed = numberOfSubjectPassed;
        this.numberOfBacklogSubjects = numberOfBacklogSubjects;
        // this.transferEnter = transferEnter;
        this.remark = remark;
        this.others1 = others1;
        this.others1Max = others1Max;
        this.others2 = others2;
        this.others2Max = others2Max;
        this.nataScore = nataScore;
        this.category = category;
        this.collegeCode = collegeCode;
        this.semesterId = semesterId;
        this.cgpa = cgpa;
        this.stateRank = stateRank;
        this.rank = rank;
        this.otherDetails = otherDetails;
        this.otherEntranceExam = otherEntranceExam;
        // this.score = score;
        this.ipAddress = ipAddress;
        this.macAddress = macAddress;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.modifiedBy = modifiedBy;
        this.modifiedDate = modifiedDate;
    }

    @Override
    public String toString() {
        return "AdmissionLastQualifyingExamEntity [qualifyingExamId=" + qualifyingExamId + ", studentId=" + studentId
            + ", qualifyingExamNumber=" + qualifyingExamNumber + ", qualifyingNumber=" + qualifyingNumber
            + ", yearOfExamHssc=" + yearOfExamHssc + ", regNumber=" + regNumber + ", qualifyingExamRollNo="
            + qualifyingExamRollNo + ", schoolCollegeName=" + schoolCollegeName + ", board=" + board + ", grade="
            + grade + ", attemptsTaken=" + attemptsTaken + ", meritNumber=" + meritNumber + ", marksObtained="
            + marksObtained + ", outOfMarks=" + outOfMarks + ", maxMarks=" + maxMarks + ", percentage=" + percentage
            + ", percentile=" + percentile + ", hscPcm=" + hscPcm + ", hscPcmMax=" + hscPcmMax + ", hscBio=" + hscBio
            + ", hscBioMax=" + hscBioMax + ", hscEng=" + hscEng + ", hscEngMax=" + hscEngMax + ", hscMat=" + hscMat
            + ", hscMatMax=" + hscMatMax + ", hscChe=" + hscChe + ", hscCheMax=" + hscCheMax + ", hscPhy=" + hscPhy
            + ", hscPhyMax=" + hscPhyMax + ", hscCompSc=" + hscCompSc + ", hscCompScMax=" + hscCompScMax + ", resTopic="
            + resTopic + ", supervisorName1=" + supervisorName1 + ", supervisorName2=" + supervisorName2
            + ", numberOfSubjectsOffered=" + numberOfSubjectsOffered + ", numberOfSubjectPassed="
            + numberOfSubjectPassed + ", numberOfBacklogSubjects=" + numberOfBacklogSubjects + ", remark=" + remark
            + ", others1=" + others1 + ", others1Max=" + others1Max + ", others2=" + others2 + ", others2Max="
            + others2Max + ", nataScore=" + nataScore + ", category=" + category + ", collegeCode=" + collegeCode
            + ", semesterId=" + semesterId + ", cgpa=" + cgpa + ", stateRank=" + stateRank + ", rank=" + rank
            + ", otherDetails=" + otherDetails + ", otherEntranceExam=" + otherEntranceExam + ", ipAddress=" + ipAddress
            + ", macAddress=" + macAddress + ", createdBy=" + createdBy + ", createdDate=" + createdDate
            + ", modifiedBy=" + modifiedBy + ", modifiedDate=" + modifiedDate + "]";
    }

    public String getSscExamYear() {
        return sscExamYear;
    }

    public void setSscExamYear(String sscExamYear) {
        this.sscExamYear = sscExamYear;
    }

    public float getSscMarksObtained() {
        return sscMarksObtained;
    }

    public void setSscMarksObtained(float sscMarksObtained) {
        this.sscMarksObtained = sscMarksObtained;
    }

    public float getSscOutOf() {
        return sscOutOf;
    }

    public void setSscOutOf(float sscOutOf) {
        this.sscOutOf = sscOutOf;
    }

    public float getSscPercentage() {
        return sscPercentage;
    }

    public void setSscPercentage(float sscPercentage) {
        this.sscPercentage = sscPercentage;
    }

    public String getSscPercentile() {
        return sscPercentile;
    }

    public void setSscPercentile(String sscPercentile) {
        this.sscPercentile = sscPercentile;
    }

    public String getSscRollNumber() {
        return sscRollNumber;
    }

    public void setSscRollNumber(String sscRollNumber) {
        this.sscRollNumber = sscRollNumber;
    }

    public String getSscBoard() {
        return sscBoard;
    }

    public void setSscBoard(String sscBoard) {
        this.sscBoard = sscBoard;
    }

    public String getSscGrade() {
        return sscGrade;
    }

    public void setSscGrade(String sscGrade) {
        this.sscGrade = sscGrade;
    }

    public int getSscAttempts() {
        return sscAttempts;
    }

    public void setSscAttempts(int sscAttempts) {
        this.sscAttempts = sscAttempts;
    }

    public void setHSSCDetails(TempStudentRegistrationEntity studentRegistration) {
        this.yearOfExamHssc = Integer.parseInt(studentRegistration.getHscPassingYear());
        this.marksObtained = studentRegistration.getHscTotal();
        this.outOfMarks = studentRegistration.getHscOutOf();
        this.percentage = (float) studentRegistration.getHscPercentage();
        // this.percentile = studentRegistration.getHscTotal();
        // this.schoolCollegeName = studentRegistration.getHscTotal();
        // this.board = studentRegistration.getHscTotal();
        // this.grade = studentRegistration.getHscTotal();

        this.hscPcm = studentRegistration.getHscPcm();
        this.hscPcmMax = studentRegistration.getHscPcmMax();
        // this.hscBio = studentRegistration.getHscTotal();
        // this.hscBioMax = studentRegistration.getHscTotal();
        // this.hscEng = studentRegistration.getHscTotal();
        // this.hscEngMax = studentRegistration.getHscTotal();
        this.hscMat = studentRegistration.getHscMaths();
        this.hscMatMax = studentRegistration.getHscMathsMax();
        this.hscChe = studentRegistration.getHscChemestry();
        this.hscCheMax = studentRegistration.getHscChemestryMax();
        this.hscPhy = studentRegistration.getHscPhysics();
        this.hscPhyMax = studentRegistration.getHscPhysicsMax();
    }

    public void setSSCDetails(TempStudentRegistrationEntity studentRegistration) {
        this.sscExamYear = studentRegistration.getSscPassingYear();
        this.sscMarksObtained = studentRegistration.getSscTotal();
        this.sscOutOf = studentRegistration.getSscOutof();
        this.sscPercentage = (studentRegistration.getSscTotal() / studentRegistration.getSscOutof()) * 100;
        // this.sscPercentile = studentRegistration.getSscPassingYear();
        // this.sscRollNumber = studentRegistration.getSscPassingYear();
        // this.sscBoard = studentRegistration.getSscPassingYear();
        // this.sscGrade = studentRegistration.getSscPassingYear();
        // this.sscAttempts = studentRegistration.getSscPassingYear();
    }

    public String getSscHsscDetails() {
        return "yearOfExamHssc  : " + this.yearOfExamHssc + "\n" + "marksObtained  : " + this.marksObtained + "\n"
            + "outOfMarks  : " + this.outOfMarks + "\n" + "percentage  : " + this.percentage + "\n"
            + "schoolCollegeName  : " + this.schoolCollegeName + "\n" + "board  : " + this.board + "\n" + "grade  : "
            + this.grade + "\n" + "percentile  : " + this.percentile + "\n" + "hscPcm  : " + this.hscPcm + "\n"
            + "hscEng  : " + this.hscEng + "\n" + "hscChe  : " + this.hscChe + "\n" + "hscPcmMax  : " + this.hscPcmMax
            + "\n" + "hscEngMax  : " + this.hscEngMax + "\n" + "hscCheMax  : " + this.hscCheMax + "\n" + "hscBio  : "
            + this.hscBio + "\n" + "hscMat  : " + this.hscMat + "\n" + "hscPhy  : " + this.hscPhy + "\n"
            + "hscBioMax  : " + this.hscBioMax + "\n" + "hscMatMax  : " + this.hscMatMax + "\n" + "hscPhyMax  : "
            + this.hscPhyMax + "\n" +

        "sscExamYear  : " + this.sscExamYear + "\n" + "sscMarksObtained  : " + this.sscMarksObtained + "\n"
            + "sscOutOf  : " + this.sscOutOf + "\n" + "sscPercentage  : " + this.sscPercentage + "\n"
            + "sscPercentile  : " + this.sscPercentile + "\n" + "sscRollNumber  : " + this.sscRollNumber + "\n"
            + "sscBoard  : " + this.sscBoard + "\n" + "sscGrade  : " + this.sscGrade + "\n" + "sscAttempts  : "
            + this.sscAttempts + "\n";
    }

    public String getLastQualification() {
        return "qualifyingExamNumber   : " + this.qualifyingExamNumber + "\n" + "yearOfExamHssc   : "
            + this.yearOfExamHssc + "\n" + "schoolCollegeName   : " + this.schoolCollegeName + "\n"
            + "marksObtained   : " + this.marksObtained + "\n" + "outOfMarks   : " + this.outOfMarks + "\n"
            + "percentage   : " + this.percentage + "\n" + "attemptsTaken   : " + this.attemptsTaken + "\n";
    }

    public void setEntranceDetails(TempStudentRegistrationEntity studentRegistration) {
        this.qualifyingExamNumber = studentRegistration.getEntranceExamId();
        // this.rank
        // this.yearOfExamHssc
        // this.marksObtained
        // this.percentage
        // this.score
        // this.quotaId
        // this.otherEntranceExam
        // this.stateRank
        // this.outOfMarks
        // this.hallTicketNumber
        // this.percentile
        // this.otherDetails
        this.qualifyingExamRollNo = studentRegistration.getEntranceExamRollNumber();
        // this.
    }

    public String getEntranceDetails() {
        return "qualifyingExamNumber  : " + this.qualifyingExamNumber + "\n" +
            // "allIndiaRank : " + this.allIndiaRank + "\n" +
            "yearOfExamHssc  : " + this.yearOfExamHssc + "\n" + "marksObtained  : " + this.marksObtained + "\n"
            + "percentage  : " + this.percentage + "\n" +
            // "score : " + this.score + "\n" +
            // "quotaId : " + this.quotaId + "\n" +
        "otherEntranceExam  : " + this.otherEntranceExam + "\n" + "stateRank  : " + this.stateRank + "\n"
            + "outOfMarks  : " + this.outOfMarks + "\n" +
            // "hallTicketNumber : " + this.hallTicketNumber + "\n" +
            "percentile  : " + this.percentile + "\n" + "otherDetails  : " + this.otherDetails + "\n";

    }
}
