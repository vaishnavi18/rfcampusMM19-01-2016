package com.iitms.rfcampusdata.sms.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;

public interface StudentSmsDoa {
    public List<StudentAdmissionEntity> getStudentByQuery(String query);
}
