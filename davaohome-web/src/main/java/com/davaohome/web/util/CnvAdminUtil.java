package com.davaohome.web.util;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

public class CnvAdminUtil {

	public static String getLanguage(HttpServletRequest request){
		try {
			String uri = request.getRequestURI();
			String language = null;
			if (uri.length() > 3) {
				language = uri.substring(1, 3);
			} else {
				language = "ko";
			}

			return language;
		}catch (Exception e){
			return "ko";
		}
	}

	public static String getLanguageText(String language) {

		switch (language) {
			case "en":
				return "ENG";
			case "ja":
				return "JPN";
			case "ko":
				return "KOR";
			case "cn":
				return "CN";
			case "zh":
				return "TW";
			case "th":
				return "THA";
			default:
				return "ENG";
		}
	}

//	public static String getLocaleInfoFromURL(HttpServletRequest request) {
//		String serverName = request.getServerName();
//
//		int adminStrIndex = serverName.indexOf(".home");
//			try{
//			String localeStr = serverName.substring(adminStrIndex - 2, adminStrIndex);
//			if (localeStr.equalsIgnoreCase("ha")) {
//				return "kr";
//			} else {
//				return localeStr;
//			}
//		}catch (Exception e){
//			e.printStackTrace();
//			return "en";
//		}
//	}
}
