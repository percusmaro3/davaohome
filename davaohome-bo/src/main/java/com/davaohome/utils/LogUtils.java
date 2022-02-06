package com.davaohome.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogUtils {
	
	private static final Logger log = LoggerFactory.getLogger(LogUtils.class);
	
	
	public static void debug(String paramString) {
		log.debug(paramString);
	}

	public static void error(String paramString) {
		log.error(paramString);
	}

	public static void error(String paramString, Throwable paramThrowable) {
		log.error(paramString, paramThrowable);
	}

	public static void warn(String paramString, Throwable paramThrowable) {
		log.warn(paramString, paramThrowable);
	}

}
