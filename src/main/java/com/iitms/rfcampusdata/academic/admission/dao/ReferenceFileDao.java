package com.iitms.rfcampusdata.academic.admission.dao;

import java.util.List;

import com.iitms.rfcampusdata.academic.admission.entity.ReferenceFileEntity;
import com.iitms.rfcampusdata.academic.admission.entity.RegistrationNumberFormatEntity;

public interface ReferenceFileDao {

    public int addReferenceRecord(ReferenceFileEntity referenceFileEntity);

    public int updateReferenceRecord(ReferenceFileEntity referenceFileEntity);

    public List<RegistrationNumberFormatEntity> getRegistrationNumberFormats();

    public ReferenceFileEntity getReferenceRecord();
}
