package com.davaohome.admin.message;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.LocaleResolver;

@Service
public class MessageHelper {


	private static MessageSource messageSource;
	private static LocaleResolver localeResolver;

	public void setLocaleResolver(LocaleResolver localeResolver) {
		this.localeResolver = localeResolver;
	}

	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}

	public static String getMessage(String key) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return getMessage(key, request);
	}

	public static String getMessage(String key, Locale locale) {
		return messageSource.getMessage(key, null, locale);
	}

	public static String getMessage(String key, HttpServletRequest request) {
		return messageSource.getMessage(key, null, localeResolver.resolveLocale(request));
	}

	public static String getMessage(String key, Object[] objs, Locale locale) {
		return messageSource.getMessage(key, objs, locale);
	}

	public static String getMessage(String key, Object[] objs, HttpServletRequest request) {
		return messageSource.getMessage(key, objs, localeResolver.resolveLocale(request));
	}

}
