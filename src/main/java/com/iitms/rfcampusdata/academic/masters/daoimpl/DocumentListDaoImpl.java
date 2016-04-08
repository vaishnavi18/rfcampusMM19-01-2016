package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.masters.dao.DocumentListDao;
import com.iitms.rfcampusdata.academic.masters.entity.DocumentListMasterEntity;

@Repository
public class DocumentListDaoImpl implements DocumentListDao {
    private static final Logger logger = LoggerFactory.getLogger(DocumentListDaoImpl.class);

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean addDocumentList(DocumentListMasterEntity entity) {
        this.sessionFactory.getCurrentSession().save(entity);

        return true;

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<DocumentListMasterEntity> getDocumentList() {
        List<DocumentListMasterEntity> list = this.sessionFactory.getCurrentSession()
            .createCriteria(DocumentListMasterEntity.class).addOrder(Order.asc("id")).list();

        logger.info("List of document:" + list);
        return list;
    }

    @Override
    public boolean updateDocumentList(DocumentListMasterEntity entity) {
        Session session = this.sessionFactory.getCurrentSession();
        DocumentListMasterEntity documentEntity =
            (DocumentListMasterEntity) session.get(DocumentListMasterEntity.class, entity.getId());
        logger.info("documentEntity : " + documentEntity);
        documentEntity.setDocumentName(entity.getDocumentName());
        session.update(documentEntity);
        return true;

    }

    /*
     * @Override
     * @SuppressWarnings("unchecked") public List<DocumentListEntity> getDocummentList() { List<DocumentListEntity> list
     * = this.sessionFactory.getCurrentSession().createCriteria(DocumentListEntity.class)
     * .addOrder(Order.asc("id")).list(); logger.info("List of document:" + list); return list; }
     */

    /*
     * @Override public List<DocumentListEntity> getDocumentList() { Session session =
     * sessionFactory.getCurrentSession(); List<DocumentListEntity> documentList =
     * session.createCriteria(DocumentListEntity.class).list(); logger.info(" docList:" + documentList); return
     * documentList; }
     */

}
