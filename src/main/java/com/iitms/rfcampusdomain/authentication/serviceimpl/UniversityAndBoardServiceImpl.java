package com.iitms.rfcampusdomain.authentication.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.authentication.dao.UniversityAndBoardDao;
import com.iitms.rfcampusdata.authentication.entity.UniversityMaster;
import com.iitms.rfcampusdomain.authentication.service.UniversityAndBoardService;
@Service
@Transactional
public class UniversityAndBoardServiceImpl implements UniversityAndBoardService{

	@Autowired
	UniversityAndBoardDao universityAndBoardDao;
	
	@Override
	public boolean addUniversity(UniversityMaster entity) {
	 
	    return universityAndBoardDao.addUniversityAndBoard(entity);
	}

	@Override
	public List<UniversityMaster> getAllUniversity(boolean onlyActive) {
		return universityAndBoardDao.getUniversityList(onlyActive);
	}

	@Override
	public boolean updateUniversity(UniversityMaster entity) {
		return universityAndBoardDao.updateUniversity(entity);
	}

    @Override
    public boolean getUniversityAlreadyExist(String univCode, String univName) {
   
        return universityAndBoardDao.getUniversityAlreadyExist(univCode, univName);
    }
	 
}
