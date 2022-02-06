package com.davaohome.bo.model.country;

import java.util.ArrayList;
import java.util.List;

public class CountryMakeHelper {

	static List<ServiceCountry> serviceCountryList = new ArrayList<>();
	static List<ServiceCountry> appServiceCountryList = new ArrayList<>();
	static List<ServiceCountry> adminCountryList = new ArrayList<>();

	static {
		CountryStaticMaker.initAllServiceCountry();

		initActiveAdmin();
		initActiveService();
		initActiveApp();

		//		switch (CnvBoConstant.boPhase) {
		//			case REAL:
		//				initActiveAdmin();
		//				initActiveService();
		//				initActiveApp();
		//				break;
		//			case ALPHA:
		//			case LOCAL:
		//				initAlphaActiveAdmin();
		//				initAlphaActiveService();
		//				initAlphaActiveApp();
		//				break;
		//		}
	}

	static ServiceCountry getCountry(List<ServiceCountry> countryList, String countryId) {

		for (ServiceCountry sc : countryList) {
			if (sc.getCountryId().equalsIgnoreCase(countryId)) {
				return sc;
			}
		}
		return null;
	}

	private static void initActiveApp() {
		String[] countryIdArr =
				{"kr", "us", "jp", "tw", "th", "vn", "gb", "in", "my", "ru", "dk",
				 "mm", "mt", "la", "kp", "kh", "is", "mo", "hk", "au", "ph",
				 "fr", "ca", "cn", "id", "it", "ae", "sg", "es", "de"};

		for (String countryId : countryIdArr) {
			appServiceCountryList.add(CountryStaticMaker.getCountry(countryId));
		}
	}

	private static void initActiveService() {

		String[] countryIdArr =
				{"kr", "us", "jp", "tw", "th", "vn", "gb", "in", "my", "ru", "dk",
				 "mm", "mt", "la", "kp", "kh", "is", "mo", "hk", "au", "ph",
				 "fr", "ca", "cn", "id", "it", "ae", "sg", "es", "de"};

		for (String countryId : countryIdArr) {
			serviceCountryList.add(CountryStaticMaker.getCountry(countryId));
		}
	}

	private static void initActiveAdmin() {
		String[] countryIdArr = {"kr", "jp", "tw", "th", "ph", "us"};

		for (String countryId : countryIdArr) {
			adminCountryList.add(CountryStaticMaker.getCountry(countryId));
		}
	}

	//	private static void initAlphaActiveService() {
	//		String[] countryIdArr = {"kr", "jp", "tw", "th", "vn", "gb"};
	//
	//		for (String countryId : countryIdArr) {
	//			serviceCountryList.add(CountryStaticMaker.getCountry(countryId));
	//		}
	//	}
	//
	//	private static void initAlphaActiveAdmin() {
	//		String[] countryIdArr = {"kr", "jp", "tw", "th"};
	//
	//		for (String countryId : countryIdArr) {
	//			adminCountryList.add(CountryStaticMaker.getCountry(countryId));
	//		}
	//	}
}
