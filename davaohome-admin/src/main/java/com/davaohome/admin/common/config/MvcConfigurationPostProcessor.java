package com.davaohome.admin.common.config;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

public class MvcConfigurationPostProcessor implements BeanPostProcessor {

	private WebBindingInitializer webBindingInitializer;

	public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
		if (bean instanceof RequestMappingHandlerAdapter) {

			ConfigurableWebBindingInitializer origin = (ConfigurableWebBindingInitializer)((RequestMappingHandlerAdapter) bean).getWebBindingInitializer();

			((ConfigurableWebBindingInitializer) webBindingInitializer).setBindingErrorProcessor(origin.getBindingErrorProcessor());
			((ConfigurableWebBindingInitializer) webBindingInitializer).setConversionService(origin.getConversionService());
			((ConfigurableWebBindingInitializer) webBindingInitializer).setDirectFieldAccess(origin.isDirectFieldAccess());
			((ConfigurableWebBindingInitializer) webBindingInitializer).setAutoGrowNestedPaths(true);
			((ConfigurableWebBindingInitializer) webBindingInitializer).setPropertyEditorRegistrars(origin.getPropertyEditorRegistrars());
			((ConfigurableWebBindingInitializer) webBindingInitializer).setValidator(origin.getValidator());

			((RequestMappingHandlerAdapter) bean).setWebBindingInitializer(webBindingInitializer);
		}
		return bean;
	}

	public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
		return bean;
	}

	public void setWebBindingInitializer(WebBindingInitializer webBindingInitializer) {
		this.webBindingInitializer = webBindingInitializer;
	}

}
