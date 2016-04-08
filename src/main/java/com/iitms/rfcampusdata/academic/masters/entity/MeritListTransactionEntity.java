package com.iitms.rfcampusdata.academic.masters.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;

@Entity
@Table(name = "transaction.merit_list_transaction")
public class MeritListTransactionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    /*
     * @Column(name = "student_serial_id", columnDefinition = "serial") private int studentSerialId; // for sorting by
     * serialno public int getStudentSerialId() { return studentSerialId; } public void setStudentSerialId(int
     * studentSerialId) { this.studentSerialId = studentSerialId; }
     */

    @Column(name = "merit_list_id", columnDefinition = "serial")
    private int meritListId;

    @Column(name = "student_application_id")
    private String studentAapplicationId;

    @Column(name = "serial_number_meritlist")
    private int serialNumberMeritlist;

    @Column(name = "student_id")
    private int studentId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private TempStudentRegistrationEntity tempStudentRegistrationEntity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMeritListId() {
        return meritListId;
    }

    public void setMeritListId(int meritListId) {
        this.meritListId = meritListId;
    }

    public String getStudentAapplicationId() {
        return studentAapplicationId;
    }

    public void setStudentAapplicationId(String studentAapplicationId) {
        this.studentAapplicationId = studentAapplicationId;
    }

    public int getSerialNumberMeritlist() {
        return serialNumberMeritlist;
    }

    public void setSerialNumberMeritlist(int serialNumberMeritlist) {
        this.serialNumberMeritlist = serialNumberMeritlist;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public TempStudentRegistrationEntity getTempStudentRegistrationEntity() {
        return tempStudentRegistrationEntity;
    }

    public void setTempStudentRegistrationEntity(TempStudentRegistrationEntity tempStudentRegistrationEntity) {
        this.tempStudentRegistrationEntity = tempStudentRegistrationEntity;
    }

}
