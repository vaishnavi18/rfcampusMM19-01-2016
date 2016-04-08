package com.iitms.rfcampusdomain.authentication.service;

import java.util.HashMap;
import java.util.List;

import com.iitms.rfcampusdata.authentication.daoimpl.MenuListItem;
import com.iitms.rfcampusdata.authentication.entity.MenuMasterEntity;

public interface MenuCreationService {

    public List<MenuMasterEntity> getMainMainById(int moduleId, int parentMenuId);

    public boolean addMainMenuCreation(MenuMasterEntity menuMasterEntity);

    public boolean updateMainMenuCreation(MenuMasterEntity menuMasterEntity);
    
    public List<MenuMasterEntity> getModulewiseMenu(int moduleId);

    public HashMap<Integer, MenuListItem> getModulewiseMenu(int moduleId, List<Integer> roleIds);
    
    public boolean isMenuExist(int parentMenuId, String menuName);
}
