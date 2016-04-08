package com.iitms.rfcampusdata.academic.admission.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.admission.dao.ReferenceFileDao;
import com.iitms.rfcampusdata.academic.admission.entity.ReferenceFileEntity;
import com.iitms.rfcampusdata.academic.admission.entity.RegistrationNumberFormatEntity;

@Repository
public class ReferenceFileDaoImpl implements ReferenceFileDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public int addReferenceRecord(ReferenceFileEntity referenceFileEntity) {
        this.sessionFactory.getCurrentSession().save(referenceFileEntity);
        return ConstantUtil.RECORD_INSERTED;
    }

    @Override
    public int updateReferenceRecord(ReferenceFileEntity referenceFileEntity) {
        Session session = this.sessionFactory.getCurrentSession();

        ReferenceFileEntity sessionEntity =
            (ReferenceFileEntity) session.get(ReferenceFileEntity.class, referenceFileEntity.getId());
        sessionEntity.setCreateRegistrationNumber(referenceFileEntity.isCreateRegistrationNumber());
        sessionEntity.setRegistrationNumberFormatId(referenceFileEntity.getRegistrationNumberFormatId());
        session.update(sessionEntity);

        return ConstantUtil.RECORD_UPDATED;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<RegistrationNumberFormatEntity> getRegistrationNumberFormats() {
        List<RegistrationNumberFormatEntity> list =
            this.sessionFactory.getCurrentSession().createCriteria(RegistrationNumberFormatEntity.class).list();

        return list;
    }

    @Override
    public ReferenceFileEntity getReferenceRecord() {
        ReferenceFileEntity entity = (ReferenceFileEntity) this.sessionFactory.getCurrentSession()
            .createCriteria(ReferenceFileEntity.class).setMaxResults(1).uniqueResult();

        return entity;
    }

}
