package com.davaohome.bo.service.google.model;

import lombok.Data;

@Data
public class GeocodeResult {

	private String resultAddress;
	private float latitude;
	private float longitude;
}
