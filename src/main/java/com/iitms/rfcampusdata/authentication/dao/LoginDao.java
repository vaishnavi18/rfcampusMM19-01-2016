package com.iitms.rfcampusdata.authentication.dao;

public interface LoginDao {

    /* Method For Changing Password Forcefully */
    public void changePassword(String username, String password);

    /* Methods for Users Login Attempt */
    void updateFailAttempts(String username);

    void resetFailAttempts(String username);
}
