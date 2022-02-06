package com.davaohome.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.davaohome.admin.common.cookie.AdminCookie;
import com.davaohome.admin.common.cookie.CookieHandler;
import com.davaohome.admin.message.MessageHelper;
import com.davaohome.admin.util.RequestUtil;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private MessageSource messageSource;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String country = (String) request.getAttribute("countryId");

		if (!isLogined(country)) {
			RequestUtil.alerRedirect(request, response, MessageHelper.getMessage("admin.plzDoLogin", request),
									 "/auth/login");

			return false;
		}

		return true;
	}

	private boolean isLogined(String country) {

		String countryValue = CookieHandler.getCookieValue(AdminCookie.COUNTRY);
		String adminId = CookieHandler.getCookieValue(AdminCookie.ADMIN_ID);

		return country.equalsIgnoreCase(countryValue) && StringUtils.isNotEmpty(adminId);
	}

}
