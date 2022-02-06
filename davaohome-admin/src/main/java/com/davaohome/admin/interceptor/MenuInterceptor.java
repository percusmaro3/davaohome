package com.davaohome.admin.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.davaohome.admin.common.cookie.AdminCookie;
import com.davaohome.admin.common.cookie.CookieHandler;
import com.davaohome.admin.menu.AdminMenu;
import com.davaohome.admin.menu.AdminMenuComposition;
import com.davaohome.bo.model.admin.AdminMemberType;

public class MenuInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		AdminMemberType adminType = getAdminMemberType();

		List<AdminMenu> rootMenuList = AdminMenuComposition.getRootMenuMap(adminType);
		request.setAttribute("rootMenuList", rootMenuList);

		String[] menuIdArr = AdminMenuComposition.getMenuIdArrFromMenuUrl(adminType, request.getRequestURI());
		if (menuIdArr == null) {
			String defaultMenuUrl = rootMenuList.get(0).getChildMenuList().get(0).getMenuUrl();
			menuIdArr = AdminMenuComposition.getMenuIdArrFromMenuUrl(adminType, defaultMenuUrl);
		}

		request.setAttribute("menu", menuIdArr[0]);
		request.setAttribute("childMenu", menuIdArr[1]);

		return true;
	}

	private AdminMemberType getAdminMemberType() {
		String adminType = CookieHandler.getCookieValue(AdminCookie.ADMIN_TYPE);

		return AdminMemberType.valueOf(adminType);
	}

}
