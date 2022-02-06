package com.davaohome.utils.date;


import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public final class DateTimeUtil {

	private static final Log logger = LogFactory.getLog(DateTimeUtil.class);
	public static final int DAY_SECOND = 86400;
	public static final Locale curLocale = Locale.getDefault();
	public static final int timezoneOffsetHour = 0;
	public static final SimpleDateFormat dateTimeFormat = null;
	public static final SimpleDateFormat dateFormat = null;

	public static SimpleDateFormat newSimpleDateFormatWithTimezone(String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format, curLocale);
		return sdf;
	}

	public static String convertDateToDefault(Date date) {
		if (date == null) {
			return "";
		}
		return dateTimeFormat.format(date);
	}

	public static String convertDateToYYYYMMDDSlash(Date date) {
		if (date == null) {
			return "";
		}
		return dateTimeFormat.format(date);
	}

	public static String convertDateToForChart(Date date) {
		if (date == null) {
			return "";
		}
		return new SimpleDateFormat("yyyy/MM/dd").format(date);
	}

	public static String convertDateToYYYYMM(Date date) {
		//return new SimpleDateFormat("yyyy年MM月").format(date);
		return new SimpleDateFormat("MMM yyyy").format(date);
	}

	public static String convertDateToStr(Date date, String dateFormat) {
		return new SimpleDateFormat(dateFormat).format(date);
	}

	public static Date parseTimeToHHMMAMPM(String timeStr) {
		return parseDate(timeStr, "hh:mm a");
	}

	public static Date parseTimeToHHMM(String timeStr) {
		return parseDate(timeStr, "HH:mm");
	}

	public static String convertDateToHHMMAMPM(Date date) {
		if (date == null) {
			return "";
		}

		return new SimpleDateFormat("hh:mm a", Locale.US).format(date);
	}

	public static String convertDateToHHMM(Date date) {
		if (date == null) {
			return "";
		}

		return new SimpleDateFormat("HH:mm", Locale.US).format(date);
	}

	/**
	 * 입력받은 날짜형 string을 previousformat으로 파싱한뒤 returnformat형식으로 리턴한다.
	 *
	 * @param dateString
	 * @param previousformat
	 * @param returnformat
	 * @return
	 */
	public static String convertDateText(String dateString,
										 String previousformat, String returnformat) {
		return convertDateText(dateString, previousformat, returnformat, curLocale);
	}

	/**
	 * 입력받은 날짜형 string을 previousformat으로 파싱한뒤 returnformat형식으로 리턴한다.
	 * 단, DateFormatSymbols는 locale을 따른다.
	 *
	 * @param dateString
	 * @param previousformat
	 * @param returnformat
	 * @param locale
	 * @return
	 */
	public static String convertDateText(String dateString,
										 String previousformat, String returnformat, Locale locale) {
		try {
			Date date = parseDate(dateString, previousformat);
			return new SimpleDateFormat(returnformat, locale).format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return dateString;
		}
	}

	/**
	 * 현재시간을 returnformat 형식으로 리턴한다.
	 *
	 * @param date
	 * @param returnformat
	 * @return
	 */
	public static String convertDateText(String returnformat) {
		return convertDateText(returnformat, curLocale);
	}

	/**
	 * 현재시간을 returnformat 형식으로 리턴한다.
	 * 단, DateFormatSymbols는 locale을 따른다.
	 *
	 * @param date
	 * @param returnformat
	 * @param locale
	 * @return
	 */
	public static String convertDateText(String returnformat, Locale locale) {
		Date date = new Date();
		try {
			return new SimpleDateFormat(returnformat, locale).format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return date.toString();
		}
	}

	/**
	 * 입력받은 date를 returnformat 형식으로 리턴한다.
	 */
	public static String convertDateText(Date date, String returnformat) {
		return convertDateText(date, returnformat, curLocale);
	}

	/**
	 * 입력받은 date를 returnformat 형식으로 리턴한다.
	 * 단, DateFormatSymbols는 locale을 따른다.
	 */
	public static String convertDateText(Date date, String returnformat,
										 Locale locale) {
		try {
			return new SimpleDateFormat(returnformat, locale).format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return date.toString();
		}
	}

	/**
	 * 날짜형 텍스트를 pattern으로 파싱하여 java.util.Date로 변환합니다.
	 */
	public static Date parseDate(String dateString, String pattern) {
		if (StringUtils.isEmpty(dateString)) {
			return null;
		}

		SimpleDateFormat formatter = new SimpleDateFormat(pattern, Locale.US);
		// Parse the previous string back into a Date.
		ParsePosition pos = new ParsePosition(0);
		return formatter.parse(dateString, pos);
	}

	public static Date createDate(int year, int month, int day) {
		Calendar cal = Calendar.getInstance();

		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month);
		cal.set(Calendar.DATE, day);

		return cal.getTime();
	}

	public static long getXDayMillisFromNow(int day) {
		Date date = getToday();

		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.HOUR, timezoneOffsetHour);

		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, day);

		return calendar.getTimeInMillis();
	}

	public static Date getXDayDateFromNow(int day) {
		long dateMillis = getXDayMillisFromNow(day);
		return new Date(dateMillis);
	}

	public static Date getXDayDate(Date basicDate, int day) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(basicDate);
		calendar.add(Calendar.DAY_OF_MONTH, day);

		return new Date(calendar.getTimeInMillis());
	}

	public static int getTermDays(Date startDate, Date endDate) {
		return getTermDays(startDate.getTime(), endDate.getTime());
	}

	public static int getTermDays(long startDate, long endDate) {
		long term = endDate - startDate;
		return (int) (term / (60 * 60 * 24 * 1000)) + 1;
	}

	public static String getLocaleStringExcludeSecond(Date d) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(d);
		cal.set(Calendar.SECOND, 0);
		Date excludeSecondDate = cal.getTime();

		return DateFormat.getInstance().format(excludeSecondDate);
	}

	public static Date getComputeMonth(Date d, int addMonthCount) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(d);
		cal.add(Calendar.MONTH, addMonthCount);

		return cal.getTime();
	}

	public static int[] getDayHourMinuteSecondFromSecond(int totalSecond) {

		int[] returnValue = new int[4];

		returnValue[0] = totalSecond / DAY_SECOND; // day
		int daySecond = returnValue[0] * DAY_SECOND;

		returnValue[1] = (totalSecond - daySecond) / 60 / 60; // hour
		returnValue[2] = ((totalSecond - (daySecond)) - returnValue[1] * 360) / 60; // minute
		returnValue[3] = totalSecond % 60; // second

		return returnValue;
	}

	public static Date getToday() {
		Calendar todayCal = Calendar.getInstance();
		todayCal.add(Calendar.HOUR, timezoneOffsetHour);
		todayCal.set(Calendar.MILLISECOND, 0);

		return todayCal.getTime();
	}

	public static String getToday(String format) {
		Date date = getToday();
		return convertDateText(date, format);
	}

	public static Date getTodayWithZeroTime() {
		Date today = getToday();

		return getDateWithFirstTime(today);
	}

	public static Date getDateWithFirstTime(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);

		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		return cal.getTime();
	}

	public static Date getDateWithLastTime(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);

		cal.set(Calendar.HOUR, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 99);

		return cal.getTime();
	}

	public static String getCurrentYYYYMM() {
		Date curDate = getToday();
		return new SimpleDateFormat("yyyyMM").format(curDate);
	}

	public static String getCurrentTimeHH() {
		Calendar todayCal = Calendar.getInstance();
		todayCal.add(Calendar.HOUR, timezoneOffsetHour);

		int time = todayCal.get(Calendar.HOUR);
		String timeStr = String.valueOf(time);

		return timeStr.length() != 2 ? "0" + timeStr : timeStr;
	}

	public static String getCurrentTimeHH(int term) {
		Calendar todayCal = Calendar.getInstance();
		todayCal.add(Calendar.HOUR, timezoneOffsetHour);
		todayCal.add(Calendar.HOUR, term);

		int time = todayCal.get(Calendar.HOUR_OF_DAY);
		String timeStr = String.valueOf(time);

		return timeStr.length() != 2 ? "0" + timeStr : timeStr;
	}

	public static String getDayOfWeekByEng(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);

		int dayNum = cal.get(Calendar.DAY_OF_WEEK);

		switch (dayNum) {
			case 1:
				return "Sun";
			case 2:
				return "Mon";
			case 3:
				return "Tue";
			case 4:
				return "Wed";
			case 5:
				return "Thu";
			case 6:
				return "Fri";
			case 7:
				return "Sat";
		}
		return null;
	}

}