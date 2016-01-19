package com.iitms.rfcampuscommon;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUploadUtil {

    @Autowired
    UploadsDirectories uploadsDirectories;

    @Autowired
    RandomNumberGenerator randomNumberGenerator;

    public String uploadFile(HttpServletRequest request, MultipartFile newFile, String oldFileName, String mainModule, String subModule) {
        String fileName = null;
        String realPath = request.getSession().getServletContext().getRealPath("");
        File directory = null;
        
        try {
            switch (mainModule) {
                
                case "authentication":{
                    
                    switch(subModule){
                        case "college": {
                            directory = new File(realPath + uploadsDirectories.getUploadDirectory()
                            + uploadsDirectories.getAuthorizationDirectory() + uploadsDirectories.getCollege());

                        if (!directory.exists())
                            directory.mkdirs();
                        
                        if (newFile != null && newFile.getOriginalFilename() != "") {
                            deleteFile(request, oldFileName, "college");
                            fileName = getFileName(newFile.getOriginalFilename());
                            newFile.transferTo(new File(realPath + uploadsDirectories.getUploadDirectory()
                                + uploadsDirectories.getAuthorizationDirectory() + uploadsDirectories.getCollege() + fileName));
                        }
                        }
                            break;
                        case "society": {
                            directory = new File(realPath + uploadsDirectories.getUploadDirectory()
                            + uploadsDirectories.getAuthorizationDirectory() + uploadsDirectories.getSociety());

                        if (!directory.exists())
                            directory.mkdirs();
                        
                        if (newFile != null && newFile.getOriginalFilename() != "") {
                            deleteFile(request, oldFileName, "society");
                            fileName = getFileName(newFile.getOriginalFilename());
                            newFile.transferTo(new File(realPath + uploadsDirectories.getUploadDirectory()
                                + uploadsDirectories.getAuthorizationDirectory() + uploadsDirectories.getSociety() + fileName));
                        }
                        }
                            break;
                        case "user": {
                            directory = new File(realPath + uploadsDirectories.getUploadDirectory()
                            + uploadsDirectories.getAuthorizationDirectory() + uploadsDirectories.getUser());

                        if (!directory.exists())
                            directory.mkdirs();
                        
                        if (newFile != null && newFile.getOriginalFilename() != "") {
                            deleteFile(request, oldFileName, "user");
                            fileName = getFileName(newFile.getOriginalFilename());
                            newFile.transferTo(new File(realPath + uploadsDirectories.getUploadDirectory()
                                + uploadsDirectories.getAuthorizationDirectory() + uploadsDirectories.getUser() + fileName));
                        }
                        }
                            break;
                    }
                }
                case "academic":{
                    switch(subModule){
                        case "admission":{
                            directory = new File(realPath + uploadsDirectories.getUploadDirectory()
                            + uploadsDirectories.getAcademicDirectory() + uploadsDirectories.getAdmission());

                        if (!directory.exists())
                            directory.mkdirs();
                        
                        if (newFile != null && newFile.getOriginalFilename() != "") {
                            deleteFile(request, oldFileName, "admission");
                            fileName = getFileName(newFile.getOriginalFilename());
                            newFile.transferTo(new File(realPath + uploadsDirectories.getUploadDirectory()
                                + uploadsDirectories.getAcademicDirectory() + uploadsDirectories.getAdmission() + fileName));
                        }
                        break;
                        }
                        case "registration":{
                            directory = new File(realPath + File.separator + uploadsDirectories.getUploadDirectory()
                            + uploadsDirectories.getAcademicDirectory() + uploadsDirectories.getRegistration());

                        if (!directory.exists())
                            directory.mkdirs();
                        
                        if (newFile != null && newFile.getOriginalFilename() != "") {
                            deleteFile(request, oldFileName, "registration");
                            fileName = getFileName(newFile.getOriginalFilename());
                            newFile.transferTo(new File(realPath + File.separator +  uploadsDirectories.getUploadDirectory()
                                + uploadsDirectories.getAcademicDirectory() + uploadsDirectories.getRegistration() + fileName));
                        }
                        break;
                        }
                    }
                }
                
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return fileName;
    }

    private String getFileName(String originalFileName) {
        return "authorization_college_" + randomNumberGenerator.getRandomNumber() + "_" + originalFileName;
    }

    private void deleteFile(HttpServletRequest request, String oldFileName, String module) {

        switch (module) {
            case "college": {
                new File(request.getSession().getServletContext().getRealPath("")
                    + uploadsDirectories.getUploadDirectory() + uploadsDirectories.getAuthorizationDirectory()
                    + uploadsDirectories.getCollege() + oldFileName).delete();
            }
                break;
            case "society": {
                new File(request.getSession().getServletContext().getRealPath("")
                    + uploadsDirectories.getUploadDirectory() + uploadsDirectories.getAuthorizationDirectory()
                    + uploadsDirectories.getSociety() + oldFileName).delete();
            }
                break;
            case "user": {
                new File(request.getSession().getServletContext().getRealPath("")
                    + uploadsDirectories.getUploadDirectory() + uploadsDirectories.getAuthorizationDirectory()
                    + uploadsDirectories.getUser() + oldFileName).delete();
            }
                break;
            case "admission": {
                new File(request.getSession().getServletContext().getRealPath("")
                    + uploadsDirectories.getUploadDirectory() + uploadsDirectories.getAcademicDirectory()
                    + uploadsDirectories.getAdmission() + oldFileName).delete();
            }
                break;
            case "registration": {
                new File(request.getSession().getServletContext().getRealPath("")
                    + uploadsDirectories.getUploadDirectory() + uploadsDirectories.getAcademicDirectory()
                    + uploadsDirectories.getRegistration() + oldFileName).delete();
            }
                break;    
        }

    }
    
    
    public String copyFileRegistrationToAdmission(HttpServletRequest request, String sourceFileName){
        InputStream inStream = null;
        OutputStream outStream = null;
        String fileName = null;
        String realPath = request.getSession().getServletContext().getRealPath("");
        
        try {
            File sourceFile = new File(realPath
                + uploadsDirectories.getUploadDirectory() + uploadsDirectories.getAcademicDirectory()
                + uploadsDirectories.getRegistration() + sourceFileName);
            
            fileName = this.getFileName(sourceFileName);
            File destinationFile =new File(realPath
                + uploadsDirectories.getUploadDirectory() + uploadsDirectories.getAcademicDirectory()
                + uploadsDirectories.getAdmission() + fileName);
            
            inStream = new FileInputStream(sourceFile);
            outStream = new FileOutputStream(destinationFile);
            
            byte[] buffer = new byte[1024];
            
            int length;
            
            while ((length = inStream.read(buffer)) > 0){
                outStream.write(buffer, 0, length);
            }
         
            inStream.close();
            outStream.close();
            
            sourceFile.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return fileName;
    }
}
