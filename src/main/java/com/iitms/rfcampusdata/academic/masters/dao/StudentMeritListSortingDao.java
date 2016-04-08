package com.iitms.rfcampusdata.academic.masters.dao;

import org.hibernate.Session;

import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListSortingEntity;

public interface StudentMeritListSortingDao {
    Session currentSession();

    StudentMeritListMasterEntity getId(int id);

    // StudentMeritListSortingEntity getMeritSortingId(String meritSortingId);

    StudentMeritListSortingEntity getColumnName(String columnName);

    StudentMeritListSortingEntity getDisplayName(String displayName);

}
