package com.iitms.rfcampusdomain.academic.admission.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @author Sachinmt
 *
 */
//@Transactional
public interface AdmissionExcelService {

	int saveExcelSheet(MultipartFile file);
}
