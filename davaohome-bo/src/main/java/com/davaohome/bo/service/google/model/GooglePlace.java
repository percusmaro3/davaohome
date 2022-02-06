package com.davaohome.bo.service.google.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class GooglePlace {

	@JsonProperty("html_attributions")
	List<Object> htmlAttributions;

	@JsonProperty("next_page_token")
	String nextPageToken;

	List<GooglePlaceResult> results;

	String status;

	@Data
	public class GooglePlaceResult {

		@JsonProperty("formatted_address")
		String formattedAddress;
		GooglePlaceGeometry geometry;
		String icon;
		String id;
		String name;

		@JsonProperty("opening_hours")
		GooglePlaceOpeningHours openingHours;
		List<GooglePlacePhoto> photos;

		@JsonProperty("place_id")
		String placeId;
		@JsonProperty("place_level")
		String priceLevel;
		String rating;
		String reference;

		List<String> types;
	}

	@Data
	public class GooglePlaceGeometry {
		GoogleLocation location;
		GoogleViewport viewport;
	}

	@Data
	class GooglePlaceOpeningHours {
		@JsonProperty("open_now")
		Boolean openNow;
		List<Object> weekday_text;
	}

	@Data
	class GooglePlacePhoto {
		Integer height;
		Integer width;
		List<Object> html_attributions;
		@JsonProperty("photo_reference")
		String photoReference;

	}
}
