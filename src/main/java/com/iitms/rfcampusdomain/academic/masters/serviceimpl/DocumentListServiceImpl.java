package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampusdata.academic.masters.dao.DocumentListDao;
import com.iitms.rfcampusdata.academic.masters.entity.DocumentListMasterEntity;
import com.iitms.rfcampusdomain.academic.masters.service.DocumentListService;

@Service
@Transactional
public class DocumentListServiceImpl implements DocumentListService {
    @Autowired
    DocumentListDao documentListDao;

    @Override
    public List<DocumentListMasterEntity> getDocumentList() {
        return documentListDao.getDocumentList();
      
    }

    @Override
    public boolean addDocumentList(DocumentListMasterEntity entity) {
        return documentListDao.addDocumentList(entity);
    }

    @Override
    public boolean updateDocumentList(DocumentListMasterEntity documentEntity) {
        // TODO Auto-generated method stub
        return documentListDao.updateDocumentList(documentEntity);
    }

 }
