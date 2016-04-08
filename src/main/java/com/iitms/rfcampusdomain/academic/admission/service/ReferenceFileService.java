package com.iitms.rfcampusdomain.academic.admission.service;

import java.util.List;

import com.iitms.rfcampusdata.academic.admission.entity.ReferenceFileEntity;
import com.iitms.rfcampusdata.academic.admission.entity.RegistrationNumberFormatEntity;

public interface ReferenceFileService {

    public int addReferenceRecord(ReferenceFileEntity referenceFileEntity);
    
    public int updateReferenceRecord(ReferenceFileEntity referenceFileEntity);
    
    public List<RegistrationNumberFormatEntity> getRegistrationNumberFormats();
    
    public ReferenceFileEntity getReferenceRecord();
}
