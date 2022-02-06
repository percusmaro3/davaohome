package com.davaohome.web.message;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davaohome.web.common.cookie.AdminCookie;
import com.davaohome.web.common.cookie.CookieHandler;
import com.davaohome.web.util.CnvAdminUtil;
import org.springframework.web.servlet.LocaleResolver;

public class CnvLocaleResolver implements LocaleResolver {

	@Override
	public Locale resolveLocale(HttpServletRequest request) {

		String language = CnvAdminUtil.getLanguage(request);

		switch (language) {
			case "en":
				return Locale.ENGLISH;
			case "ja":
				return Locale.JAPANESE;
			case "ko":
				return Locale.KOREAN;
			case "cn":
				return Locale.CHINESE;
			case "zh":
				return Locale.TAIWAN;
			case "th":
				return new Locale("th", "TH");
			case "vi":
				return new Locale("vi", "VN");
			default:
				return Locale.ENGLISH;
		}
	}

	@Override
	public void setLocale(HttpServletRequest request, HttpServletResponse response, Locale locale) {
		CookieHandler.setEternalCookie(AdminCookie.LANGUAGE, locale.getLanguage(), response);
	}
}
