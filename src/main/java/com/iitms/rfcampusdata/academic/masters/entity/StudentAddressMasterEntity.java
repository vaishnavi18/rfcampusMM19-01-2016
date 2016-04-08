package com.iitms.rfcampusdata.academic.masters.entity;

import java.io.Serializable;
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

import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;

@Entity
@Table(name = "master.admission_student_address_master")
public class StudentAddressMasterEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")

    private int id;

    @Column(name = "student_id")
    private int studentId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private StudentAdmissionEntity studentAdmissionEntity;

    @Column(name = "local_address")
    private String localAddress;

    @Column(name = "local_town")
    private String localTown;

    @Column(name = "local_city")
    private int localCity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "local_city", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private CityMasterEntity localCityMasterEntity;

    @Column(name = "local_district")
    private int localDistrictId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "local_district", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private DistrictMasterEntity localDistrictMasterEntity;

    @Column(name = "local_state")
    private int localStateId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "local_state", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private StateMasterEntity localStateMasterEntity;

    @Column(name = "local_pincode")
    private String localPINCode;

    @Column(name = "local_telephone")
    private String localTelephone;

    @Column(name = "local_mobile")
    private String localMobileNumber;

    @Column(name = "local_email")
    private String localEmail;

    @Column(name = "permenant_address")
    private String permenantAddress;

    @Column(name = "permenant_town")
    private String permenantTown;

    @Column(name = "permenant_city")
    private int permenantCityId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "permenant_city", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private CityMasterEntity permanentCityMasterEntity;

    @Column(name = "permenant_state")
    private int permenantStateId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "permenant_state", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private StateMasterEntity permanentStateMasterEntity;

    @Column(name = "permenant_district")
    private int permenantDistrictId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "permenant_district", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private DistrictMasterEntity permanentDistrictMasterEntity;

    @Column(name = "permenant_telephone")
    private String permanentTelephone;

    @Column(name = "permenant_mobile")
    private String permenantMobileNumber;

    @Column(name = "permenant_pincode")
    private String permenantPINCode;

    @Column(name = "permenant_email")
    private String permenantEmail;

    @Column(name = "father_name")
    private String fatherName;

    @Column(name = "father_designation")
    private String fatherDesignation;

    @Column(name = "father_occupation_id")
    private int fatherOccupationId;

    @Column(name = "father_job_detail")
    private int fatherJobDetailId;

    @Column(name = "father_mobile")
    private String fatherMobileNumber;

    @Column(name = "father_office_number")
    private String fatherOfficeNumber;

    @Column(name = "mother_name")
    private String motherName;

    @Column(name = "mother_maiden_name")
    private String motherMaidenName;

    @Column(name = "mother_designation")
    private String motherDesignation;

    @Column(name = "mother_occupation_id")
    private int motherOccupationId;

    @Column(name = "mother_job_details")
    private int motherJobDetailsId;

    @Column(name = "mother_mobile")
    private String motherMobileNumber;

    @Column(name = "mother_office_number")
    private String motherOfficeNumber;

    @Column(name = "guardian_name")
    private String guardianName;

    @Column(name = "relation_with_guardian")
    private String relationWithGuardian;

    @Column(name = "guardian_address")
    private String guardianAddress;

    @Column(name = "guardian_occupation_name")
    private String guardianOccupationName;

    @Column(name = "guardian_phone")
    private String guardianPhone;

    @Column(name = "guardian_email")
    private String guardianEmail;

    @Column(name = "railway_station")
    private String railwayStation;

    @Column(name = "bus_station")
    private String busStation;

    @Column(name = "local_station_name")
    private String localStationName;

    @Column(name = "organisation_name")
    private String organisationName;

    @Column(name = "organisation_address")
    private String organisationAddress;

    /*
     * @Column(name = "student_serial_number") private int studentSerialNumber;
     */

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "local_post_office")
    private String localPostOffice;

    @Column(name = "local_police_station")
    private String localPoliceStation;

    @Column(name = "local_tehsil")
    private String localTehsil;

    @Column(name = "permenant_post_office")
    private String permenantPostOffice;

    @Column(name = "permenant_police_office")
    private String permenantPoliceOffice;

    @Column(name = "permenant_tehsil")
    private String permenantTehsil;

    @Column(name = "guardian_status")
    private String guirdianStatus;

    @Column(name = "mother_house_status")
    private String motherHouseStatus;

    @Column(name = "local_othercity_name")
    private String localOthercityName;

    @Column(name = "permenant_othercity_name")
    private String permenantOthercityName;

    @Column(name = "guardian_othercity_name")
    private String guardianOtherCityName;

    @Column(name = "mother_city_name")
    private int motherCityName;

    @Column(name = "father_othercity_name")
    private String fatherOtherCityName;

    @Column(name = "local_otherdistrict_name")
    private String localOtherDistrictName;

    @Column(name = "permenant_otherdistrict_name")
    private String permenantOtherDistrictName;

    @Column(name = "guardian_otherdistrict_name")
    private String guardianOtherDistrictName;

    @Column(name = "mother_district_name")
    private int motherDistrictName;

    @Column(name = "father_otherdistrict_name")
    private String fatherOtherDistrictName;

    @Column(name = "local_locality")
    private String localLocality;

    @Column(name = "permenant_locality")
    private String permenantLocality;

    @Column(name = "guardian__locality")
    private String guardianLocality;

    @Column(name = "father_flat_no")
    private String fatherFlatNumber;

    @Column(name = "mother_flat_no")
    private String motherFlatNumber;

    @Column(name = "guardian__flat_no")
    private String guardianFlatNo;

    @Column(name = "local_flat_no")
    private String localFlatNumber;

    @Column(name = "permenant_flat_no")
    private String permenantFlatNumber;

    @Column(name = "local_streetname")
    private String localStreetName;

    @Column(name = "permanant_streetname")
    private String permanantStreetName;

    @Column(name = "guardian_streetname")
    private String guardianStreetName;

    @Column(name = "local_landmark")
    private String localLandmark;

    @Column(name = "permanant_landmark")
    private String permanantLandmark;

    @Column(name = "guardian_landmark")
    private String guardianLandmark;

    @Column(name = "father_streetname")
    private String fatherStreetName;

    @Column(name = "mother_office_streetname")
    private String motherOfficeStreetName;

    @Column(name = "father_education_id")
    private int fatherEducationId;

    @Column(name = "father_office_address")
    private String fatherOfficeAddress;

    @Column(name = "father_office_city")
    private int fatherOfficeCity;

    @Column(name = "father_office_pincode")
    private String fatherOfficePINCode;

    @Column(name = "father_office_locality")
    private String fatherOfficeLocality;

    @Column(name = "father_office_landmark")
    private String fatherOfficeLandmark;

    @Column(name = "father_office_district")
    private int fatherOfficeDistrict;

    @Column(name = "father_office_state")
    private int fatherOfficeState;

    @Column(name = "mother_education")
    private int motherEducation;

    @Column(name = "mother_office_address")
    private String motherOfficeAddress;

    @Column(name = "guardian_telephone")
    private String guardianTelephone;

    @Column(name = "mother_office_city")
    private int motherOfficeCity;

    @Column(name = "mother_office_pincode")
    private String motherOfficePINCode;

    @Column(name = "mother_office_locality")
    private String motherOfficeLocality;

    @Column(name = "mother_office_landmark")
    private String motherOfficeLandmark;

    @Column(name = "mother_office_district")
    private int motherOfficeDistrict;

    @Column(name = "mother_office_state")
    private int motherOfficeState;

    @Column(name = "guardian_city")
    private int guardianCity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "guardian_city", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private CityMasterEntity guardianCityMasterEntity;

    @Column(name = "guardian_district")
    private int guardianDistrict;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "guardian_district", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private DistrictMasterEntity guardianDistrictMasterEntity;

    @Column(name = "guardian_state")
    private int guardianStateId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "permenant_state", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private StateMasterEntity guardianStateMasterEntity;

    @Column(name = "guardian_pincode")
    private String guardianPINCode;

    @Column(name = "guardian_town")
    private String guardianTown;

    @Transient
    private String branchShortName;

    public String getBranchShortName() {
        return branchShortName;
    }

    public void setBranchShortName(String branchShortName) {
        this.branchShortName = branchShortName;
    }
    /*
     * @Column(name = "route_number") private String routeNumber;
     * @Column(name = "route_amount") private float routeAmount;
     */

    /*
     * @Column(name = "is_medical_problem") private boolean medicalProblem;
     * @Column(name = "medical_details") private String medicalDetails;
     */

    /*
     * @Column(name = "number_of_brother") private byte numberOfBrother;
     * @Column(name = "number_of_sister") private byte numberOfSister;
     */

    @Column(name = "father_office_address_status")
    private boolean fatherOfficeAddressStatus;

    @Column(name = "mother_address_status")
    private boolean motherAddressStatus;

    @Column(name = "father_emailid")
    private String fatherEmailid;

    @Column(name = "mother_emailid")
    private String motherEmailid;

    @Column(name = "admission_document_list")
    private String admissionDocumentList;

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

    @Column(name = "mother_othercity_name")
    private String motherOtherCityName;

    @Column(name = "mother_otherdistrict_name")
    private String motherOtherDistrictName;

    @Transient
    private int fatherOfficeDistrictName;

    @Transient
    private String registrationNumber;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getLocalAddress() {
        return localAddress;
    }

    public void setLocalAddress(String localAddress) {
        this.localAddress = localAddress;
    }

    public int getLocalCity() {
        return localCity;
    }

    public void setLocalCity(int localCity) {
        this.localCity = localCity;
    }

    public int getLocalDistrictId() {
        return localDistrictId;
    }

    public void setLocalDistrictId(int localDistrictId) {
        this.localDistrictId = localDistrictId;
    }

    public int getLocalStateId() {
        return localStateId;
    }

    public void setLocalStateId(int localStateId) {
        this.localStateId = localStateId;
    }

    public String getLocalPINCode() {
        return localPINCode;
    }

    public void setLocalPINCode(String localPINCode) {
        this.localPINCode = localPINCode;
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

    public String getPermenantAddress() {
        return permenantAddress;
    }

    public void setPermenantAddress(String permenantAddress) {
        this.permenantAddress = permenantAddress;
    }

    public int getPermenantCityId() {
        return permenantCityId;
    }

    public void setPermenantCityId(int permenantCityId) {
        this.permenantCityId = permenantCityId;
    }

    public int getPermenantStateId() {
        return permenantStateId;
    }

    public void setPermenantStateId(int permenantStateId) {
        this.permenantStateId = permenantStateId;
    }

    public int getPermenantDistrictId() {
        return permenantDistrictId;
    }

    public void setPermenantDistrictId(int permenantDistrictId) {
        this.permenantDistrictId = permenantDistrictId;
    }

    public String getPermanentTelephone() {
        return permanentTelephone;
    }

    public void setPermanentTelephone(String permanentTelephone) {
        this.permanentTelephone = permanentTelephone;
    }

    public String getPermenantMobileNumber() {
        return permenantMobileNumber;
    }

    public void setPermenantMobileNumber(String permenantMobileNumber) {
        this.permenantMobileNumber = permenantMobileNumber;
    }

    public String getPermenantPINCode() {
        return permenantPINCode;
    }

    public void setPermenantPINCode(String permenantPINCode) {
        this.permenantPINCode = permenantPINCode;
    }

    public String getPermenantEmail() {
        return permenantEmail;
    }

    public void setPermenantEmail(String permenantEmail) {
        this.permenantEmail = permenantEmail;
    }

    public String getFatherDesignation() {
        return fatherDesignation;
    }

    public void setFatherDesignation(String fatherDesignation) {
        this.fatherDesignation = fatherDesignation;
    }

    public int getFatherOccupationId() {
        return fatherOccupationId;
    }

    public void setFatherOccupationId(int fatherOccupationId) {
        this.fatherOccupationId = fatherOccupationId;
    }

    public int getFatherJobDetailId() {
        return fatherJobDetailId;
    }

    public void setFatherJobDetailId(int fatherJobDetailId) {
        this.fatherJobDetailId = fatherJobDetailId;
    }

    public String getMotherDesignation() {
        return motherDesignation;
    }

    public void setMotherDesignation(String motherDesignation) {
        this.motherDesignation = motherDesignation;
    }

    public int getMotherOccupationId() {
        return motherOccupationId;
    }

    public void setMotherOccupationId(int motherOccupationId) {
        this.motherOccupationId = motherOccupationId;
    }

    public int getMotherJobDetailsId() {
        return motherJobDetailsId;
    }

    public void setMotherJobDetailsId(int motherJobDetailsId) {
        this.motherJobDetailsId = motherJobDetailsId;
    }

    public String getGuardianName() {
        return guardianName;
    }

    public void setGuardianName(String guardianName) {
        this.guardianName = guardianName;
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

    public String getRailwayStation() {
        return railwayStation;
    }

    public void setRailwayStation(String railwayStation) {
        this.railwayStation = railwayStation;
    }

    public String getBusStation() {
        return busStation;
    }

    public void setBusStation(String busStation) {
        this.busStation = busStation;
    }

    public String getLocalStationName() {
        return localStationName;
    }

    public void setLocalStationName(String localStationName) {
        this.localStationName = localStationName;
    }

    public String getOrganisationName() {
        return organisationName;
    }

    public void setOrganisationName(String organisationName) {
        this.organisationName = organisationName;
    }

    public String getOrganisationAddress() {
        return organisationAddress;
    }

    public void setOrganisationAddress(String organisationAddress) {
        this.organisationAddress = organisationAddress;
    }

    /*
     * public int getStudentSerialNumber() { return studentSerialNumber; } public void setStudentSerialNumber(int
     * studentSerialNumber) { this.studentSerialNumber = studentSerialNumber; }
     */

    public String getCollegeCode() {
        return collegeCode;
    }

    public void setCollegeCode(String collegeCode) {
        this.collegeCode = collegeCode;
    }

    public String getLocalPostOffice() {
        return localPostOffice;
    }

    public void setLocalPostOffice(String localPostOffice) {
        this.localPostOffice = localPostOffice;
    }

    public String getLocalPoliceStation() {
        return localPoliceStation;
    }

    public void setLocalPoliceStation(String localPoliceStation) {
        this.localPoliceStation = localPoliceStation;
    }

    public String getLocalTehsil() {
        return localTehsil;
    }

    public void setLocalTehsil(String localTehsil) {
        this.localTehsil = localTehsil;
    }

    public String getPermenantPostOffice() {
        return permenantPostOffice;
    }

    public void setPermenantPostOffice(String permenantPostOffice) {
        this.permenantPostOffice = permenantPostOffice;
    }

    public String getPermenantPoliceOffice() {
        return permenantPoliceOffice;
    }

    public void setPermenantPoliceOffice(String permenantPoliceOffice) {
        this.permenantPoliceOffice = permenantPoliceOffice;
    }

    public String getPermenantTehsil() {
        return permenantTehsil;
    }

    public void setPermenantTehsil(String permenantTehsil) {
        this.permenantTehsil = permenantTehsil;
    }

    public String getGuirdianStatus() {
        return guirdianStatus;
    }

    public void setGuirdianStatus(String guirdianStatus) {
        this.guirdianStatus = guirdianStatus;
    }

    public String getMotherHouseStatus() {
        return motherHouseStatus;
    }

    public void setMotherHouseStatus(String motherHouseStatus) {
        this.motherHouseStatus = motherHouseStatus;
    }

    public String getLocalOthercityName() {
        return localOthercityName;
    }

    public void setLocalOthercityName(String localOthercityName) {
        this.localOthercityName = localOthercityName;
    }

    public String getPermenantOthercityName() {
        return permenantOthercityName;
    }

    public void setPermenantOthercityName(String permenantOthercityName) {
        this.permenantOthercityName = permenantOthercityName;
    }

    public String getGuardianOtherCityName() {
        return guardianOtherCityName;
    }

    public void setGuardianOtherCityName(String guardianOtherCityName) {
        this.guardianOtherCityName = guardianOtherCityName;
    }

    public int getMotherCityName() {
        return motherCityName;
    }

    public void setMotherCityName(int motherCityName) {
        this.motherCityName = motherCityName;
    }

    public String getFatherOtherCityName() {
        return fatherOtherCityName;
    }

    public void setFatherOtherCityName(String fatherOtherCityName) {
        this.fatherOtherCityName = fatherOtherCityName;
    }

    public String getLocalOtherDistrictName() {
        return localOtherDistrictName;
    }

    public void setLocalOtherDistrictName(String localOtherDistrictName) {
        this.localOtherDistrictName = localOtherDistrictName;
    }

    public String getPermenantOtherDistrictName() {
        return permenantOtherDistrictName;
    }

    public void setPermenantOtherDistrictName(String permenantOtherDistrictName) {
        this.permenantOtherDistrictName = permenantOtherDistrictName;
    }

    public String getGuardianOtherDistrictName() {
        return guardianOtherDistrictName;
    }

    public void setGuardianOtherDistrictName(String guardianOtherDistrictName) {
        this.guardianOtherDistrictName = guardianOtherDistrictName;
    }

    public int getMotherDistrictName() {
        return motherDistrictName;
    }

    public void setMotherDistrictName(int motherDistrictName) {
        this.motherDistrictName = motherDistrictName;
    }

    public String getFatherOtherDistrictName() {
        return fatherOtherDistrictName;
    }

    public void setFatherOtherDistrictName(String fatherOtherDistrictName) {
        this.fatherOtherDistrictName = fatherOtherDistrictName;
    }

    public String getLocalLocality() {
        return localLocality;
    }

    public void setLocalLocality(String localLocality) {
        this.localLocality = localLocality;
    }

    public String getPermenantLocality() {
        return permenantLocality;
    }

    public void setPermenantLocality(String permenantLocality) {
        this.permenantLocality = permenantLocality;
    }

    public String getGuardianLocality() {
        return guardianLocality;
    }

    public void setGuardianLocality(String guardianLocality) {
        this.guardianLocality = guardianLocality;
    }

    public String getFatherFlatNumber() {
        return fatherFlatNumber;
    }

    public void setFatherFlatNumber(String fatherFlatNumber) {
        this.fatherFlatNumber = fatherFlatNumber;
    }

    public String getMotherFlatNumber() {
        return motherFlatNumber;
    }

    public void setMotherFlatNumber(String motherFlatNumber) {
        this.motherFlatNumber = motherFlatNumber;
    }

    public String getGuardianFlatNo() {
        return guardianFlatNo;
    }

    public void setGuardianFlatNo(String guardianFlatNo) {
        this.guardianFlatNo = guardianFlatNo;
    }

    public String getLocalFlatNumber() {
        return localFlatNumber;
    }

    public void setLocalFlatNumber(String localFlatNumber) {
        this.localFlatNumber = localFlatNumber;
    }

    public String getPermenantFlatNumber() {
        return permenantFlatNumber;
    }

    public void setPermenantFlatNumber(String permenantFlatNumber) {
        this.permenantFlatNumber = permenantFlatNumber;
    }

    public String getLocalStreetName() {
        return localStreetName;
    }

    public void setLocalStreetName(String localStreetName) {
        this.localStreetName = localStreetName;
    }

    public String getPermanantStreetName() {
        return permanantStreetName;
    }

    public void setPermanantStreetName(String permanantStreetName) {
        this.permanantStreetName = permanantStreetName;
    }

    public String getGuardianStreetName() {
        return guardianStreetName;
    }

    public void setGuardianStreetName(String guardianStreetName) {
        this.guardianStreetName = guardianStreetName;
    }

    public String getLocalLandmark() {
        return localLandmark;
    }

    public void setLocalLandmark(String localLandmark) {
        this.localLandmark = localLandmark;
    }

    public String getPermanantLandmark() {
        return permanantLandmark;
    }

    public void setPermanantLandmark(String permanantLandmark) {
        this.permanantLandmark = permanantLandmark;
    }

    public String getGuardianLandmark() {
        return guardianLandmark;
    }

    public void setGuardianLandmark(String guardianLandmark) {
        this.guardianLandmark = guardianLandmark;
    }

    public String getFatherStreetName() {
        return fatherStreetName;
    }

    public void setFatherStreetName(String fatherStreetName) {
        this.fatherStreetName = fatherStreetName;
    }

    public String getMotherOfficeStreetName() {
        return motherOfficeStreetName;
    }

    public void setMotherOfficeStreetName(String motherOfficeStreetName) {
        this.motherOfficeStreetName = motherOfficeStreetName;
    }

    public int getFatherEducationId() {
        return fatherEducationId;
    }

    public void setFatherEducationId(int fatherEducationId) {
        this.fatherEducationId = fatherEducationId;
    }

    public String getFatherOfficeAddress() {
        return fatherOfficeAddress;
    }

    public void setFatherOfficeAddress(String fatherOfficeAddress) {
        this.fatherOfficeAddress = fatherOfficeAddress;
    }

    public int getFatherOfficeCity() {
        return fatherOfficeCity;
    }

    public void setFatherOfficeCity(int fatherOfficeCity) {
        this.fatherOfficeCity = fatherOfficeCity;
    }

    public String getFatherOfficePINCode() {
        return fatherOfficePINCode;
    }

    public void setFatherOfficePINCode(String fatherOfficePINCode) {
        this.fatherOfficePINCode = fatherOfficePINCode;
    }

    public String getFatherOfficeLocality() {
        return fatherOfficeLocality;
    }

    public void setFatherOfficeLocality(String fatherOfficeLocality) {
        this.fatherOfficeLocality = fatherOfficeLocality;
    }

    public String getFatherOfficeLandmark() {
        return fatherOfficeLandmark;
    }

    public void setFatherOfficeLandmark(String fatherOfficeLandmark) {
        this.fatherOfficeLandmark = fatherOfficeLandmark;
    }

    public int getFatherOfficeDistrict() {
        return fatherOfficeDistrict;
    }

    public void setFatherOfficeDistrict(int fatherOfficeDistrict) {
        this.fatherOfficeDistrict = fatherOfficeDistrict;
    }

    public int getFatherOfficeState() {
        return fatherOfficeState;
    }

    public void setFatherOfficeState(int fatherOfficeState) {
        this.fatherOfficeState = fatherOfficeState;
    }

    public int getMotherEducation() {
        return motherEducation;
    }

    public void setMotherEducation(int motherEducation) {
        this.motherEducation = motherEducation;
    }

    public String getMotherOfficeAddress() {
        return motherOfficeAddress;
    }

    public void setMotherOfficeAddress(String motherOfficeAddress) {
        this.motherOfficeAddress = motherOfficeAddress;
    }

    public int getMotherOfficeCity() {
        return motherOfficeCity;
    }

    public void setMotherOfficeCity(int motherOfficeCity) {
        this.motherOfficeCity = motherOfficeCity;
    }

    public String getMotherOfficePINCode() {
        return motherOfficePINCode;
    }

    public void setMotherOfficePINCode(String motherOfficePINCode) {
        this.motherOfficePINCode = motherOfficePINCode;
    }

    public String getMotherOfficeLocality() {
        return motherOfficeLocality;
    }

    public void setMotherOfficeLocality(String motherOfficeLocality) {
        this.motherOfficeLocality = motherOfficeLocality;
    }

    public String getMotherOfficeLandmark() {
        return motherOfficeLandmark;
    }

    public void setMotherOfficeLandmark(String motherOfficeLandmark) {
        this.motherOfficeLandmark = motherOfficeLandmark;
    }

    public int getMotherOfficeDistrict() {
        return motherOfficeDistrict;
    }

    public void setMotherOfficeDistrict(int motherOfficeDistrict) {
        this.motherOfficeDistrict = motherOfficeDistrict;
    }

    public int getMotherOfficeState() {
        return motherOfficeState;
    }

    public void setMotherOfficeState(int motherOfficeState) {
        this.motherOfficeState = motherOfficeState;
    }

    public int getGuardianCity() {
        return guardianCity;
    }

    public void setGuardianCity(int guardianCity) {
        this.guardianCity = guardianCity;
    }

    public int getGuardianDistrict() {
        return guardianDistrict;
    }

    public void setGuardianDistrict(int guardianDistrict) {
        this.guardianDistrict = guardianDistrict;
    }

    /*
     * public String getRouteNumber() { return routeNumber; } public void setRouteNumber(String routeNumber) {
     * this.routeNumber = routeNumber; } public float getRouteAmount() { return routeAmount; } public void
     * setRouteAmount(float routeAmount) { this.routeAmount = routeAmount; }
     */

    /*
     * public boolean isMedicalProblem() { return medicalProblem; } public void setMedicalProblem(boolean
     * medicalProblem) { this.medicalProblem = medicalProblem; } public String getMedicalDetails() { return
     * medicalDetails; } public void setMedicalDetails(String medicalDetails) { this.medicalDetails = medicalDetails; }
     */

    /*
     * public byte getNumberOfBrother() { return numberOfBrother; } public void setNumberOfBrother(byte numberOfBrother)
     * { this.numberOfBrother = numberOfBrother; } public byte getNumberOfSister() { return numberOfSister; } public
     * void setNumberOfSister(byte numberOfSister) { this.numberOfSister = numberOfSister; }
     */

    public String getGuardianPINCode() {
        return guardianPINCode;
    }

    public int getGuardianStateId() {
        return guardianStateId;
    }

    public void setGuardianStateId(int guardianStateId) {
        this.guardianStateId = guardianStateId;
    }

    public void setGuardianPINCode(String guardianPINCode) {
        this.guardianPINCode = guardianPINCode;
    }

    public boolean isFatherOfficeAddressStatus() {
        return fatherOfficeAddressStatus;
    }

    public void setFatherOfficeAddressStatus(boolean fatherOfficeAddressStatus) {
        this.fatherOfficeAddressStatus = fatherOfficeAddressStatus;
    }

    public boolean isMotherAddressStatus() {
        return motherAddressStatus;
    }

    public void setMotherAddressStatus(boolean motherAddressStatus) {
        this.motherAddressStatus = motherAddressStatus;
    }

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

    public String getAdmissionDocumentList() {
        return admissionDocumentList;
    }

    public void setAdmissionDocumentList(String admissionDocumentList) {
        this.admissionDocumentList = admissionDocumentList;
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

    public void setParentsDetails(int studentId, int fatherOccupationId, String fatherDesignation,
        int fatherEducationId, String fatherFlatNumber, String fatherOfficeLocality, String fatherStreetName,
        String fatherOfficeLandmark, int fatherOfficeCity, int fatherOfficeDistrictName, int fatherOfficeState,
        String fatherOfficePINCode, String fatherOtherCityName, String fatherOtherDistrictName, String fatherEmailid,
        String fatherMobileNumber, String fatherOfficeNumber, String motherName, String motherMaidenName,
        String motherOfficeNumber, String motherMobileNumber, String motherEmailid, int motherOccupationId,
        String motherDesignation, int motherEducation, String motherFlatNumber, String motherOfficeLocality,
        String motherOfficeStreetName, String motherOfficeLandmark, int motherOfficeCity, int motherOfficeDistrict,
        int motherOfficeState, String motherOfficePINCode, String motherOtherCityName, String motherOtherDistrictName) {
        this.studentId = studentId;
        this.fatherOccupationId = fatherOccupationId;
        this.fatherDesignation = fatherDesignation;
        this.fatherEducationId = fatherEducationId;
        this.fatherFlatNumber = fatherFlatNumber;
        this.fatherOfficeLocality = fatherOfficeLocality;
        this.fatherStreetName = fatherStreetName;
        this.fatherOfficeLandmark = fatherOfficeLandmark;
        this.fatherOfficeCity = fatherOfficeCity;
        this.fatherOfficeDistrictName = fatherOfficeDistrictName;
        this.fatherOfficePINCode = fatherOfficePINCode;
        this.fatherOtherCityName = fatherOtherCityName;
        this.fatherOtherDistrictName = fatherOtherDistrictName;
        this.fatherEmailid = fatherEmailid;
        this.fatherMobileNumber = fatherMobileNumber;
        this.fatherOfficeNumber = fatherOfficeNumber;
        // this.motherName = motherName;
        this.motherMaidenName = motherMaidenName;
        this.motherOfficeNumber = motherOfficeNumber;
        this.motherMobileNumber = motherMobileNumber;
        this.motherEmailid = motherEmailid;
        this.motherOccupationId = motherOccupationId;
        this.motherDesignation = motherDesignation;
        this.motherEducation = motherEducation;
        this.motherFlatNumber = motherFlatNumber;
        this.motherOfficeLocality = motherOfficeLocality;
        this.motherOfficeStreetName = motherOfficeStreetName;
        this.motherOfficeLandmark = motherOfficeLandmark;
        this.motherOfficeCity = motherOfficeCity;
        this.motherOfficeDistrict = motherOfficeDistrict;
        this.motherOfficeState = motherOfficeState;
        this.motherOfficePINCode = motherOfficePINCode;
        this.motherOtherCityName = motherOtherCityName;
        this.motherOtherDistrictName = motherOtherDistrictName;
        this.fatherOfficeState = fatherOfficeState;

    }

    public String getFatherMobileNumber() {
        return fatherMobileNumber;
    }

    public void setFatherMobileNumber(String fatherMobileNumber) {
        this.fatherMobileNumber = fatherMobileNumber;
    }

    public String getFatherOfficeNumber() {
        return fatherOfficeNumber;
    }

    public void setFatherOfficeNumber(String fatherOfficeNumber) {
        this.fatherOfficeNumber = fatherOfficeNumber;
    }

    public String getMotherMobileNumber() {
        return motherMobileNumber;
    }

    public void setMotherMobileNumber(String motherMobileNumber) {
        this.motherMobileNumber = motherMobileNumber;
    }

    public String getMotherOfficeNumber() {
        return motherOfficeNumber;
    }

    public void setMotherOfficeNumber(String motherOfficeNumber) {
        this.motherOfficeNumber = motherOfficeNumber;
    }

    /*
     * public String getMotherName() { return motherName; } public void setMotherName(String motherName) {
     * this.motherName = motherName; }
     */

    public String getMotherMaidenName() {
        return motherMaidenName;
    }

    public void setMotherMaidenName(String motherMaidenName) {
        this.motherMaidenName = motherMaidenName;
    }

    public String getMotherOtherCityName() {
        return motherOtherCityName;
    }

    public void setMotherOtherCityName(String motherOtherCityName) {
        this.motherOtherCityName = motherOtherCityName;
    }

    public String getMotherOtherDistrictName() {
        return motherOtherDistrictName;
    }

    public void setMotherOtherDistrictName(String motherOtherDistrictName) {
        this.motherOtherDistrictName = motherOtherDistrictName;
    }

    public int getFatherOfficeDistrictName() {
        return fatherOfficeDistrictName;
    }

    public void setFatherOfficeDistrictName(int fatherOfficeDistrictName) {
        this.fatherOfficeDistrictName = fatherOfficeDistrictName;
    }

    public void setAddressAndContactDetails(String localFlatNumber, String localLocality, String localStreetName,
        String localLandmark, int localCity, int localDistrictId, String localPINCode, String localPoliceStation,
        String localPostOffice, int localStateId, String localOthercityName, String localOtherDistrictName,

        String permenantFlatNumber, String permenantLocality, String permenantStreetName, String permenantLandmark,
        int permenantCity, int permenantDistrictId, String permenantPINCode, String permenantPoliceStation,
        String permenantPostOffice, int permenantStateId, String permenantOthercityName,
        String permenantOtherDistrictName,

        String guardianName, String relationWithGuardian, String guardianOccupationName, String guardianPhone,
        String guardianFlatNumber, String guardianLocality, String guardianStreetName, String guardianLandmark,
        int guardianCity, int guardianDistrictId, String guardianPINCode, int guardianStateId,
        String guardianOthercityName, String guardianOtherDistrictName

    ) {

        this.localFlatNumber = localFlatNumber;
        this.localLocality = localLocality;
        this.localStreetName = localStreetName;
        this.localLandmark = localLandmark;
        this.localCity = localCity;
        this.localDistrictId = localDistrictId;
        this.localPINCode = localPINCode;
        this.localPoliceStation = localPoliceStation;
        this.localPostOffice = localPostOffice;
        this.localStateId = localStateId;
        this.localOthercityName = localOthercityName;
        this.localOtherDistrictName = localOtherDistrictName;

        this.permenantFlatNumber = permenantFlatNumber;
        this.permenantLocality = permenantLocality;
        this.permanantStreetName = permenantStreetName;
        this.permanantLandmark = permenantLandmark;
        this.permenantCityId = permenantCity;
        this.permenantDistrictId = permenantDistrictId;
        this.permenantPINCode = permenantPINCode;
        this.permenantPoliceOffice = permenantPoliceStation;
        this.permenantPostOffice = permenantPostOffice;
        this.permenantStateId = permenantStateId;
        this.permenantOthercityName = permenantOthercityName;
        this.permenantOtherDistrictName = permenantOtherDistrictName;

        this.guardianName = guardianName;
        this.relationWithGuardian = relationWithGuardian;
        this.guardianOccupationName = guardianOccupationName;
        this.guardianPhone = guardianPhone;
        this.guardianFlatNo = guardianFlatNumber;
        this.guardianLocality = guardianLocality;
        this.guardianStreetName = guardianStreetName;
        this.guardianLandmark = guardianLandmark;
        this.guardianCity = guardianCity;
        this.guardianDistrict = guardianDistrictId;
        this.guardianPINCode = guardianPINCode;
        this.guardianStateId = guardianStateId;
        this.guardianOtherCityName = guardianOthercityName;
        this.guardianOtherDistrictName = guardianOtherDistrictName;
    }

    @Override
    public String toString() {
        return "StudentAddressEntity [id=" + id + ", studentId=" + studentId + ", localAddress=" + localAddress
            + ", localCity=" + localCity + ", localDistrictId=" + localDistrictId + ", localStateId=" + localStateId
            + ", localPINCode=" + localPINCode + ", localTelephone=" + localTelephone + ", localMobileNumber="
            + localMobileNumber + ", localEmail=" + localEmail + ", permenantAddress=" + permenantAddress
            + ", permenantCityId=" + permenantCityId + ", permenantStateId=" + permenantStateId
            + ", permenantDistrictId=" + permenantDistrictId + ", permenantTelephoneNumber=" + permanentTelephone
            + ", permenantMobileNumber=" + permenantMobileNumber + ", permenantPINCode=" + permenantPINCode
            + ", permenantEmail=" + permenantEmail + ", fatherDesignation=" + fatherDesignation
            + ", fatherOccupationId=" + fatherOccupationId + ", fatherJobDetailId=" + fatherJobDetailId
            + ", fatherMobileNumber=" + fatherMobileNumber + ", fatherOfficeNumber=" + fatherOfficeNumber
            + ", motherMaidenName=" + motherMaidenName + ", motherDesignation=" + motherDesignation
            + ", motherOccupationId=" + motherOccupationId + ", motherJobDetailsId=" + motherJobDetailsId
            + ", motherMobileNumber=" + motherMobileNumber + ", motherOfficeNumber=" + motherOfficeNumber
            + ", guardianName=" + guardianName + ", relationWithGuardian=" + relationWithGuardian + ", guardianAddress="
            + guardianAddress + ", guardianOccupationName=" + guardianOccupationName + ", guardianPhone="
            + guardianPhone + ", guardianEmail=" + guardianEmail + ", railwayStation=" + railwayStation
            + ", busStation=" + busStation + ", localStationName=" + localStationName + ", organisationName="
            + organisationName + ", organisationAddress=" + organisationAddress + ", collegeCode=" + collegeCode
            + ", localPostOffice=" + localPostOffice + ", localPoliceStation=" + localPoliceStation + ", localTehsil="
            + localTehsil + ", permenantPostOffice=" + permenantPostOffice + ", permenantPoliceOffice="
            + permenantPoliceOffice + ", permenantTehsil=" + permenantTehsil + ", guirdianStatus=" + guirdianStatus
            + ", motherHouseStatus=" + motherHouseStatus + ", localOthercityName=" + localOthercityName
            + ", permenantOthercityName=" + permenantOthercityName + ", guardianOthercityName=" + guardianOtherCityName
            + ", motherCityName=" + motherCityName + ", fatherOtherCityName=" + fatherOtherCityName
            + ", localOtherDistrictName=" + localOtherDistrictName + ", permenantOtherDistrictName="
            + permenantOtherDistrictName + ", guirdianOtherDistrictName=" + guardianOtherDistrictName
            + ", motherDistrictName=" + motherDistrictName + ", fatherOtherDistrictName=" + fatherOtherDistrictName
            + ", localLocality=" + localLocality + ", permenantLocality=" + permenantLocality + ", guirdianLocality="
            + guardianLocality + ", fatherFlatNumber=" + fatherFlatNumber + ", motherFlatNumber=" + motherFlatNumber
            + ", guirdianFlatNumber=" + guardianFlatNo + ", localFlatNumber=" + localFlatNumber
            + ", permenantFlatNumber=" + permenantFlatNumber + ", localStreetName=" + localStreetName
            + ", permanantStreetName=" + permanantStreetName + ", guirdianStreetName=" + guardianStreetName
            + ", localLandmark=" + localLandmark + ", permanantLandmark=" + permanantLandmark + ", guirdianLandmark="
            + guardianLandmark + ", fatherStreetName=" + fatherStreetName + ", motherOfficeStreetName="
            + motherOfficeStreetName + ", fatherEducationId=" + fatherEducationId + ", fatherOfficeAddress="
            + fatherOfficeAddress + ", fatherOfficeCity=" + fatherOfficeCity + ", fatherOfficePINCode="
            + fatherOfficePINCode + ", fatherOfficeLocality=" + fatherOfficeLocality + ", fatherOfficeLandmark="
            + fatherOfficeLandmark + ", fatherOfficeDistrict=" + fatherOfficeDistrict + ", fatherOfficeState="
            + fatherOfficeState + ", motherEducation=" + motherEducation + ", motherOfficeAddress="
            + motherOfficeAddress + ", motherOfficeCity=" + motherOfficeCity + ", motherOfficePINCode="
            + motherOfficePINCode + ", motherOfficeLocality=" + motherOfficeLocality + ", motherOfficeLandmark="
            + motherOfficeLandmark + ", motherOfficeDistrict=" + motherOfficeDistrict + ", motherOfficeState="
            + motherOfficeState + ", guirdianCity=" + guardianCity + ", guirdianDistrict=" + guardianDistrict
            + ", guirdianState=" + guardianStateId + ", guirdianPINCode=" + guardianPINCode
            + ", fatherOfficeAddressStatus=" + fatherOfficeAddressStatus + ", motherAddressStatus="
            + motherAddressStatus + ", fatherEmailid=" + fatherEmailid + ", motherEmailid=" + motherEmailid
            + ", admissionDocumentList=" + admissionDocumentList + ", ipAddress=" + ipAddress + ", macAddress="
            + macAddress + ", createdBy=" + createdBy + ", createdDate=" + createdDate + ", modifiedBy=" + modifiedBy
            + ", modifiedDate=" + modifiedDate + ", motherOtherCityName=" + motherOtherCityName
            + ", motherOtherDistrictName=" + motherOtherDistrictName + ", fatherOfficeDistrictName="
            + fatherOfficeDistrictName + "]";
    }

    public String getStudentParentsDetails() {
        return "fatherName   : " + this.fatherName + "\n" + "fatherDesignation   : " + this.fatherDesignation + "\n"
            + "fatherEmailid   : " + this.fatherEmailid + "\n" + "fatherOccupationId   : " + this.fatherOccupationId
            + "\n" + "fatherOfficeAddress   : " + this.fatherOfficeAddress + "\n" + "fatherMobileNumber   : "
            + this.fatherMobileNumber + "\n" +

        "motherName   : " + this.motherName + "\n" + "motherDesignation   : " + this.motherDesignation + "\n"
            + "motherEmailid   : " + this.motherEmailid + "\n" + "motherOccupationId   : " + this.motherOccupationId
            + "\n" + "motherOfficeAddress   : " + this.motherOfficeAddress + "\n" + "motherMobileNumber   : "
            + this.motherMobileNumber + "\n" +

        "guardianName   : " + this.guardianName + "\n" + "guardianOccupationName   : " + this.guardianOccupationName
            + "\n" + "guardianEmail   : " + this.guardianEmail + "\n" + "relationWithGuardian   : "
            + this.relationWithGuardian + "\n" + "guardianPhone   : " + this.guardianPhone + "\n";
    }

    public void setStudentParentsDetails(StudentAddressMasterEntity entity) {
        this.fatherName = entity.getFatherName();
        this.fatherDesignation = entity.getFatherDesignation();
        this.fatherEmailid = entity.getFatherEmailid();
        this.fatherOccupationId = entity.getFatherOccupationId();
        this.fatherOfficeAddress = entity.getFatherOfficeAddress();
        this.fatherMobileNumber = entity.getFatherMobileNumber();

        this.motherName = entity.getMotherName();
        this.motherDesignation = entity.getMotherDesignation();
        this.motherEmailid = entity.getMotherEmailid();
        this.motherOccupationId = entity.getMotherOccupationId();
        this.motherOfficeAddress = entity.getMotherOfficeAddress();
        this.motherMobileNumber = entity.getMotherMobileNumber();

        this.guardianName = entity.getGuardianName();
        this.guardianOccupationName = entity.getGuardianOccupationName();
        this.guardianEmail = entity.getGuardianEmail();
        this.relationWithGuardian = entity.getRelationWithGuardian();
        this.guardianPhone = entity.getGuardianPhone();
    }

    public String getStudentAddressDetails() {
        return "localPINCode   : " + this.localPINCode + "\n" + "localDistrictId   : " + this.localDistrictId + "\n"
            + "localStateId   : " + this.localStateId + "\n" + "localTelephone   : " + this.localTelephone + "\n"
            + "localTown   : " + this.localTown + "\n" + "localCity   : " + this.localCity + "\n" +

        "permenantPINCode   : " + this.permenantPINCode + "\n" + "permenantDistrictId   : " + this.permenantDistrictId
            + "\n" + "permenantStateId   : " + this.permenantStateId + "\n" + "permenantTelephoneNumber   : "
            + this.permanentTelephone + "\n" + "permenantTown   : " + this.permenantTown + "\n" + "permenantCityId   : "
            + this.permenantCityId + "\n" +

        "guardianPINCode   : " + this.guardianPINCode + "\n" + "guardianDistrict   : " + this.guardianDistrict + "\n"
            + "guardianStateId   : " + this.guardianStateId + "\n" + "guardianTelephone   : " + this.guardianTelephone
            + "\n" + "railwayStation   : " + this.railwayStation + "\n" + "localStationName   : "
            + this.localStationName + "\n" + "guardianTown   : " + this.guardianTown + "\n" + "guardianCity   : "
            + this.guardianCity + "\n" + "busStation   : " + this.busStation + "\n";
    }

    public void setStudentAddressDetails(StudentAddressMasterEntity entity) {

        this.localPINCode = entity.getLocalPINCode();
        this.localDistrictId = entity.getLocalDistrictId();
        this.localStateId = entity.getLocalStateId();
        this.localTelephone = entity.getLocalTelephone();
        this.localTown = entity.getLocalTown();
        this.localCity = entity.getLocalCity();

        this.permenantPINCode = entity.getPermenantPINCode();
        this.permenantDistrictId = entity.getPermenantDistrictId();
        this.permenantStateId = entity.getPermenantStateId();
        this.permanentTelephone = entity.getPermanentTelephone();
        this.permenantTown = entity.getPermenantTown();
        this.permenantCityId = entity.getPermenantCityId();

        this.guardianPINCode = entity.getGuardianPINCode();
        this.guardianDistrict = entity.getGuardianDistrict();
        this.guardianStateId = entity.getGuardianStateId();
        this.guardianTelephone = entity.getGuardianTelephone();
        this.railwayStation = entity.getRailwayStation();
        this.localStationName = entity.getLocalStationName();
        this.guardianTown = entity.getGuardianTown();
        this.guardianCity = entity.getGuardianCity();
        this.busStation = entity.getBusStation();
    }

    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public String getLocalTown() {
        return localTown;
    }

    public void setLocalTown(String localTown) {
        this.localTown = localTown;
    }

    public String getPermenantTown() {
        return permenantTown;
    }
    /* gjg */

    public void setPermenantTown(String permenantTown) {
        this.permenantTown = permenantTown;
    }

    public String getGuardianTelephone() {
        return guardianTelephone;
    }

    public void setGuardianTelephone(String guardianTelephone) {
        this.guardianTelephone = guardianTelephone;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getGuardianTown() {
        return guardianTown;
    }

    public void setGuardianTown(String guardianTown) {
        this.guardianTown = guardianTown;
    }

    @Transient
    private String genderName;

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }

    @Transient
    private String studentPhoto;

    public String getStudentPhoto() {
        return studentPhoto;
    }

    public void setStudentPhoto(String studentPhoto) {
        this.studentPhoto = studentPhoto;
    }

    @Transient
    private String studentName;

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    @Transient
    private Date dateOfBirth;

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    @Transient
    private String height;

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    @Transient
    private String bloodGroup;

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    @Transient
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Transient
    private String identityMark1;

    public String getIdentityMark1() {
        return identityMark1;
    }

    public void setIdentityMark1(String identityMark1) {
        this.identityMark1 = identityMark1;
    }

    @Transient
    private String studentSignature;

    public String getStudentSignature() {
        return studentSignature;
    }

    public void setStudentSignature(String studentSignature) {
        this.studentSignature = studentSignature;
    }

    @Transient
    private String studentMobileNumber;

    public String getStudentMobileNumber() {
        return studentMobileNumber;
    }

    public void setStudentMobileNumber(String studentMobileNumber) {
        this.studentMobileNumber = studentMobileNumber;
    }
    /****/
}
