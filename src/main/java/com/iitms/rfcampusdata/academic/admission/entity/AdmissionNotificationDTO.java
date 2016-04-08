package com.iitms.rfcampusdata.academic.admission.entity;

import java.util.Date;

public class AdmissionNotificationDTO {

    private String session;

    private String degree;

    private String branch;

    private Date admissionStartDate;

    private Date admissionEndDate;

    private Date admissionPrintDate;

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
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

}
