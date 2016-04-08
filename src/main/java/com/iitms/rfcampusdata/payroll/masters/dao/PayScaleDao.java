package com.iitms.rfcampusdata.payroll.masters.dao;

import java.util.List;

import com.iitms.rfcampusdata.payroll.masters.entity.PayscaleMasterEntity;

public interface PayScaleDao {

    public int addPayScale(PayscaleMasterEntity payscaleMaster);

    public boolean getPayScaleDetail(PayscaleMasterEntity payscaleMaster);

    public List<PayscaleMasterEntity> getAllPayScale();

    public boolean updatePayscaleRecord(PayscaleMasterEntity payscaleEntity);

    boolean getScaleAlreadyExist(final String scale);

    // public boolean updatePayscaleRecord(PayscaleDTO payscaleDTO);

    // public int deletePayscale(int id);

}
