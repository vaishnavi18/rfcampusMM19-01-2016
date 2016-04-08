package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.masters.dao.StudentMeritListDao;
import com.iitms.rfcampusdata.academic.masters.entity.MeritListStoreMaster;
import com.iitms.rfcampusdata.academic.masters.entity.MeritListTransactionEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListSortingEntity;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;

@Repository
public class StudentMeritListDaoImpl implements StudentMeritListDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private SessionUser sessionUser;

    @Override
    public Session currentSession() {
        @SuppressWarnings("unused")
        Session session = sessionFactory.getCurrentSession();
        return null;
    }

    @Override
    public StudentMeritListMasterEntity getStudentId(int studentId) {
        return null;
    }

    @Override
    public StudentMeritListMasterEntity getId(int id) {
        return null;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<TempStudentRegistrationEntity> generateMeritList(final int category, final String restriction,
        final String orderedColumns) {
        Session session = sessionFactory.getCurrentSession();
        // @SuppressWarnings("unchecked")
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("applicationId").as("applicationId"));
        projectionList.add(Projections.property("studentName").as("studentName"));
        projectionList.add(Projections.property("fatherName").as("fatherName"));
        projectionList.add(Projections.property("lastName").as("lastName"));
        projectionList.add(Projections.property("gender").as("gender"));
        projectionList.add(Projections.property("categoryId").as("categoryId"));
        // projectionList.add(Projections.property("religionId").as("religionId"));
        projectionList.add(Projections.property("categoryEntity.categoryName").as("category"));
        projectionList.add(Projections.property("entranceExamRank").as("entranceExamRank"));
        // projectionList.add(Projections.property("religionEntity.religionName").as("religion"));

        Criteria criteria = session.createCriteria(TempStudentRegistrationEntity.class)
            .createAlias("categoryEntity", "categoryEntity").setProjection(projectionList);

        /*
         * Criteria criteria = session.createCriteria(TempStudentRegistrationEntity.class).createAlias("categoryEntity",
         * "categoryEntity") .setProjection(Projections.distinct(Projections.projectionList()));
         */
        if (category != 0) {
            criteria.add(Restrictions.eq("categoryId", category));
        }

        /*
         * if (religion != 0) { criteria.add(Restrictions.eq("religionId", religion)); }
         */
        for (String condition : restriction.split(",")) {
            String[] conditionPart = condition.split("#");
            int conditionIndex = Integer.parseInt(conditionPart[0]);

            switch (conditionIndex) {
                case ConstantUtil.TENTH_PERCENTAGE:
                    criteria
                        .add(Restrictions.sqlRestriction("this_.ssc_perentage" + conditionPart[1] + conditionPart[2]));
                    break;
                case ConstantUtil.TWELVE_PERCENTAGE:
                    criteria
                        .add(Restrictions.sqlRestriction("this_.hsc_percentage" + conditionPart[1] + conditionPart[2]));
                    break;
                case ConstantUtil.NUMBER_OF_STUDENT:
                    criteria.setMaxResults(Integer.parseInt(conditionPart[2]));
                    break;
                case ConstantUtil.CATEGORY:
                    conditionPart[1] = conditionPart[1].replaceAll("\\$", ",");
                    conditionPart[1] = conditionPart[1].substring(0, conditionPart[1].length() - 1);
                    criteria.add(Restrictions.sqlRestriction("this_.category_id in ( " + conditionPart[1] + " )"));
                    break;

                default:
                    break;
            }
        }

        if (orderedColumns != null) {
            // criteria.add(
            // Restrictions.sqlRestriction("order by " + orderedColumns.substring(0, orderedColumns.length() - 1)));
            for (String column : orderedColumns.split(",")) {
                criteria.addOrder(Order.asc(column));
            }

        }

        List<TempStudentRegistrationEntity> categoryList =
            criteria.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

        return categoryList;
    }

    @Override
    public List<TempStudentRegistrationEntity> viewMeritList() {
        return null;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<StudentMeritListSortingEntity> getSortingList() {
        List<StudentMeritListSortingEntity> list =
            this.sessionFactory.getCurrentSession().createCriteria(StudentMeritListSortingEntity.class).list();

        return list;
    }

    @Override
    public int transferMeritList(final String meritListName, MeritListTransactionEntity[] studentList) {
        Session session = this.sessionFactory.getCurrentSession();
        MeritListStoreMaster meritListEntity = new MeritListStoreMaster();
        meritListEntity.setListName(meritListName);
        meritListEntity.setPreparationDate(new Date());
        meritListEntity.setCreatedBy(sessionUser.getCustomLoginUser().getUserId());
        int meritListId = (Integer) session.save(meritListEntity);

        for (MeritListTransactionEntity student : studentList) {
            student.setMeritListId(meritListId);
            session.save(student);
        }

        return meritListId;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<MeritListStoreMaster> viewAllMeritList() {
        Session session = this.sessionFactory.getCurrentSession();
        System.err.println("SHOWING all MERIT LIST IN DAO");
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("listNumber").as("listNumber"));
        projectionList.add(Projections.property("listName").as("listName"));
        projectionList.add(Projections.property("preparationDate").as("preparationDate"));
        projectionList.add(Projections.property("userMasterEntity.name").as("createdBy"));

        List<MeritListStoreMaster> list = session.createCriteria(MeritListStoreMaster.class)
            .createAlias("userMasterEntity", "userMasterEntity").setProjection(projectionList)
            .addOrder(Order.desc("preparationDate")).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();

        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<TempStudentRegistrationEntity> getMeritList(int meritListId) {
        Session session = sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("student.id").as("id"));
        projectionList.add(Projections.property("student.applicationId").as("applicationId"));
        projectionList.add(Projections.property("student.studentName").as("studentName"));
        projectionList.add(Projections.property("student.fatherName").as("fatherName"));
        projectionList.add(Projections.property("student.lastName").as("lastName"));
        projectionList.add(Projections.property("student.gender").as("gender"));
        projectionList.add(Projections.property("genderMasterEntity.genderName").as("genderName"));
        projectionList.add(Projections.property("student.categoryId").as("categoryId"));
        projectionList.add(Projections.property("student.entranceExamRank").as("entranceExamRank"));
        projectionList.add(Projections.property("categoryEntity.categoryName").as("category"));

        List<TempStudentRegistrationEntity> list = session.createCriteria(MeritListTransactionEntity.class)
            .createAlias("tempStudentRegistrationEntity", "student")
            .createAlias("student.genderMasterEntity", "genderMasterEntity")
            .createAlias("student.categoryEntity", "categoryEntity").setProjection(projectionList)
            .add(Restrictions.eq("meritListId", meritListId)).addOrder(Order.asc("serialNumberMeritlist"))
            .setResultTransformer(new AliasToBeanResultTransformer(TempStudentRegistrationEntity.class)).list();

        return list;
    }

    @Override
    public String getMeritListNameById(final int meritListId) {
        MeritListStoreMaster entity =
            (MeritListStoreMaster) this.sessionFactory.getCurrentSession().get(MeritListStoreMaster.class, meritListId);

        return entity.getListName();
    }

    // for addition and removal of students manually
    @Override
    public int editMeritList(final String meritListName1, MeritListTransactionEntity[] studentList1) {
        Session session = this.sessionFactory.getCurrentSession();
        MeritListStoreMaster meritListStoreMaster = new MeritListStoreMaster();
        meritListStoreMaster.setListName(meritListName1);
        int meritListId = (Integer) session.save(meritListStoreMaster);
        session.save(studentList1);

        for (MeritListTransactionEntity student : studentList1) {
            student.setMeritListId(meritListId);
            session.save(student);
        }

        return meritListId;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<TempStudentRegistrationEntity> getMeritListByStudentId(final int meritListId, final String id) {
        Session session = this.sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("applicationId").as("applicationId"));
        projectionList.add(Projections.property("studentName").as("studentName"));
        projectionList.add(Projections.property("fatherName").as("fatherName"));
        projectionList.add(Projections.property("lastName").as("lastName"));
        projectionList.add(Projections.property("gender").as("gender"));
        projectionList.add(Projections.property("genderMasterEntity.genderName").as("genderName"));
        projectionList.add(Projections.property("categoryId").as("categoryId"));
        projectionList.add(Projections.property("entranceExamRank").as("entranceExamRank"));
        projectionList.add(Projections.property("categoryEntity.categoryName").as("category"));

        DetachedCriteria dc = DetachedCriteria.forClass(MeritListTransactionEntity.class)
            .setProjection(Projections.property("studentId")).add(Restrictions.eq("meritListId", meritListId));

        List<Integer> studentIds = session.createCriteria(MeritListTransactionEntity.class)
            .setProjection(Projections.property("studentId")).add(Restrictions.eq("meritListId", meritListId)).list();

        List<TempStudentRegistrationEntity> entity = session.createCriteria(TempStudentRegistrationEntity.class)
            .createAlias("genderMasterEntity", "genderMasterEntity").createAlias("categoryEntity", "categoryEntity")
            .setProjection(projectionList).add(Restrictions.eq("applicationId", id))
            .add(Restrictions.not(Restrictions.in("id", studentIds))).setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
            .list();

        return entity;
    }

    @Override
    public int updateMeritList(final String meritListName, MeritListTransactionEntity[] studentList) {
        Session session = this.sessionFactory.getCurrentSession();
        MeritListStoreMaster meritListEntity = new MeritListStoreMaster();
        meritListEntity.setListName(meritListName);
        meritListEntity.setPreparationDate(new Date());
        meritListEntity.setCreatedBy(sessionUser.getCustomLoginUser().getUserId());
        int meritListId = (Integer) session.save(meritListEntity);

        for (MeritListTransactionEntity student : studentList) {
            student.setMeritListId(meritListId);
            session.save(student);
        }

        return meritListId;
    }

}
