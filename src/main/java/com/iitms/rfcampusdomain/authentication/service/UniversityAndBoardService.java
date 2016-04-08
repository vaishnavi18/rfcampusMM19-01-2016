package com.iitms.rfcampusdomain.authentication.service;

import java.util.List;

import com.iitms.rfcampusdata.authentication.entity.UniversityMaster;

public interface UniversityAndBoardService {
    public boolean addUniversity(UniversityMaster entity);

    public List<UniversityMaster> getAllUniversity(boolean onlyActive);

    public boolean updateUniversity(UniversityMaster entity);

    public boolean getUniversityAlreadyExist(String univCode, String univName);

}
