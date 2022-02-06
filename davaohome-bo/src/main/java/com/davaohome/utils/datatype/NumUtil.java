package com.davaohome.utils.datatype;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;

import com.davaohome.utils.LogUtils;

public class NumUtil {
	private NumUtil() {
	}

	/* 천단위 표기. 3자리 마다 ,를 찍어 반환함. ex) 100000 -> 100,000  */
	public static String notation(double d) {
		return NumberFormat.getInstance().format(d);
	}

	/* 콤마 제거.  ex) 100,000 -> 100000  */
	public static double normal(String str) {
		double returnValue;

		try {
			returnValue = NumberFormat.getInstance().parse(str).doubleValue();
		} catch (ParseException e) {
			returnValue = 0;

			LogUtils.error("[CATCH_EXCEPTION_AND_RETURN_ERROR]", e);

		}

		return returnValue;
	}

	/* 숫자로 형변환이 가능한지 확인 */
	public static boolean isNumber(String str) {
		try {
			Integer.parseInt(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	public static float calculatePercentage(int num1, int num2) {
		if (num1 == 0 || num2 == 0) {
			return 0;
		}

		return (float) num1 / (float) num2 * 100;
	}

	public static int integerToint(Integer num) {
		return num == null ? 0 : num;
	}

	public static String getNumberByComma(Integer number) {
		if (number != null) {
			return new DecimalFormat("##,###").format(number);
		} else {
			return "";
		}
	}

	public static String getNumberByComma(Float number) {
		if (number != null) {
			return new DecimalFormat("##,###.#").format(number);
		} else {
			return "";
		}
	}

	public static String getNumberByComma(Double number) {
		if (number != null) {
			return new DecimalFormat("##,###.#").format(number);
		} else {
			return "";
		}
	}
}
