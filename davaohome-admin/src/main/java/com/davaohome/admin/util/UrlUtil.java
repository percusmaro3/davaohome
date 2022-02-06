package com.davaohome.admin.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.google.common.base.CaseFormat;
import com.google.common.base.Strings;

public class UrlUtil {
	public static final String URL_QUERYSTRING_DELIMITER = "?";
	public static final String QUERYSTRING_DELIMITER = "&";
	public static final String EQUALS = "=";
	public static final String DEFAULT_CHARSET = "UTF-8";

	public static String makeUrl(String protocol, String domain, String path, Map<String, ? extends Object> queryMap) {
		StringBuffer sb = (new StringBuffer(protocol)).append("://").append(domain);
		if (!domain.matches(".*/$")) {
			sb.append("/");
		}

		return makeUrl(sb.append(path).toString(), queryMap);
	}

	public static String makeUrl(String url, String path, Map<String, ? extends Object> queryMap) {
		StringBuffer sb = new StringBuffer(url);
		if (!url.matches(".*/$")) {
			sb.append("/");
		}

		return makeUrl(sb.append(path).toString(), queryMap);
	}

	public static String makeUrl(String url, Map<String, ? extends Object> queryMap) {
		StringBuffer urlSb = new StringBuffer(url);
		if (queryMap != null && queryMap.size() > 0) {
			urlSb.append("?").append(makeQueryString(queryMap));
		}

		return urlSb.toString();
	}

	public static String makeQueryString(Map<String, ? extends Object> queryMap) {
		try {
			StringBuffer e = new StringBuffer();
			Iterator i$ = queryMap.entrySet().iterator();

			while (i$.hasNext()) {
				Map.Entry entry = (Map.Entry) i$.next();
				e.append((String) entry.getKey()).append("=").append(URLEncoder.encode(entry.getValue().toString(), "UTF-8")).append("&");
			}

			e.deleteCharAt(e.length() - 1);
			return e.toString();
		} catch (Exception var4) {
			throw new RuntimeException(var4.getMessage(), var4);
		}
	}

	public static String makeQueryString(Map<String, String> queryMap, String encodeCharType) {
		return makeQueryString(queryMap, encodeCharType, (CaseFormat) null);
	}

	public static String makeQueryString(Map<String, String> queryMap, CaseFormat caseFormat) {
		return makeQueryString(queryMap, "utf8", caseFormat);
	}

	public static String makeQueryString(Map<String, String> queryMap, String encodeCharType, CaseFormat caseFormat) {
		StringBuffer queryString = new StringBuffer();

		try {
			Iterator e = queryMap.entrySet().iterator();

			while (e.hasNext()) {
				Map.Entry entry = (Map.Entry) e.next();
				String name = caseFormat == null ? (String) entry.getKey() : CaseFormat.LOWER_CAMEL.to(caseFormat, (String) entry.getKey());
				String entryValue = encodeCharType == null ? Strings.nullToEmpty((String) entry.getValue())
						: URLEncoder.encode(Strings.nullToEmpty((String) entry.getValue()), encodeCharType);
				queryString.append(name).append("=").append(entryValue).append("&");
			}
		} catch (Exception var8) {
			throw new RuntimeException(var8);
		}

		queryString.deleteCharAt(queryString.length() - 1);
		return queryString.toString();
	}

	public static String beanToQueryString(Object bean) {
		return beanToQueryString(bean, (CaseFormat) null);
	}

	public static String beanToQueryString(Object bean, CaseFormat caseFormat) {
		try {
			Map e = null;
			if (bean instanceof Map) {
				e = (Map) bean;
			} else {
				e = BeanUtils.describe(bean);
			}

			e.remove("class");
			String query = caseFormat == null ? makeQueryString(e) : makeQueryString(e, CaseFormat.UPPER_UNDERSCORE);
			return query;
		} catch (Exception var4) {
			throw new RuntimeException(var4);
		}
	}

	public static String makeBridgeUrl(String bridgeUrl, Map bridgeQuery, String nextUrl, Map<String, ? extends Object> nextQueryString) throws
			UnsupportedEncodingException {
		String next = URLEncoder.encode(makeUrl(nextUrl, nextQueryString), "UTF-8");
		if (bridgeQuery == null) {
			bridgeQuery = new HashMap(1);
		}

		((Map) bridgeQuery).put("nextURL", next);
		return makeUrl(bridgeUrl, (Map) bridgeQuery);
	}

	public static enum Protocol {
		HTTP("http"),
		HTTPS("https");

		private String protocol;

		private Protocol(String protocol) {
			this.protocol = protocol;
		}

		public String getValue() {
			return this.protocol;
		}
	}
}
