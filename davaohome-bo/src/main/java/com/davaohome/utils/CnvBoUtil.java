package com.davaohome.utils;

import com.davaohome.bo.model.base.CountryContents;
import com.davaohome.bo.model.country.ServiceCountry;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CnvBoUtil {

	public static <T> Map<String, T> convertListToLanguageMap(List<T> list) {
		Map<String, T> contentsMap = new HashMap<>();

		for (T t : list) {
			CountryContents cc = (CountryContents) t;
			contentsMap.put(cc.getLanguage(), t);
		}

		return contentsMap;
	}

	public static String getPriceStr(String countryId, Float price) {
		if (price == null) {
			return "";
		}

		ServiceCountry sc = ServiceCountry.getServiceCountry(countryId);
		DecimalFormat df = sc.getCurrencyFormat();

		return sc.getCurrency() + df.format(price);
	}

	public static String getCurrency(String countryId) {
		ServiceCountry sc = ServiceCountry.getServiceCountry(countryId);
		return sc.getCurrency();
	}
}
