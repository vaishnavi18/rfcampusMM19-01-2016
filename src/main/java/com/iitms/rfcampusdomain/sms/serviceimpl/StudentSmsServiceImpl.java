package com.iitms.rfcampusdomain.sms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.admission.entity.StudentAdmissionEntity;
import com.iitms.rfcampusdata.sms.dao.StudentSmsDoa;
import com.iitms.rfcampusdomain.sms.service.StudentSmsService;

@Service
@Transactional
public class StudentSmsServiceImpl  implements StudentSmsService{
    
    @Autowired
    private StudentSmsDoa studentSmsDoa;

    @Override
    public List<StudentAdmissionEntity> getStudentByQuery(String query) {
        
        return studentSmsDoa.getStudentByQuery(query);
    }

}
