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

/**
 * Table :master.admission_student_photodetails_master Fields:11
 * 
 * @author Sachinmt
 */
@Entity
@Table(name = "master.admission_student_photodetails_master")
public class StudentPhotoDetailsMasterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int stdPhtDtlId;

    @Column(name = "photo_path")
    private String photoPath;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "stud_signnature_path")
    private String studSignaturePath;

    @Column(name = "qr_code_path")
    private String qrCodePath;

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

    public StudentPhotoDetailsMasterEntity(String photoPath, String collegeCode, String studSignaturePath,
        String qrCodePath, String ipAddress, String macAddress, int createdBy, Date createdDate, int modifiedBy,
        Date modifiedDate) {
        super();
        this.photoPath = photoPath;
        this.collegeCode = collegeCode;
        this.studSignaturePath = studSignaturePath;
        this.qrCodePath = qrCodePath;
        this.ipAddress = ipAddress;
        this.macAddress = macAddress;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.modifiedBy = modifiedBy;
        this.modifiedDate = modifiedDate;
    }

}
