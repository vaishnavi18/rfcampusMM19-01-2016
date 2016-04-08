package com.iitms.rfcampusdata.academic.feecollection.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.feecollection.entity.FeesReceiptTypeEntity;

public interface ReceiptTypeDao {
    public boolean addReceiptType(final FeesReceiptTypeEntity feesReceiptTypeEntity);

    public boolean updateReceiptType(final FeesReceiptTypeEntity entity);

    public boolean deleteReceiptType(final int id);

    public FeesReceiptTypeEntity getReceiptType(final int id);

    public List<FeesReceiptTypeEntity> listAllReceiptType();

    public boolean getReceiptTypeForAlreadyExists(final String receiptCode, final String receiptTitle);

    public String getReceiptCode(final int receiptId);

    public List<FeesReceiptTypeEntity> getMiscellaneousReceipt();

}
