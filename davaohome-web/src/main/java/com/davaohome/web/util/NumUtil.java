package com.davaohome.web.util;

import java.text.NumberFormat;
import java.text.ParseException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class NumUtil {

	private static final Logger log = LoggerFactory.getLogger(NumUtil.class);

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

			log.error("[CATCH_EXCEPTION_AND_RETURN_ERROR]", e);
		}

		return returnValue;
	}
}
