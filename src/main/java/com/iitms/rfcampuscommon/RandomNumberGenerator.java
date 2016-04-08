package com.iitms.rfcampuscommon;

import java.security.SecureRandom;

import org.springframework.stereotype.Component;

@Component
public class RandomNumberGenerator {

    private SecureRandom random = new SecureRandom();
    
    String saltChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    private SecureRandom randomPassword = new SecureRandom();
    
    public int getRandomNumber(){
        return random.nextInt();
    }
    
    public String generateRandomPassword(){
        String passwordStr = "";
        StringBuffer passwordBuffer = new StringBuffer();
        while (passwordBuffer.length() < 10) {
            int index = (int) (randomPassword.nextFloat() * saltChars.length());
            passwordBuffer.append(saltChars.substring(index, index + 1));
        }

        passwordStr = passwordBuffer.toString();
        
        return passwordStr;
    }
}
