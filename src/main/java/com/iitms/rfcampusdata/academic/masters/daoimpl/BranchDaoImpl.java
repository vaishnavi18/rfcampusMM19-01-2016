package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.masters.dao.BranchDao;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;

@Repository
public class BranchDaoImpl implements BranchDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean addBranch(final BranchMasterEntity entity) {
        Session session = sessionFactory.getCurrentSession();
        session.save(entity);
        return true;
    }

    @Override
    public List<BranchMasterEntity> getAllBranch() {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
        List<BranchMasterEntity> branchList = session.createCriteria(BranchMasterEntity.class).list();
        return branchList;
    }

    @Override
    public boolean updateBranch(BranchMasterEntity entity) {
        Session session = sessionFactory.getCurrentSession();
        BranchMasterEntity branchEntity = (BranchMasterEntity) session.get(BranchMasterEntity.class, entity.getId());
        branchEntity.setBranchDegreeNumber(entity.getBranchDegreeNumber());
        // branchEntity.setDeptNo(entity.getDeptNo());
        // branchEntity.setBranchShortName(entity.getBranchShortName());
        // branchEntity.setBranchLongName(entity.getBranchLongName());
        branchEntity.setBranchDuration(entity.getBranchDuration());
        branchEntity.setBranchCode(entity.getBranchCode());
        branchEntity.setBranchDegreeType(entity.getBranchDegreeType());
        branchEntity.setBranchIntakeRound1(entity.getBranchIntakeRound1());
        branchEntity.setBranchIntakeRound2(entity.getBranchIntakeRound2());
        branchEntity.setBranchIntakeRound3(entity.getBranchIntakeRound3());
        branchEntity.setBranchIntakeRound4(entity.getBranchIntakeRound4());
        branchEntity.setBranchIntakeRound5(entity.getBranchIntakeRound5());
        branchEntity.setBranchTotalIntake(entity.getBranchTotalIntake());
        session.update(branchEntity);
        return true;
    }

    @Override
    public boolean getBranchAlreadyExist(final String branchShortName, final String branchLongName) {
        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        BranchMasterEntity entity = (BranchMasterEntity) session.createCriteria(BranchMasterEntity.class)
            .add(Restrictions.eq("branchShortName", branchShortName))
            .add(Restrictions.eq("branchLongName", branchLongName)).uniqueResult();
        if (entity != null) {
            result = true;
        }
        return result;
    }

    @Override
    public List<BranchMasterEntity> getBranchByDegree(final int degreeId) {
        Session session = sessionFactory.getCurrentSession();
        @SuppressWarnings("unchecked")
        List<BranchMasterEntity> branchList = session.createCriteria(BranchMasterEntity.class)
            .add(Restrictions.eq("branchDegreeNumber", degreeId)).list();
        return branchList;
    }

}
