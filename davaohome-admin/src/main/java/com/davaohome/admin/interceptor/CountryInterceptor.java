package com.davaohome.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.davaohome.admin.common.CnvAdminConstant;
import com.davaohome.admin.util.CnvAdminUtil;
import com.davaohome.bo.model.country.ServiceCountry;

public class CountryInterceptor extends HandlerInterceptorAdapter {

	@Override

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String country = CnvAdminUtil.getLocaleInfoFromURL(request);
		ServiceCountry sc = null;
		try {
			sc = ServiceCountry.getAdminCountry(country);
		} catch (Exception e) {
			sc = ServiceCountry.getAdminCountry("kr");
		}

		request.setAttribute(CnvAdminConstant.COUNTRY_ID, country);
		request.setAttribute(CnvAdminConstant.COUNTRY_HTML_DATEFORMAT, sc.getHtmlDateFormat());
		request.setAttribute(CnvAdminConstant.COUNTRY_DATEFORMAT, sc.getDateFormat());

		return true;
	}
}
