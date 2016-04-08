package com.iitms.rfcampusdomain.academic.admission.serviceimpl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.iitms.rfcampusdata.academic.admission.dao.ExcelFileImportDao;
import com.iitms.rfcampusdata.academic.admission.entity.ExcelFileImportEntity;
import com.iitms.rfcampusdomain.academic.admission.service.AdmissionExcelService;

/**
 * @author Sachinmt
 */
@Service
@Transactional
public class AdmissionExcelServiceImpl implements AdmissionExcelService {

    private static final Logger LOG = LoggerFactory.getLogger(AdmissionExcelServiceImpl.class);

    @Autowired
    private ExcelFileImportDao admissionExcelDao;

    @Override
    public int saveExcelSheet(MultipartFile file) {
        int count = 0;
        Workbook workbook;
        try {
            workbook = new HSSFWorkbook(file.getInputStream());
            LOG.info("Workbook : ", workbook);
            Sheet firstSheet = workbook.getSheetAt(0);
            Iterator<Row> iterator = firstSheet.iterator();
            /**
             * Skip First Row of excel Sheet
             */
            if (iterator.hasNext()) {
                iterator.next();
            }
            while (iterator.hasNext()) {
                ExcelFileImportEntity admissionExcelEntity = new ExcelFileImportEntity();
                Row nextRow = iterator.next();
                Iterator<Cell> cellIterator = nextRow.cellIterator();

                while (cellIterator.hasNext()) {
                    Cell nextCell = cellIterator.next();
                    int columnIndex = nextCell.getColumnIndex();
                    switch (columnIndex) {
                        case 0:
                            admissionExcelEntity.setAdmissionExcelSerialNo(((Double) getCellValue(nextCell)).longValue());
                            break;
                        case 1:
                            admissionExcelEntity.setRollNumber(Long.toString(((Double) getCellValue(nextCell)).longValue()));
                            break;
                        case 2:
                            admissionExcelEntity.setAllIndiaRanking(((Double) getCellValue(nextCell)).longValue());
                            break;
                        case 3:
                            admissionExcelEntity.setCandidateName((String) getCellValue(nextCell));
                            break;
                        case 4:
                            admissionExcelEntity.setBranchNameId(admissionExcelDao.getBranchId(getBranch((String) getCellValue(nextCell))));
                            break;
                        case 5:
                            admissionExcelEntity.setAllotedCategoryId(admissionExcelDao.getAllocatedCategoryId(getCategory((String) getCellValue(nextCell))));
                            break;
                        case 6:
                            admissionExcelEntity.setCandidateCategoryId(admissionExcelDao.getCandidateCategoryId(getCategory((String) getCellValue(nextCell))));
                            break;
                        case 7:
                            admissionExcelEntity.setHomeStateId(admissionExcelDao.getStateId((String) getCellValue(nextCell)));
                            break;
                        case 8:
                            /**
                             * UnComment Below code When need to persist the date into DataBase
                             */
                            /*
                             * Date dateValue = null; if(nextCell.getCellType() == nextCell.CELL_TYPE_NUMERIC) { if
                             * (DateUtil.isCellDateFormatted(nextCell)) { dateValue =
                             * getDate(nextCell.getDateCellValue()); } }
                             */
                            Date dateValue = null;
                            admissionExcelEntity.setReportingDate(dateValue);
                            break;
                        case 9:
                            admissionExcelEntity.setReportedFrom((String) getCellValue(nextCell));
                            break;
                        case 10:
                            admissionExcelEntity.setQuotaId(admissionExcelDao.getQuotaId((String) getCellValue(nextCell)));
                            break;
                        case 11:
                            admissionExcelEntity.setFatherName((String) getCellValue(nextCell));
                            break;
                        case 12:
                            admissionExcelEntity.setMotherName((String) getCellValue(nextCell));
                            break;
                        case 13:                           
                            admissionExcelEntity.setMobileNumber(Long.toString(((Double) getCellValue(nextCell)).longValue()));
                            break;
                        case 14:
                            admissionExcelEntity.setGenderId(admissionExcelDao.getGenderId(getGender((String) getCellValue(nextCell))));
                            break;
                    }
                }
                /** call Save service **/
                admissionExcelDao.save(admissionExcelEntity);
                count++;
            }
        } catch (IOException e) {
            LOG.error("Error", e);
        }
        LOG.info("Get Stored Record Count ::", count);
        return count;
    }
    
    
    

    /** Identify data by type **/
    private Object getCellValue(Cell cell) {
        switch (cell.getCellType()) {
            case Cell.CELL_TYPE_STRING:
                return cell.getStringCellValue();

            case Cell.CELL_TYPE_BOOLEAN:
                return cell.getBooleanCellValue();

            case Cell.CELL_TYPE_NUMERIC:
                return cell.getNumericCellValue();
        }
        return null;
    }

    
    
    
    /** Get Category Name by different Naming conventions **/
    private String getCategory(String categoryName) {

        String category = "";
        if (categoryName.equalsIgnoreCase("OTHER BACKWORD CAST")
            || categoryName.equalsIgnoreCase("OTHER BACKWORD CLASSES")
            || categoryName.equalsIgnoreCase("OTHER BACKWORD CASTES")) {
            category = "OBC";
            LOG.info("Set Category OBC  :", category);

        } else if (categoryName.equalsIgnoreCase("SCHEDULED CASTES") || categoryName.equalsIgnoreCase("SCHEDULED CASTE")
            || categoryName.equalsIgnoreCase("SCHEDULED CAST")) {
            category = "SC";
            LOG.info("Set Category SC  :", category);

        } else if (categoryName.equalsIgnoreCase("SCHEDULED TRIBES")) {
            category = "ST";
            LOG.info("Set Category ST  :", category);

        } else if (categoryName.equalsIgnoreCase("GE") || categoryName.equalsIgnoreCase("GENERAL")) {
            category = "GEN";
            LOG.info("Set Category GEN  :", category);

        } else if (categoryName.equalsIgnoreCase("OPEN")) {
            category = "OPEN";
            LOG.info("Set Category OPEN  :", category);

        } else {
            category = categoryName.toUpperCase();
            LOG.info("Set Category   :", category);
        }
        return category;
    }

    
    
    
    /** Get Branch Name by different Naming conventions **/
    private String getBranch(String branchName) {

        LOG.info("Get Branch Name From Excel  :", branchName);
        String branch = "";
        if (branchName.equalsIgnoreCase("INFO TECH") || branchName.equalsIgnoreCase("INFORMATION TECHNOLOGY")) {
            branch = "INFORMATION TECHNOLOGY";
            LOG.info("Set Branch IT  :", branch);

        } else if (branchName.equalsIgnoreCase("MECH ENG") || branchName.equalsIgnoreCase("MECH")) {
            branch = "MECHANICAL ENGINEERING";
            LOG.info("Set Branch ME  :", branch);

        } else if (branchName.equalsIgnoreCase("BT") || branchName.equalsIgnoreCase("BIO TECH")
            || branchName.equalsIgnoreCase("BIO TECH ENG")) {
            branch = "BIO TECHNOLOGY ENGINEERING";
            LOG.info("Set Branch BT  :", branch);

        } else if (branchName.equalsIgnoreCase("BIO MEDICAL") || branchName.equalsIgnoreCase("BIO MED")
            || branchName.equalsIgnoreCase("BIO MED ENG")) {
            branch = "BIO MEDICAL ENGINEERING";
            LOG.info("Set Branch BM  :", branch);

        } else if (branchName.equalsIgnoreCase("CSE") || branchName.equalsIgnoreCase("COMP SCI")
            || branchName.equalsIgnoreCase("COMPUTER SCI & TECH")) {
            branch = "COMPUTER SCIENCE & ENGINEERING";
            LOG.info("Set Branch CS  :", branch);

        } else if (branchName.equalsIgnoreCase("CH") || branchName.equalsIgnoreCase("CHEMICAL ENG")
            || branchName.equalsIgnoreCase("CHEM ENG & TECH")) {
            branch = "CHEMICAL ENGINEERING";
            LOG.info("Set Branch CH  :", branch);

        } else if (branchName.equalsIgnoreCase("CIVIL") || branchName.equalsIgnoreCase("CIVIL ENG")
            || branchName.equalsIgnoreCase("CE ENG")) {
            branch = "CIVIL ENGINEERING";
            LOG.info("Set Branch CE  :", branch);

        } else if (branchName.equalsIgnoreCase("ELECTRICAL") || branchName.equalsIgnoreCase("ELE ENG")
            || branchName.equalsIgnoreCase("ELECTRICAL ENG")) {
            branch = "ELECTRICAL ENGINEERING";
            LOG.info("Set Branch EE  :", branch);

        } else if (branchName.equalsIgnoreCase("ETC") || branchName.equalsIgnoreCase("ELECTRONICS & TELE COMM")
            || branchName.equalsIgnoreCase("ELECTRONICS")) {
            branch = "ELECTRONICS & TELE COMMUNICATION ENGINEERING";
            LOG.info("Set Branch EC  :", branch);

        } else if (branchName.equalsIgnoreCase("MET") || branchName.equalsIgnoreCase("METALLURGICAL")
            || branchName.equalsIgnoreCase("METAL ENG")) {
            branch = "METALLURGICAL ENGINEERING";
            LOG.info("Set Branch MT  :", branch);

        } else if (branchName.equalsIgnoreCase("MINING") || branchName.equalsIgnoreCase("MINING ENG")
            || branchName.equalsIgnoreCase("MIN ENG")) {
            branch = "MINING ENGINEERING";
            LOG.info("Set Branch MI  :", branch);

        } else {
            branch = branchName.toUpperCase();
            LOG.info("Set Branch set  :", branch);
        }
        return branch;
    }

    
    
    /** Get Gender Name by different Naming conventions **/
    private String getGender(String gender) {
        String genderName = "";
        if (gender.equalsIgnoreCase("M") || gender.equalsIgnoreCase("MALE")) {
            genderName = "Male";
            LOG.info("Set Gender Id One  :", genderName);
        } else if (gender.equalsIgnoreCase("F") || gender.equalsIgnoreCase("FEMALE")) {
            genderName = "Female";
            LOG.info("Set Gender Id Two  :", genderName);
        } else if (gender.equalsIgnoreCase("T") || gender.equalsIgnoreCase("TRANSGENDER")) {
            genderName = "Transgender";
            LOG.info("Set Gender Id Three  :", genderName);
        }
        return genderName;
    }
    
    
    

    /**
     * To Convert Excel Sheet Data into insertable into DataBase
     * 
     * @param dateValue
     * @return
     * @throws ParseException
     */
    private Date getDate(Date dateValue) throws ParseException {
        Date d1 = new Date();
        SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
        String formatD1 = format.format(dateValue);
        d1 = format.parse(formatD1);
        return d1;
    }
}
