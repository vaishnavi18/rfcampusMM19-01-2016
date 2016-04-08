package com.iitms.rfcampusdata.authentication.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.PaginationResponse;
import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.authentication.dao.RoleCreationDao;
import com.iitms.rfcampusdata.authentication.entity.RoleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.RoleTypeMasterEntity;

@Repository
public class RoleCreationDaoImpl implements RoleCreationDao {

    private static final Logger LOG = LoggerFactory.getLogger(RoleCreationDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<RoleMasterEntity> getRolesByUserType(int roleTypeId) throws GenericException {

        try {
            Session session = this.sessionFactory.getCurrentSession();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("roleId").as("roleId"));
            projectionList.add(Projections.property("roleName").as("roleName"));
            projectionList.add(Projections.property("roleDescription").as("roleDescription"));
            projectionList.add(Projections.property("active").as("active"));

            List<RoleMasterEntity> list = session.createCriteria(RoleMasterEntity.class).setProjection(projectionList)
                .add(Restrictions.eq("userTypeId", roleTypeId)).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
                .list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error while Retrieving Roles By User Type");
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public PaginationResponse getPaginationResponse(int sEcho, int pageStart, int pageLength, int sortColumn,
        String sortDirection, String search, int roleTypeId) throws GenericException {

        try {
            Session session = this.sessionFactory.getCurrentSession();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("roleId").as("roleId"));
            projectionList.add(Projections.property("roleName").as("roleName"));
            projectionList.add(Projections.property("roleDescription").as("roleDescription"));
            projectionList.add(Projections.property("active").as("active"));
            projectionList.add(Projections.property("userTypeId").as("userTypeId"));

            int totalRecord =
                ((Long) session.createCriteria(RoleMasterEntity.class).setProjection(Projections.rowCount())
                    .add(Restrictions.eq("userTypeId", roleTypeId)).uniqueResult()).intValue();

            List<RoleMasterEntity> list = session.createCriteria(RoleMasterEntity.class).setProjection(projectionList)
                .add(Restrictions.eq("userTypeId", roleTypeId)).setFirstResult(pageStart).setMaxResults(pageLength)
                .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

            PaginationResponse paginationResponse =
                setPaginationResponse(sEcho, pageStart, pageLength, totalRecord, list);

            return paginationResponse;
        } catch (Exception e) {
            throw new GenericException("Error : Pagination");
        }
    }

    private PaginationResponse setPaginationResponse(int sEcho, int pageStart, int pageLength, int totalRecord,
        List<RoleMasterEntity> list) throws GenericException {

        PaginationResponse paginationResponse = new PaginationResponse();
        paginationResponse.setsEcho(sEcho);
        paginationResponse.setiTotalRecords(totalRecord);
        paginationResponse.setiTotalDisplayRecords(totalRecord);
        paginationResponse.setiDisplayLength(pageLength);
        paginationResponse.setiDisplayStart(pageStart);
        paginationResponse.setAaData(list);

        return paginationResponse;
    }

    @Override
    public RoleMasterEntity getRolesInfo(int roleId) throws GenericException {

        try {
            RoleMasterEntity entity =
                (RoleMasterEntity) this.sessionFactory.getCurrentSession().get(RoleMasterEntity.class, roleId);
            return entity;
        } catch (Exception e) {
            throw new GenericException("Error while Getting Role Info By Id");
        }

    }

    @Override
    public boolean addRole(RoleMasterEntity roleMasterEntity) throws GenericException {

        try {
            this.sessionFactory.getCurrentSession().save(roleMasterEntity);
            return true;
        } catch (Exception e) {
            throw new GenericException("Error while Adding Role");
        }

    }

    @Override
    public boolean updateRole(RoleMasterEntity roleMasterEntity) throws GenericException {

        try {
            Session session = this.sessionFactory.getCurrentSession();
            RoleMasterEntity existingRoleEntity =
                (RoleMasterEntity) session.get(RoleMasterEntity.class, roleMasterEntity.getRoleId());
            existingRoleEntity.setRoleName(roleMasterEntity.getRoleName());
            existingRoleEntity.setRoleDescription(roleMasterEntity.getRoleDescription());
            existingRoleEntity.setActive(roleMasterEntity.getActive());
            session.update(existingRoleEntity);
            return true;
        } catch (Exception e) {
            throw new GenericException("Error while Updating Role");
        }

    }

    @Override
    public boolean isRoleExist(int roleID, String roleName) throws GenericException {

        try {
            Session session = this.sessionFactory.getCurrentSession();

            Criteria criteria = session.createCriteria(RoleMasterEntity.class).setProjection(Projections.rowCount())
                .add(Restrictions.eq("roleName", roleName));
            if (roleID != 0) {
                criteria.add(Restrictions.eq("userTypeId", roleID));
            }
            int count = ((Long) criteria.uniqueResult()).intValue();
            LOG.info("Exist Count : " + count);
            return count == 0 ? false : true;
        } catch (Exception e) {
            throw new GenericException("Error while Checking Role Existance");
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<RoleTypeMasterEntity> getRoleTypes() throws GenericException {

        try {
            Session session = this.sessionFactory.getCurrentSession();
            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("id").as("id"));
            projectionList.add(Projections.property("roleTypeName").as("roleTypeName"));

            List<RoleTypeMasterEntity> list = session.createCriteria(RoleTypeMasterEntity.class)
                .setProjection(projectionList).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error while Retrieving Role Types");
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<RoleMasterEntity> getAllRoles(int roleTypeId) throws GenericException {

        try {
            Session session = this.sessionFactory.getCurrentSession();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("roleId").as("roleId"));
            projectionList.add(Projections.property("roleName").as("roleName"));
            projectionList.add(Projections.property("roleDescription").as("roleDescription"));
            projectionList.add(Projections.property("active").as("active"));
            projectionList.add(Projections.property("userTypeId").as("userTypeId"));

            List<RoleMasterEntity> list = session.createCriteria(RoleMasterEntity.class).setProjection(projectionList)
                .add(Restrictions.eq("userTypeId", roleTypeId)).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
                .list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error while Retrieving All Roles BY Role Type");
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<RoleMasterEntity> getAllRoles() throws GenericException {

        try {
            Session session = this.sessionFactory.getCurrentSession();

            ProjectionList projectionList = Projections.projectionList();
            projectionList.add(Projections.property("roleId").as("roleId"));
            projectionList.add(Projections.property("roleName").as("roleName"));

            List<RoleMasterEntity> list = session.createCriteria(RoleMasterEntity.class).setProjection(projectionList)
                .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

            return list;
        } catch (Exception e) {
            throw new GenericException("Error while Retrieving All Roles");
        }
    }

}
