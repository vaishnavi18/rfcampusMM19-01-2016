package com.iitms.rfcampusdomain.authentication.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.authentication.dao.CollegeCreationDao;
import com.iitms.rfcampusdata.authentication.entity.CollegeCreationModel;
import com.iitms.rfcampusdata.authentication.entity.CollegeMasterEntity;
import com.iitms.rfcampusdomain.authentication.service.CollegeCreationService;
import com.iitms.rfcampuspresentation.academic.studentsection.entity.CollegeInformation;

@Service
@Transactional
public class CollegeCreationServiceImpl implements CollegeCreationService {

    @Autowired
    private CollegeCreationDao collegeCreationDao;

    @Override
    public List<CollegeMasterEntity> getCollegeList() throws GenericException {
        try {
            return collegeCreationDao.getCollegeList();
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean addCollege(CollegeCreationModel collegeCreationModel) throws GenericException {
        try {
            return collegeCreationDao.addCollege(collegeCreationModel);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean updateCollege(CollegeCreationModel collegeCreationModel) throws GenericException {
        try {
            return collegeCreationDao.updateCollege(collegeCreationModel);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean isCollegeExist(String collegeName) throws GenericException {
        try {
            return collegeCreationDao.isCollegeExist(collegeName);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public CollegeCreationModel getCollegeInformation(int collegeId) throws GenericException {
        try {
            return collegeCreationDao.getCollegeInformation(collegeId);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<CollegeMasterEntity> getCollegeBySociety(int societyId) throws GenericException {
        try {
            return collegeCreationDao.getCollegeBySociety(societyId);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public CollegeInformation getCollegeInfo(int collegeId) {
        return collegeCreationDao.getCollegeInfo(collegeId);
    }

}
