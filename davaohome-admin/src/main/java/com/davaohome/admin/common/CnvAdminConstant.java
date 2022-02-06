package com.davaohome.admin.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class CnvAdminConstant {

	public static int COMMON_LIST_ITEM_PER_PAGE = 20;

	public static String IMAGE_SERVER_URL;
	public static String CDN_URL;

	@Value("#{config['static.img.path']}")
	public void setImageServerUrl(String url) {
		IMAGE_SERVER_URL = url;
	}


	@Value("#{config['cdn.url']}")
	public void setCdnUrl(String url) {
		CDN_URL = url;
	}


	//	public static final String ATTR_LANGUAGE = "language";

	// Request Attribute
	public static final String COUNTRY_ID = "countryId";
	public static final String COUNTRY_HTML_DATEFORMAT = "countryHtmlDateFormat";
	public static final String COUNTRY_DATEFORMAT = "countryDateFormat";

	/***
	 * IMAGE SIZE
	 ***/
	//	public static final ImageSize PLACE_POPULAR_IMAGE = new ImageSize(510, 388);
	//	public static final ImageSize PLACE_LIST_IMAGE = new ImageSize(1030, 338);
	//	public static final ImageSize PLACE_SMALL_IMAGE = new ImageSize(300, 300);
	//	public static final ImageSize PLACE_DETAIL_IMAGE = new ImageSize(1030, 602);

	public static final Integer SMALL_IMAGE_SIZE = 128000;
	public static final Integer BASIC_IMAGE_SIZE = 512000;
	public static final Integer BIG_IMAGE_SIZE = 1048576;

}
