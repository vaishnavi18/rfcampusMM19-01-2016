package com.iitms.rfcampusdata.authentication.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampusdata.authentication.dao.MenuCreationDao;
import com.iitms.rfcampusdata.authentication.entity.MenuMasterEntity;
import com.iitms.rfcampusdata.authentication.entity.ModuleMenuRow;

@Repository
public class MenuCreationDaoImpl implements MenuCreationDao {

    private static final Logger logger = LoggerFactory.getLogger(MenuCreationDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @SuppressWarnings("unchecked")
    public List<MenuMasterEntity> getMainMainById(int moduleId, int parentMenuId) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("menuId").as("menuId"));
        projectionList.add(Projections.property("moduleId").as("moduleId"));
        projectionList.add(Projections.property("menuName").as("menuName"));
        projectionList.add(Projections.property("menuLink").as("menuLink"));
        projectionList.add(Projections.property("menuTooltip").as("menuToolTip"));// menuStatus
        projectionList.add(Projections.property("menuStatus").as("active"));
        projectionList.add(Projections.property("menuSerialNumber").as("menuSrno"));
        projectionList.add(Projections.property("parentMenuId").as("parentMenuId"));

        Criteria criteria = session.createCriteria(MenuMasterEntity.class);
        List<MenuMasterEntity> menuResponse = criteria.setProjection(projectionList)
            .add(Restrictions.eq("moduleId", moduleId)).add(Restrictions.eq("parentMenuId", parentMenuId))
            .addOrder(Order.asc("menuSerialNumber")).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

        return menuResponse;

    }

    @Override
    public boolean addMainMenuCreation(MenuMasterEntity menuMasterEntity) {
        this.sessionFactory.getCurrentSession().save(menuMasterEntity);
        return true;
    }

    @Override
    public boolean updateMainMenuCreation(MenuMasterEntity menuMasterEntity) {
        this.sessionFactory.getCurrentSession().update(menuMasterEntity);
        return true;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<MenuMasterEntity> getModulewiseMenu(int moduleId) {
        Session session = this.sessionFactory.getCurrentSession();
        // Hibernate.initialize("module.getModule()");
        // SerializationFeature.FAIL_ON_EMPTY_BEANS
        // session.enableFetchProfile("module");
        List<MenuMasterEntity> subMenuList;
        List<MenuMasterEntity> mainMenuList = session.createCriteria(MenuMasterEntity.class)
            // .createAlias("subMenu", "subMenu", JoinType.INNER_JOIN)
            .add(Restrictions.eq("parentMenuId", 0)).add(Restrictions.eq("moduleId", moduleId)).list();

        for (MenuMasterEntity mainMenu : mainMenuList) {
            subMenuList = session.createCriteria(MenuMasterEntity.class)
                // .createAlias("subMenu", "subMenu", JoinType.INNER_JOIN)
                .add(Restrictions.eq("parentMenuId", mainMenu.getMenuId())).add(Restrictions.eq("moduleId", moduleId))
                .list();
            mainMenu.setSubMenu(subMenuList);
        }
        // logger.info("Menu Size : " + mainMenuList .size() + " - " + mainMenuList);

        return mainMenuList;
    }

    /*
     * @SuppressWarnings("unchecked")
     * @Override public List<RoleMenuResponse> getModulewiseMenu(int moduleId, List<Integer> roleIds) { Session session
     * = this.sessionFactory.getCurrentSession(); List<Integer> assignedMenus =
     * session.createCriteria(RoleMenuAllocationEntity.class)
     * .setProjection(Projections.distinct(Projections.property("menuId"))) .add(Restrictions.in("roleId", roleIds))
     * .add(Restrictions.eq("moduleId", moduleId)) .list(); ProjectionList projectionList =
     * Projections.projectionList(); projectionList.add(Projections.property("menuMasterEntity.menuId").as("menuId"));
     * projectionList.add(Projections.property("menuMasterEntity.menuName").as("menuName"));
     * projectionList.add(Projections.property("menuMasterEntity.menuTooltip").as("menuTooltip"));
     * projectionList.add(Projections.property("menuMasterEntity.menuLink").as("menuLink"));
     * projectionList.add(Projections.property("menuMasterEntity.parentMenuId").as("parentMenuId")); //
     * Hibernate.initialize("module.getModule()"); // SerializationFeature.FAIL_ON_EMPTY_BEANS //
     * session.enableFetchProfile("module"); List<RoleMenuResponse> subMenuList; List<RoleMenuResponse> mainMenuList =
     * session.createCriteria(RoleMenuAllocationEntity.class) .createAlias("menuMasterEntity", "menuMasterEntity",
     * JoinType.INNER_JOIN) .setProjection(projectionList) .add(Restrictions.in("roleId", roleIds))
     * .add(Restrictions.eq("menuMasterEntity.parentMenuId", 0)) .add(Restrictions.eq("menuMasterEntity.moduleId",
     * moduleId)) .addOrder(Order.asc("menuMasterEntity.menuSerialNumber")) .setResultTransformer(new
     * AliasToBeanResultTransformer(RoleMenuResponse.class)) .list(); projectionList = Projections.projectionList();
     * projectionList.add(Projections.property("menuId").as("menuId"));
     * projectionList.add(Projections.property("menuName").as("menuName"));
     * projectionList.add(Projections.property("menuTooltip").as("menuTooltip"));
     * projectionList.add(Projections.property("menuLink").as("menuLink"));
     * projectionList.add(Projections.property("parentMenuId").as("parentMenuId")); for (RoleMenuResponse mainMenu :
     * mainMenuList) { subMenuList = session.createCriteria(MenuMasterEntity.class) //.createAlias("MenuMasterEntity",
     * "MenuMasterEntity", JoinType.INNER_JOIN) .setProjection(projectionList) //.add(Restrictions.eq("roleId", roleId))
     * .add(Restrictions.in("menuId", assignedMenus)) .add(Restrictions.eq("parentMenuId", mainMenu.getMenuId() ))
     * //.add(Restrictions.eq("MenuMasterEntity.moduleId", moduleId)) .addOrder(Order.asc("menuSerialNumber"))
     * .setResultTransformer(new AliasToBeanResultTransformer(RoleMenuResponse.class)) .list();
     * mainMenu.setSubmenu(subMenuList); } return mainMenuList; }
     */

    @SuppressWarnings("unchecked")
    @Override
    public HashMap<Integer, MenuListItem> getModulewiseMenu(int moduleId, List<Integer> roleIds) {

        Session session = this.sessionFactory.getCurrentSession();

        SQLQuery query = session
            .createSQLQuery(
                "WITH RECURSIVE nodes(uid, parentId, parentName, childId, childName, depth, module, menu_tooltip, menu_link, srno) AS ( "
                    + "SELECT " + "r.\"id\", r.\"id\", r.\"menu_name\", " + "r.\"id\", r.\"menu_name\", "
                    + " 1,r.module_id, r.menu_tooltip, r.menu_link, r.menu_serial_number "
                    + "FROM master.useraccess_menu_master AS r "+ "WHERE r.\"parent_menu_id\" = 0 " + "UNION ALL "
                    + "SELECT "+ "r.\"id\", r1.\"id\", r1.\"menu_name\", " + "r.\"id\", r.\"menu_name\", "
                    + " nd.depth + 1, r.module_id, r.menu_tooltip, r.menu_link, r.menu_serial_number  "
                    + "FROM master.useraccess_menu_master AS r, master.useraccess_menu_master AS r1, " + "nodes AS nd "
                    + "WHERE r.parent_menu_id = nd.childId and r.parent_menu_id=r1.id " + "AND depth < 5 " + ") "
                    + "SELECT distinct uid, parentId, parentName, childId, childName, depth, module,modulemaster.module_name, menu_tooltip, menu_link,srno FROM nodes nds, transaction.useraccess_user_role_allocation as userrole, transaction.useraccess_role_menu_allocation as menuaccess, master.useraccess_module_master as modulemaster  "
                    + "where modulemaster.id=module and userrole.user_id=" + moduleId
                    + " and userrole.role_id=menuaccess.useraccess_role_id and menu_id=parentId and module_id=module order by module,parentid,srno;")
            .addEntity(ModuleMenuRow.class);
        List<ModuleMenuRow> rows = query.list();
        int tmpModuleId = 0;
        int tmpParentId = 0;
        HashMap<Integer, MenuListItem> moduleMap = new HashMap<Integer, MenuListItem>();
        // List<MenuListItem> moduleList = new ArrayList<MenuListItem>();
        MenuListItem parentMenu = null;
        MenuListItem moduleItem = null;
        HashMap<Integer, MenuListItem> menuMap = new HashMap<Integer, MenuListItem>();
        for (ModuleMenuRow row : rows) {

            if (tmpModuleId != row.getModule()) {
                tmpModuleId = row.getModule();

                moduleItem = new MenuListItem();
                moduleItem.setMenuId(row.getModule());
                moduleItem.setMenuName(row.getModule_name());
                moduleItem.setMenuLogoUrl("resources/bootstrap/img/" + row.getModule_name().toLowerCase() + ".png");
                moduleMap.put(tmpModuleId, moduleItem);

                tmpParentId = row.getParentId();
                parentMenu = new MenuListItem();
                parentMenu.setMenuId(row.getParentId());
                parentMenu.setMenuName(row.getParentName());
                // adding Parent Menu to module
                moduleItem.addItem(parentMenu);
            } else {
                if (tmpParentId != row.getParentId()) {
                    tmpParentId = row.getParentId();
                    parentMenu = menuMap.get(tmpParentId);
                    if (parentMenu == null) {
                        parentMenu = new MenuListItem();
                        parentMenu.setMenuId(row.getParentId());
                        parentMenu.setMenuName(row.getParentName());
                        moduleItem.addItem(parentMenu);
                        continue;
                    }
                }
                MenuListItem menuItem = new MenuListItem();
                menuItem.setMenuId(row.getChildId());
                menuItem.setMenuName(row.getChildName());
                menuItem.setMenuUrl(row.getMenu_link());
                menuMap.put(menuItem.getMenuId(), menuItem);
                parentMenu.addItem(menuItem);
            }
        }
        System.out.println(moduleMap);
        return moduleMap;

    }

    @Override
    public boolean isMenuExist(int parentMenuId, String menuName) {
        /*
         * Session session = this.sessionFactory.getCurrentSession(); Long o = (Long)
         * session.createCriteria(MenuMasterEntity.class).add(Restrictions.eq("menuName", menuName))
         * .add(Restrictions.ne("parentMenuId", parentMenuId)).setProjection(Projections.rowCount()).uniqueResult();
         * return o.intValue() != 0 ? true : false;
         */

        System.out.println("parentMenuId=" + parentMenuId);
        System.out.println("menuName=" + menuName);
        boolean result = false;
        Session session = sessionFactory.getCurrentSession();
        MenuMasterEntity entity =
            (MenuMasterEntity) session.createCriteria(MenuMasterEntity.class).add(Restrictions.eq("menuName", menuName))
                .add(Restrictions.eq("parentMenuId", parentMenuId)).uniqueResult();

        System.out.println("etity=" + entity);
        if (entity != null) {
            result = true;
        }
        return result;
    }

}
