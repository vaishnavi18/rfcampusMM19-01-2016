package com.iitms.rfcampusdata.academic.masters.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;

@Entity
@Table(name = "master.admission_student_merit_list")
public class StudentMeritListMasterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "serial")
    private int id;

    @Column(name = "student_id")
    private int studentId;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "student_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private TempStudentRegistrationEntity registrationEntity;

    public TempStudentRegistrationEntity getRegistrationEntity() {
        return registrationEntity;
    }

    public void setRegistrationEntity(TempStudentRegistrationEntity registrationEntity) {
        this.registrationEntity = registrationEntity;
    }

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

}
