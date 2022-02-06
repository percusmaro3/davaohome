package com.davaohome.utils.io;

public class FileUtils {

	public static String BASE_FILEPATH = "";

	public static String getExtName(String fileName) {
		int lastDot = fileName.lastIndexOf(".");
		return fileName.substring(lastDot + 1);
	}
}
