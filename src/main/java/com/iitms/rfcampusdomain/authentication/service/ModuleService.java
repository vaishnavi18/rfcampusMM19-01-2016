package com.iitms.rfcampusdomain.authentication.service;

import java.util.List;

import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.authentication.entity.ModuleMasterEntity;

public interface ModuleService {

    public List<ModuleMasterEntity> listAuthorisedModule(List<Integer> roleIds) throws GenericException;

    public List<ModuleMasterEntity> listAllModule() throws GenericException;
    
    public List<ModuleMasterEntity> listActiveModules() throws GenericException;

    public boolean addModule(ModuleMasterEntity moduleMasterEntity) throws GenericException;

    public boolean updateModule(ModuleMasterEntity moduleMasterEntity) throws GenericException;

    public ModuleMasterEntity getModuleInfo(int moduleId) throws GenericException;

    public boolean isModuleNameExist(int moduleId, String moduleName) throws GenericException;
}
