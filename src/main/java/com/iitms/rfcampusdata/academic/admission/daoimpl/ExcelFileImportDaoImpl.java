package com.iitms.rfcampusdata.academic.admission.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.academic.admission.dao.ExcelFileImportDao;
import com.iitms.rfcampusdata.academic.admission.entity.ExcelFileImportEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.GenderMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.QuotaMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StateMasterEntity;

/**
 * @author Sachinmt
 */
@Repository
public class ExcelFileImportDaoImpl implements ExcelFileImportDao {

    private static final Logger LOG = LoggerFactory.getLogger(ExcelFileImportDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    public ExcelFileImportDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Session currentSession() {

        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("unchecked")
    @Override
    public int getBranchId(String branch) {

        LOG.info("Get Allocated Category Name  :", branch);
        String query1 =
            "from BranchMasterEntity where branchShortName =:branchShortName or branchLongName=:branchLongName";
        Query query = currentSession().createQuery(query1).setParameter("branchShortName", branch.trim())
            .setParameter("branchLongName", branch.trim());
        List<BranchMasterEntity> list = query.list();
        return list.get(0).getId();
    }

    @SuppressWarnings("unchecked")
    @Override
    public int getAllocatedCategoryId(String categoryName) {

        LOG.info("Get Allocated Category Name  :", categoryName);

        String q1 = "from CategoryMasterEntity where categoryName =:categoryName";
        Query query = currentSession().createQuery(q1).setParameter("categoryName", categoryName.trim());
        List<CategoryMasterEntity> list = query.list();
        System.out.println("category:=" + list);
        return list.get(0).getId();
    }

    @SuppressWarnings("unchecked")
    @Override
    public int getCandidateCategoryId(String categoryName) {

        System.out.println("category name" + categoryName);
        LOG.info("Get Allocated Category Name  :", categoryName);
        String queryDel = "from CategoryMasterEntity where categoryName =:categoryName";
        Query query = currentSession().createQuery(queryDel).setParameter("categoryName", categoryName.trim());
        List<CategoryMasterEntity> list = query.list();
        return list.get(0).getId();
    }

    @SuppressWarnings("unchecked")
    @Override
    public int getStateId(String state) {

        LOG.info("Get State Name  :", state);
        String queryDel = "from StateMasterEntity where state =:state";
        Query query = currentSession().createQuery(queryDel).setParameter("state", state.trim());
        List<StateMasterEntity> list = query.list();
        return list.get(0).getId();
    }

    @SuppressWarnings("unchecked")
    @Override
    public int getQuotaId(String quota) {

        LOG.info("Get Quota Name  :", quota);
        String queryDel = "from QuotaMasterEntity where quotaName =:quota";
        Query query = currentSession().createQuery(queryDel).setParameter("quota", quota.trim());
        List<QuotaMasterEntity> list = query.list();
        return list.get(0).getId();

    }

    @SuppressWarnings("unchecked")
    @Override
    public int getGenderId(String gender) {

        LOG.info("Get Gender Name  :", gender);
        String queryDel = "from GenderMasterEntity where genderName =:gender";
        Query query = currentSession().createQuery(queryDel).setParameter("gender", gender.trim());
        List<GenderMasterEntity> list = query.list();
        return list.get(0).getId();

    }

    @Override
    public void save(ExcelFileImportEntity admissionExcelEntityService) {
        currentSession().save(admissionExcelEntityService);
        currentSession().flush();
    }

}
