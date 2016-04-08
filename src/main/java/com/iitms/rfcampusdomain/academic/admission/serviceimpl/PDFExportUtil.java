package com.iitms.rfcampusdomain.academic.admission.serviceimpl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView;

import net.sf.jasperreports.engine.JasperPrint;

public class PDFExportUtil extends JasperReportsPdfView{

    private String fileName;
    
    @Override
    protected void renderReport(JasperPrint populatedReport, Map<String, Object> model, HttpServletResponse response)
            throws Exception {

        net.sf.jasperreports.engine.JRExporter exporter = createExporter();

        fileName = (String) model.get("fileName");
        
        Map<net.sf.jasperreports.engine.JRExporterParameter, Object> mergedExporterParameters = getConvertedExporterParameters();
        if (!CollectionUtils.isEmpty(mergedExporterParameters)) {
            exporter.setParameters(mergedExporterParameters);
        }

        if (useWriter()) {
            renderReportUsingWriter(exporter, populatedReport, response);
        }
        else {
            renderReportUsingOutputStream(exporter, populatedReport, response);
        }
    }
    
    
    protected void writeToResponse(HttpServletResponse response, ByteArrayOutputStream baos) throws IOException {
        // Write content type and also length (determined via byte array).
        response.setContentType("application/pdf");
        response.setContentLength(baos.size());
        response.setHeader( "Content-Disposition", "attachment;filename="
            + fileName );

        // Flush byte array to servlet output stream.
        ServletOutputStream out = response.getOutputStream();
        baos.writeTo(out);
        out.flush();
    }
}
