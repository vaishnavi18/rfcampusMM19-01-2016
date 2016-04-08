package com.iitms.rfcampusdomain.academic.masters.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.masters.entity.DocumentListMasterEntity;

public interface DocumentListService {
    boolean addDocumentList(DocumentListMasterEntity entity);

    List<DocumentListMasterEntity> getDocumentList();

    boolean updateDocumentList(DocumentListMasterEntity documentEntity);
    
  

  
}
