package com.davaohome.admin.controller.login;

import java.io.IOException;
import java.nio.charset.Charset;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

import com.davaohome.admin.common.cookie.AdminCookie;
import com.davaohome.admin.common.cookie.CookieHandler;
import com.davaohome.admin.util.RequestUtil;
import com.davaohome.bo.model.admin.AdminMember;
import com.davaohome.bo.model.base.ActiveLanguage;
import com.davaohome.bo.service.admin.AdminMemberService;

@Slf4j
@Controller
@RequestMapping("/auth")
public class LoginController {

	@Autowired
	private AdminMemberService adminMemberService;

	public static final String charset = Charset.defaultCharset().displayName();

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginPage(Model model) throws Exception {

		setBaseData(model);

		return "/admin/login";
	}

	@RequestMapping(value = "/doLogin")
	public String doLogin(@RequestParam String adminId, @RequestParam String password, @RequestParam String language,
						  HttpServletRequest request, HttpServletResponse response, Model model) throws
			ServletException, IOException {

		AdminMember adminMember = adminMemberService.checkLogin(adminId, password);
		if (adminMember != null) {

			CookieHandler.setCookie(AdminCookie.ADMIN_ID, adminId, response);
			CookieHandler.setCookie(AdminCookie.COUNTRY, (String) request.getAttribute("countryId"), response);
			CookieHandler.setCookie(AdminCookie.ADMIN_TYPE, adminMember.getAdminMemberType().name(), response);
			CookieHandler.setCookie(AdminCookie.PARTNER_NAME, adminMember.getPartnerName(), response);
			CookieHandler.setCookie(AdminCookie.PARTNER_NO, String.valueOf(adminMember.getPartnerNo()), response);
			CookieHandler.setCookie(AdminCookie.PARTNER_TYPE, String.valueOf(adminMember.getPartnerType()), response);
			CookieHandler.setEternalCookie(AdminCookie.LANGUAGE, language, response);

			return "redirect:/notice/noticeList";
		} else {
			model.addAttribute("adminId", adminId);
			model.addAttribute("error", "error");

			setBaseData(model);

			return "/admin/login";
		}
	}

	private void setBaseData(Model model) {

		String language = CookieHandler.getCookieValue(AdminCookie.LANGUAGE);

		if (StringUtils.isNotEmpty(language)) {
			model.addAttribute("savedLanguage", language);
		}
		model.addAttribute("languageList", ActiveLanguage.values());
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String doLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {

		CookieHandler.removeCookie(AdminCookie.ADMIN_ID, response);
		CookieHandler.removeCookie(AdminCookie.COUNTRY, response);

		RequestUtil.redirect(request, response, "/auth/login");
		return null;
	}

}
