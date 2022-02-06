package com.davaohome.web.util;

import com.davaohome.bo.model.country.ServiceCountry;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Service
public class DatetimeUtil {

	public static Date convertToDate(long timeMillis) {
		return new Date(timeMillis);
	}

	public static Long convertToTimeMillis(String dateStr, SimpleDateFormat format) throws ParseException {
		if (StringUtils.isEmpty(dateStr)) {
			return null;
		}
		Date date = format.parse(dateStr);
		return date.getTime();
	}

	public static Date convertToDate(String dateStr, String formatStr) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat(formatStr);
		return convertToDate(dateStr, format);
	}

	public static Date convertToDate(String dateStr, SimpleDateFormat format) throws ParseException {
		if (StringUtils.isEmpty(dateStr)) {
			return null;
		}
		return format.parse(dateStr);
	}

	public static String convertToDateString(Long timeMillis, String countryStr) {

		return convertToDateString(timeMillis, ServiceCountry.getAdminCountry(countryStr));
	}

	public static String convertToDatetimeString(Long timeMillis, String countryStr) {
		return convertToDatetimeString(timeMillis, ServiceCountry.getAdminCountry(countryStr));
	}

	public static String convertToDateString(Date date, String countryStr) {

		return convertToDateString(date, ServiceCountry.getAdminCountry(countryStr));
	}

	public static String convertToDatetimeString(Date date, String countryStr) {
		return convertToDatetimeString(date, ServiceCountry.getAdminCountry(countryStr));
	}

	public static String convertToDateString(Long timeMillis, ServiceCountry country) {
		if (timeMillis == null || timeMillis == 0) {
			return "";
		}

		Date date = convertToDate(timeMillis);
		return convertToDateString(date, country);
	}

	public static String convertToDatetimeString(Long timeMillis, ServiceCountry country) {
		if (timeMillis == null || timeMillis == 0) {
			return "";
		}

		Date date = convertToDate(timeMillis);
		return convertToDatetimeString(date, country);
	}

	public static String convertToDateString(Date date, ServiceCountry country) {

		Date date2 = applyTimezone(date, country.getTimezoneOffsetHour());
		return country.getDateFormat().format(date2);
	}

	public static String convertToDatetimeString(Date date, ServiceCountry country) {

		Date date2 = applyTimezone(date, country.getTimezoneOffsetHour());
		return country.getDatetimeFormat().format(date2);
	}

	private static Date applyTimezone(Date date, int timezoneOffsetHour) {

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.HOUR, timezoneOffsetHour);

		return calendar.getTime();
	}


}
