package com.iitms.rfcampusdomain.payroll.service;

import java.util.List;

import com.iitms.rfcampusdata.payroll.masters.entity.PayscaleMasterEntity;

public interface PayScaleService {

    public int addPayScale(PayscaleMasterEntity payscaleMaster);

    public boolean getPayScaleDetail(PayscaleMasterEntity payscaleMaster);

    public List<PayscaleMasterEntity> getAllPayScale();

    public boolean updatePayscaleRecord(PayscaleMasterEntity payscaleEntity);

    boolean getScaleAlreadyExist(String scale);
    
    //public int deletePayscale(int id);

}
