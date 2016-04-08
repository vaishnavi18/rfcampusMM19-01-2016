package com.iitms.rfcampusdata.academic.feecollection.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.StudentDetails;

public interface StudentDetailsDoa {
    public List<StudentDetails> searchUserByCriteria(String searchBy, String searchText);
}
