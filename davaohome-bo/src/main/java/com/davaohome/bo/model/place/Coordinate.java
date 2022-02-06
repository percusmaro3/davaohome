package com.davaohome.bo.model.place;

import lombok.Data;

@Data
public class Coordinate {

	private Float latitude;
	private Float longitude;
	private Integer zoomLevel;
	private Integer radius;

	public Coordinate() {

	}

	public Coordinate(Float latitude, Float longitude) {
		this.latitude = latitude;
		this.longitude = longitude;
	}
}
