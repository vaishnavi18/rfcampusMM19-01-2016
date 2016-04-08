package com.iitms.rfcampusdata.academic.admission.dao;

import org.hibernate.Session;

import com.iitms.rfcampusdata.academic.admission.entity.ExcelFileImportEntity;

/**
 * @author Sachinmt
 */
public interface ExcelFileImportDao {

    Session currentSession();

    public int getBranchId(String branch);

    public int getAllocatedCategoryId(String categoryName);

    public int getCandidateCategoryId(String categoryName);

    public int getStateId(String state);

    public int getQuotaId(String quota);

    void save(ExcelFileImportEntity admissionExcelEntityService);

    public int getGenderId(String gender);
}
