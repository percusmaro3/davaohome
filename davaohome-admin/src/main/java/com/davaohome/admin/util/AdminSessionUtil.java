package com.davaohome.admin.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.davaohome.admin.common.cookie.AdminCookie;
import com.davaohome.admin.common.cookie.CookieHandler;
import com.davaohome.admin.model.CountryIdHolder;
import com.davaohome.bo.model.base.RegisterUpdateInfo;

public class AdminSessionUtil {

	public static void setCountryAndLastUpdater(Object obj) {
		setCountryId(obj);
		setLastUpdater(obj);
	}

	public static void setCountryId(Object obj) {

		if (obj instanceof CountryIdHolder) {

			CountryIdHolder cih = (CountryIdHolder) obj;
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

			cih.setCountryId((String) request.getAttribute("countryId"));
		}
	}

	public static void setLastUpdater(Object obj) {

		if (obj instanceof RegisterUpdateInfo) {

			RegisterUpdateInfo rui = (RegisterUpdateInfo) obj;

			rui.setLastUpdater(CookieHandler.getCookieValue(AdminCookie.ADMIN_ID));
		}
	}

	public static String getLastUpdater() {
		return CookieHandler.getCookieValue(AdminCookie.ADMIN_ID);
	}
}
