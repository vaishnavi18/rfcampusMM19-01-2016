package com.iitms.rfcampusdata.authentication.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.authentication.dao.UserCreationDao;
import com.iitms.rfcampusdata.authentication.entity.RoleMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.UserMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.UserRoleAllocationEntity;

@Repository
public class UserCreationDaoImpl implements UserCreationDao {

    private static final Logger logger = LoggerFactory.getLogger(UserCreationDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean addUser(UserMasterEntity userMasterEntity) {
        Session session = this.sessionFactory.getCurrentSession();
        userMasterEntity.setEnabled(true);
        int userId = (Integer) session.save(userMasterEntity);
        allocateRoles(session, userId, userMasterEntity.getRoleIds());
        return true;
    }

    @Override
    public boolean addTemporaryUser(UserMasterEntity userMasterEntity) {
        Session session = this.sessionFactory.getCurrentSession();
        userMasterEntity.setEnabled(true);
        userMasterEntity.setTemporaryUser(true);
        int userId = (Integer) session.save(userMasterEntity);
        int roleId = getRoleByName(session, "TempUser");
        allocateRoles(session, userId, String.valueOf(roleId));
        return true;
    }

    @Override
    public boolean updateUser(UserMasterEntity userMasterEntity) {
        Session session = this.sessionFactory.getCurrentSession();
        UserMasterEntity sessionEntity =
            (UserMasterEntity) session.get(UserMasterEntity.class, userMasterEntity.getUserId());
        sessionEntity.setName(userMasterEntity.getName());
        sessionEntity.setUsername(userMasterEntity.getUsername());
        sessionEntity.setPassword(userMasterEntity.getPassword());
        sessionEntity.setRoleIds(userMasterEntity.getRoleIds());
        sessionEntity.setCounter(userMasterEntity.getCounter());
        sessionEntity.setSetWorkingDate(userMasterEntity.getSetWorkingDate());
        sessionEntity.setActive(userMasterEntity.getActive());
        sessionEntity.setMobileNumber(userMasterEntity.getMobileNumber());
        sessionEntity.setEmailid(userMasterEntity.getEmailid());
        sessionEntity.setUserPhoto(userMasterEntity.getUserPhoto());
        session.update(sessionEntity);

        allocateRoles(session, sessionEntity.getUserId(), userMasterEntity.getRoleIds());
        return true;
    }

    @Override
    public UserMasterEntity getUserInformation(int userId) {
        Session session = this.sessionFactory.getCurrentSession();
        // session.disableFetchProfile("roleMasterEntityList");
        UserMasterEntity userMasterEntity = (UserMasterEntity) session.get(UserMasterEntity.class, userId);
        return userMasterEntity;
    }

    @Override
    public boolean isUserAvailable(String username) {
        Object o = this.sessionFactory.getCurrentSession().createCriteria(UserMasterEntity.class)
            .add(Restrictions.eq("username", username)).setProjection(Projections.rowCount()).uniqueResult();
        return o != null ? true : false;
    }

    /* Private Methods */
    private void allocateRoles(Session session, int userId, String roleIds) {
        UserRoleAllocationEntity entity;
        logger.info("Role Ids : " + roleIds);
        session.createQuery("Delete From UserRoleAllocationEntity entity where entity.userId = :userId")
            .setParameter("userId", userId).executeUpdate();

        for (String roleId : roleIds.split(",")) {
            entity = new UserRoleAllocationEntity();
            entity.setUserId(userId);
            entity.setRoleId(Integer.parseInt(roleId));
            session.save(entity);
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<UserMasterEntity> searchUserByCriteria(int searchBy, String searchText) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("userId").as("userId"));
        projectionList.add(Projections.property("name").as("name"));
        projectionList.add(Projections.property("username").as("username"));

        Criteria criteria = session.createCriteria(UserMasterEntity.class).setProjection(projectionList)
            .setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);

        switch (searchBy) {
            case ConstantUtil.USER_NAME: {
                criteria.add(Restrictions.ilike("name", searchText + "%"));
            }
                break;
            case ConstantUtil.USER_ID: {
                criteria.add(Restrictions.eq("userId", Integer.parseInt(searchText)));
            }
                break;
            case ConstantUtil.LOGIN_ID: {
                criteria.add(Restrictions.ilike("username", searchText + "%"));
            }
                break;
        }

        List<UserMasterEntity> list = criteria.list();

        return list;
    }

    private int getRoleByName(Session session, String roleName) {
        int roleId = (Integer) session.createCriteria(RoleMasterEntity.class)
            .setProjection(Projections.property("roleId")).add(Restrictions.eq("roleName", roleName)).uniqueResult();

        return roleId;
    }

    @Override
    public List<MasterModel> getNonFacultyUser() {
        String[] roleTypes = {"faculty"};

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("user.id").as("id"));
        projectionList.add(Projections.property("user.name").as("name"));

        @SuppressWarnings("unchecked")
        List<MasterModel> nonFacultyUser = this.sessionFactory.getCurrentSession()
            .createCriteria(UserRoleAllocationEntity.class).createAlias("userMasterEntity", "user")
            .createAlias("roleMasterEntity", "role").createAlias("roleMasterEntity.roleTypeMasterEntity", "roleType")
            .setProjection(projectionList).add(Restrictions.not(Restrictions.in("roleType.roleTypeName", roleTypes)))
            .setResultTransformer(new AliasToBeanResultTransformer(MasterModel.class)).list();

        return nonFacultyUser;
    }
}
