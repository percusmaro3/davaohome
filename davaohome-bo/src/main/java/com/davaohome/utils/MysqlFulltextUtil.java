package com.davaohome.utils;

public class MysqlFulltextUtil {

	private static final String DELIMETER = ";";

	public static String makeFulltextStr(String... args) {

		StringBuffer sb = new StringBuffer();
		for (String arg : args) {
			sb.append(arg).append(DELIMETER);
		}

		return sb.toString();
	}
}
