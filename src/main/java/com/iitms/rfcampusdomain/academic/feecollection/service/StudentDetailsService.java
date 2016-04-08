package com.iitms.rfcampusdomain.academic.feecollection.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.StudentDetails;

public interface StudentDetailsService {
    public List<StudentDetails> searchUserByCriteria(String searchBy, String searchText);
}
