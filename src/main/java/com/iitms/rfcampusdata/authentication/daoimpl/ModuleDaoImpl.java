package com.iitms.rfcampusdata.authentication.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.authentication.dao.ModuleDao;
import com.iitms.rfcampusdata.authentication.entity.ModuleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.RoleMenuAllocationEntity;

@Repository
public class ModuleDaoImpl implements ModuleDao {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<ModuleMasterEntity> listAuthorisedModule(List<Integer> roleIds) throws GenericException {

        try {
            ProjectionList projectionList = Projections.projectionList();
            projectionList
                .add(Projections.distinct(Projections.property("moduleMasterEntity.moduleId").as("moduleId")));
            projectionList.add(Projections.property("moduleMasterEntity.moduleName").as("moduleName"));

            List<ModuleMasterEntity> list =
                this.sessionFactory.getCurrentSession().createCriteria(RoleMenuAllocationEntity.class)
                    .createAlias("moduleMasterEntity", "moduleMasterEntity").setProjection(projectionList)
                    .add(Restrictions.in("roleId", roleIds)).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error while Retrieving Authorised Module");
        }
    }

    @Override
    public boolean addModule(ModuleMasterEntity moduleMasterEntity) throws GenericException {

        try {
            this.sessionFactory.getCurrentSession().save(moduleMasterEntity);
            return true;
        } catch (Exception e) {
            throw new GenericException("Error while Adding Module");
        }
    }

    @Override
    public boolean updateModule(ModuleMasterEntity moduleMasterEntity) throws GenericException {

        try {
            Session session = this.sessionFactory.getCurrentSession();
            ModuleMasterEntity entity =
                (ModuleMasterEntity) session.get(ModuleMasterEntity.class, moduleMasterEntity.getModuleId());
            entity.setModuleName(moduleMasterEntity.getModuleName());
            entity.setSerialNumber(moduleMasterEntity.getSerialNumber());
            entity.setModuleStatus(moduleMasterEntity.getModuleStatus());
            session.update(entity);
            return true;
        } catch (Exception e) {
            throw new GenericException("Error while Updating Module");
        }
    }

    @Override
    public boolean isModuleNameExist(int moduleId, String moduleName) throws GenericException {

        try {
            Session session = this.sessionFactory.getCurrentSession();
            Long o =
                (Long) session.createCriteria(ModuleMasterEntity.class).add(Restrictions.eq("moduleName", moduleName))
                    .add(Restrictions.ne("id", moduleId)).setProjection(Projections.rowCount()).uniqueResult();

            return o.intValue() != 0 ? true : false;
        } catch (Exception e) {
            throw new GenericException("Error while Checking Module Exist or Not");
        }
    }

    @Override
    public ModuleMasterEntity getModuleInfo(int moduleId) throws GenericException {

        try {
            ModuleMasterEntity entity =
                (ModuleMasterEntity) this.sessionFactory.getCurrentSession().get(ModuleMasterEntity.class, moduleId);
            return entity;
        } catch (Exception e) {
            throw new GenericException("Error while Module by Id");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<ModuleMasterEntity> listAllModule() throws GenericException {

        try {
            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("moduleId").as("moduleId"));
            projectionList.add(Projections.property("moduleName").as("moduleName"));
            projectionList.add(Projections.property("moduleStatus").as("moduleStatus"));
            projectionList.add(Projections.property("serialNumber").as("serialNumber"));

            List<ModuleMasterEntity> modulesList =
                this.sessionFactory.getCurrentSession().createCriteria(ModuleMasterEntity.class)
                    // .add(Restrictions.eq("", 1))
                    .setProjection(projectionList).addOrder(Order.asc("serialNumber"))
                    .setResultTransformer(new AliasToBeanResultTransformer(ModuleMasterEntity.class)).list();

            return modulesList;
        } catch (Exception e) {
            throw new GenericException("Error while Listing All Module");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<ModuleMasterEntity> listActiveModules() throws GenericException {
        List<ModuleMasterEntity> list = this.sessionFactory.getCurrentSession().createCriteria(ModuleMasterEntity.class)
            .setProjection(Projections.projectionList().add(Projections.property("moduleId").as("moduleId"))
                .add(Projections.property("moduleName").as("moduleName")))
            .add(Restrictions.eq("moduleStatus", 1)).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

        return list;
    }

}
