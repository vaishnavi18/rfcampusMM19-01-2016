package com.iitms.rfcampuspresentation.academic.masters;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iitms.rfcampuscommon.Student;
import com.iitms.rfcampuscommon.StudentDao;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JREmptyDataSource;
 
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.data.JRTableModelDataSource;
import net.sf.jasperreports.engine.export.JExcelApiExporter;
import net.sf.jasperreports.engine.export.JRCsvExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXhtmlExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.oasis.JROdsExporter;
import net.sf.jasperreports.engine.export.oasis.JROdtExporter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRPptxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.engine.util.AbstractSampleApp;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

/**
 * 
 * @author Sachinmt
 *
 */
@Controller
public class JasperReportController  {

    private static final Logger logger=org.slf4j.LoggerFactory.getLogger(JasperReportController.class);    
    
    
    @Autowired
    private StudentDao studentDao;
    
          
    @RequestMapping(method = RequestMethod.GET , value = "/pdf")
    public ModelAndView generatePdfReport(ModelAndView modelAndView){ 
        
        logger.debug("--------------generate PDF report----------");
 
        Map<String,Object> parameterMap = new HashMap<String,Object>();
 
        List<Student> usersList = studentDao.retrieveAllRegisteredUsers();
        
        for(Student list:usersList){
            System.out.println("Record"+list);
        }
 
        JRDataSource JRdataSource = new JRBeanCollectionDataSource(usersList); 
        parameterMap.put("dataSource", JRdataSource);
 
        //JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(listOfDummyData);
        //System.out.println(dataSource.getRecordCount());
        //params.put("author", "by : mdsaputra.wordpress.com");
        //params.put("dataSource", dataSource);        
        //pdfReport bean has ben declared in the jasper-views.xml file
        //modelAndView = new ModelAndView("pdfReport", parameterMap);
        modelAndView = new ModelAndView("pdfReport", parameterMap);
        
        
       /* try {
            JasperPrint printer = JasperFillManager.fillReport(getClass().getResourceAsStream("classpath:tablereport.jrxml"), parameterMap, new JREmptyDataSource());
            //generate kedalam file report.pdf
            JasperExportManager.exportReportToPdfFile(printer, "C:/report.pdf");
            //tampilkan print viewer/dialog
            //ya benar, jasper memiliki print dialog sendiri, kerenkan?
            //jadi tidak usah repot membuka file pdf yang sudah digenerate, dan memanggil fungsi print bawaan java
            JasperViewer jv = new JasperViewer(printer);
            jv.show();
        } catch (JRException ex) {
            ex.printStackTrace();
        }*/
        return modelAndView;
        
    }
}
