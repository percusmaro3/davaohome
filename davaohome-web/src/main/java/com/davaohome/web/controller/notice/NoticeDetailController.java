package com.davaohome.web.controller.notice;

import com.davaohome.bo.model.notice.Notice;
import com.davaohome.bo.model.notice.NoticeContents;
import com.davaohome.bo.service.notice.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/{languageCode}/notice")
public class NoticeDetailController {

	private static final Logger log = LoggerFactory.getLogger(NoticeDetailController.class);

	@Autowired
	NoticeService noticeService;


	@RequestMapping(value = "/{noticeNo}")
	public String showNoticeDetail(@PathVariable String languageCode, @PathVariable Integer noticeNo, Model model) throws Exception {

		Notice notice = noticeService.getNotice(noticeNo);

		NoticeContents noticeContents = notice.getContentsMap().get(languageCode);

		model.addAttribute("notice", noticeContents);

		return "web/newsDetail";
	}

}
