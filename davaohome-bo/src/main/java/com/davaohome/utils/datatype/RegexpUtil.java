package com.davaohome.utils.datatype;

public class RegexpUtil {

	public static final String EMAIL_PATTERN = "^(([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5}){1,25})+([;.](([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5}){1,25})+)*$";
	public static final String PHONE_NO_PATTERN = "^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$";
	public static final String BIRTHDAY_8_PATTERN = "(19|20)[\\d]{2}[0|1][\\d][0|1|2|3][\\d]";
	public static final String BIRTHDAY_6_PATTERN = "^[\\d]{2}[0|1][\\d][0|1|2|3][\\d]";

	public static boolean matches(String input, String regexp) {

		if(input == null || regexp == null) {
			return false;
		}

		return input.matches(regexp);
	}
}
