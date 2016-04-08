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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;

import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;

@Entity
@Table(name = "master.admission_notification_master")
public class AdmissionNotificationEntity implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private static final Logger LOG = LoggerFactory.getLogger(AdmissionNotificationEntity.class);

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "session_id")
    private int sessionId;

    @Column(name = "degree_id")
    private int degreeId;

    @Column(name = "branch_id")
    private int branchId;

    @Column(name = "admission_start_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date admissionStartDate;

    @Column(name = "admission_end_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date admissionEndDate;

    @Column(name = "admission_print_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date admissionPrintDate;

    @Column(name = "prefix")
    private String prefix;

    @Column(name = "start_number")
    private String startNumber;

    @Column(name = "sufix")
    private String sufix;

    /*
     * @ManyToOne(fetch = FetchType.LAZY)
     * @JoinColumn(name = "degree_type_id", referencedColumnName = "id", insertable = false, updatable = false, nullable
     * = false) private DegreeTypeEntity degreeTypeEntity;
     */

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "degree_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private DegreeMasterEntity degreeMasterEntity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private BranchMasterEntity branchMasterEntity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "session_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private AcademicSessionMasterEntity academicSessionEntity;

    @Transient
    private String admissionStartDateString;

    @Transient
    private String admissionEndDateString;

    @Transient
    private String admissionPrintDateString;

    @Transient
    private String branchIds;

    @Transient
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm a");

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public Date getAdmissionStartDate() {
        return admissionStartDate;
    }

    public void setAdmissionStartDate(Date admissionStartDate) {
        this.admissionStartDate = admissionStartDate;
    }

    public Date getAdmissionEndDate() {
        return admissionEndDate;
    }

    public void setAdmissionEndDate(Date admissionEndDate) {
        this.admissionEndDate = admissionEndDate;
    }

    public Date getAdmissionPrintDate() {
        return admissionPrintDate;
    }

    public void setAdmissionPrintDate(Date admissionPrintDate) {
        this.admissionPrintDate = admissionPrintDate;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public String getStartNumber() {
        return startNumber;
    }

    public void setStartNumber(String startNumber) {
        this.startNumber = startNumber;
    }

    public String getSufix() {
        return sufix;
    }

    public void setSufix(String sufix) {
        this.sufix = sufix;
    }

    public void setNotificationParameter(AdmissionNotificationEntity admissionNotificationEntity) {
        this.sessionId = admissionNotificationEntity.getSessionId();
        this.degreeId = admissionNotificationEntity.getDegreeId();
        this.branchId = admissionNotificationEntity.getBranchId();
        this.admissionStartDate = admissionNotificationEntity.getAdmissionStartDate();
        this.admissionEndDate = admissionNotificationEntity.getAdmissionEndDate();
        this.admissionPrintDate = admissionNotificationEntity.getAdmissionPrintDate();
        this.prefix = admissionNotificationEntity.getPrefix();
        this.startNumber = admissionNotificationEntity.getStartNumber();
        this.sufix = admissionNotificationEntity.getSufix();
    }

    public String getAdmissionStartDateString() {
        if (this.admissionStartDate != null) {
            return sdf.format(this.admissionStartDate);
        }
        return admissionStartDateString;
    }

    public void setAdmissionStartDateString(String admissionStartDateString) {
        try {
            this.admissionStartDateString = admissionStartDateString;
            if (admissionStartDateString != null) {
                this.admissionStartDate = sdf.parse(admissionStartDateString);
            }
        } catch (Exception e) {
            // e.printStackTrace();
            LOG.error("ERR", e);
        }

    }

    public String getAdmissionEndDateString() {
        if (this.admissionEndDate != null) {
            return sdf.format(this.admissionEndDate);
        }
        return admissionEndDateString;
    }

    public void setAdmissionEndDateString(String admissionEndDateString) {
        try {
            this.admissionEndDateString = admissionEndDateString;
            if (admissionEndDateString != null) {
                this.admissionEndDate = sdf.parse(admissionEndDateString);
            }
        } catch (Exception e) {
            // e.printStackTrace();
            LOG.error("errr", e);
        }
    }

    public String getAdmissionPrintDateString() {
        if (this.admissionPrintDate != null) {
            return sdf.format(this.admissionPrintDate);
        }
        return admissionPrintDateString;
    }

    public void setAdmissionPrintDateString(String admissionPrintDateString) {
        try {
            this.admissionPrintDateString = admissionPrintDateString;
            if (admissionPrintDateString != null) {
                this.admissionPrintDate = sdf.parse(admissionPrintDateString);
            }
        } catch (Exception e) {
            // e.printStackTrace();
            LOG.error("errr", e);
        }
    }

    public AcademicSessionMasterEntity getAcademicSessionEntity() {
        return academicSessionEntity;
    }

    public void setAcademicSessionEntity(AcademicSessionMasterEntity academicSessionEntity) {
        this.academicSessionEntity = academicSessionEntity;
    }

    public int getDegreeId() {
        return degreeId;
    }

    public void setDegreeId(int degreeId) {
        this.degreeId = degreeId;
    }

    public DegreeMasterEntity getDegreeMasterEntity() {
        return degreeMasterEntity;
    }

    public void setDegreeMasterEntity(DegreeMasterEntity degreeMasterEntity) {
        this.degreeMasterEntity = degreeMasterEntity;
    }

    public String getBranchIds() {
        return branchIds;
    }

    public void setBranchIds(String branchIds) {
        this.branchIds = branchIds;
    }

    @Override
    public String toString() {
        return "AdmissionNotificationEntity [admissionStartDateString=" + admissionStartDateString
            + ", admissionEndDateString=" + admissionEndDateString + ", admissionPrintDateString="
            + admissionPrintDateString + "]";
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public BranchMasterEntity getBranchMasterEntity() {
        return branchMasterEntity;
    }

    public void setBranchMasterEntity(BranchMasterEntity branchMasterEntity) {
        this.branchMasterEntity = branchMasterEntity;
    }

}
