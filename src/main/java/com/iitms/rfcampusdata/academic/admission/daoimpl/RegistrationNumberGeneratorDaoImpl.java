package com.iitms.rfcampusdata.academic.admission.daoimpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.admission.dao.RegistrationNumberGeneratorDao;
import com.iitms.rfcampusdata.academic.masters.entity.BatchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;

@Repository
public class RegistrationNumberGeneratorDaoImpl implements RegistrationNumberGeneratorDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public DegreeMasterEntity getDegree(int degreeId) {
        return (DegreeMasterEntity) this.sessionFactory.getCurrentSession().get(DegreeMasterEntity.class, degreeId);
    }

    @Override
    public BranchMasterEntity getBranch(int branchId) {
        return (BranchMasterEntity) this.sessionFactory.getCurrentSession().get(BranchMasterEntity.class, branchId);
    }

    @Override
    public BatchMasterEntity getBatch(int sessionId) {
        return (BatchMasterEntity) this.sessionFactory.getCurrentSession().get(BatchMasterEntity.class, sessionId);
    }

}
