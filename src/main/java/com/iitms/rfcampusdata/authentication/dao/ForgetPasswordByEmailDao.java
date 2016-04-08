package com.iitms.rfcampusdata.authentication.dao;

import com.iitms.rfcampusdata.authentication.entity.UserMasterEntity;

public interface ForgetPasswordByEmailDao {
    public UserMasterEntity checkEmail(String email);

    public Boolean updatePassword(int id, String password);
}
