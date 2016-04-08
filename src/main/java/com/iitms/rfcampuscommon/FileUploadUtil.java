package com.iitms.rfcampuscommon;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUploadUtil {

    private long serialNumber;

    private static final Logger LOG = LoggerFactory.getLogger(FileUploadUtil.class);

    public String uploadFile(HttpServletRequest request, MultipartFile newFile, String oldFileName, String fileType) {
        String fileName = null;
        String uploadPath = request.getSession().getServletContext().getInitParameter("uploadPath");
        File directory = null;

        try {
            directory = new File(uploadPath);

            if (!directory.exists())
                directory.mkdirs();

            if (newFile != null && newFile.getOriginalFilename() != "") {
                deleteFile(request, oldFileName);
                fileName = getFileName(fileType, newFile.getOriginalFilename());
                newFile.transferTo(new File(uploadPath + File.separator + fileName));
            }

        } catch (Exception e) {
            LOG.error("err", e);
        }

        return fileName;
    }

    private String getFileName(String fileType, String originalFileName) {
        String fileName = null;
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        LOG.info("Filename : " + originalFileName + " - " + extension);

        switch (fileType) {
            case ConstantUtil.IMAGE:
                fileName = "Image_File_" + serialNumber + extension;
                break;
            case ConstantUtil.PDF:
                fileName = "Pdf_File_" + serialNumber + extension;
                break;
        }

        serialNumber++;

        return fileName;
    }

    private void deleteFile(HttpServletRequest request, String oldFileName) {
        new File(request.getSession().getServletContext().getInitParameter("reportPath") + oldFileName).delete();
    }

}
