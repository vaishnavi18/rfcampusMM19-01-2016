package com.iitms.rfcampuscommon;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class RandomNumberGenerator {

    private Random random = new Random(Long.MAX_VALUE);
    
    String saltChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    private Random randomPassword = new Random(Long.MAX_VALUE);
    
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
