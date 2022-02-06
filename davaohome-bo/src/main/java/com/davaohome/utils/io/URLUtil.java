package com.davaohome.utils.io;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

public class URLUtil {
	
	public static List<String> getUrlDecode(List<String> urlList) throws UnsupportedEncodingException{
		
		if( urlList == null )
			return null;
		
		int index = 0;
		
		for( String url : urlList ){
			urlList.set(index, URLDecoder.decode(url, "UTF-8"));
		}
		
		return urlList;
	}
	
	public static List<String> getUrlEncode(List<String> urlList) throws UnsupportedEncodingException{
		
		if( urlList == null )
			return null;
		
		int index = 0;
		
		for( String url : urlList ){
			urlList.set(index, URLEncoder.encode(url, "UTF-8"));
		}
		
		return urlList;
	}
	
}
