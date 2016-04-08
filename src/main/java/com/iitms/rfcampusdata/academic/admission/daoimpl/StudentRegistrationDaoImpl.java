package com.iitms.rfcampusdata.academic.admission.daoimpl;

import java.util.List;

import org.hibernate.Query;
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

import com.iitms.rfcampuscommon.RandomNumberGenerator;
import com.iitms.rfcampusdata.academic.admission.dao.StudentRegistrationDao;
import com.iitms.rfcampusdata.academic.admission.entity.BranchPrefrenceEntity;
import com.iitms.rfcampusdata.academic.admission.entity.TempStudentRegistrationEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CountryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DistrictMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.NationalityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StateMasterEntity;

@Repository
public class StudentRegistrationDaoImpl implements StudentRegistrationDao {
    private static final Logger LOG = LoggerFactory.getLogger(StudentRegistrationDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private RandomNumberGenerator randomNumberGenerator;

    /*
     * FINAL METHOD
     * @Override public String addStudentRegistrationInfo(TempStudentRegistrationEntity student) { LOG.info("Student:" +
     * student); Session session = sessionFactory.getCurrentSession(); String registrationCredential = ""; String
     * applicationpassword = randomNumberGenerator.generateRandomPassword(); String applicationId =
     * student.getStudentName().substring(0, 2) + student.getSessionId() + student.getLastName().substring(0, 2);
     * LOG.info("ApplicationId:" + applicationId); student.setApplicationId(applicationId);
     * student.setPassword(applicationpassword); registrationCredential = applicationId + "#" + applicationpassword;
     * Integer id = (Integer) session.save(student); return registrationCredential; }
     */

    // TEST METHOD
    @Override
    public String addStudentRegistrationInfo(TempStudentRegistrationEntity student) {
        LOG.info("Student:" + student);
        Session session = sessionFactory.getCurrentSession();
        student.setApplicationId(student.getStudentName());
        student.setPassword("test");

        int id = (Integer) session.save(student);

        String registrationCredential = student.getStudentName() + "#" + "test" + "#" + id;
        return registrationCredential;
    }

    @Override
    public TempStudentRegistrationEntity getStudentRegistrationInformation(String applicationId, String password) {
        LOG.info("applicationId : " + applicationId);
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("studentName").as("studentName"));
        projectionList.add(Projections.property("fatherName").as("fatherName"));
        projectionList.add(Projections.property("lastName").as("lastName"));
        projectionList.add(Projections.property("motherName").as("motherName"));
        projectionList.add(Projections.property("gender").as("gender"));
        projectionList.add(Projections.property("categoryId").as("categoryId"));
        projectionList.add(Projections.property("casteId").as("casteId"));
        projectionList.add(Projections.property("nationalityId").as("nationalityId"));
        projectionList.add(Projections.property("stateId").as("stateId"));
        projectionList.add(Projections.property("districtId").as("districtId"));
        projectionList.add(Projections.property("cityId").as("cityId"));
        projectionList.add(Projections.property("pincode").as("pincode"));
        projectionList.add(Projections.property("address").as("address"));
        projectionList.add(Projections.property("emailId").as("emailId"));
        projectionList.add(Projections.property("mobileNumber").as("mobileNumber"));
        projectionList.add(Projections.property("photoLink").as("photoLink"));
        projectionList.add(Projections.property("signatureLink").as("signatureLink"));

        @SuppressWarnings("unchecked")
        TempStudentRegistrationEntity entity = (TempStudentRegistrationEntity) this.sessionFactory.getCurrentSession()
            .createCriteria(TempStudentRegistrationEntity.class).setProjection(projectionList)
            .add(Restrictions.eq("applicationId", applicationId)).add(Restrictions.eq("active", true))
            // .add(Restrictions.eq("password", password))
            .setResultTransformer(new AliasToBeanResultTransformer(TempStudentRegistrationEntity.class)).uniqueResult();

        return entity;
    }

    @Override
    public TempStudentRegistrationEntity updateStudentRegistrationInfo(TempStudentRegistrationEntity student) {
        LOG.info("ID=" + student.getApplicationId());

        Session session = sessionFactory.getCurrentSession();
        TempStudentRegistrationEntity entity =
            (TempStudentRegistrationEntity) session.get(TempStudentRegistrationEntity.class, student.getId());
        LOG.info("ENTITY OBJECT:" + entity);
        // -------------personal Deatils update----------------
        if (entity.isFinalSubmission() == false) {
            entity.setStudentName(student.getStudentName());
            entity.setFatherName(student.getFatherName());
            entity.setMotherName(student.getMotherName());
            entity.setLastName(student.getLastName());
            entity.setMotherTongueId(student.getMotherTongueId());
            entity.setDateOfBirth(student.getDateOfBirth());
            entity.setGender(student.getGender());
            entity.setCasteId(student.getCasteId());
            entity.setCategoryId(student.getCategoryId());
            entity.setNationalityId(student.getNationalityId());
            // ------------Contact and Address Update---------------
            entity.setMobileNumber(student.getMobileNumber());
            entity.setPermanentTelephoneStd(student.getPermanentTelephoneStd());
            entity.setPermanentTelephone(student.getPermanentTelephone());
            entity.setEmailId(student.getEmailId());
            entity.setCountryId(student.getCountryId());
            entity.setStateId(student.getStateId());
            entity.setDistrictId(student.getDistrictId());
            entity.setCityId(student.getCityId());
            entity.setPincode(student.getPincode());
            entity.setAddress(null != student.getAddress() ? student.getAddress().trim() : "");
            // -----------Educational Details-------------------
            entity.setSscPassingYear(student.getSscPassingYear());
            entity.setSscMaths(student.getSscMaths());
            entity.setSscMathsMaximum(student.getSscMathsMaximum());
            entity.setSscTotal(student.getSscTotal());
            entity.setSscOutof(student.getSscOutof());
            if (student.getSscOutof() != 0) {
                entity.setSscPerentage(student.getSscTotal() / student.getSscOutof() * 100);
            }

            entity.setHscPassingYear(student.getHscPassingYear());
            entity.setHscTotal(student.getHscTotal());
            entity.setHscOutOf(student.getHscOutOf());
            entity.setHscPhysics(student.getHscPhysics());
            entity.setHscChemestry(student.getHscChemestry());
            entity.setHscMaths(student.getHscMaths());
            entity.setHscPhysicsMax(student.getHscPhysicsMax());
            entity.setHscChemestryMax(student.getHscChemestryMax());
            entity.setHscMathsMax(student.getHscMathsMax());
            entity.setHscPcm(student.getHscPcm());
            entity.setHscPcmMax(student.getHscPcmMax());
            if (student.getHscOutOf() != 0) {
                entity.setHscPercentage(student.getHscTotal() / student.getHscOutOf() * 100);
            }

            entity.setEntranceExamId(student.getEntranceExamId());
            entity.setEntranceExamRollNumber(student.getEntranceExamRollNumber());
            entity.setEntranceExamYear(student.getEntranceExamYear());
            entity.setEntranceExamScore(student.getEntranceExamScore());
            entity.setEntranceExamRank(student.getEntranceExamRank());
            // ------------ Document Details------------------
            entity.setSscMarksheet(student.getSscMarksheet());
            entity.setHscMarksheet(student.getHscMarksheet());
            entity.setEntranceScorecard(student.getEntranceScorecard());
            entity.setLeavingCertificate(student.getLeavingCertificate());
            entity.setDomicileCertificate(student.getDomicileCertificate());
            entity.setNationalityCertificate(student.getNationalityCertificate());
            entity.setMigrationCertificate(student.getMigrationCertificate());
            entity.setCastCertificate(student.getCastCertificate());
            entity.setPhotoLink(student.getPhotoLink());
            entity.setSignatureLink(student.getSignatureLink());
            entity.setFinalSubmission(student.isFinalSubmission());
            // entity.setDegreeId(student.getDegreeId());
            session.update(entity);
            // Delete operation
            session.createQuery("delete from BranchPrefrenceEntity entity where entity.studRegiId=:studRegiId")
                .setParameter("studRegiId", entity.getId()).executeUpdate();
            // add operation
            BranchPrefrenceEntity branchPrefrenceEntity;
            for (String batch : student.getPreferences().split(",")) {
                branchPrefrenceEntity = new BranchPrefrenceEntity();
                branchPrefrenceEntity.setStudRegiId(student.getId());
                branchPrefrenceEntity.setBranchPrefNo(Integer.parseInt(batch));
                session.save(branchPrefrenceEntity);
            }
        }

        return entity;
    }

    @Override
    public List<Integer> getStudentBranchPrefrence(final int id) {

        Session session = sessionFactory.getCurrentSession();
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("branchPrefNo"));
        @SuppressWarnings("unchecked")
        List<Integer> preference = session.createCriteria(BranchPrefrenceEntity.class).setProjection(projectionList)
            .add(Restrictions.eq("studRegiId", id)).list();
        return preference;
    }

    @Override
    public TempStudentRegistrationEntity getStudentById(int id) {
        TempStudentRegistrationEntity entity = (TempStudentRegistrationEntity) sessionFactory.getCurrentSession()
            .get(TempStudentRegistrationEntity.class, id);

        return entity;
    }

    /** By Sachinmt **/

    /** By Sachinmt **/
    @SuppressWarnings("unchecked")
    @Override
    public String getMothertongue(int motherTongueId) {
        Session session = sessionFactory.getCurrentSession();
        String motherTongue = "";
        if (motherTongueId != 0) {
            LOG.info("Get Mother Tongue Id  :", motherTongueId);
            String getOuery = "from MothertongueMasterEntity where id =:motherTongueId ";
            Query query = session.createQuery(getOuery).setParameter("motherTongueId", motherTongueId);
            List<MothertongueMasterEntity> list = query.list();
            motherTongue = list.get(0).getMothertongue();
            System.out.println("mother tongue Name ==>:" + motherTongue);
        }
        return motherTongue;
    }

    @SuppressWarnings("unchecked")
    @Override
    public String getCategory(int categoryId) {
        Session session = sessionFactory.getCurrentSession();
        String category = "";
        if (categoryId != 0) {
            LOG.info("Get category Id  :", categoryId);
            String getQuery = "from CategoryMasterEntity where id =:categoryId";
            Query query = session.createQuery(getQuery).setParameter("categoryId", categoryId);
            List<CategoryMasterEntity> list = query.list();
            category = list.get(0).getCategoryName();
            System.out.println("category Name ==>:" + category);
        }
        return category;
    }

    @SuppressWarnings("unchecked")
    @Override
    public String getNationality(int nationalityId) {
        Session session = sessionFactory.getCurrentSession();
        String natinality = "";
        if (nationalityId != 0) {
            LOG.info("Get Natinality Id  :", nationalityId);
            String getQuery = "from NationalityMasterEntity where id =:nationalityId";
            Query query = session.createQuery(getQuery).setParameter("nationalityId", nationalityId);
            List<NationalityMasterEntity> list = query.list();
            natinality = list.get(0).getNationality();
            System.out.println("Natinality Name ==>:" + natinality);
        }
        return natinality;
    }

    @SuppressWarnings("unchecked")
    @Override
    public String getCountry(int countryId) {
        Session session = sessionFactory.getCurrentSession();
        String country = "";
        if (countryId != 0) {
            LOG.info("Get Country Id  :", countryId);
            String getquery = "from CountryMasterEntity where id =:countryId";
            Query query = session.createQuery(getquery).setParameter("countryId", countryId);
            List<CountryMasterEntity> list = query.list();
            country = list.get(0).getCountry();
            System.out.println("State Name ==>:" + country);
        }
        return country;
    }

    @SuppressWarnings("unchecked")
    @Override
    public String getState(int stateId) {
        Session session = sessionFactory.getCurrentSession();
        String state = "";
        if (stateId != 0) {
            LOG.info("Get State Id  :", stateId);
            String getQuery = "from StateMasterEntity where id =:stateId";
            Query query = session.createQuery(getQuery).setParameter("stateId", stateId);
            List<StateMasterEntity> list = query.list();
            state = list.get(0).getState();
            System.out.println("State Name ==>:" + state);
        }
        return state;
    }

    @SuppressWarnings("unchecked")
    @Override
    public String getDistrict(int districtId) {
        Session session = sessionFactory.getCurrentSession();
        String district = "";
        if (districtId != 0) {
            LOG.info("Get District Id  :", districtId);
            String getQuery = "from DistrictMasterEntity where id =:districtId";
            Query query = session.createQuery(getQuery).setParameter("districtId", districtId);
            List<DistrictMasterEntity> list = query.list();
            district = list.get(0).getDistrictName();
            System.out.println("District Name ==>:" + district);
        }
        return district;
    }

    @SuppressWarnings("unchecked")
    @Override
    public String getCity(int cityId) {
        Session session = sessionFactory.getCurrentSession();
        String city = "";
        if (cityId != 0) {
            LOG.info("Get City Id  :", cityId);
            String getQuery = "from CityMasterEntity where id =:cityId";
            Query query = session.createQuery(getQuery).setParameter("cityId", cityId);
            List<CityMasterEntity> list = query.list();
            city = list.get(0).getCityName();
            System.out.println("City Name ==>:" + city);
        }
        return city;
    }

    /*
     * @Override public List<TempStudentRegistrationEntity> getRegStudentRecords() { Session session =
     * sessionFactory.getCurrentSession(); Criteria cr = session.createCriteria(TempStudentRegistrationEntity.class);
     * Disjunction or = Restrictions.disjunction(); if (firstName != null) { or.add(Restrictions.ilike("firstName",
     * firstName + "%")); } if (lastName != null) { or.add(Restrictions.ilike("lastName", "%" + lastName)); } if (gender
     * != null) { or.add(Restrictions.eq("gender", gender)); } if (speciality != null) {
     * or.add(Restrictions.ilike("speciality", "%" + speciality + "%")); } cr.add(or); return cr.list(); }
     */

    @SuppressWarnings("unchecked")
    @Override
    public List<TempStudentRegistrationEntity> getMultipleRegistardStudentsReports(String applicationId) {
        Session session = sessionFactory.getCurrentSession();

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("id").as("id"));
        projectionList.add(Projections.property("applicationId").as("applicationId"));
        projectionList.add(Projections.property("studentName").as("studentName"));
        projectionList.add(Projections.property("fatherName").as("fatherName"));
        projectionList.add(Projections.property("lastName").as("lastName"));
        projectionList.add(Projections.property("motherName").as("motherName"));
        projectionList.add(Projections.property("photoLink").as("photoLink"));
        projectionList.add(Projections.property("signatureLink").as("signatureLink"));

        projectionList.add(Projections.property("motherTongueId").as("motherTongueId"));
        projectionList.add(Projections.property("mothertongueMasterEntity.mothertongue").as("motherTongue"));

        projectionList.add(Projections.property("dateOfBirth").as("dateOfBirth"));

        projectionList.add(Projections.property("gender").as("gender"));
        projectionList.add(Projections.property("genderMasterEntity.genderName").as("genderName"));

        projectionList.add(Projections.property("casteId").as("casteId"));
        projectionList.add(Projections.property("casteMasterEntity.caste").as("caste"));

        projectionList.add(Projections.property("categoryId").as("categoryId"));
        projectionList.add(Projections.property("categoryEntity.categoryName").as("category"));

        projectionList.add(Projections.property("nationalityId").as("nationalityId"));
        projectionList.add(Projections.property("nationalityMasterEntity.nationality").as("nationality"));

        projectionList.add(Projections.property("countryId").as("countryId"));
        projectionList.add(Projections.property("countryMasterEntity.country").as("country"));

        projectionList.add(Projections.property("stateId").as("stateId"));
        projectionList.add(Projections.property("stateMasterEntity.state").as("state"));

        projectionList.add(Projections.property("districtId").as("districtId"));
        projectionList.add(Projections.property("districtMasterEntity.districtName").as("districtName"));

        projectionList.add(Projections.property("cityId").as("cityId"));
        projectionList.add(Projections.property("cityMasterEntity.cityName").as("cityName"));

        projectionList.add(Projections.property("permanentTelephoneStd").as("permanentTelephoneStd"));
        projectionList.add(Projections.property("permanentTelephone").as("permanentTelephone"));
        projectionList.add(Projections.property("emailId").as("emailId"));
        projectionList.add(Projections.property("photoLink").as("photoLink"));
        projectionList.add(Projections.property("signatureLink").as("signatureLink"));

        projectionList.add(Projections.property("lastQualificationId").as("lastQualificationId"));
        projectionList.add(Projections.property("sscMaths").as("sscMaths"));
        projectionList.add(Projections.property("sscMathsMaximum").as("sscMathsMaximum"));
        projectionList.add(Projections.property("sscPerentage").as("sscPerentage"));
        projectionList.add(Projections.property("sscTotal").as("sscTotal"));
        projectionList.add(Projections.property("sscOutof").as("sscOutof"));
        projectionList.add(Projections.property("sscPassingYear").as("sscPassingYear"));

        projectionList.add(Projections.property("hscMaths").as("hscMaths"));
        projectionList.add(Projections.property("hscMathsMax").as("hscMathsMax"));
        projectionList.add(Projections.property("hscChemestry").as("hscChemestry"));
        projectionList.add(Projections.property("hscChemestryMax").as("hscChemestryMax"));
        projectionList.add(Projections.property("hscPhysics").as("hscPhysics"));
        projectionList.add(Projections.property("hscPhysicsMax").as("hscPhysicsMax"));
        projectionList.add(Projections.property("hscPcm").as("hscPcm"));
        projectionList.add(Projections.property("hscPcmMax").as("hscPcmMax"));
        projectionList.add(Projections.property("hscPercentage").as("hscPercentage"));
        projectionList.add(Projections.property("hscTotal").as("hscTotal"));
        projectionList.add(Projections.property("hscOutOf").as("hscOutOf"));
        projectionList.add(Projections.property("hscPassingYear").as("hscPassingYear"));
        projectionList.add(Projections.property("admissionStatus").as("admissionStatus"));

        projectionList.add(Projections.property("entranceExamId").as("entranceExamId"));
        projectionList.add(Projections.property("entranceExamYear").as("entranceExamYear"));
        projectionList.add(Projections.property("entranceExamScore").as("entranceExamScore"));
        projectionList.add(Projections.property("entranceExamRank").as("entranceExamRank"));
        projectionList.add(Projections.property("entranceExamRollNumber").as("entranceExamRollNumber"));

        List<TempStudentRegistrationEntity> list = session.createCriteria(TempStudentRegistrationEntity.class)

            .createAlias("mothertongueMasterEntity", "mothertongueMasterEntity")
            .createAlias("genderMasterEntity", "genderMasterEntity")
            .createAlias("casteMasterEntity", "casteMasterEntity").createAlias("categoryEntity", "categoryEntity")
            .createAlias("nationalityMasterEntity", "nationalityMasterEntity")
            .createAlias("countryMasterEntity", "countryMasterEntity")
            .createAlias("stateMasterEntity", "stateMasterEntity")
            .createAlias("districtMasterEntity", "districtMasterEntity")
            .createAlias("cityMasterEntity", "cityMasterEntity").setProjection(projectionList)
            .add(Restrictions.eq("applicationId", applicationId))
            /* .add(Restrictions.eq("meritListId", meritListId)).addOrder(Order.asc("serialNumberMeritlist")) */
            .setResultTransformer(new AliasToBeanResultTransformer(TempStudentRegistrationEntity.class)).list();

        return list;
    }

    @Override
    public void setStudentInactive(String applicationId) {
        this.sessionFactory.getCurrentSession()
            .createQuery(
                "Update TempStudentRegistrationEntity entity set entity.active = :active where entity.applicationId = :applicationId")
            .setParameter("active", false).setParameter("applicationId", applicationId).executeUpdate();

    }

}
