package com.iitms.rfcampusdata.academic.feecollection.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * TABLE: master.fees_standardfee_master, Fields:23
 * 
 * @author Sachinmt
 */
@Entity
@Table(name = "master.fees_standardfee_master")
public class StanderedFeesMaster {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private long id;

    @Column(name = "receipt_type_id")
    private long receiptTypeId;

    @Column(name = "feehead_id")
    private long feeHeadId;

    @Column(name = "session_id")
    private long sessionId;

    @Column(name = "course_id")
    private long courseId;

    @Column(name = "student_type_id")
    private long studentTypeId;

    @Column(name = "batch_id")
    private long batchId;

    @Column(name = "degree_id")
    private long degreeId;

    @Column(name = "semester_id")
    private long semesterId;

    @Column(name = "payment_type_id")
    private long paymentTypeId;

    @Column(name = "is_active")
    private boolean isActive;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "active_start_date")
    private Date activeStartDate;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "active_end_date")
    private Date activeEndDate;

    @Column(name = "amount")
    private long amount;

    @Column(name = "total")
    private long total;

    @Column(name = "remark")
    private String remark;

    @Column(name = "college_code")
    private String collegeCode;

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "macaddress")
    private String macAddress;

    @Column(name = "created_by")
    private long createdBy;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date")
    private Date createdDate;

    @Column(name = "modified_by")
    private long modifiedBy;

    @DateTimeFormat(pattern = "yyyy MM dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "modified_date")
    private Date modifiedDate;

}
