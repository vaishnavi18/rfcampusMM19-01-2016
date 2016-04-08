package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.dao.BankDao;
import com.iitms.rfcampusdata.academic.masters.entity.BankMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.BankService;

@Service
@Transactional
public class BankServiceImpl implements BankService{
    
    @Autowired
    private BankDao bankDao;

    @Override
    public List<BankMasterEntity> getAllBank() {
     
        return bankDao.getAllBank();
    }
    
    

}
