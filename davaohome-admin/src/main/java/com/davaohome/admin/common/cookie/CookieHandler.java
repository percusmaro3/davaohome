package com.davaohome.admin.common.cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.davaohome.utils.TimeConstantUtils;

public class CookieHandler {

	private static String COOKIE_DOMAIN = ".davao-invest.com";
	public static String PLACE_LIST_PARAM = "PLACE_LIST_PARAM";

	public static void setCookie(AdminCookie adminCookie, String value, HttpServletResponse response) {
		if (value != null) {
			Cookie cookie = new Cookie(adminCookie.name(), value);

			cookie.setPath("/");
			cookie.setDomain(COOKIE_DOMAIN);
			response.addCookie(cookie);
		}
	}

	public static void setEternalCookie(AdminCookie adminCookie, String value, HttpServletResponse response) {
		if (value != null) {
			Cookie cookie = new Cookie(adminCookie.name(), value);

			cookie.setPath("/");
			cookie.setDomain(COOKIE_DOMAIN);
			cookie.setMaxAge(TimeConstantUtils.THREE_YEAR_SECOND);
			response.addCookie(cookie);
		}
	}

	public static Cookie getCookie(AdminCookie adminCookie) {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			return null;
		}

		for (Cookie c : cookies) {
			if (StringUtils.equals(c.getName(), adminCookie.name())) {
				return c;
			}
		}

		return null;
	}

	public static String getCookieValue(AdminCookie adminCookie) {
		Cookie cookie = getCookie(adminCookie);

		return cookie == null ? null : cookie.getValue();
	}

	public static void removeCookie(AdminCookie adminCookie, HttpServletResponse response) {

		Cookie cookie = new Cookie(adminCookie.name(), "");

		cookie.setPath("/");
		cookie.setDomain(COOKIE_DOMAIN);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}

	public static void setCookie(HttpServletResponse response , String name, String value){
		if (value != null) {
			Cookie cookie = new Cookie(name, value);

			cookie.setPath("/");
			cookie.setDomain(COOKIE_DOMAIN);
			response.addCookie(cookie);
		}
	}

	public static String getCookieValue(String key){
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			return null;
		}

		for (Cookie c : cookies) {
			if (StringUtils.equals(c.getName(), key)) {
				return c.getValue();
			}
		}

		return null;
	}

}
