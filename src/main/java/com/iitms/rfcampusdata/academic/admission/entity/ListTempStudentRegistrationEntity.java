package com.iitms.rfcampusdata.academic.admission.entity;

import java.util.List;

/**
 * @author Sachinmt
 */
public class ListTempStudentRegistrationEntity {

    private List<TempStudentRegistrationEntity> registardStudentList;

    public List<TempStudentRegistrationEntity> getRegistardStudentList() {
        return registardStudentList;
    }

    public void setRegistardStudentList(List<TempStudentRegistrationEntity> registardStudentList) {

        this.registardStudentList = registardStudentList;
    }
}
