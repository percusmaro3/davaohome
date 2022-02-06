package com.davaohome.utils.date;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang3.time.FastDateFormat;
import org.springframework.stereotype.Component;

@Component("boDateUtil")
public class DateUtil {

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
	public static final int CALC_DATE_DAY = 5;
	public static final int CALC_DATE_TWELVE_HOURS = 9;
	public static final String[] KOREAN_DAY_ARRAY = {"일", "월", "화", "수", "목", "금", "토"};

	/* 현재 날짜 반환 */
	public static java.util.Date date() {

		return new java.util.Date();
	}

	/* java.util.Date 클래스를 yyyy-MM-dd HH:mm:ss 포맷의 String으로 변환. */
	public static String dateToString(Date date) {

		return dateToString(date, "yyyy-MM-dd HH:mm:ss");
	}

	public static String dateToString(Date date, String pattern) {

		return FastDateFormat.getInstance(pattern).format(date);
	}

	/* yyyy/mm/dd 포맷을 java.util.Date 타입으로 변환  */
	public static Date stringToDate(String strdate) {

		//return stringToDate(strdate, "yyyy/MM/dd");
		return stringToDate(strdate, "yyyy.MM.dd");
	}

	public static Date stringToDate(String strdate, String pattern) {

		try {

			if (strdate == "") {

				return null;
			} else {

				return FastDateFormat.getInstance(pattern, Locale.KOREA).parse(strdate);
			}
		} catch (ParseException e) {
			throw new RuntimeException(e);
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

	public static Date getCalsDate(Date date, int y, int z) throws Exception {

		if (date == null) {
			return null;
		}

		Calendar cal = Calendar.getInstance(Locale.KOREAN);
		cal.setTime(date);
		cal.add(y, z);
		Date currentTime = cal.getTime();
		return currentTime;
	}

	public static Date getCalsDate(int y, int z) throws Exception {

		return getCalsDate(new Date(), y, z);
	}

	public static String getDepositDeadline(Date reserveDatetime) {
		return getDepositDeadline(reserveDatetime, "yyyy년 MM월 dd일 a H시 mm분");
	}

	public static String getDepositDeadline(Date reserveDatetime, String format) {

		Calendar deadline = Calendar.getInstance();
		deadline.setTime(reserveDatetime);
		deadline.add(Calendar.DATE, 1);
		deadline.set(Calendar.HOUR_OF_DAY, 23);
		deadline.set(Calendar.MINUTE, 59);

		String returnVal = FastDateFormat.getInstance(format).format(deadline);
		return returnVal;
	}

	/*
		Calendar 클래스의 상수는 SUNDAY 1부터 시작이고 배열은 0부터 시작임. 사용시 주의.
	 */
	public static String indexToKoreanDay(int index) {
		return KOREAN_DAY_ARRAY[index];
	}

	public static int calculateDifferenceDate(Date firstDate, Date secondDate) {
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		c1.setTime(firstDate);
		c2.setTime(secondDate);

		long difference = (c1.getTimeInMillis() - c2.getTimeInMillis()) / 1000;
		return (int) (difference / (24 * 60 * 60));
	}
}
