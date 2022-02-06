package com.davaohome.admin.util;

public class RegexpUtil {

	public static final String EMAIL_PATTERN = "";
	public static final String PHONE_NO_PATTERN = "";
	public static final String BIRTHDAY_8_PATTERN = "(19|20)[\\d]{2}[0|1][\\d][0|1|2|3][\\d]";
	public static final String BIRTHDAY_6_PATTERN = "/^[\\d]{2}[0|1][\\d][0|1|2|3][\\d]/";

	public static boolean matches(String input, String regexp) {

		if(input == null || regexp == null) {
			return false;
		}

		return input.matches(regexp);
	}
}
