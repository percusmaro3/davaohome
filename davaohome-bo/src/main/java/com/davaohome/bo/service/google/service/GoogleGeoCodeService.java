package com.davaohome.bo.service.google.service;

import com.davaohome.bo.service.google.model.GeocodeResult;
import com.davaohome.bo.service.google.model.GoogleGeocode;
import com.davaohome.http.FluentHCWrapper;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class GoogleGeoCodeService {

	public static final String GOOGLE_SERVER_API_KEY = "AIzaSyA3o5c56Md8ZLsNBCwpVcekNF_P3J8dCFk";
	private static final String GOOGLE_GEOCODE_URL = "https://maps.googleapis.com/maps/api/geocode/json?address=";

	public List<GeocodeResult> getGeocode(String address) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append(GOOGLE_GEOCODE_URL).append(address)
		  .append("&key=").append(GOOGLE_SERVER_API_KEY);

		GoogleGeocode googleGeocode = FluentHCWrapper.executeJson(sb.toString(), GoogleGeocode.class);

		return googleGeocode.getGeocodeResultList();
	}

	public GeocodeResult getGeocodeFirstOne(String address) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append(GOOGLE_GEOCODE_URL).append(address)
		  .append("&key=").append(GOOGLE_SERVER_API_KEY);

		GoogleGeocode googleGeocode = FluentHCWrapper.executeJson(sb.toString(), GoogleGeocode.class);

		List<GeocodeResult> geocodeResultList = googleGeocode.getGeocodeResultList();

		if (geocodeResultList != null && geocodeResultList.size() > 0) {
			return geocodeResultList.get(0);
		} else {
			return null;
		}
	}
}
