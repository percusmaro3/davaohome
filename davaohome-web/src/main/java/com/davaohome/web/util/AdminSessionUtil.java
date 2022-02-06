package com.davaohome.web.util;

import com.davaohome.web.common.cookie.AdminCookie;
import com.davaohome.web.common.cookie.CookieHandler;
import com.davaohome.web.model.CountryIdHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

public class AdminSessionUtil {

	public static void setCountryAndLastUpdater(Object obj) {
		setCountryId(obj);
	}

	public static void setCountryId(Object obj) {

		if (obj instanceof CountryIdHolder) {

			CountryIdHolder cih = (CountryIdHolder) obj;
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

			cih.setCountryId((String) request.getAttribute("countryId"));
		}
	}


	public static String getLastUpdater() {
		return CookieHandler.getCookieValue(AdminCookie.ADMIN_ID);
	}
}
