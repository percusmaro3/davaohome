package com.davaohome.web.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class DeviceInterceptor extends HandlerInterceptorAdapter {

	static List<String> mobileTextList = new ArrayList<>();
	static{
		mobileTextList.add("Android");
		mobileTextList.add("iPhone");
	}



	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String userAgent = request.getHeader("User-Agent");
		for( String mobileText : mobileTextList ){
			if( userAgent.indexOf(mobileText) != -1 ){
				request.setAttribute("Device", "MOBILE");
				return true;
			}
		}

		request.setAttribute("Device", "PC");
		return true;
	}
}
