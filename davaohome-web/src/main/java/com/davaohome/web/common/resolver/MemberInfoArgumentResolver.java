package com.davaohome.web.common.resolver;

import com.davaohome.web.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class MemberInfoArgumentResolver implements HandlerMethodArgumentResolver {

	@Autowired
    CookieUtil cookieUtil;

	@Override
	public boolean supportsParameter(MethodParameter param) {

		//		return MemberInfo.class.isAssignableFrom(param.getParameterType());

		return true;
	}

	@Override
	public Object resolveArgument(MethodParameter param, ModelAndViewContainer mavContainer,
								  NativeWebRequest webRequest,
								  WebDataBinderFactory dataBinderFactory) throws Exception {

		//		HttpServletRequest request = (HttpServletRequest)webRequest.getNativeRequest();
		//
		//		Member member = (Member)CookieHandler.getCookie(request, TKLCookie.TKLINK, Member.class);
		//
		//		MemberInfo memberInfo = new MemberInfo();
		//		memberInfo.setMemberNumber(member.getMemberNo());
		//		return memberInfo;

		return null;
	}
}
