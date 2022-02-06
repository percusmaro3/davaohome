package com.davaohome.web.util;

import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

public class ExceptionLogUtils {

	private static final String KEY_VALUE_DELIMETER = " : ";
	private static final String LINE_SEPARATOR = "\n";

	public static String getRequestInfo(HttpServletRequest request) {

		StringBuffer info = new StringBuffer("\n[requestUri]\n").append(request.getRequestURI());
		info.append("\n[method]\n").append(request.getMethod());
		info.append("\n[content-type]\n").append(request.getContentType());
		info.append("\n[character-encoding]\n").append(request.getCharacterEncoding());
		info.append("\n[headers]\n");

		appendHeaders(request, info);
		appendCookies(request, info);

		StringBuffer parameters = new StringBuffer();
		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			if (parameters.length() < 1) {
				parameters.append("[paramters]\n");
			}
			String parameterName = parameterNames.nextElement();
			parameters.append(getKeyValueLog(parameterName, request.getParameter(parameterName)));
		}
		info.append(parameters);

		String jsonData = (String) request.getAttribute("json");
		if (!StringUtils.isBlank(jsonData)) {
			info.append("[json]\n").append(jsonData);
		}

		return info.toString();
	}

	private static void appendHeaders(HttpServletRequest request, StringBuffer info) {
		Enumeration<String> headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements()) {
			String headerName = headerNames.nextElement();
			info.append(getKeyValueLog(headerName, request.getHeader(headerName)));
		}
	}

	private static void appendCookies(HttpServletRequest request, StringBuffer info) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			info.append("\n[cookies]\n");
			for (Cookie cookie : cookies) {
				info.append(getKeyValueLog(cookie.getName(), cookie.getValue()));
			}
		}
	}

	private static String getKeyValueLog(String key, String value) {

		StringBuffer sb = new StringBuffer(key).append(KEY_VALUE_DELIMETER).append(value).append(LINE_SEPARATOR);
		return sb.toString();
	}
}
