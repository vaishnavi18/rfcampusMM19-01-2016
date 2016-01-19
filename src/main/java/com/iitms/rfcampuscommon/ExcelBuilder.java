package com.iitms.rfcampuscommon;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.servlet.view.document.AbstractExcelView;

/**
 * 
 * @author Sachinmt
 *
 */
public  class ExcelBuilder extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model,
            HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        /** get data model which is passed by the Spring container
         * 
         */
        List<ExcelModel> excelModelList = (List<ExcelModel>) model.get("excelModel");
         
        /** create a new Excel sheet
         * 
         */
        HSSFSheet sheet = workbook.createSheet("Java Books");
        sheet.setDefaultColumnWidth(30);
         
        /** create style for header cells
         * 
         */
        CellStyle style = workbook.createCellStyle();
        HSSFFont font = workbook.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.CORNFLOWER_BLUE.index);
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.GREY_80_PERCENT.index);
        style.setFont(font);
        
        /**
         * create style for local cells
         */
        CellStyle styles = workbook.createCellStyle();
        HSSFFont fonts = workbook.createFont();
        fonts.setFontName("Arial");
        fonts.setColor(HSSFColor.GREY_40_PERCENT.index);
        styles.setFont(fonts);
        
        
         
        /** create header row
         * 
         */
        HSSFRow header = sheet.createRow(0);
         
        header.createCell(0).setCellValue("Sr No");
        header.getCell(0).setCellStyle(style);
         
        header.createCell(1).setCellValue("Roll No");
        header.getCell(1).setCellStyle(style);
         
        header.createCell(2).setCellValue("AIR");
        header.getCell(2).setCellStyle(style);
         
        header.createCell(3).setCellValue("Candidate Name");
        header.getCell(3).setCellStyle(style);
         
        header.createCell(4).setCellValue("Branch Name");
        header.getCell(4).setCellStyle(style);
        
        header.createCell(5).setCellValue("Alloted Category");
        header.getCell(5).setCellStyle(style);
        
        header.createCell(6).setCellValue("Candidate Category");
        header.getCell(6).setCellStyle(style);
        
        header.createCell(7).setCellValue("Home State");
        header.getCell(7).setCellStyle(style);
        
        header.createCell(8).setCellValue("Reporting Date");
        header.getCell(8).setCellStyle(style);
        
        header.createCell(9).setCellValue("Reported From");
        header.getCell(9).setCellStyle(style);
        
        header.createCell(10).setCellValue("Quota");
        header.getCell(10).setCellStyle(style);
        
        header.createCell(11).setCellValue("Father Name");
        header.getCell(11).setCellStyle(style);
        
        header.createCell(12).setCellValue("Mother Name");
        header.getCell(12).setCellStyle(style);
        
        header.createCell(13).setCellValue("Mobile ");
        header.getCell(13).setCellStyle(style);
        
        header.createCell(14).setCellValue("Gender");
        header.getCell(14).setCellStyle(style);
        
        /**
         *  create data rows
         */
        int rowCount = 1;
         
        for (ExcelModel excelModel : excelModelList) {
            HSSFRow aRow = sheet.createRow(rowCount++);
            aRow.createCell(0).setCellValue(excelModel.getAdmissionExcelSerialNo());
            aRow.getCell(0).setCellStyle(styles);
            
            aRow.createCell(1).setCellValue(excelModel.getRollNumber());
            aRow.getCell(1).setCellStyle(styles);
            
            aRow.createCell(2).setCellValue(excelModel.getAllIndiaRanking());
            aRow.getCell(2).setCellStyle(styles);
            
            aRow.createCell(3).setCellValue(excelModel.getCandidateName());
            aRow.getCell(3).setCellStyle(styles);
            
            aRow.createCell(4).setCellValue(excelModel.getBranchName());
            aRow.getCell(4).setCellStyle(styles);
            
            aRow.createCell(5).setCellValue(excelModel.getAllocatedCategory());
            aRow.getCell(5).setCellStyle(styles);
            
            aRow.createCell(6).setCellValue(excelModel.getCandidateCategory());
            aRow.getCell(6).setCellStyle(styles);
            
            aRow.createCell(7).setCellValue(excelModel.getStateName());
            aRow.getCell(7).setCellStyle(styles);
            
            //aRow.createCell(8).setCellValue(excelModel.getReportingDate());            
            aRow.createCell(8).setCellValue("");
            aRow.getCell(8).setCellStyle(styles);
            
            aRow.createCell(9).setCellValue(excelModel.getReportedFrom());
            aRow.getCell(9).setCellStyle(styles);
            
            aRow.createCell(10).setCellValue(excelModel.getQuotaName());
            aRow.getCell(10).setCellStyle(styles);
            
            aRow.createCell(11).setCellValue(excelModel.getFatherName());
            aRow.getCell(11).setCellStyle(styles);
            
            aRow.createCell(12).setCellValue(excelModel.getMotherName());
            aRow.getCell(12).setCellStyle(styles);
            
            aRow.createCell(13).setCellValue(excelModel.getMobileNumber());
            aRow.getCell(13).setCellStyle(styles);
            
            aRow.createCell(14).setCellValue(excelModel.getGenderName());
            aRow.getCell(14).setCellStyle(styles);
        }
    }
}
