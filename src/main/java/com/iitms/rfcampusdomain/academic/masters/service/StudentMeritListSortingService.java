package com.iitms.rfcampusdomain.academic.masters.service;

import org.hibernate.Session;

import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentMeritListSortingEntity;

    public interface StudentMeritListSortingService {
        Session currentSession();

        StudentMeritListMasterEntity getId(int id);

        // StudentMeritListSortingEntity getMeritSortingId(String meritSortingId);

        StudentMeritListSortingEntity getColumnName(String columnName);

        StudentMeritListSortingEntity getDisplayName(String displayName);

}
