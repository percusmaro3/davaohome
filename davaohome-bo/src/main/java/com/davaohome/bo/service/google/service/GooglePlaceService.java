package com.davaohome.bo.service.google.service;

import com.davaohome.bo.model.place.Coordinate;
import com.davaohome.bo.service.google.model.GooglePlace;
import com.davaohome.http.FluentHCWrapper;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class GooglePlaceService {

	public static final String GOOGLE_SERVER_API_KEY = "AIzaSyDTEetYOoivgYaBT1_OMiAxIdWgpBCGe1Y";
	private static final String GOOGLE_PLACE_URL = "https://maps.googleapis.com/maps/api/place/textsearch/json?";

	public GooglePlace getPlace(String query, String language, Coordinate coordinate) throws IOException {

		StringBuffer sb = new StringBuffer();
		sb.append(GOOGLE_PLACE_URL).append("key=").append(GOOGLE_SERVER_API_KEY)
		  .append("&query=").append(query)
		  .append("&lanugage=").append(language);

		if (coordinate != null) {
			if (coordinate.getLatitude() != null && coordinate.getLongitude() != null) {
				sb.append("&location=").append(coordinate.getLatitude()).append(",").append(coordinate.getLongitude());
			}

			if (coordinate.getRadius() != null) {
				sb.append("&radius=").append(coordinate.getRadius());
			}
		}

		System.out.println("Google place URL : " + sb.toString());

		return FluentHCWrapper.executeJson(sb.toString(), GooglePlace.class);

	}


	//	public List<GeocodeResult> getGeocode(String address) throws IOException {
	//		StringBuffer sb = new StringBuffer();
	//		sb.append(GOOGLE_GEOCODE_URL).append(address)
	//		  .append("&key=").append(GOOGLE_SERVER_API_KEY);
	//
	//		GoogleGeocode googleGeocode = FluentHCWrapper.executeJson(sb.toString(), GoogleGeocode.class);
	//
	//		return googleGeocode.getGeocodeResultList();
	//	}
	//
	//	public GeocodeResult getGeocodeFirstOne(String address) throws IOException {
	//		StringBuffer sb = new StringBuffer();
	//		sb.append(GOOGLE_GEOCODE_URL).append(address)
	//		  .append("&key=").append(GOOGLE_SERVER_API_KEY);
	//
	//		GoogleGeocode googleGeocode = FluentHCWrapper.executeJson(sb.toString(), GoogleGeocode.class);
	//
	//		List<GeocodeResult> geocodeResultList = googleGeocode.getGeocodeResultList();
	//
	//		if (geocodeResultList != null && geocodeResultList.size() > 0) {
	//			return geocodeResultList.get(0);
	//		} else {
	//			return null;
	//		}
	//	}
}
