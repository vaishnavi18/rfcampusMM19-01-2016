package com.iitms.rfcampusdata.academic.masters.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.DocumentListMasterEntity;

public interface DocumentListDao {

    public boolean addDocumentList(DocumentListMasterEntity entity);

    public List<DocumentListMasterEntity> getDocumentList();

    public boolean updateDocumentList(DocumentListMasterEntity documentEntity);
}
