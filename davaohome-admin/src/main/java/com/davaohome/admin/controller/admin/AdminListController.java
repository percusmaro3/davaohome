package com.davaohome.admin.controller.admin;

import com.davaohome.admin.common.CnvAdminConstant;
import com.davaohome.admin.common.pager.PagerMaker;
import com.davaohome.admin.common.pager.Pagination;
import com.davaohome.bo.model.admin.AdminMemberSearchParam;
import com.davaohome.bo.model.base.PagerResult;
import com.davaohome.bo.model.country.ServiceCountry;
import com.davaohome.bo.service.admin.AdminMemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/adminMember")
public class AdminListController {

	private static final Logger log = LoggerFactory.getLogger(AdminListController.class);

	@Autowired
	AdminMemberService adminService;

	@RequestMapping(value = "/adminMemberList")
	public String searchAdminList(@RequestParam(required = false, defaultValue = "1") Integer page,
								  @ModelAttribute AdminMemberSearchParam adminMemberSearchParam,
								  Model model) throws Exception {

		Pagination paging = PagerMaker.makePagerWithIndexSet(page, CnvAdminConstant.COMMON_LIST_ITEM_PER_PAGE, adminMemberSearchParam);
		PagerResult pr = adminService.getAdminMemberList(adminMemberSearchParam);
		paging.setTotalItemCount(pr.getTotalResultCount());

		model.addAttribute("paging", paging);
		model.addAttribute("adminMemberList", pr.getResult());
		model.addAttribute("param", adminMemberSearchParam);
		model.addAttribute("countryList", ServiceCountry.getAdminCountryList());

		return "/admin/adminMemberList";
	}
}
