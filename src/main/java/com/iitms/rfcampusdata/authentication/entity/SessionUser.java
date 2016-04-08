package com.iitms.rfcampusdata.authentication.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.iitms.rfcampusdata.authentication.daoimpl.MenuListItem;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SessionUser implements Serializable {

    private static final long serialVersionUID = 1L;

    private CustomLoginUser customLoginUser;

    private Map<Integer, MenuListItem> moduleMap = new HashMap<Integer, MenuListItem>();

    private Map<Integer, Integer> authorisedMenu = new HashMap<Integer, Integer>();

    private int selectedModule = 0;

    public CustomLoginUser getCustomLoginUser() {
        return customLoginUser;
    }

    public void setCustomLoginUser(CustomLoginUser customLoginUser) {
        this.customLoginUser = customLoginUser;
    }

    public Map<Integer, MenuListItem> getModuleMap() {
        return moduleMap;
    }

    public void setModuleMap(Map<Integer, MenuListItem> moduleMap) {
        this.moduleMap = moduleMap;
    }

    public int getSelectedModule() {
        return selectedModule;
    }

    public void setSelectedModule(int selectedModule) {
        this.selectedModule = selectedModule;
    }

    public List<MenuListItem> getModuleMenus() {
        MenuListItem moduleMenu = moduleMap.get(selectedModule);
        if (moduleMenu != null) {
            return moduleMenu.getSubMenus();

        } else {
            return new ArrayList<MenuListItem>();
        }
    }
    
    @Override
    public String toString() {
        return "SessionUser [customLoginUser=" + customLoginUser + ", selectedModule=" + selectedModule + "]";
    }

    public Map<Integer, Integer> getAuthorisedMenu() {
        return authorisedMenu;
    }

    public void setAuthorisedMenu(Map<Integer, Integer> authorisedMenu) {
        this.authorisedMenu = authorisedMenu;
    }

    public boolean hasAuthority(int pageno) {
        // return (this.authorisedMenu.get(pageno) != null ? true : false);
        return true;
    }
}
