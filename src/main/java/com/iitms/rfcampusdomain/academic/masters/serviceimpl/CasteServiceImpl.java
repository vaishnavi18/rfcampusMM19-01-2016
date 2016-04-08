package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.dao.CasteDao;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.CasteService;
@Service
@Transactional
public class CasteServiceImpl implements CasteService {
   @Autowired
    CasteDao admissionCasteMasterDao;
    @Override
    public List<CasteMasterEntity> getCastList() {
       
        return admissionCasteMasterDao.getCastList();
    }

}
