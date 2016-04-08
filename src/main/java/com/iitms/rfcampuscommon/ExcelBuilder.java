package com.iitms.rfcampuscommon;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.servlet.view.document.AbstractExcelView;

/**
 * @author Sachinmt
 */
@SuppressWarnings("deprecation")
public class ExcelBuilder extends AbstractExcelView {

    private static String reportName = null;

    CellStyle headerStyle;

    CellStyle cellStyle;

    @Override
    protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
        HttpServletResponse response) throws Exception {

        /**
         * get data model which is passed by the Spring container
         */
        // List<Map<Object, Object>> excelModelList = (List<Map<Object, Object>>) model.get("excelModel");

        reportName = (String) model.get("excelReportName");
        /**
         * create a new Excel sheet
         */
        HSSFSheet sheet = workbook.createSheet("Java Books");
        sheet.setDefaultColumnWidth(30);

        setStyle(workbook);
        setExcelHeader(sheet, reportName, model);
        setExcelRows(sheet, model);
    }

    private void setExcelRows(HSSFSheet sheet, Map<String, Object> model) {
        int rowCount = 1;
        int cellIndex = 0;

        switch (reportName) {

            case ConstantUtil.EXCEL_SELECTED_FIELD: {
                Object excelModelList = model.get("excelModel");
                Map<String, Object> headerInfo = (Map<String, Object>) model.get("headerInfo");
                int columnCount = (int) headerInfo.get("columns");

                if (columnCount == -1) {

                    List<Object[]> list = (List<Object[]>) excelModelList;

                    for (Object[] excelModel : list) {
                        HSSFRow aRow = sheet.createRow(rowCount++);

                        aRow.setRowStyle((HSSFCellStyle) cellStyle);

                        for (Object field : excelModel) {
                            aRow.createCell(cellIndex++).setCellValue((String) field);

                        }
                        cellIndex = 0;
                    }
                } else {
                    List<Object> list = (List<Object>) excelModelList;

                    for (Object field : list) {
                        HSSFRow aRow = sheet.createRow(rowCount++);

                        aRow.setRowStyle((HSSFCellStyle) cellStyle);

                        aRow.createCell(cellIndex++).setCellValue((String) field);

                        cellIndex = 0;
                    }
                }

                break;
            }
            case ConstantUtil.EXCEL_SAMPLE: {
                Object excelModelList = model.get("excelModel");
                List<CommonExcelModel> list = (List<CommonExcelModel>) excelModelList;

                for (CommonExcelModel excelModel : list) {
                    HSSFRow aRow = sheet.createRow(rowCount++);

                    aRow.setRowStyle((HSSFCellStyle) cellStyle);
                    // aRow.getCell(0).setCellStyle(cellStyle);
                    aRow.createCell(0).setCellValue(excelModel.getField0());
                    aRow.createCell(1).setCellValue(excelModel.getField1());
                    aRow.createCell(2).setCellValue(excelModel.getField2());
                    aRow.createCell(3).setCellValue(excelModel.getField3());
                    aRow.createCell(4).setCellValue(excelModel.getField4());
                    aRow.createCell(5).setCellValue(excelModel.getField5());
                    aRow.createCell(6).setCellValue(excelModel.getField6());
                    aRow.createCell(7).setCellValue(excelModel.getField7());
                    aRow.createCell(8).setCellValue("");
                    aRow.createCell(9).setCellValue(excelModel.getField9());
                    aRow.createCell(10).setCellValue(excelModel.getField10());
                    aRow.createCell(11).setCellValue(excelModel.getField11());
                    aRow.createCell(12).setCellValue(excelModel.getField12());
                    aRow.createCell(13).setCellValue(excelModel.getField13());
                    aRow.createCell(14).setCellValue(excelModel.getField14());
                }
                break;
            }
            case ConstantUtil.EXCEL_SAMPLE_DOWNLOAD: {
                Object excelModelList = model.get("excelModel");
                List<ExcelModel> list = (List<ExcelModel>) excelModelList;
                for (ExcelModel excelModel : list) {
                    HSSFRow aRow = sheet.createRow(rowCount++);
                    aRow.createCell(0).setCellValue(excelModel.getAdmissionExcelSerialNo());
                    aRow.createCell(1).setCellValue(excelModel.getRollNumber());
                    aRow.createCell(2).setCellValue(excelModel.getAllIndiaRanking());
                    aRow.createCell(3).setCellValue(excelModel.getCandidateName());
                    aRow.createCell(4).setCellValue(excelModel.getBranchName());
                    aRow.createCell(5).setCellValue(excelModel.getAllocatedCategory());
                    aRow.createCell(6).setCellValue(excelModel.getCandidateCategory());
                    aRow.createCell(7).setCellValue(excelModel.getStateName());
                    aRow.createCell(8).setCellValue("");
                    aRow.createCell(9).setCellValue(excelModel.getReportedFrom());
                    aRow.createCell(10).setCellValue(excelModel.getQuotaName());
                    aRow.createCell(11).setCellValue(excelModel.getFatherName());
                    aRow.createCell(12).setCellValue(excelModel.getMotherName());
                    aRow.createCell(13).setCellValue(excelModel.getMobileNumber());
                    aRow.createCell(14).setCellValue(excelModel.getGenderName());

                }
            }
                break;

        }
    }

    @SuppressWarnings("unchecked")
    private void setExcelHeader(HSSFSheet sheet, String reportName, Map<String, Object> model) {
        HSSFRow header = sheet.createRow(0);
        int cellNumber = 0;

        switch (reportName) {
            case ConstantUtil.EXCEL_SAMPLE_DOWNLOAD: {
                for (String headerName : ConstantUtil.EXCEL_SAMPLE_HEADER) {
                    header.createCell(cellNumber).setCellValue(headerName);
                    header.getCell(cellNumber).setCellStyle(headerStyle);
                    cellNumber++;
                }
                break;
            }
            case ConstantUtil.EXCEL_SELECTED_FIELD: {
                Map<String, Object> headerInfo = (Map<String, Object>) model.get("headerInfo");

                for (Object key : (Object[]) headerInfo.get("headers")) {
                    header.createCell(cellNumber).setCellValue((String) key);
                    header.getCell(cellNumber).setCellStyle(headerStyle);
                    cellNumber++;
                }
                break;
            }
        }
    }

    private void setStyle(HSSFWorkbook workbook) {
        headerStyle = workbook.createCellStyle();
        HSSFFont font = workbook.createFont();
        font.setFontName("Arial");
        headerStyle.setFillForegroundColor(HSSFColor.CORNFLOWER_BLUE.index);
        headerStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.GREY_80_PERCENT.index);
        headerStyle.setFont(font);

        cellStyle = workbook.createCellStyle();
        HSSFFont fonts = workbook.createFont();
        fonts.setFontName("Arial");
        fonts.setColor(HSSFColor.GREY_40_PERCENT.index);
        cellStyle.setFont(fonts);
    }
}
