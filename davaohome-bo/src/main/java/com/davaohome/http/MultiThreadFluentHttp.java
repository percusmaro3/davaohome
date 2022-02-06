package com.davaohome.http;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.apache.http.client.fluent.Async;
import org.apache.http.client.fluent.Content;
import org.apache.http.client.fluent.Request;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

@Repository
public class MultiThreadFluentHttp<K> {

	@Value("#{baseboConfig['default.http.timeout.connect']}")
	private Integer connectTimeout;
	@Value("#{baseboConfig['default.http.timeout.socket']}")
	private Integer socketTimeout;

	public Map<K, Content> requestGetUsingMultiThread(Map<K, String> multiRequestUrlMap) throws Exception {

		Map<K, Request> requestMap = new HashMap<K, Request>();

		for (K kObj : multiRequestUrlMap.keySet()) {
			requestMap.put(kObj, createRequest(multiRequestUrlMap.get(kObj)));
		}

		return requestUsingMultiThread(requestMap);
	}

	private Request createRequest(String url) throws UnsupportedEncodingException {

		Request request = Request.Get(url)
								 .connectTimeout(connectTimeout)
								 .socketTimeout(socketTimeout);

		return request;
	}

	public Map<K, Content> requestUsingMultiThread(Map<K, Request> multiRequestMap)
			throws InterruptedException,
			ExecutionException, IOException {

		ExecutorService service = null;
		try {
			service = Executors.newFixedThreadPool(multiRequestMap.size());

			return executeRequest(service, multiRequestMap);
		} finally {
			if (service != null) {
				service.shutdown();
			}
		}
	}

	private Map<K, Content> executeRequest(ExecutorService service, Map<K, Request> multiRequest)
			throws InterruptedException, ExecutionException {
		Async async = Async.newInstance().use(service);
		Map<K, Content> futureMap = new HashMap<K, Content>();

		for (final K kObj : multiRequest.keySet()) {
			Request request = multiRequest.get(kObj);
			Future<Content> future = async.execute(request);

			futureMap.put(kObj, future.get());
		}
		return futureMap;
	}

}
