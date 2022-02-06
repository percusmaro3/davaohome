package com.davaohome.admin.util;

import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.davaohome.bo.model.common.StartEndDateCondition;
import com.davaohome.bo.model.country.ServiceCountry;
import com.davaohome.utils.date.DateTimeUtil;

public class CnvAdminUtil {

	public static String getLocaleInfoFromURL(HttpServletRequest request) {
//		String serverName = request.getServerName();
//		int adminStrIndex = serverName.indexOf(".admin");
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
		return "en";
	}

	public static ServiceCountry getAdminCountry(HttpServletRequest request) {

		String country = (String) request.getAttribute("countryId");
		return ServiceCountry.getAdminCountry(country);
	}

	public static void makeDateCondition(HttpServletRequest request, String startParam, String endParam, StartEndDateCondition searchParam) throws
			ParseException {

		Date startDate = RequestUtil.getDateFromHtmlDate(request, startParam);
		if (startDate != null) {
			searchParam.setStartDate(DateTimeUtil.getDateWithFirstTime(startDate).getTime());
		}

		Date endDate = RequestUtil.getDateFromHtmlDate(request, endParam);
		if (endDate != null) {
			searchParam.setEndDate(DateTimeUtil.getDateWithLastTime(endDate).getTime());
		}
	}

}
