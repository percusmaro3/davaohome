package com.davaohome.utils.convert;

import java.io.IOException;

import org.apache.commons.codec.binary.Base64;

//import sun.misc.BASE64Decoder;
//import sun.misc.BASE64Encoder;

public class Base64Encrypt {

//	public static BASE64Encoder encoder = new BASE64Encoder();

//	public static BASE64Decoder decoder = new BASE64Decoder();

 

	public static String encrypt(String planText) {
	
//		return encoder.encode(planText.getBytes());
		
		return new String(Base64.encodeBase64(planText.getBytes()));
	}
	
	 
	
	public static String decrypt(String encryptText) throws IOException {
	
//		return new String(decoder.decodeBuffer(encryptText));
		
		return new String(Base64.decodeBase64(encryptText));
	
	}

}


