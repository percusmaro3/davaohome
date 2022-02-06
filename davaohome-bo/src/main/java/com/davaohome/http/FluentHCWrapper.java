package com.davaohome.http;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.http.client.fluent.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

public class FluentHCWrapper {

	private static final Logger log = LoggerFactory.getLogger(FluentHCWrapper.class);


	private static final int CONNECTION_TIMEOUT = 1000;
	private static final int SOCKET_TIMEOUT = 5000;
	//	private static final String URL_DELIMINATOR = "/";
	private static final String API_CONTENT_TYPE_JSON = "application/json";
	//	private static final String API_CONTENT_TYPE_POST = "application/x-www-form-urlencoded";

	private static Gson gson = new Gson();

	public static <T> T executeJson(String url, Class<T> clazz) throws IOException {
		return executeJson(url, clazz, CONNECTION_TIMEOUT, SOCKET_TIMEOUT);
	}

	public static <T> T executeJson(String url, Class<T> clazz, int connectionTimeout, int socketTimeout) throws IOException {
		String str = Request.Get(url)
							.connectTimeout(connectionTimeout)
							.socketTimeout(socketTimeout)
							.addHeader("Content-Type", API_CONTENT_TYPE_JSON)
							.execute()
							.returnContent().asString();

		return gson.fromJson(str, clazz);
	}

	private static Request createRequest(String url, Integer connectTimeout, Integer socketTimeout) throws UnsupportedEncodingException {

		Request request = Request.Get(url)
								 .connectTimeout(connectTimeout)
								 .socketTimeout(socketTimeout);

		return request;
	}


}
