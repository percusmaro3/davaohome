package com.davaohome.utils;

import java.text.DecimalFormat;

public class DistanceUtil {

	private static final DecimalFormat KM_FORMAT = new DecimalFormat("###,###");
	private static final DecimalFormat KM_METER_FORMAT = new DecimalFormat("###.0");
	private static final DecimalFormat METER_FORMAT = new DecimalFormat("###");

	public static String convertToDefaultDistance(Float distance) {
		if (distance == null) {
			return "";
		}

		if (distance.floatValue() > 1.0f) {
			if (distance > 100) {
				return KM_FORMAT.format(distance) + "km";
			} else {
				return KM_METER_FORMAT.format(distance) + "km";
			}
		} else {
			distance = distance * 1000;
			return METER_FORMAT.format(distance) + "m";
		}
	}

}
