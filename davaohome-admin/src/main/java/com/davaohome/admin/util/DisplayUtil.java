package com.davaohome.admin.util;

import java.text.ParseException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

@Service
public class DisplayUtil {

	public static String changeTelType(String telInfo) {
		String newTelInfo;
		if (telInfo == null) {
			newTelInfo = "";
		} else {
			String patternRegex = "(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})";
			Pattern p = Pattern.compile(patternRegex);
			Matcher m = p.matcher(telInfo);
			newTelInfo = m.replaceAll("$1-$2-$3");
		}
		return newTelInfo;

	}

	public static String changeZipCodeFormat(String zipCode) {
		if (zipCode.length() < 6) {
			return zipCode;
		}
		return zipCode.substring(0, 3) + "-" + zipCode.substring(3, 6);
	}

	public static String compareTodayAndTargetDate(Date targetDate) throws ParseException {
		Date current = DateUtil.getToday();

		if (current.compareTo(targetDate) > 0) {
			return "N";
		} else {
			return "Y";
		}
	}

	public static String masking(String value, int start) {
		if (StringUtils.isBlank(value)) {
			return value;
		}

		return masking(value, start, value.length());
	}

	public static String masking(String value, int start, int end) {
		if (StringUtils.isBlank(value)) {
			return value;
		}

		String[] parts = new String[]{value.substring(0, start), value.substring(start, end),
			value.substring(end, value.length())};

		return parts[0] + parts[1].replaceAll(".", "*") + parts[2];
	}
}
