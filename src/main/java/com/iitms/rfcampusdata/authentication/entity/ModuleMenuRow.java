package com.iitms.rfcampusdata.authentication.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ModuleMenuRow {

    @Id
    private int uid;

    private int parentId;

    private String parentName;

    private int childId;

    private String childName;

    private int depth;

    private int module;

    private String module_name;

    private String menu_tooltip;

    private String menu_link;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public int getChildId() {
        return childId;
    }

    public void setChildId(int childId) {
        this.childId = childId;
    }

    public String getChildName() {
        return childName;
    }

    public void setChildName(String childName) {
        this.childName = childName;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public int getModule() {
        return module;
    }

    public void setModule(int module) {
        this.module = module;
    }

    public String getMenu_tooltip() {
        return menu_tooltip;
    }

    public void setMenu_tooltip(String menu_tooltip) {
        this.menu_tooltip = menu_tooltip;
    }

    public String getMenu_link() {
        return menu_link;
    }

    public void setMenu_link(String menu_link) {
        this.menu_link = menu_link;
    }

    public String getModule_name() {
        return module_name;
    }

    public void setModule_name(String module_name) {
        this.module_name = module_name;
    }

    @Override
    public String toString() {
        return "Module Name: " + module_name + ", Parent Name: " + parentName + ", child name: " + childName;
    }
}
