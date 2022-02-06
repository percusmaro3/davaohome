package com.davaohome.web.common.config;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

public class CustomWebBindingInitializer extends ConfigurableWebBindingInitializer {

	@Override
	public void initBinder(WebDataBinder binder, WebRequest request) {
		super.initBinder(binder, request);

		binder.setAutoGrowNestedPaths(true);
		binder.setAutoGrowCollectionLimit(100000);
	}
}
