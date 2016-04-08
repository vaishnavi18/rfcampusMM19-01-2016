package com.iitms.rfcampusdomain.sms.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;

public interface StudentSmsService {

    public List<StudentAdmissionEntity> getStudentByQuery(String query);
}
