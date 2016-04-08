package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.masters.dao.BankDao;
import com.iitms.rfcampusdata.academic.masters.entity.BankMasterEntity;

@Repository
public class BankDaoImpl implements BankDao {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<BankMasterEntity> getAllBank() {
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("bankName").as("bankName"));
        List<BankMasterEntity> bankList =
            sessionFactory.getCurrentSession().createCriteria(BankMasterEntity.class).setProjection(projectionList)
                .setResultTransformer(new AliasToBeanResultTransformer(BankMasterEntity.class)).list();

        return bankList;
    }

}
