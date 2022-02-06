package com.davaohome.admin.controller.notice;

import com.davaohome.bo.model.notice.NoticeSearchParam;
import com.davaohome.bo.service.notice.NoticeService;
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

@Controller
@RequestMapping("/notice")
public class NoticeListController {

	private static final Logger log = LoggerFactory.getLogger(NoticeListController.class);

	@Autowired
	NoticeService noticeService;

	@RequestMapping(value = "/noticeList")
	public String searchNoticeList(@RequestParam(required = false, defaultValue = "1") Integer page,
								   Model model) throws Exception {

		NoticeSearchParam noticeSearchParam = new NoticeSearchParam();
		String language = CookieHandler.getCookieValue(AdminCookie.LANGUAGE);
		noticeSearchParam.setLanguage(language);

		Pagination paging = PagerMaker.makePagerWithIndexSet(page, CnvAdminConstant.COMMON_LIST_ITEM_PER_PAGE, noticeSearchParam);
		PagerResult pr = noticeService.getNoticeList(noticeSearchParam);
		paging.setTotalItemCount(pr.getTotalResultCount());

		model.addAttribute("paging", paging);
		model.addAttribute("noticeList", pr.getResult());

		return "/notice/noticeList";
	}
}
