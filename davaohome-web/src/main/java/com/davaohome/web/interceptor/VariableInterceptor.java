package com.davaohome.web.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VariableInterceptor extends HandlerInterceptorAdapter {

	@Override

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

//		String resouceUrl = "http://hodduk486.cafe24.com/confirm/holdings/";
		String resouceUrl = "http://davao-invest.com/resources";
//		String resouceUrl = "http://localhost:8081/resources";
		String tag = "?202007271347";

		request.setAttribute("resouceUrl", resouceUrl);
		request.setAttribute("tag", tag);
		return true;
	}
}
