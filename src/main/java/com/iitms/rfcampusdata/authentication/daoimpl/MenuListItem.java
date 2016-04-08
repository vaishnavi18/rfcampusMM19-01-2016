package com.iitms.rfcampusdata.authentication.daoimpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class MenuListItem implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private int menuId;

    private String menuName;

    private String menuUrl;

    private String menuLogoUrl;

    private int type;// 0-module,1-main menu,2-sub Menu

    private List<MenuListItem> subMenus = new ArrayList<MenuListItem>();

    public void addItem(MenuListItem subMenu) {
        subMenus.add(subMenu);
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public String getMenuLogoUrl() {
        return menuLogoUrl;
    }

    public void setMenuLogoUrl(String menuLogoUrl) {
        this.menuLogoUrl = menuLogoUrl;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public List<MenuListItem> getSubMenus() {
        return subMenus;
    }

    public void setSubMenus(List<MenuListItem> subMenus) {
        this.subMenus = subMenus;
    }

    @Override
    public String toString() {
        return "RoleMenuResponse [menuId=" + menuId + ", menuName=" + menuName + ", parentMenuId=" + 0 + ", submenu="
            + subMenus + "]";
    }

}
