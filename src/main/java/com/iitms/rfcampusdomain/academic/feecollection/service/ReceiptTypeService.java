package com.iitms.rfcampusdomain.academic.feecollection.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;

public interface ReceiptTypeService {
    public boolean addReceiptTypeService(final FeesReceiptTypeEntity feesReceiptTypeEntity);

    public boolean updateReceiptTypeService(final FeesReceiptTypeEntity entity);

    public boolean deleteReceiptTypeService(final int id);

    public FeesReceiptTypeEntity getReceiptTypeService(final int id);

    public List<FeesReceiptTypeEntity> listAllReceiptTypeService();

    public boolean getReceiptTypeForAlreadyExists(final String receiptCode, final String receiptTitle);

    public String getReceiptCode(final int receiptId);

    public List<FeesReceiptTypeEntity> getMiscellaneousReceipt();
}
