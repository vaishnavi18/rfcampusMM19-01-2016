package com.iitms.rfcampusdomain.academic.masters.serviceimpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampuscommon.MasterModel;
import com.iitms.rfcampusdata.academic.admission.entity.ScholarshipTypeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.dao.MasterDao;
import com.iitms.rfcampusdata.academic.masters.entity.AcademicSessionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BankMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BatchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BloodGroupMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.BranchMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CasteMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CategoryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.CountryMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DegreeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DistrictMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.DocumentListMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.EducationMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.MasterData;
import com.iitms.rfcampusdata.academic.masters.entity.MasterFields;
import com.iitms.rfcampusdata.academic.masters.entity.MothertongueMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.NationalityMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.OccupationMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.PaymentTypeMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.PhysicallyHandicappedMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.ReligionMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.SemesterMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StateMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.StudentStatusMasterEntity;
import com.iitms.rfcampusdata.academic.masters.entity.YearMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.AppointmentTypeMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.PayrollCasteMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.PayrollCategoryMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.PayrollDepartmentMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.PayrollDesignationMaster;
import com.iitms.rfcampusdata.payroll.masters.entity.PayrollNationalityMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.PayrollSubdesignationMaster;
import com.iitms.rfcampusdata.payroll.masters.entity.PayrollTitleMaster;
import com.iitms.rfcampusdata.payroll.masters.entity.PayruleMaster;
import com.iitms.rfcampusdata.payroll.masters.entity.PayscaleMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.ProvidentFundMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.StaffMasterEntity;
import com.iitms.rfcampusdata.payroll.masters.entity.StaffTypeMaster;
import com.iitms.rfcampusdomain.academic.masters.service.MasterService;

@Service
public class MasterServiceImpl implements MasterService {

    private static final Logger Log = LoggerFactory.getLogger(MasterServiceImpl.class);

    @Autowired
    private MasterDao masterDao;

    @Override
    @Transactional
    public MasterFields getStaticFields(String masterType) {
        return masterDao.getStaticFields(masterType);
    }

    @Override
    @Transactional
    public List<MasterData> loadMasterFields(Class<?> runtimeClass, String propertyName) {
        return masterDao.loadMasterFields(runtimeClass, propertyName.split(","));
    }

    @Override
    @Transactional
    public int addmaster(MasterFields masterFields) {
        int flag = 0;
        try {
            // getSelectedClass(masterFields.getMasterType());
            boolean exist = masterDao.isRecordExist(masterFields);

            Log.info("Exist : " + exist);
            if (!exist) {

                flag = (masterFields.getRecordId() == 0 ? masterDao.addmaster(masterFields.getEntity())
                    : masterDao.updateMaster(masterFields.getEntity(),masterFields));
            } else {
                flag = ConstantUtil.RECORD_EXIST;
            }
        } catch (Exception e) {
            Log.info("Error", e);
            return 0;
        }

        return flag;
    }

    @Override
    public boolean isRecordExist(MasterFields masterFields) {
        return false;
    }

    @Override
    @Transactional
    public List<MasterModel> getMasterData(String master) {
        return masterDao.getMasterData(getSelectedClass(master));
    }

    /*---------------- Private Methods----------------*/

    /*
     * private Class getSelectedClass(String masterType) { Class masterClass = null; try { masterClass =
     * Class.forName(masterType); } catch (Exception e) { } return masterClass; }
     */

    private Class<?> getSelectedClass(String masterType) {
        Class masterClass = null;

        switch (masterType) {
            case ConstantUtil.DEGREE_LIST: {
                masterClass = DegreeMasterEntity.class;
                break;
            }
            case ConstantUtil.CASTE_LIST: {
                masterClass = CasteMasterEntity.class;
                break;
            }
            case ConstantUtil.RELIGION_LIST: {
                masterClass = ReligionMasterEntity.class;
                break;
            }
            case ConstantUtil.ACADEMIC_YEAR_LIST: {
                masterClass = YearMasterEntity.class;
                break;
            }
            case ConstantUtil.ACADEMIC_SESSION_LIST: {
                masterClass = AcademicSessionMasterEntity.class;
                break;
            }
            case ConstantUtil.ADMISSION_BATCH_LIST: {
                masterClass = BatchMasterEntity.class;
                break;
            }
            case ConstantUtil.BLOOD_GROUP_LIST: {
                masterClass = BloodGroupMasterEntity.class;
                break;
            }
            case ConstantUtil.BRANCH_LIST: {
                masterClass = BranchMasterEntity.class;
                break;
            }
            case ConstantUtil.CATEGORY_LIST: {
                masterClass = CategoryMasterEntity.class;
                break;
            }
            case ConstantUtil.NATIONALITY_LIST: {
                masterClass = NationalityMasterEntity.class;
                break;
            }
            case ConstantUtil.SEMESTER_LIST: {
                masterClass = SemesterMasterEntity.class;
                break;
            }
            case ConstantUtil.PAYMENT_TYPE_LIST: {
                masterClass = PaymentTypeMasterEntity.class;
                break;
            }
            case ConstantUtil.MOTHERTONGUE_LIST: {
                masterClass = MothertongueMasterEntity.class;
                break;
            }
            case ConstantUtil.DOCUMENT_LIST: {
                masterClass = DocumentListMasterEntity.class;
                break;
            }
            case ConstantUtil.COUNTRY_LIST: {
                masterClass = CountryMasterEntity.class;
                break;
            }
            case ConstantUtil.STATE_LIST: {
                masterClass = StateMasterEntity.class;
                break;
            }
            case ConstantUtil.STUDENT_STATUS_LIST: {
                masterClass = StudentStatusMasterEntity.class;
                break;
            }
            case ConstantUtil.BANK_LIST: {
                masterClass = BankMasterEntity.class;
                break;
            }
            case ConstantUtil.PHYSICALLY_HANDICAPPED_LIST: {
                masterClass = PhysicallyHandicappedMasterEntity.class;
                break;
            }
            case ConstantUtil.OCCUPATION_LIST: {
                masterClass = OccupationMasterEntity.class;
                break;
            }
            case ConstantUtil.EDUCATION_LIST: {
                masterClass = EducationMasterEntity.class;
                break;
            }
            case ConstantUtil.SCHOLARSHIP_TYPE_LIST: {
                masterClass = ScholarshipTypeMasterEntity.class;
                break;
            }
            case ConstantUtil.PAYROLL_MASTER_CASTE: {
                masterClass = PayrollCasteMasterEntity.class;
                break;
            }

            case ConstantUtil.PAYROLL_MASTER_CATEGORY: {
                masterClass = PayrollCategoryMasterEntity.class;
                break;
            }

            case ConstantUtil.PAYROLL_MASTER_NATIONALITY: {
                masterClass = PayrollNationalityMasterEntity.class;
                break;
            }
            case ConstantUtil.PAYROLL_MASTER_TITLE: {
                masterClass = PayrollTitleMaster.class;
                break;
            }
            case ConstantUtil.BATCH_LIST: {
                masterClass = BatchMasterEntity.class;
                break;
            }
            case ConstantUtil.PAYROLL_MASTER_DESIGNATION_NATURE: {
                masterClass = PayrollDesignationMaster.class;
                break;
            }

            case ConstantUtil.PAYROLL_MASTER_DESIGNATION: {
                masterClass = PayrollSubdesignationMaster.class;
                break;
            }

            case ConstantUtil.PAYROLL_MASTER_STAFF_TYPE: {
                masterClass = StaffTypeMaster.class;
                break;
            }

            case ConstantUtil.PAYROLL_MASTER_APPOINTMENT_TYPE: {
                masterClass = AppointmentTypeMasterEntity.class;
                break;
            }

            case ConstantUtil.PAYROLL_MASTER_PAYRULE: {
                masterClass = PayruleMaster.class;
                break;
            }
            case ConstantUtil.PAYROLL_MASTER_BANKNAME: {
                masterClass = BankMasterEntity.class;
                break;
            }
            case ConstantUtil.PAYROLL_MASTER_DEPARTMENT: {
                masterClass = PayrollDepartmentMasterEntity.class;
                break;
            }
            case ConstantUtil.PAYROLL_MASTER_PF: {
                masterClass = ProvidentFundMasterEntity.class;
                break;
            }
            case ConstantUtil.PAYROLL_MASTER_STAFF: {
                masterClass = StaffMasterEntity.class;
                break;
            }

            case ConstantUtil.PAYROLL_MASTER_PAYSCALE: {
                masterClass = PayscaleMasterEntity.class;
                break;
            }
            
            case ConstantUtil.DISTRICT_LIST: {
                masterClass = DistrictMasterEntity.class;
                break;
            }
            
            case ConstantUtil.CITY_LIST: {
                masterClass = CityMasterEntity.class;
                break;
            }

        }

        return masterClass;
    }

    @Override
    @Transactional
    public List<?> getAllRecords(Class<?> criteriaClass) {
        return masterDao.getAllRecords(criteriaClass);
    }

}
