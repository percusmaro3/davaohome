package com.davaohome.admin.util;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang3.time.FastDateFormat;

public class DateUtil {


	/* 현재 날짜 반환 */
	public static java.util.Date date() {
		return new java.util.Date();
	}

	/* java.util.Date 클래스를 yyyy-MM-dd HH:mm:ss 포맷의 String으로 변환. */
	public static String dateToString(Date date) {

		FastDateFormat transFormat = FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss");
		return transFormat.format(date);
	}

	/* 오늘 날짜를 yyyy/mm/dd date형식으로 변환 */
	public static Date getToday() throws ParseException {
		FastDateFormat fdf = FastDateFormat.getInstance("yyyy.MM.dd");
		return fdf.parse(fdf.format(new Date()));
	}

	/* yyyy/mm/dd 포맷을 java.util.Date 타입으로 변환  */
	public static Date stringToDate(String strdate) throws ParseException {

		FastDateFormat transFormat = FastDateFormat.getInstance("yyyy/MM/dd", Locale.KOREA);
		if (strdate == "") {
			return null;
		} else {
			return transFormat.parse(strdate);

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
	 * PARAM : string <p>
	 * getCalsDate(0,1) :오늘<p>
	 * getCalsDate(1,1) :년, -1(1년전 오늘),-2(2년전 오늘)<p>
	 * getCalsDate(2,1) :개월, -1(1개월전 오늘),-2(2개월전 오늘), 1(1개월후 오늘)<p>
	 * getCalsDate(3 or 4 or 8,1) :주, -1(일주일전 같은요일), 1(1주일후 같은요일)<p>
	 * getCalsDate(5 or 6 or 7,1) :하루, -1(오늘부터 하루전), 1(오늘부터 하루후)<p>
	 * getCalsDate(9,1) :12시간, -1(12시간전) 1(12시간후) 2(24시간후)<p>
	 * PARAM date_type : 출력을 원하는 날짜형식<p>
	 * RETURN VALUE : string <p>
	 * 출처 : http://www.okjsp.net/seq/100706
	 * 수정자 : 김병규
	 *************************************************/
	//이해하기 쉽도록 변수 선언
	public static final int CALC_DATE_YEAR = 1;
	public static final int CALC_DATE_MONTH = 2;
	public static final int CALC_DATE_WEEK = 3;
	public static final int CALC_DATE_DAY = 5;
	public static final int CALC_DATE_TWELVE_HOURS = 9;

	public static Date getCalsDate(Date date, int y, int z) throws Exception {

		Calendar cal = Calendar.getInstance(Locale.KOREAN);
		cal.setTime(date);
		cal.add(y, z);
		Date currentTime = cal.getTime();
		return currentTime;
	}

	public static Date getCalsDate(int y, int z) throws Exception {

		return getCalsDate(new Date(), y, z);
	}

}
