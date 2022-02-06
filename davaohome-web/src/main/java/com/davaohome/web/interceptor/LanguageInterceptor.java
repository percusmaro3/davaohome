package com.davaohome.web.interceptor;

import com.davaohome.web.common.CnvAdminConstant;
import com.davaohome.web.util.CnvAdminUtil;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LanguageInterceptor extends HandlerInterceptorAdapter {

	@Override

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String language = CnvAdminUtil.getLanguage(request);
		String languageText = CnvAdminUtil.getLanguageText(language);

		request.setAttribute(CnvAdminConstant.LANGUAGE, language);
		request.setAttribute(CnvAdminConstant.LANGUAGE_TEXT, languageText);
		request.setAttribute(CnvAdminConstant.WORDBREAK, getWordBreak(language));
		request.setAttribute(CnvAdminConstant.CSS_LANGUAGE, getCssLanguage(language));

		return true;
	}

	private Object getCssLanguage(String language) {
		switch (language){
			case "ja" : return "_ja";
			default: return "";
		}
	}

	private String getWordBreak(String language){
		switch (language){
			case "th" :
			case "zh" :
			case "ja" : return "break";
			default: return "keep";
		}
	}
}
