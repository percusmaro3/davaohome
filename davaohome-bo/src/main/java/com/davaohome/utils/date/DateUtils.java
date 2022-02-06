package com.davaohome.utils.date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.time.FastDateFormat;

public class DateUtils {

	public static final long ONE_MINUTE_IN_MILLIS = 60000;

	/* 현재 날짜 반환 */
	public static java.util.Date date() {

		return new java.util.Date();
	}

	/* java.util.Date 클래스를 yyyy-MM-dd HH:mm:ss 포맷의 String으로 변환. */
	public static String dateToString(Date date) {

		return dateToString(date, "yyyy-MM-dd HH:mm:ss");
	}

	/* java.util.Date 클래스를 yyyy.MM.dd HH:mm:ss 포맷의 String으로 변환. */
	public static String dateToyymmdd(Date date) {

		return dateToString(date, "yyyy.MM.dd");
	}

	public static String dateToString(Date date, String pattern) {

		return FastDateFormat.getInstance(pattern).format(date);
	}

	/* yyyy/mm/dd 포맷을 java.util.Date 타입으로 변환  */
	public static Date stringToDate(String strdate) {

		//return stringToDate(strdate, "yyyy/MM/dd");
		return stringToDate(strdate, "yyyy.MM.dd");
	}

	public static Date stringToDateYYYYMMDDHHMM(String strdate) {

		//return stringToDate(strdate, "yyyy/MM/dd");
		return stringToDate(strdate, "yyyy-MM-dd HH:mm");
	}

	public static Date stringToDateYYYYMMDDHHMMSS(String strdate) {

		//return stringToDate(strdate, "yyyy/MM/dd");
		return stringToDate(strdate, "yyyy-MM-dd HH:mm:ss");
	}

	public static Date stringToDate(String strdate, String pattern) {

		try {

			if (StringUtils.defaultString(strdate) == "") {

				return null;
			} else {

				return FastDateFormat.getInstance(pattern, Locale.KOREA).parse(strdate);
			}
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}

	public static Date stringToDateNoExcpetion(String strdate, String pattern) {

		try {
			if (StringUtils.defaultString(strdate) == "") {
				return null;
			} else {
				return FastDateFormat.getInstance(pattern, Locale.KOREA).parse(strdate);
			}
		} catch (ParseException e) {
			return null;
		}
	}

	/* java.util.Date 클래스를 지정한 포맷의 String으로 변환.
	 * 데이터가 null 일경우 "" 리턴 */
	public static String dateToStringFormat(Date date, String format) {

		FastDateFormat transFormat = FastDateFormat.getInstance(format);
		if (date != null) {
			return transFormat.format(date);
		}
		return "";
	}

	/************************************************
	 * 메서드명 : getCalsDate<p>
	 * 메서드 기능 : 원하는 시점의 날짜를 찾는다.<p>
	 * PARAM : datatype <p>
	 * getCalsDate(0,1) :오늘<p>
	 * getCalsDate(1,1) :년, -1(1년전 오늘),-2(2년전 오늘)<p>
	 * getCalsDate(2,1) :개월, -1(1개월전 오늘),-2(2개월전 오늘), 1(1개월후 오늘)<p>
	 * getCalsDate(3 or 4 or 8,1) :주, -1(일주일전 같은요일), 1(1주일후 같은요일)<p>
	 * getCalsDate(5 or 6 or 7,1) :하루, -1(오늘부터 하루전), 1(오늘부터 하루후)<p>
	 * getCalsDate(9,1) :12시간, -1(12시간전) 1(12시간후) 2(24시간후)<p>
	 * PARAM date_type : 출력을 원하는 날짜형식<p>
	 * RETURN VALUE : datatype <p>
	 * 출처 : http://www.okjsp.net/seq/100706
	 * 수정자 : 김병규
	 *************************************************/
	//이해하기 쉽도록 변수 선언
	public static final int CALC_DATE_YEAR = 1;
	public static final int CALC_DATE_MONTH = 2;
	public static final int CALC_DATE_WEEK = 3;
	public static final int CALC_DATE_DAY = 4;
	public static final int CALC_DATE_TWELVE_HOURS = 9;

	public static Date getCalsDate(int y, int z) throws Exception {

		Calendar cal = Calendar.getInstance(Locale.KOREAN);
		cal.add(y, z);
		Date currentTime = cal.getTime();
		return currentTime;
	}

	public static long getXDayMillisFromNow(int day) {
		Date date = getToday();

		Calendar calendar = Calendar.getInstance();
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

	public static Date getToday() {
		Calendar todayCal = Calendar.getInstance();

		return todayCal.getTime();
	}

	public static String getTodayToString() {
		return DateUtils.dateToStringFormat(DateUtils.getToday(), "yyyyMMddHHmmss");
	}

	public static Date getTodayWithZeroTime() {
		Date today = getToday();

		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		return cal.getTime();
	}

	public static String makeStringtoDateFormat(String notFormat) {
		return notFormat.substring(0, 4) + "." + notFormat.substring(4, 6) + "." + notFormat.substring(6, 8);
	}

	public static Date getAddMinutes(int addMinutes) {

		Date date = new Date();
		long nowTime = date.getTime();

		Date addDate = new Date(nowTime + (addMinutes * ONE_MINUTE_IN_MILLIS));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String strDate = df.format(addDate);
		Date preOccupancyDate = DateUtils.stringToDateYYYYMMDDHHMM(strDate);

		return preOccupancyDate;
	}

	public static Date getAddMinutesOrver(int addMinutes) {

		Date date = new Date();
		long nowTime = date.getTime();

		Date addDate = new Date(nowTime + (addMinutes * ONE_MINUTE_IN_MILLIS));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate = df.format(addDate);
		Date preOccupancyDate = DateUtils.stringToDateYYYYMMDDHHMMSS(strDate);

		return preOccupancyDate;
	}

	public static Date getAddDate(Date date, int canlendarType, int add) {
		Calendar calDate = Calendar.getInstance();
		calDate.setTime(date);
		calDate.add(canlendarType, add);

		return calDate.getTime();
	}

	public static Date getAddDate(int canlendarType, int add) {
		return getAddDate(new Date(), canlendarType, add);
	}

	public static boolean checkMonth(Date date1, Date date2) {
		if (date1 == null || date2 == null) {
			return false;
		}

		if (getMonth(date1) == getMonth(date2)) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean checkCurrentMonth(Date date) {
		return checkMonth(date, getToday());
	}

	public static int getMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.MONTH);
	}

	public static int getCurrentMonth() {
		return getMonth(getToday());
	}
}
