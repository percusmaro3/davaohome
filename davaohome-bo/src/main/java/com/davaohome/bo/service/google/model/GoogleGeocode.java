package com.davaohome.bo.service.google.model;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class GoogleGeocode {

	private List<GoogleGeocodeResult> results;
	private String status;

	@Data
	class GoogleGeocodeResult {

		private List<AddressComponent> address_components;
		private String formatted_address;
		private Geometry geometry;
		private String place_id;
		private List<String> types;

	}

	@Data
	class AddressComponent {

		private String long_name;
		private String short_name;
		private List<String> types;
	}

	@Data
	class Geometry {
		private GoogleLocation location;
		private String location_type;
		private GoogleViewport viewport;

	}

	public List<GeocodeResult> getGeocodeResultList() {

		List<GeocodeResult> geoResultList = new ArrayList<>();

		if (!getStatus().equalsIgnoreCase("OK") || getResults().size() == 0) {
			return geoResultList;
		}

		for (GoogleGeocodeResult result : results) {
			GeocodeResult geocodeResult = new GeocodeResult();

			geocodeResult.setResultAddress(result.getFormatted_address());
			geocodeResult.setLatitude(result.getGeometry().getLocation().getLat());
			geocodeResult.setLongitude(result.getGeometry().getLocation().getLng());

			geoResultList.add(geocodeResult);
		}

		return geoResultList;
	}
}
