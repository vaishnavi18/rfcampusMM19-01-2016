package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.dao.MothertongueDao;
import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.MothertongueService;

@Service
@Transactional
public class MothertongueServiceImpl implements MothertongueService {
    
    @Autowired
    MothertongueDao mothertongueDao;

    @Override
    public boolean addMothertongue(MothertongueMasterEntity entity) {
        // TODO Auto-generated method stub
        return mothertongueDao.addMothertongue(entity);
    }

    @Override
    public List<MothertongueMasterEntity> getMothertongue() {
        // TODO Auto-generated method stub
        return mothertongueDao.getMothertongue();
    }

    @Override
    public boolean updateMothertongue(MothertongueMasterEntity entity) {
        // TODO Auto-generated method stub
        return mothertongueDao.updateMothertongue(entity);
    }

}
