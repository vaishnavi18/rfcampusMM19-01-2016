package com.iitms.rfcampusdata.authentication.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "transaction.useraccess_user_role_allocation")
public class UserRoleAllocationEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "useraccess_user_role_allocation", columnDefinition = "serial")
    private int id;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "role_id")
    private int roleId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private UserMasterEntity userMasterEntity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "role_id", referencedColumnName = "id", insertable = false, updatable = false, nullable = false)
    private RoleMasterEntity roleMasterEntity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public UserMasterEntity getUserMasterEntity() {
        return userMasterEntity;
    }

    public void setUserMasterEntity(UserMasterEntity userMasterEntity) {
        this.userMasterEntity = userMasterEntity;
    }

    public RoleMasterEntity getRoleMasterEntity() {
        return roleMasterEntity;
    }

    public void setRoleMasterEntity(RoleMasterEntity roleMasterEntity) {
        this.roleMasterEntity = roleMasterEntity;
    }

}
