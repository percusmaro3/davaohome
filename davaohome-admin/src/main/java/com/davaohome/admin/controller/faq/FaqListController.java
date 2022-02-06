package com.davaohome.admin.controller.faq;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.davaohome.admin.common.CnvAdminConstant;
import com.davaohome.admin.common.cookie.AdminCookie;
import com.davaohome.admin.common.cookie.CookieHandler;
import com.davaohome.admin.common.pager.PagerMaker;
import com.davaohome.admin.common.pager.Pagination;
import com.davaohome.bo.model.base.PagerResult;
import com.davaohome.bo.model.faq.FaqSearchParam;
import com.davaohome.bo.service.faq.FaqService;

@Controller
@RequestMapping("/faq")
public class FaqListController {

	private static final Logger log = LoggerFactory.getLogger(FaqListController.class);

	@Autowired
	FaqService faqService;

	@RequestMapping(value = "/faqList")
	public String searchFaqList(@RequestParam(required = false, defaultValue = "1") Integer page,
								Model model) throws Exception {

		FaqSearchParam faqSearchParam = new FaqSearchParam();
		String language = CookieHandler.getCookieValue(AdminCookie.LANGUAGE);
		faqSearchParam.setLanguage(language);

		Pagination paging = PagerMaker.makePagerWithIndexSet(page, CnvAdminConstant.COMMON_LIST_ITEM_PER_PAGE, faqSearchParam);
		PagerResult pr = faqService.getFaqList(faqSearchParam);
		paging.setTotalItemCount(pr.getTotalResultCount());

		model.addAttribute("paging", paging);
		model.addAttribute("faqList", pr.getResult());

		return "/faq/faqList";
	}
}
