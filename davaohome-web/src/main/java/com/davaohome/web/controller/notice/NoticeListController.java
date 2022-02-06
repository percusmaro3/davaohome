package com.davaohome.web.controller.notice;

import com.davaohome.bo.model.base.PagerResult;
import com.davaohome.bo.model.notice.Notice;
import com.davaohome.bo.model.notice.NoticeSearchParam;
import com.davaohome.bo.service.notice.NoticeService;
import com.davaohome.web.common.CnvAdminConstant;
import com.davaohome.web.common.pager.PagerMaker;
import com.davaohome.web.common.pager.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/{languageCode}/notice")
public class NoticeListController {

	private static final Logger log = LoggerFactory.getLogger(NoticeListController.class);

	private static Integer TOP_NOTICE_LIST = 5;

	@Autowired
	NoticeService noticeService;

	@RequestMapping(value = "/noticeList")
	public String searchNoticeList(@PathVariable String languageCode, @RequestParam(required = false, defaultValue = "1") Integer page,
								   Model model) throws Exception {

		NoticeSearchParam noticeSearchParam = new NoticeSearchParam();
		noticeSearchParam.setLanguage(languageCode);

		Pagination paging = PagerMaker.makePagerWithIndexSet(page, CnvAdminConstant.COMMON_LIST_ITEM_PER_PAGE, noticeSearchParam);
		PagerResult pr = noticeService.getNoticeList(noticeSearchParam);
		paging.setTotalItemCount(pr.getTotalResultCount());

		model.addAttribute("paging", paging);
		model.addAttribute("noticeList", pr.getResult());

		System.out.println("paging : "+paging);

		return "web/news";
	}

	@RequestMapping(value = "/topNoticeList")
	public String topNoticeList(@PathVariable String languageCode, @RequestParam(required = false, defaultValue = "1") Integer page,
								   Model model) throws Exception {

		NoticeSearchParam noticeSearchParam = new NoticeSearchParam();
		noticeSearchParam.setLanguage(languageCode);

		Pagination paging = PagerMaker.makePagerWithIndexSet(page, TOP_NOTICE_LIST, noticeSearchParam);
		PagerResult pr = noticeService.getNoticeList(noticeSearchParam);
		paging.setTotalItemCount(pr.getTotalResultCount());

		List<Notice> noticeList = (List<Notice>)pr.getResult().get(0);

		model.addAttribute("noticeList", noticeList);

		return "web/news";
	}
}
