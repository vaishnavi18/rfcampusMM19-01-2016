package com.iitms.rfcampusdomain.payroll.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.payroll.masters.dao.PayScaleDao;
import com.iitms.rfcampusdata.payroll.masters.entity.PayscaleMasterEntity;
import com.iitms.rfcampusdomain.payroll.service.PayScaleService;

@Service
@Transactional
public class PayScaleServiceImpl implements PayScaleService {

    @Autowired
    PayScaleDao payScaleDao;

    @Override
    public int addPayScale(PayscaleMasterEntity payscaleMaster) {
        return payScaleDao.addPayScale(payscaleMaster);
    }

    @Override
    public boolean getPayScaleDetail(PayscaleMasterEntity payscaleMaster) {
        return payScaleDao.getPayScaleDetail(payscaleMaster); 
    }

    @Override
    public List<PayscaleMasterEntity> getAllPayScale() {
        return payScaleDao.getAllPayScale(); 
    }

    @Override
    public boolean updatePayscaleRecord(PayscaleMasterEntity payscaleEntity) { 
        return payScaleDao.updatePayscaleRecord(payscaleEntity);
    }
    
    @Override
    public boolean getScaleAlreadyExist(final String scale) { 
        return payScaleDao.getScaleAlreadyExist(scale);
    }

  /*  @Override
    public int deletePayscale(int id) {
        return payScaleDao.deletePayscale(id);
    }
    */
    
}
