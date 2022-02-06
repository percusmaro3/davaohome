package com.davaohome.utils.datatype;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtils {

	public static String markAsterisk(String id) {
		int idxOfAmpersat = id.indexOf("@");
		int lengthOfMemberId = id.length();
		String markedMemberId;

		if (idxOfAmpersat != -1) {
			if (idxOfAmpersat >= 3) {
				markedMemberId = id.substring(0, 2) + "***" + id.substring(idxOfAmpersat, idxOfAmpersat + 3);
			} else {
				markedMemberId = id.substring(0, idxOfAmpersat) + "***"
								 + id.substring(idxOfAmpersat, idxOfAmpersat + 3);
			}
		} else {
			if (lengthOfMemberId < 3) {
				markedMemberId = id + "***";
			} else {
				markedMemberId = id.substring(0, 2) + "***";
			}
		}
		return markedMemberId;
	}

	public static String getFileExtenttion(String fileName) {
		String regex = "[\\w]*$";

		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(fileName);

		while (matcher.find()) {
			return matcher.group();
		}

		return null;
	}

}
