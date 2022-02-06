package com.davaohome.admin.controller.admin;

import com.davaohome.admin.common.cookie.AdminCookie;
import com.davaohome.admin.common.cookie.CookieHandler;
import com.davaohome.admin.message.MessageHelper;
import com.davaohome.admin.model.ErrorMsg;
import com.davaohome.admin.model.JobType;
import com.davaohome.admin.util.AdminSessionUtil;
import com.davaohome.bo.model.admin.AdminMember;
import com.davaohome.bo.model.admin.AdminMemberType;
import com.davaohome.bo.model.country.ServiceCountry;
import com.davaohome.bo.service.admin.AdminMemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/adminMember")
public class AdminDetailController {

	private static final Logger log = LoggerFactory.getLogger(AdminDetailController.class);

	@Autowired
	AdminMemberService adminMemberService;

	@RequestMapping(value = "/newAdminMember")
	public String showNewAdminMemberDetail(HttpServletRequest request, Model model) throws Exception {

		setBaseData(request, JobType.INSERT, new AdminMember(), model);

		return "/admin/adminMemberDetail";
	}

	@RequestMapping(value = "/{adminMemberId}")
	public String showAdminMemberDetail(@PathVariable String adminMemberId, HttpServletRequest request, Model model) throws Exception {

		AdminMember adminMember = adminMemberService.getAdminMember(adminMemberId);

		setBaseData(request, JobType.UPDATE, adminMember, model);

		return "/admin/adminMemberDetail";
	}

	@RequestMapping(value = "/register")
	public String registerAdminMember(@Valid @ModelAttribute AdminMember adminMember, HttpServletRequest request,
									  BindingResult result, Model model) throws Exception {

		AdminSessionUtil.setLastUpdater(adminMember);

		ErrorMsg em = new ErrorMsg();
		checkAdminMember(adminMember, request, em);

		if (result.hasErrors() || em.hasErrorMsg()) {

			model.addAttribute("errorMsg", em.getErrorMsg());
			setBaseData(request, JobType.INSERT, adminMember, model);

			return "/admin/adminMemberDetail";
		}

		adminMemberService.insertAdminMember(adminMember);

		return "/common/popupcloseOpenerReload";
	}

	private void checkAdminMember(AdminMember adminMember, HttpServletRequest request, ErrorMsg em) {


		if (adminMember.getPassword().equals(request.getParameter("confirmPassword"))) {
			return;
		} else {
			em.addErrorMsg(MessageHelper.getMessage("adminMember.notMachtedConfirmPassword"));
		}
	}

	@RequestMapping(value = "/update")
	public String updateAdminMember(@Valid @ModelAttribute AdminMember adminMember, HttpServletRequest request,
									BindingResult result, Model model) throws Exception {

		AdminSessionUtil.setLastUpdater(adminMember);
		String loginAdminId = CookieHandler.getCookieValue(AdminCookie.ADMIN_ID);

		ErrorMsg em = new ErrorMsg();
		if (adminMember.getAdminMemberId().equals(loginAdminId)) {
			checkAdminMember(adminMember, request, em);
		}

		if (result.hasErrors() || em.hasErrorMsg()) {

			model.addAttribute("errorMsg", em.getErrorMsg());
			setBaseData(request, JobType.UPDATE, adminMember, model);

			return "/admin/adminMemberDetail";
		}


		adminMemberService.updateAdminMember(adminMember, loginAdminId);

		return "/common/popupcloseOpenerReload";
	}

	private void setBaseData(HttpServletRequest request, JobType jobType, AdminMember adminMember, Model model) {


		model.addAttribute("jobType", jobType);
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("countryList", ServiceCountry.getAdminCountryList());
		model.addAttribute("adminMemberTypeList", AdminMemberType.values());
		model.addAttribute("loginAdminId", CookieHandler.getCookieValue(AdminCookie.ADMIN_ID));
	}

}
