package com.iitms.rfcampusdata.authentication.dao;

import java.util.List;

import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.authentication.entity.CollegeCreationModel;
import com.iitms.rfcampusdata.authentication.entity.CollegeMasterEntity;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;

public interface CollegeCreationDao {

    public List<CollegeMasterEntity> getCollegeList() throws GenericException;

    public CollegeCreationModel getCollegeInformation(int collegeId) throws GenericException;

    public boolean addCollege(CollegeCreationModel collegeCreationModel) throws GenericException;

    public boolean updateCollege(CollegeCreationModel collegeCreationModel) throws GenericException;

    public boolean isCollegeExist(String collegeName) throws GenericException;

    public List<CollegeMasterEntity> getCollegeBySociety(int societyId) throws GenericException;

    public CollegeInformation getCollegeInfo(int collegeId);
}
