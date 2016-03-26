package com.iitms.rfcampuspresentation.authentication;

import java.text.NumberFormat;

public class ReadonlySettings {

	public static void main(String[] args) {
	    NumberFormat numberFormat = NumberFormat.getInstance();
	    numberFormat.setMinimumIntegerDigits(3);
	    String number = numberFormat.format(1);

	    System.out.println(number);
    }

	
}
