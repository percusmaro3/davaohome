package com.davaohome.admin.util;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.davaohome.admin.common.CnvAdminConstant;
import com.davaohome.bo.model.country.ServiceCountry;

public class RequestUtil {

	public static void alerRedirect(HttpServletRequest request, HttpServletResponse response, String alertMsg, String redirectUrl)
			throws ServletException, IOException {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("alertMsg", alertMsg);
		paramMap.put("redirectUrl", redirectUrl);

		RequestDispatcher rd = request.getRequestDispatcher(UrlUtil.makeUrl("/script/alertRedirect", paramMap));
		rd.forward(request, response);
	}

	public static void redirect(HttpServletRequest request, HttpServletResponse response, String redirectUrl)
			throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher(redirectUrl);
		rd.forward(request, response);
	}

	public static Long getTimemillisFromHtmlDate(HttpServletRequest request, String requestParam) throws ParseException {

		SimpleDateFormat format = (SimpleDateFormat) request.getAttribute(CnvAdminConstant.COUNTRY_DATEFORMAT);

		return getTimemillisFromHtml(request, requestParam, format);
	}

	public static Date getDateFromHtmlDate(HttpServletRequest request, String requestParam) throws ParseException {

		SimpleDateFormat format = (SimpleDateFormat) request.getAttribute(CnvAdminConstant.COUNTRY_DATEFORMAT);

		return getDateFromHtml(request, requestParam, format);
	}

	public static Long getTimemillisFromHtmlDatetime(HttpServletRequest request, String requestParam) throws ParseException {

		SimpleDateFormat format = (SimpleDateFormat) request.getAttribute(CnvAdminConstant.COUNTRY_HTML_DATEFORMAT);

		return getTimemillisFromHtml(request, requestParam, format);
	}

	public static Date getDateFromHtmlDate(String dateStr, HttpServletRequest request) throws
			ParseException {

		SimpleDateFormat format = (SimpleDateFormat) request.getAttribute(CnvAdminConstant.COUNTRY_DATEFORMAT);

		if (StringUtils.isEmpty(dateStr)) {
			return null;
		}
		return DatetimeUtil.convertToDate(dateStr, format);
	}

	private static Long getTimemillisFromHtml(HttpServletRequest request, String requestParam, SimpleDateFormat format) throws ParseException {

		String dateStr = request.getParameter(requestParam);
		if (StringUtils.isEmpty(dateStr)) {
			return null;
		}
		return DatetimeUtil.convertToTimeMillis(dateStr, format);
	}

	private static Date getDateFromHtml(HttpServletRequest request, String requestParam, SimpleDateFormat format) throws ParseException {

		String dateStr = request.getParameter(requestParam);
		if (StringUtils.isEmpty(dateStr)) {
			return null;
		}
		return DatetimeUtil.convertToDate(dateStr, format);
	}

}
