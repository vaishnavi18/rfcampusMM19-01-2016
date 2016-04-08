package com.iitms.rfcampusdomain.authentication.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampuscommon.exceptions.GenericException;
import com.iitms.rfcampusdata.authentication.dao.ModuleDao;
import com.iitms.rfcampusdata.authentication.entity.ModuleMasterEntity;
import com.iitms.rfcampusdomain.authentication.service.ModuleService;

@Service
@Transactional
public class ModuleServiceImpl implements ModuleService {

    @Autowired
    private ModuleDao moduleDao;

    @Override
    public List<ModuleMasterEntity> listAuthorisedModule(List<Integer> roleIds) throws GenericException {
        try {
            return moduleDao.listAuthorisedModule(roleIds);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean addModule(ModuleMasterEntity moduleMasterEntity) throws GenericException {
        try {
            return moduleDao.addModule(moduleMasterEntity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean updateModule(ModuleMasterEntity moduleMasterEntity) throws GenericException {
        try {
            return moduleDao.updateModule(moduleMasterEntity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean isModuleNameExist(int moduleId, String moduleName) throws GenericException {
        try {
            return moduleDao.isModuleNameExist(moduleId, moduleName);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public ModuleMasterEntity getModuleInfo(int moduleId) throws GenericException {
        try {
            return moduleDao.getModuleInfo(moduleId);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<ModuleMasterEntity> listAllModule() throws GenericException {
        try {
            return moduleDao.listAllModule();
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<ModuleMasterEntity> listActiveModules() throws GenericException {
        try {
            return moduleDao.listActiveModules();
        } catch (Exception e) {
            throw e;
        }
        
    }

}
