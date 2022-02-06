package com.davaohome.bo.model.country;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Data
public class ServiceCountry {

	private String countryId;
	private Map<String, String> countryNamePerLanguage = new HashMap<>();
	@JsonIgnore
	private String currency;
	@JsonIgnore
	private DecimalFormat currencyFormat;
	@JsonIgnore
	private String htmlDateFormat;
	@JsonIgnore
	private SimpleDateFormat dateFormat;
	@JsonIgnore
	private SimpleDateFormat datetimeFormat;
	@JsonIgnore
	private String language;
	@JsonIgnore
	private Integer timezoneOffsetHour;

	private String activeFlagImageUrl;
	@JsonIgnore
	private String inactiveFlagImageUrl;


	public ServiceCountry(String countryId) {
		this.countryId = countryId;
	}

	public void addCountryName(String language, String str) {
		countryNamePerLanguage.put(language, str);
	}

	public static List<ServiceCountry> getServiceCountryList() {
		return CountryMakeHelper.serviceCountryList;
	}

	public static List<ServiceCountry> getAdminCountryList() {
		return CountryMakeHelper.serviceCountryList;
	}

	public static List<ServiceCountry> getAppServiceCountryList() {
		return CountryMakeHelper.appServiceCountryList;
	}

	public static ServiceCountry getServiceCountry(String countryId) {

		ServiceCountry sc = CountryMakeHelper.getCountry(CountryMakeHelper.serviceCountryList, countryId.toLowerCase());
		if (sc == null) {
			throw new IllegalArgumentException("Given countryId is not serviced. countryId : " + countryId);
		} else {
			return sc;
		}
	}

	public static ServiceCountry getAdminCountry(String countryId) {

		ServiceCountry sc = CountryMakeHelper.getCountry(CountryMakeHelper.adminCountryList, countryId.toLowerCase());
		if (sc == null) {
			return CountryMakeHelper.getCountry(CountryMakeHelper.adminCountryList, "us");
		} else {
			return sc;
		}
	}

}
