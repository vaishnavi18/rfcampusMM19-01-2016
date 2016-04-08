package com.iitms.rfcampusdomain.academic.feecollection.serviceimpl;

import java.beans.Transient;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.feecollection.dao.StudentDetailsDoa;
import com.iitms.rfcampusdata.academic.feecollection.entity.StudentDetails;
import com.iitms.rfcampusdomain.academic.feecollection.service.StudentDetailsService;

@Service
@Transactional
public class StudentDetailsServiceImpl implements StudentDetailsService{

    @Autowired
    StudentDetailsDoa  studentDetailsDoa;
    
    public List<StudentDetails> searchUserByCriteria(String searchBy, String searchText) {
        return studentDetailsDoa.searchUserByCriteria(searchBy, searchText);
    }

}
