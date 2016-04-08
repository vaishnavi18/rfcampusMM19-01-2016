package com.iitms.rfcampusdomain.academic.admission.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.admission.dao.ReferenceFileDao;
import com.iitms.rfcampusdata.academic.admission.entity.ReferenceFileEntity;
import com.iitms.rfcampusdata.academic.admission.entity.RegistrationNumberFormatEntity;
import com.iitms.rfcampusdomain.academic.admission.service.ReferenceFileService;

@Service
@Transactional
public class ReferenceFileServiceImpl implements ReferenceFileService{ 

    @Autowired
    private ReferenceFileDao referenceFileDao;
    
    @Override
    public int addReferenceRecord(ReferenceFileEntity referenceFileEntity) {
        int flag = 0;
        if(referenceFileEntity.getId() == 0){
            flag = referenceFileDao.addReferenceRecord(referenceFileEntity);
        }else{
            flag = this.updateReferenceRecord(referenceFileEntity);
        }
        return flag;
    }

    @Override
    public int updateReferenceRecord(ReferenceFileEntity referenceFileEntity) {
        return referenceFileDao.updateReferenceRecord(referenceFileEntity);
    }

    @Override
    public List<RegistrationNumberFormatEntity> getRegistrationNumberFormats() {
        return referenceFileDao.getRegistrationNumberFormats();
    }

    @Override
    public ReferenceFileEntity getReferenceRecord() {
        return referenceFileDao.getReferenceRecord();
    }

}
