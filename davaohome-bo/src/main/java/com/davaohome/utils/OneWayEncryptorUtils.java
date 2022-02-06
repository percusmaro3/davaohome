package com.davaohome.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class OneWayEncryptorUtils {

	private static final String ALGORITHM_SHA_256 = "SHA-256";

	public static String makeSHA256(String data) {
		try {
			MessageDigest md5 = MessageDigest.getInstance(ALGORITHM_SHA_256);
			md5.update(data.getBytes());
			byte byteData[] = md5.digest();
			StringBuffer encrypted = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				encrypted.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			return encrypted.toString();
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("NoSuchAlgorithmException has occured", e);
		}
	}
}
