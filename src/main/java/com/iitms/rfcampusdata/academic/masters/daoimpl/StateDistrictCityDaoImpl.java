package com.iitms.rfcampusdata.academic.masters.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.academic.masters.dao.StateDistrictCityDao;
import com.iitms.rfcampusdata.academic.masters.entity.CityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DistrictMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StateMasterEntity;

@Repository
public class StateDistrictCityDaoImpl implements StateDistrictCityDao {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    public List<MasterModel> getAllStates() {

        List<MasterModel> stateList = this.sessionFactory.getCurrentSession().createCriteria(StateMasterEntity.class)
            .setProjection(Projections.projectionList().add(Projections.property("id").as("id"))
                .add(Projections.property("state").as("name")))
            .setResultTransformer(new AliasToBeanResultTransformer(MasterModel.class)).list();

        return stateList;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<MasterModel> getDistricts(int stateId) {
        List<MasterModel> districtList =
            this.sessionFactory.getCurrentSession().createCriteria(DistrictMasterEntity.class)
                .setProjection(Projections.projectionList().add(Projections.property("id").as("id"))
                    .add(Projections.property("districtName").as("name")))
                .add(Restrictions.eq("stateId", stateId))
                .setResultTransformer(new AliasToBeanResultTransformer(MasterModel.class)).list();

        return districtList;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<MasterModel> getCities(int districtId) {
        List<MasterModel> cityList = this.sessionFactory.getCurrentSession().createCriteria(CityMasterEntity.class)
            .setProjection(Projections.projectionList().add(Projections.property("id").as("id"))
                .add(Projections.property("cityName").as("name")))
            .add(Restrictions.eq("districtId", districtId))
            .setResultTransformer(new AliasToBeanResultTransformer(MasterModel.class)).list();

        return cityList;
    }

}
