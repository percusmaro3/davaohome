package com.davaohome.web.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class CookieUtil {

	public Map getCookieMap(HttpServletRequest request) {

		Cookie[] cookies = request.getCookies();
		Map<String, String> cookieMap = new HashMap<String, String>();

		for (Cookie cookie : cookies) {
			String key = cookie.getName();
			String value = cookie.getValue();

			cookieMap.put(key, value);
		}

		return cookieMap;
	}

	public String getMemberNo(HttpServletRequest request) {
		Map<String, String> cookieMap = getCookieMap(request);
		if (cookieMap.get("MEMBER_NO") == null) {
			return "";
		} else {
			return (String) cookieMap.get("MEMBER_NO");
		}
	}

	public String getValue(HttpServletRequest request, String key) {
		Map<String, String> cookieMap = getCookieMap(request);

		return (String) cookieMap.get(key);
	}
}
