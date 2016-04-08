package com.iitms.rfcampusdata.authentication.dao;

import java.util.List;

import com.iitms.rfcampusdata.authentication.entity.UniversityMaster;

public interface UniversityAndBoardDao {
    public boolean addUniversityAndBoard(UniversityMaster entity);

    public List<UniversityMaster> getUniversityList(boolean onlyActive);

    public boolean updateUniversity(UniversityMaster entity);

    public boolean getUniversityAlreadyExist(String univCode, String univName);

}
