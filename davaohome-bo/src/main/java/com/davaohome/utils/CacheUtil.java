package com.davaohome.utils;

import java.util.concurrent.TimeoutException;

import com.google.code.ssm.CacheFactory;
import com.google.code.ssm.providers.CacheException;

public class CacheUtil {

	public static void deleteCache(CacheFactory memcachedClient, String nameSpace, String key) throws TimeoutException, CacheException {
		String keyStr = nameSpace + ":" + key;
		memcachedClient.getCache().delete(keyStr);
	}
}
